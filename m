Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF205C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 06:01:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96BC66101A
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 06:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96BC66101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nLgSzi9l9XYw7ArCOWSWtTFIPwDvtTIQrEHW2aZh4aU=; b=UUnrNjmxaq84Ws
	nPh9i6Jkqr8iqSD3R0XrWxE2exVLDE6sAT0dSjYyk7lJcV/c0zPxLvRInSCtIqV5Pr4lhtA73CIHJ
	k2l5fkEIeHVj0dLDanyQhqk/MhHmn1CoXG6O4u+j2sZzloAYl8KoJRLb988VWuDKBQTBhO4aTacuO
	s4vRE2HEWzKBDgSM85a5lYoH3UMTt6K6+EGlWdjkd4Jo7aDSh2oApJBcQISxFqOnshn9fIdHfd8AO
	Zb2lCmXheMDIpWV1kOx1kWfSeJDdAjC8GZa/X7jS3nHBdFUi1XFOkCSy+ern9eogNdE0XoyabOhCD
	hLv/7eloPN85pfQp6iZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM2GJ-00B1Id-Dw; Fri, 03 Sep 2021 06:01:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM2Fz-00B1Cx-F4; Fri, 03 Sep 2021 06:00:58 +0000
X-UUID: e61fef84fff14a3183151957e4b3a600-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AYaKt3DoV95GK/4Gok/KkHADDtaIERIFcHHStVaUo34=; 
 b=YIW1mMrjFGFQt3WyWf1WUnerwAxlOP3arAaz8u5nj8KQ9t4y3nWULx+9VXY/Gf2461bf8HfHMqrOX7kDdF9hEUlFgm5QtCNbfE6anP5leJE4EHUbJgsSvdLCcixz4zm9kp9YwlNrN5mWFJF2RFC9eipcbBjLNexqyDcIoXiNQ7o=;
X-UUID: e61fef84fff14a3183151957e4b3a600-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1143356723; Thu, 02 Sep 2021 23:00:53 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 23:00:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 14:00:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Sep 2021 14:00:50 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mt8195: correct the dts parsing logic about DPTX and
 HDMITX
Date: Fri, 3 Sep 2021 14:00:49 +0800
Message-ID: <20210903060049.20764-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_230055_559412_E26C0336 
X-CRM114-Status: GOOD (  11.66  )
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

According to the description in dt-bindings, phandle assignment of
HDMI TX and DP TX are not required properties, but driver regards them
as required properties.
In real use case, it's expected that DP TX and HDMI TX are optional
features, so correct the behavior in driver.

Fixes: 40d605df0a7b ("ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and rt5682")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 5dc217f59bd6..c97ace7387b4 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1018,13 +1018,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,dptx-codec", 0);
 			if (!dai_link->codecs->of_node) {
-				dev_err(&pdev->dev, "Property 'dptx-codec' missing or invalid\n");
-				return -EINVAL;
+				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
+			} else {
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name = "i2s-hifi";
+				dai_link->init = mt8195_dptx_codec_init;
 			}
-
-			dai_link->codecs->name = NULL;
-			dai_link->codecs->dai_name = "i2s-hifi";
-			dai_link->init = mt8195_dptx_codec_init;
 		}
 
 		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
@@ -1032,13 +1031,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,hdmi-codec", 0);
 			if (!dai_link->codecs->of_node) {
-				dev_err(&pdev->dev, "Property 'hdmi-codec' missing or invalid\n");
-				return -EINVAL;
+				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
+			} else {
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name = "i2s-hifi";
+				dai_link->init = mt8195_hdmi_codec_init;
 			}
-
-			dai_link->codecs->name = NULL;
-			dai_link->codecs->dai_name = "i2s-hifi";
-			dai_link->init = mt8195_hdmi_codec_init;
 		}
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
