Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 13:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R07szbdVMc5pvkv0BJJZ9vf/HO/UG48kk9diDWtUFVY=; b=zuacTVLJ0Pbff7
	L3JQcCGBnKpldHBfQG3atrSrbcfnweBcWJqkxYfpXi6H1I9Ji4J/tl7se3d4peykNVmMkQweymgdW
	GRkSPDzc0tdOufUeQIbVf/kLeLu1kJWuK2iEh6/77JMY5NObeAwYKsyZ+pqetV05J/+VuBQ2pq5Cu
	s9yLi2bScFU6D1a4641u9P1ZZyjgTTkChpszoq0JO1wPq2u4Xwv04u+YuSmpHtfd59fBoyJf4ngbb
	iCpvG9olREZ7xNZEUPfKNRsgTW4TuBUCh6MTvh3EoMwvxpSXiokIV8TQyTDGWuInsqiH4q5XjdyWk
	fgKmqBzPoIa+7vur6mYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRDH9-000FMO-O0; Mon, 07 Mar 2022 13:19:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRDGx-000FJx-Qw; Mon, 07 Mar 2022 13:19:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id s42so1138089pfg.0;
 Mon, 07 Mar 2022 05:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=8UIXOdI0t1TiJ+FRLj3UKI2HFoPWogUwUu2GB97fws0=;
 b=aFXQLGZNm6HlTM+8vb5jBpBwR6GcUgZ+vJeu6kLxjsPs4qpHX63yj5GjD7LIv+R0qG
 uW0/fL50y3txM8TmbA+ZeFDXGIwErtwvN+cksdP91/UNNNL8nnfMlNWMM+xMKJot988o
 FCNj/CFn2yPPNnTAmUEmNjayZTw8UHpvKiLp9kqXlLOwmJBU1aIqd3sXdxKGPLu56/85
 XZMh0ztdYKajUKKqNMaUCjrqzpZ5Jd7hH5ZrmkrDm6eMZxAciarclpNiwIiMPuA/a4C+
 m01AWr7JiT9EH/Lu/XqMPX6IH6dVMj6+VCCWXrUhuXDnD0HZ0VdfgxDJdNAJ74Caj/Gc
 ZZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=8UIXOdI0t1TiJ+FRLj3UKI2HFoPWogUwUu2GB97fws0=;
 b=2M/Bweb7KspJfXe6evaAIvAsju0vu7uzmBWPKZnLRYjbhFfDiPKJDcmXUh4vVzpJkg
 z1tEDUFrldQQi8lLW+pYJRnZtm3kfMjHLJtFBDN2MD0r2PfBfLHm6599ZQ2dkwevCoCz
 zKimOkSPqbaEoSEgRZRzfCA7eavITlaw+7Lnmzo0qT2CsFG7Vegr0XZ679n7aZxhiEnL
 kM5vEE11sHee438ficmMmd6OzZZoV3YZH/gs6u4YeUyP8CilMFhtLNRpYWNEGgYNfIEf
 WEbLlb/l+NhQNQwhJTmKWAd1hfDTrDP7p/OYJGVKi3MKVUe/NVjLwPsKwAduHS3s5p5K
 rTXw==
X-Gm-Message-State: AOAM533if2IJ5k6QKIJXkYM6KtyWwTZQTUVEXF1yTQEWi4GoYebRopBp
 n0BGi++KrLsjKNq6ZxV0bMA=
X-Google-Smtp-Source: ABdhPJw2cXIDr0JRcIC/XnOnRqQeuQAShi8lvv7wag+5HYdHbVOXvTbaf3SR8QpJ/e9XmNztZflyDw==
X-Received: by 2002:a62:8f83:0:b0:4f1:68e4:c561 with SMTP id
 n125-20020a628f83000000b004f168e4c561mr12760779pfd.67.1646659175160; 
 Mon, 07 Mar 2022 05:19:35 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 m8-20020a17090a158800b001bf2cec0377sm11040696pja.3.2022.03.07.05.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 05:19:34 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, Shunli Wang <shunli.wang@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Date: Mon,  7 Mar 2022 13:19:21 +0000
Message-Id: <20220307131924.9905-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_051935_920308_692C503E 
X-CRM114-Status: GOOD (  13.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
Fix this by calling of_node_put() in error handling too.

Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
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
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
