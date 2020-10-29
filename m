Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62761C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:04:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D25F620780
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 03:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QilK7CVh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uzmaIRqv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D25F620780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PE//+mUJKAL3jNn0aODxF/RodtxoB6/f/RNzfj90zgg=; b=QilK7CVhbzcl3JZ2UCZjyXG2m
	xP4BMbdVP53nN3CbCG2tEtypWjAdeU7gUEww7bUghAy6U/DGKYJSsDQuSnnr9FouAsWO+iTN2pUaW
	NeP8INXe2kqDMSebBi/37RzglpVvASNiOm8GGd4c2dBpEZQ36SBT+Fb4M0uWaeHaqT/Lpi8f/gG1P
	Q4LRpdg3mgOlDavkLA+wmYZ/R73HjJz+Ky1T7ebSI0QWoFvLu7Lqd3P0/iOf8AVfy4zznMZBnHBpV
	xueOml96wHs6YS39him4vhVve81x+MfPgaP0EOFOm1IWHmdcWN/IXSQ36iPsdZghLd4q0fYBUz41C
	iQ5gsUx+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXyEh-0004dj-Fk; Thu, 29 Oct 2020 03:04:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXyD4-0003sg-MP; Thu, 29 Oct 2020 03:02:45 +0000
X-UUID: e4164f6d4a0649b18ef55b51b1e47c98-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=no5yMdNeeQTfIt1QmWZMhYF/WxHLMF5DcwRgW6ymKVA=; 
 b=uzmaIRqv5A70yRYWG8b90n3c4kLyQe38rwXhfDaZ5KWSgWRyHsJc4PnnpixsZZ8r1nDXwr5PVQnw+QPcqe3ut9DVw7dgGAtmuPjEB2Kv6BXokBjrIHxmxFxKzEprJv2UWDqxgUp5W3xMi5EDU7MPlUv9U9qpnXX5bbSrYEtFUkI=;
X-UUID: e4164f6d4a0649b18ef55b51b1e47c98-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 216762149; Wed, 28 Oct 2020 19:02:29 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:55:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 08/17] phy: phy-xgene: convert to
 devm_platform_ioremap_resource
Date: Thu, 29 Oct 2020 10:54:30 +0800
Message-ID: <1603940079-8131-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5BA3BC5315E345130640907B15C4BD6A95DF88DDECA38EAE188CEA4E8451916E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_230242_920544_38ED611E 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger
 Quadros <rogerq@ti.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Ma Feng <mafeng.ma@huawei.com>, Scott
 Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/phy-xgene.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index b88922e7de1d..f4cd590fbde7 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -1644,7 +1644,6 @@ static int xgene_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct xgene_phy_ctx *ctx;
-	struct resource *res;
 	u32 default_spd[] = DEFAULT_SATA_SPD_SEL;
 	u32 default_txboost_gain[] = DEFAULT_SATA_TXBOOST_GAIN;
 	u32 default_txeye_direction[] = DEFAULT_SATA_TXEYEDIRECTION;
@@ -1661,8 +1660,7 @@ static int xgene_phy_probe(struct platform_device *pdev)
 
 	ctx->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->sds_base = devm_ioremap_resource(&pdev->dev, res);
+	ctx->sds_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->sds_base))
 		return PTR_ERR(ctx->sds_base);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
