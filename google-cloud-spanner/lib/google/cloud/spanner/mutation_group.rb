# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Google
  module Cloud
    module Spanner
      class MutationGroup
        # @private
        def initialize
          @commit = Commit.new
        end

        def upsert table, *rows
          # TODO: Should I add ensure_sesion! to every method?
          @commit.upsert table, rows
        end
        alias save upsert

        def insert table, *rows
          @commit.insert table, rows
        end

        def update table, *rows
          @commit.update table, rows
        end

        def replace table, *rows
          @commit.replace table, rows
        end

        def delete table, keys = []
          @commit.delete table, keys
        end

        ##
        # @private
        # All of the mutations created in the transaction block.
        def mutations
          @commit.mutations
        end
      end
    end
  end
end