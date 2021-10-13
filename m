Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F965C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 09:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D220D60F94
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 09:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D220D60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fzLbVqanZ8we5FAXAPio4Pv/SCZpFsa0b2ungrie3fM=; b=Ws31QvpY2jyJzT
	TNRYpw/QzVkUtjKRFW+GtR7Cb5l/sMh7ATOPCnLhI8LdgEUEEUv+sVXzSAbiAn+vvq7dSmwJcNazW
	osyRWFgC80fg1xG3flJ5Y+7IjrgXNfhFVCLiU5bWYM1xMRy7lBBy5np8h17notzg3LLKLr8xCa4Nt
	7n94mynSATNQPiZ6uCqrdGk0NzYMgzBdXkqOZay5v4U2xA9pFeu7qFaukC3FBXYOrYbZxtyuRBtep
	SNdr5q9zl1MJDtjykfVypr5XYJJAAQAXrIJM7A4CL/e57Lwr/l7CaMoA/83gVDiGsE+QZBDeeOKwB
	DHIOOYLe9ghyPcmCX3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maaop-00FoZG-3W; Wed, 13 Oct 2021 09:45:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZ5M-00FT6q-5t; Wed, 13 Oct 2021 07:54:03 +0000
X-UUID: 328dd38198ed4059a56d354ecb06b1a2-20211013
X-UUID: 328dd38198ed4059a56d354ecb06b1a2-20211013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1577999298; Wed, 13 Oct 2021 00:53:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 00:53:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Oct 2021 15:53:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 15:53:51 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <Ryan-JH.Yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v2] PCI: mediatek-gen3: Disable DVFSRC voltage request
Date: Wed, 13 Oct 2021 15:53:28 +0800
Message-ID: <20211013075328.12273-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_005400_266663_1D302DB3 
X-CRM114-Status: GOOD (  11.67  )
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

When the DVFSRC feature is not implemented, the MAC layer will
assert a voltage request signal when exit from the L1ss state,
but cannot receive the voltage ready signal, which will cause
the link to fail to exit the L1ss state correctly.

Disable DVFSRC voltage request by default, we need to find
a common way to enable it in the future.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f3aeb8d4eaca..79fb12fca6a9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -79,6 +79,9 @@
 #define PCIE_ICMD_PM_REG		0x198
 #define PCIE_TURN_OFF_LINK		BIT(4)
 
+#define PCIE_MISC_CTRL_REG		0x348
+#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
+
 #define PCIE_TRANS_TABLE_BASE_REG	0x800
 #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
 #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
@@ -297,6 +300,11 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 	val &= ~PCIE_INTX_ENABLE;
 	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
 
+	/* Disable DVFSRC voltage request */
+	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
+	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
+	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
+
 	/* Assert all reset signals */
 	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
 	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
