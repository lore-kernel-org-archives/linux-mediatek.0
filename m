From: <honghui.zhang@mediatek.com>
Subject: [PATCH v3 0/2] PCI: mediatek: enable whole MMIO range and enlarge the
 PCIe2AHB window size
Date: Fri, 1 Feb 2019 13:36:05 +0800
Message-ID: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com
Cc: youlin.pei@mediatek.com, poza@codeaurora.org, fred@fredlawl.com, rafael.j.wysocki@intel.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

Two patches:
patch 1 enable whole MMIO range which also fix the complain of scripts/coccinelle/api/resource_size.cocci
patch 2 enlarge the PCIe2AHB window size to support fully access of 4GB DRAM from EP DMA.

v3:
 - update the changlog title for patch1 and update commit message following Bjorn's suggestion
 - move the "|" into the previous line.

v2:
 - Fix the checkpatch complains for patch 1.
 - update the commit message and change title of patch 1 for changelog conventions.
 - Add patch 2.

Honghui Zhang (2):
  PCI: mediatek: Enable the whole memory mapped IO range
  PCI: mediatek: Enlarge PCIe2AHB window size to support 4GB DRAM

 drivers/pci/controller/pcie-mediatek.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.6.4
