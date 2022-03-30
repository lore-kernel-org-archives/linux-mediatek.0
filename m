Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E43DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOK6nwzZNF35UAdxwzX7kb34YXfg2XD7LuIBrVPbnE8=; b=YDw3AXdSch5frB
	gc2h4//QyRC3szZ0GomeZ7Kkov2wS9zU5WnekW/L3hlRwHpyC7Xzx5Nvpg7khnqH5c5hps3zrQ45r
	hvT0XmQac8gXlOjGkVWOLHeR/Us5oxM1UrOLrt+sqvnKIkx5ClUt14lxjRpEPejClZVCF3FkhgO2z
	KqAD2ttl/9cPb0PLxDtjo37NQ8ScXHZD4SCmhoWgJPBRxELDoK8Gvxca79WXj65keIruL/DxJlRtT
	pNhbl7eUKXIdeTj3+tInqpABzLVATjVyoz/lC/mBDLQMrh1qLtXm2t2SO6Ww9VetbgpKwLDRX3luS
	Qb0HEIwEP4z8i3TX5rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZWxE-00FU2H-2J; Wed, 30 Mar 2022 11:57:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWoM-00FPSl-NT; Wed, 30 Mar 2022 11:48:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E080861637;
 Wed, 30 Mar 2022 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FD1C34112;
 Wed, 30 Mar 2022 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640905;
 bh=CdMizYcg0vqRMBZy3nZIQsY6pEwDwVuUydNu+uhIk38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hxx23rJVV3pAQMX36J9gEjQqNIY2BS7XRvHlsJCvjgWmhEunErpOxX979TXFCFdOK
 wkK+GQVSZCjLlP/ffm0wvStIxm1AUpZUjCwtwGFNEsA3X5Q+3G3LZChLls5d9E1LMf
 K4XxoZP1jOUeqJaeYk0wn/naNR/+qyKWT0JZRbKyoIDGQAnrPG4+XD/l2lmA4+Q/C3
 LlQyXEGhlP9XqmLdGHEGVggNIRyoFQnSMHBhgEmP2nkHR8U8BSqZPL7RMbUvPU9+N3
 A8t0G9yeBC5PX87x4FGy+qokDiaYxnGIzx4MlcBFsvOJ1WX+YcdtwO53c+9oprCNQ3
 VKt7VkUqBuZtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miaoqian Lin <linmq006@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 63/66] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Date: Wed, 30 Mar 2022 07:46:42 -0400
Message-Id: <20220330114646.1669334-63-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_044826_887490_69F606BD 
X-CRM114-Status: GOOD (  14.21  )
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

From: Miaoqian Lin <linmq006@gmail.com>

[ Upstream commit 28a265a1ee11febeec5ea73a804f30dcec3181ca ]

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
Fix this by calling of_node_put() in error handling too.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Link: https://lore.kernel.org/r/20220316014059.19292-1-linmq006@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 718505c75418..f090dee0c7a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -695,8 +695,11 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
+	if (!card) {
+		ret = -EINVAL;
+		goto put_platform_node;
+	}
+
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
@@ -761,12 +764,15 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	if (!mt8183_da7219_max98357_headset_dev.dlc.of_node) {
 		dev_err(&pdev->dev,
 			"Property 'mediatek,headset-codec' missing/invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_hdmi_codec;
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto put_hdmi_codec;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -775,13 +781,16 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		ret = PTR_ERR(pinctrl);
 		dev_err(&pdev->dev, "%s failed to select default state %d\n",
 			__func__, ret);
-		return ret;
+		goto put_hdmi_codec;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	of_node_put(platform_node);
+
+put_hdmi_codec:
 	of_node_put(hdmi_codec);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
