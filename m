Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BCCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pUCTiLFMwW+w0mW5lDjeJLTHSEzCsRyoEJ/ojLDxes8=; b=XxHglfTNoRNJQL
	DXkaPC4sKx1dHEJvZ0ipnptCrrj4dCSPCKVNGMiOXSJP/uAEd9aRyFvEojWTB3oesg4JadGWURqob
	cdIugm3lEu4rLPhno1T1hQefURrOoU4zFdKJc5gpGEtCxmKUx6VOleyO6uwTT7H6VMaMR5BFL3ODY
	Zlw6IQFKNOWqRCx/JtkTbNPlpR6l8x+O3hePwDMrgSlxS6a5x/sTIQNfndPv+6Jw8m9PVDby67uov
	Vx2fSwYf/ia7zC542BROgR9czQwaUWcFUfD/mEviZkBFPAhsyV6l3E34b82/GheylZznXoIp05rMf
	srvT3ymxjP3lVDaBku4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muTgV-0073Ct-W8; Tue, 07 Dec 2021 06:10:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muTgH-0073Aj-Q4; Tue, 07 Dec 2021 06:10:28 +0000
X-UUID: b36e84f298de422491ef77dae037c4d4-20211206
X-UUID: b36e84f298de422491ef77dae037c4d4-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 745218861; Mon, 06 Dec 2021 23:10:20 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 22:06:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 14:05:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 7 Dec 2021 14:05:56 +0800
From: qizhong cheng <qizhong.cheng@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>
Subject: [PATCH] PCI: mediatek: Delay 100ms to wait power and clock to become
 stable
Date: Tue, 7 Dec 2021 14:05:50 +0800
Message-ID: <20211207060550.20918-1-qizhong.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_221025_876385_63D077F2 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Described in PCIe CEM specification setctions 2.2 (PERST# Signal) and
2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
be delayed 100ms (TPVPERL) for the power and clock to become stable.

Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
Change-Id: Ia9abe1e763564a5bad1d045fd268c38e76e2ae95
---
 drivers/pci/controller/pcie-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..a61ea3940471 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -702,6 +702,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	 */
 	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
 
+	/*
+	 * Described in PCIe CEM specification setctions 2.2 (PERST# Signal) and
+	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
+	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
+	 */
+	msleep(100);
+
 	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
 	val = readl(port->base + PCIE_RST_CTRL);
 	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
