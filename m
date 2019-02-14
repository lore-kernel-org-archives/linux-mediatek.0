From: matthias.bgg@kernel.org
Subject: [PATCH v4 0/3] Mark clocks as critical for MT6797
Date: Thu, 14 Feb 2019 17:30:23 +0100
Message-ID: <20190214163026.26073-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com, jasu@njomotys.info, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
List-Id: linux-mediatek@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Jasper send this series some month ago. As there was no reaction from
his side, I'll do a friendly take-over.
I tested the patches on my Helios X20 boards and they fix the issue.
I didn't add a Tested-by tag as I added my Signed-off-by.

Changes since v3:
- add comments explaining why the clock muxer and gates are marked
  as critical

Changes since v2 (https://patchwork.kernel.org/patch/10686759/):
- axi_sel is not needed, drop CLK_IS_CRITICAL for it.
- update commit message
- add Acked-by from Mars

Changes since v1:
- add a fixes tag.

---

Currently, DRAM-related clocks and the axi_sel MUX are not marked with
CLK_IS_CRITICAL for MT6797. This causes memory corruption when the
system is booted without clk_ignore_unused.

This patchset

1. Makes it possible to mark outputs of MUXes as critical by introducing
   a new macro, MUX_FLAGS,
2. Makes it possible to mark gates as critical by adding flags to
   mtk_gate, and
3. Marks axi_sel, ddrphycfg_sel, infra_dramc_f26m and infra_dramc_b_f26m
   as critical.

The addition of flags to mtk_gate also exists in the patch series "Add
basic and clock support for Mediatek MT8183 SoC" [1].  The type of
flags is unsigned int in that series, but the real type is unsigned
long, so my patch differs from that patch.

[1] https://patchwork.kernel.org/patch/10549953/

Jasper Mattsson (3):
  clk: mediatek: Add MUX_FLAGS macro
  clk: mediatek: Add flags to mtk_gate
  clk: mediatek: Mark bus and DRAM related clocks as critical

 drivers/clk/mediatek/clk-gate.c   |  4 +-
 drivers/clk/mediatek/clk-gate.h   |  3 +-
 drivers/clk/mediatek/clk-mt6797.c | 68 +++++++++++++++++++------------
 drivers/clk/mediatek/clk-mtk.c    |  2 +-
 drivers/clk/mediatek/clk-mtk.h    |  9 +++-
 5 files changed, 56 insertions(+), 30 deletions(-)

-- 
2.20.1
