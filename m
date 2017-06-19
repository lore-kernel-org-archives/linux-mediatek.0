From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 0/3] change powerup logic for MediaTek PCIe controller
Date: Mon, 19 Jun 2017 17:59:57 +0800
Message-ID: <1497866400-41844-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Bjorn,

This patch series does some modifications to powerup logic to avoid unbalanced
PM warnings, and turns off host power if no link is detected.

I also make some properties(eg, PHY/reset/..) optional to gain more flexibility
just in case future SoCs don't have it.

Could you also fold this patch series into pci/host-mediatek for v4.13?
Thanks!

Ryder Lee (3):
  PCI: mediatek: modify controller powerup logic
  PCI: mediatek: turn off subsys power if no link up detected
  PCI: mediatek: make some properties optioanl

 drivers/pci/host/pcie-mediatek.c | 110 +++++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 52 deletions(-)

-- 
1.9.1
