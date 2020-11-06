Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E3FC4741F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:21:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08475206F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tCpQkUgu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ezQhxO2g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08475206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3qelPZEoXrNIa6I0KVdmq6sO39zo6kfkklp5KMxw3c=; b=tCpQkUgue4a9asbsahN3tRw63
	8l5VcfL4ZnDa8QrX5bEvb9ZVRh7iTrIm6OnU3rdqaB54vGeVnzIlmt+cSawO1Kg23N+K5od/qALeX
	MOqtDaP9k0EsaD4l4s5VHX0huaHXuYKxixAR/sbLSE+WBuJWShGNuLvtPxAyoAVbfNxcLONbIREDE
	PupBF982TdJ+zrWoUgkt5k4Rah3fU+BpVs85qP+ZwGU1aXF2vHkcz6LFvcZDz02xfURQpgJMYqFYv
	qd+E/mK/xpXQ3Ij0UVujZaSvvA6dw3703LNK79h8YZioLGN0WQb7nv2tazoZsV+IkNznDSL2g6nm5
	4sWeMZnUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kav7B-0003k7-MD; Fri, 06 Nov 2020 06:20:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kav6E-0003FW-1a; Fri, 06 Nov 2020 06:19:54 +0000
X-UUID: 6efd980687de4b81ab62ae629894bca0-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RAGgnDBBxlUMea+BLDILWdxtJ1+gnngFehm4heLDSX0=; 
 b=ezQhxO2gzsq2DUWSG/ZreFsDMZ2Q77WvRufkGzgS5/32kc4tdqd7uX0Umd0hJ8Y6Xt0pUIXPbmpTNwJtoQlMmX7yXS9kE3wzOsTeo34jRuMif/c9+pTOzFIVBVKDdr3Pq+QnCubKVBJVHS9i+dpXRlTvfVd+nJc8vgQdzQb7QKw=;
X-UUID: 6efd980687de4b81ab62ae629894bca0-20201105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 448399212; Thu, 05 Nov 2020 22:19:39 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 22:10:06 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 14:10:02 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Nov 2020 14:09:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 12/17] phy: renesas: convert to
 devm_platform_ioremap_resource
Date: Fri, 6 Nov 2020 14:08:45 +0800
Message-ID: <1604642930-29019-12-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 32FD6B92CE71D460B2062F12CC7764D56DBEC637CAE1AB0F201200AE9749D5DE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_011950_264909_9068DF25 
X-CRM114-Status: GOOD (  11.99  )
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
v2: no changes
---
 drivers/phy/renesas/phy-rcar-gen2.c      | 4 +---
 drivers/phy/renesas/phy-rcar-gen3-pcie.c | 4 +---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 +---
 drivers/phy/renesas/phy-rcar-gen3-usb3.c | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 2e279ac0fa4d..c375a4676a3d 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -339,7 +339,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	struct rcar_gen2_phy_driver *drv;
 	struct phy_provider *provider;
 	struct device_node *np;
-	struct resource *res;
 	void __iomem *base;
 	struct clk *clk;
 	const struct rcar_gen2_phy_data *data;
@@ -357,8 +356,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/phy/renesas/phy-rcar-gen3-pcie.c b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
index c4e4aa216936..4dc721eb9577 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-pcie.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
@@ -76,7 +76,6 @@ static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *provider;
 	struct rcar_gen3_phy *phy;
-	struct resource *res;
 	void __iomem *base;
 	int error;
 
@@ -86,8 +85,7 @@ static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index e34e4475027c..1898bbe7c8e5 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -611,7 +611,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
-	struct resource *res;
 	const struct phy_ops *phy_usb2_ops;
 	int ret = 0, i;
 
@@ -624,8 +623,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (!channel)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	channel->base = devm_ioremap_resource(dev, res);
+	channel->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
index 566b4cf4ff38..f27d6f471629 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb3.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
@@ -133,7 +133,6 @@ static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_usb3 *r;
 	struct phy_provider *provider;
-	struct resource *res;
 	int ret = 0;
 	struct clk *clk;
 
@@ -146,8 +145,7 @@ static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
 	if (!r)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	r->base = devm_ioremap_resource(dev, res);
+	r->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(r->base))
 		return PTR_ERR(r->base);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
