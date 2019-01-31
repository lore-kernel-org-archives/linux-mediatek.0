From: <honghui.zhang@mediatek.com>
Subject: [PATCH v2 0/2] PCI: mediatek: fix warning and enlarge the PCIe2AHB window size
Date: Thu, 31 Jan 2019 16:01:51 +0800
Message-ID: <1548921713-5355-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com
Cc: rafael.j.wysocki@intel.com, fred@fredlawl.com, poza@codeaurora.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

Two patches:
patch 1 fix the complain of scripts/coccinelle/api/resource_size.cocci
patch 2 enlarge the PCIe2AHB window size to support fully access of 4GB DRAM from EP DMA.

v2:
 - Fix the checkpatch complains for patch 1.
 - update the commit message and change title of patch 1 for changelog conventions.
 - Add patch 2.

Honghui Zhang (2):
  PCI: mediatek: Use resource_size function on resource object
  PCI: mediatek: Enlarge PCIe2AHB window size to support 4GB DRAM

 drivers/pci/controller/pcie-mediatek.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.6.4
