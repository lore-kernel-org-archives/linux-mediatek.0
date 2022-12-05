Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11735C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fB8spLlu2R22q6oqnDl54Q8Vy2XCUTkav645Bl6iHhk=; b=fMixC3qo7N3NL9cVUM2aM08Scm
	tuXT3DW8PXi96yczfjlkC85Bou64QHxuYKgVa19CaFZclBAeQNmVe/KK9uA2IAt7vb1fPChS9IDkG
	qS0ZWNR4xftcnF6XPa6jzqDYr6kOCH+LsQUQuKurviLSO0P6U2oevFiJb2VfbFsb2mKCfbqttMDla
	7gsFBT4Q/L01MbEv/ZmCZNEzRYbCWc7LxfaG+JBpTmka0jVHUuGFFcRs/tT7GLaHXWBoORg+onpQr
	ydqLNKNTjAP7dmu1q0BbZIivEx3ZutI/n1HkhBLJlZGXll+B8sz5ArTYXdX9VRh54P6A328RIrF45
	PIgWx+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28Df-0004Uq-JT; Mon, 05 Dec 2022 09:57:03 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28DJ-00042J-14; Mon, 05 Dec 2022 09:56:44 +0000
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NQf7V1kFRz15N5V;
	Mon,  5 Dec 2022 17:55:50 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 17:56:36 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <shunli.wang@mediatek.com>, Wang Yufen
	<wangyufen@huawei.com>
Subject: [PATCH] ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()
Date: Mon, 5 Dec 2022 17:56:28 +0800
Message-ID: <1670234188-23596-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_015641_313877_806BE4D5 
X-CRM114-Status: GOOD (  10.17  )
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

The node returned by of_parse_phandle() with refcount incremented,
of_node_put() needs be called when finish using it. So add it in the
error path in mt8183_mt6358_ts3a227_max98357_dev_probe().

Fixes: 11c0269017b2 ("ASoC: Mediatek: MT8183: Add machine driver with TS3A227")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index a860852..48c14be 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -677,8 +677,10 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
+	if (!card) {
+		of_node_put(platform_node);
 		return -EINVAL;
+	}
 	card->dev = &pdev->dev;
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
@@ -767,8 +769,10 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -776,7 +780,8 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 	if (IS_ERR(priv->pinctrl)) {
 		dev_err(&pdev->dev, "%s devm_pinctrl_get failed\n",
 			__func__);
-		return PTR_ERR(priv->pinctrl);
+		ret = PTR_ERR(priv->pinctrl);
+		goto out;
 	}
 
 	for (i = 0; i < PIN_STATE_MAX; i++) {
@@ -809,6 +814,7 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+out:
 	of_node_put(platform_node);
 	of_node_put(ec_codec);
 	of_node_put(hdmi_codec);
-- 
1.8.3.1


