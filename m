From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v2] arm64: mm: make CONFIG_ZONE_DMA32 configurable
Date: Wed, 29 May 2019 00:08:20 +0800
Message-ID: <1559059700-19078-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-mediatek@lists.infradead.org

This change makes CONFIG_ZONE_DMA32 defuly y and allows users
to overwrite it only when CONFIG_EXPERT=y.

For the SoCs that do not need CONFIG_ZONE_DMA32, this is the
first step to manage all available memory by a single
zone(normal zone) to reduce the overhead of multiple zones.

The change also fixes a build error when CONFIG_NUMA=y and
CONFIG_ZONE_DMA32=n.

arch/arm64/mm/init.c:195:17: error: use of undeclared identifier 'ZONE_DMA32'
                max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_dma_phys());

Change since v1:
1. only expose CONFIG_ZONE_DMA32 when CONFIG_EXPERT=y
2. remove redundant IS_ENABLED(CONFIG_ZONE_DMA32)

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm64/Kconfig   | 3 ++-
 arch/arm64/mm/init.c | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 76f6e4765f49..20c552b1302c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -260,7 +260,8 @@ config GENERIC_CALIBRATE_DELAY
 	def_bool y
 
 config ZONE_DMA32
-	def_bool y
+	bool "Support DMA32 zone" if EXPERT
+	default y
 
 config HAVE_GENERIC_GUP
 	def_bool y
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d2adffb81b5d..f643bd45ff69 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -191,8 +191,9 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
 
-	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-		max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_dma_phys());
+#ifdef CONFIG_ZONE_DMA32
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_dma_phys());
+#endif
 	max_zone_pfns[ZONE_NORMAL] = max;
 
 	free_area_init_nodes(max_zone_pfns);
-- 
2.18.0
