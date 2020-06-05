Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE250C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 10:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E0B2053B
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 10:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUM+FxtJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cXcIEIsq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E0B2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HZmVXj/HuSRZmMmLc05OsefFROFmcIvuGsQFz5nYiis=; b=VUM+FxtJYTGz6l
	GrN/6kHRSJ6xZf0cWz7kn1xCi0Yh6C0wrsD9GKwJNFBmfn7eeLS6RW1Ve1PyH9TjaRsluyZ2X4L8d
	x2hSYHGRmac/jCp6ArB2t+7rz0ikupgRckpZvLpCzx9aL06HRXdRz0xKwMiyRnB0nr+zFjlvaR3dU
	Obibwv1O+Nky6MHNWVHFfKyvhzl4jUbRCyGaTguCyqQ0HDEkiwVwnCy0A8q9zLNpnjprgxyQDTRKQ
	vLdE1Dj2t6982bRvwxluHTzYHWXgd7ctszU+AyNLB+cMDPgDJsTr3pcOydcXbIcQMNI4L+lEzEbfs
	3o4r126Us0VATf91HA2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh95P-0001zn-UC; Fri, 05 Jun 2020 09:56:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh94z-0001V2-5p; Fri, 05 Jun 2020 09:56:03 +0000
X-UUID: fa5fbccea17948daa9c8e48402264977-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0zI7CVoALCkpFWkgGGj1AbfVE36QPtMcgdNgl75YRMo=; 
 b=cXcIEIsqrnB6Rr8oAwIuCJtu9hryZbshnsvBjGe5LPrLEVJ5WKnWdHRo1GMetj2b/dFjP4QeLCJMvQwkRaOWCnPFWlG8GHdU13iB4Rf0g1LPyVj0hoJmf384UyBvgMQLojAQNfP/4y5fly96WiXnR9xMl9wHpJwgL77GSusvuWM=;
X-UUID: fa5fbccea17948daa9c8e48402264977-20200605
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1535086018; Fri, 05 Jun 2020 01:55:51 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 02:55:55 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 17:55:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 17:55:50 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>, <hariprasad.kelam@gmail.com>
Subject: [v2, 1/2] ASoC: mediatek: mt6358: support DMIC one-wire mode
Date: Fri, 5 Jun 2020 17:53:44 +0800
Message-ID: <1591350825-18152-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 069F9BBDD4B821B89F92B59CD0BC2631142D0F22892B0205B49D61B390E5C21F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_025601_225856_BD9624F0 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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
Cc: alsa-devel@alsa-project.org, howie.huang@mediatek.com,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Supports DMIC one-wire mode. Uses a DT property "dmic-mode" to select.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/mt6358.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 1b830ea..1f39d59 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -95,6 +95,8 @@ struct mt6358_priv {
 	struct regulator *avdd_reg;
 
 	int wov_enabled;
+
+	unsigned int dmic_one_wire_mode;
 };
 
 int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
@@ -1831,7 +1833,10 @@ static int mt6358_dmic_enable(struct mt6358_priv *priv)
 	mt6358_mtkaif_tx_enable(priv);
 
 	/* UL dmic setting */
-	regmap_write(priv->regmap, MT6358_AFE_UL_SRC_CON0_H, 0x0080);
+	if (priv->dmic_one_wire_mode)
+		regmap_write(priv->regmap, MT6358_AFE_UL_SRC_CON0_H, 0x0400);
+	else
+		regmap_write(priv->regmap, MT6358_AFE_UL_SRC_CON0_H, 0x0080);
 
 	/* UL turn on */
 	regmap_write(priv->regmap, MT6358_AFE_UL_SRC_CON0_L, 0x0003);
@@ -2426,6 +2431,20 @@ static int mt6358_codec_probe(struct snd_soc_component *cmpnt)
 	.num_dapm_routes = ARRAY_SIZE(mt6358_dapm_routes),
 };
 
+static void mt6358_parse_dt(struct mt6358_priv *priv)
+{
+	int ret;
+	struct device *dev = priv->dev;
+
+	ret = of_property_read_u32(dev->of_node, "mediatek,dmic-mode",
+				   &priv->dmic_one_wire_mode);
+	if (ret) {
+		dev_warn(priv->dev, "%s() failed to read dmic-mode\n",
+			 __func__);
+		priv->dmic_one_wire_mode = 0;
+	}
+}
+
 static int mt6358_platform_driver_probe(struct platform_device *pdev)
 {
 	struct mt6358_priv *priv;
@@ -2445,6 +2464,8 @@ static int mt6358_platform_driver_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
+	mt6358_parse_dt(priv);
+
 	dev_info(priv->dev, "%s(), dev name %s\n",
 		 __func__, dev_name(&pdev->dev));
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
