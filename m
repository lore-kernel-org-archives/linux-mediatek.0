Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98ADC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IHoQTQxXMNI/kwGVjKpdgdHH+W+Ltak3dzNyxSp+TqE=; b=lLU31pX3T5h8Ib
	TVLwvFJjl2zf5K0Bu3aa1aeiztCJWcoQZlBr8WLMqCrVRxyfR7lGlbasjuZU31UiCv4S8LuqfXS3D
	WH6ZkziqsCxU8SepOrJ57EQCpXX9sF3R+xgZQmquYo1oniMPC/vO4ueJlBxU46BxcOXFudtipSuhr
	3GFuO0cYawXqNhU6lUksIo7eOZF0PObRZ43q7QFMZ9m5Vwq6Ph6I3vJC3HhfeuMZka7oUA3gjK25l
	zJkX1whNrNK1g9+KcRjg561GPNCTpPyJWvxfRnU9HMicTwkZ07RtAdFrURB+c1IV9lTJreoYIP0oH
	jVkU/Wfc2/RMcYA6wyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsNU-001Gtc-5n; Tue, 15 Feb 2022 07:36:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsNI-001GnU-HJ; Tue, 15 Feb 2022 07:35:49 +0000
X-UUID: 10ace0ea221c4398a5facde8b15528e6-20220215
X-UUID: 10ace0ea221c4398a5facde8b15528e6-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 321191194; Tue, 15 Feb 2022 00:35:44 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:32:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 15:31:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:31:54 +0800
From: qizhong cheng <qizhong.cheng@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <stable@vger.kernel.org>, <qizhong.cheng@mediatek.com>,
 <chuanjia.liu@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3] PCI: mediatek: Clear interrupt status before dispatching
 handler
Date: Tue, 15 Feb 2022 15:31:53 +0800
Message-ID: <20220215073153.17345-1-qizhong.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_233548_603500_A765A1B8 
X-CRM114-Status: GOOD (  12.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We found a failure when used iperf tool for wifi performance testing,
there are some MSIs received while clearing the interrupt status,
these MSIs cannot be serviced.

The interrupt status can be cleared even the MSI status still remaining,
as an edge-triggered interrupts, its interrupt status should be cleared
before dispatching to the handler of device.

Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: stable@vger.kernel.org
---

v3:
 - Add Fix tag.

v2:
 - Update the subject line.
 - Improve the commit log and code comments.

 drivers/pci/controller/pcie-mediatek.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..2856d74b2513 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -624,12 +624,17 @@ static void mtk_pcie_intr_handler(struct irq_desc *desc)
 		if (status & MSI_STATUS){
 			unsigned long imsi_status;
 
+			/*
+			 * The interrupt status can be cleared even the MSI
+			 * status still remaining, hence as an edge-triggered
+			 * interrupts, its interrupt status should be cleared
+			 * before dispatching handler.
+			 */
+			writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
 			while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
 				for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM)
 					generic_handle_domain_irq(port->inner_domain, bit);
 			}
-			/* Clear MSI interrupt status */
-			writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
 		}
 	}
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
