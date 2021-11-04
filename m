Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF457C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 06:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94EC5611CE
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 06:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94EC5611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8L8yYNx5E9WiNj5XqFYeNXNqSYmxwUR3+MF0OQnHWpQ=; b=iCbDsb2GuFeX21
	i4GJU7aAePIfsB8xC6pQsHcF1wxmrjwiOTOMeurvxcUCMouJ4/uhZ4ajSexNbG6dEF4+8+UY7hQT+
	PwRE7D+Uo7/IVC3f7lQyFTvA0utBRwgjZI9roSARIWd6bJAkeZymw23n6u9z8i7lkAqnB2PCdZM/N
	2iSpp05kBuVu8vaZg39AL4U4/oLiZoPVyPAoIQoZtlGkDtmyOTIBwgw69FuEDYnLrjkR8OJ8/XkLx
	Dyjhop/LiR3nsYxhNiyfQ6dCuB2/omDCVqu3bc3Dznrl3JBBLZp4Gxf+CgyPAtyUV942kN8u00Uif
	66kq8iMM5QmoLF+eaxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miW9K-0080tb-AN; Thu, 04 Nov 2021 06:22:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miW96-0080po-Dw; Thu, 04 Nov 2021 06:22:47 +0000
X-UUID: 90fe9ce1061245d684c5302eef6bef43-20211103
X-UUID: 90fe9ce1061245d684c5302eef6bef43-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 330067273; Wed, 03 Nov 2021 23:22:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 23:22:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 14:22:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 4 Nov 2021 14:22:35 +0800
From: qizhong cheng <qizhong.cheng@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczyi=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, Jiey Yang
 <ot_jiey.yang@mediatek.com>, qizhong cheng <qizhong.cheng@mediatek.com>
Subject: [PATCH] PCI: mediatek: Delay 100ms to wait power and clock to become
 stable
Date: Thu, 4 Nov 2021 14:21:44 +0800
Message-ID: <20211104062144.31453-1-qizhong.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_232244_504710_D69A388A 
X-CRM114-Status: UNSURE (   9.14  )
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
---
 drivers/pci/controller/pcie-mediatek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..b32acbac8084 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -702,6 +702,14 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	 */
 	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
 
+	/*
+	 * Described in PCIe CEM specification setctions 2.2 (PERST# Signal)
+	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
+	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+	 * for the power and clock to become stable.
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
