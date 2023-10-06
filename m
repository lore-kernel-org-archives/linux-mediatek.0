Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE13E92FF7
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JfeQthEyRcO4HnjndpPZvj7t1sp9LUoj0/kmQtjW57Y=; b=Q6DDO0nz8NgN9A7E/HjY77M8gL
	guck3hdPTZ1HR1SuMGrxTVBoqQ+lQmZNb/IgqY9MJMetoWeCu8O9JteS/UaQt1cOHkDHd5Hu0AK5S
	hStx2dLHZuWjfbEZY8qgyXctFp718u1YXZKVfJcR+Cu0m01Rhp0iUnusHrhmxMn61T4QwtVWFCWfc
	VwTcsr0TFPqU+8L3UACwSEuB8RWj9jFZxYoDH+H1s/OzIA/fFEkU+2qCPYLuK9CjpERZkYrsalLMi
	iHqd3ItqIBL2bwseRCV/Yab88T4o/suiOOTBVF4G6QcujNkL9cqLMNaLSTq7UNOxcmYORfiAnALKb
	eSx1EGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofZb-005Ct0-1q;
	Fri, 06 Oct 2023 07:48:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofZY-005Cru-2J;
	Fri, 06 Oct 2023 07:48:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qofZT-0004lD-0L;
	Fri, 06 Oct 2023 07:48:27 +0000
Date: Fri, 6 Oct 2023 09:45:58 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Frank Wunderlich <linux@fw-web.de>, John Crispin <john@phrozen.org>
Subject: [PATCH] PCI: mediatek-gen3: fix PCIe #PERST being de-asserted too
 early
Message-ID: <ZR-7Nm2c5s4kuOp0@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_004832_754364_12E90BAF 
X-CRM114-Status: GOOD (  10.38  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The driver for MediaTek gen3 PCIe hosts de-asserts all reset
signals at the same time using a single register write operation.
Delay the de-assertion of the #PERST signal by 100ms as required by
PCIe CEM clause 2.2, some PCIe devices fail to come up otherwise.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index e0e27645fdf4..ba8cfce03aad 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -350,7 +350,13 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	msleep(100);
 
 	/* De-assert reset signals */
-	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
+	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
+	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+	msleep(100);
+
+	/* De-assert PERST# signals */
+	val &= ~(PCIE_PE_RSTB);
 	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 
 	/* Check if the link is up or not */
-- 
2.42.0


