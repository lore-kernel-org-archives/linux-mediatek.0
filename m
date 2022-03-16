Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC54CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsKXVRQ0ZdkJY/I+Ur16lCjheIUzdLw5eZUIgwZM4ko=; b=uPQ6BTu5tp/dMl
	5DEhSDvU015vyz+a9gviBpYmY0gbmkj29sVU8CAhkeIA0WbVIHRrTfG2kovA0tPF+uckP0ExBCv4r
	5zDnsBQrVOourEkcfgzisdZJzFrFZcogY1jGIMZwq9pqai9zABSJuJ7FaHaS831P62Kv7fFcqOy8x
	+Xg3vGn5ia5OnHrLb6dxl6whCMfKk63dkiX7vVLxNmzOj5YgDFBTMDB051BHOtKWaPPSmv7P3pNhC
	XjUBumvBZMnBZBKpGIP3KjpA7h6TI1p209VMDU7azAbG4ucETCsy1T5Wf2SSOQYtOkNDWURRjgJQ/
	oA50R38pGjdPkWLedgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUIfA-00B5uV-Fr; Wed, 16 Mar 2022 01:41:20 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUIey-00B5sr-6P; Wed, 16 Mar 2022 01:41:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id z16so1800903pfh.3;
 Tue, 15 Mar 2022 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=5TN7lZdXFXxg1iaTCPv4OVG95Uy6qF3btAwL8YcaPoo=;
 b=fp6lcFh5R0fHZgw6XCRFpUL7I5I1gXmE8/vyIb2woJggGoKpx50bjig+qMBd33Y7WJ
 kVuGkMUNDOsxAT0LxoZMiZktQafTk6zX8IBjtpBWOr6JKAc+pGnn41DSEGPcj+K5e5j7
 9eEPSz1tMiJuALgTV9pauBZGx9f0iZO8XsNtGu7s/plgCrynSjgc15H4XiFvzXE5sjlr
 ZhVXs0KI7GY5UGlPLEaDuBg3g0I3YVUzZiXewCh6skyTB6rGNJOvcKadRTiLEn7VaWUh
 ZsVBekxVVg3Q4R57fTjai04UeQos0/OyCC9zSRyl+l1y5I893f5j9Li8nS1yujnNx0qj
 BZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=5TN7lZdXFXxg1iaTCPv4OVG95Uy6qF3btAwL8YcaPoo=;
 b=EMavi095N0+NTa+aDQCfC6+iKP3WkXLq4L5prOOGo0GvGZ6CPMT4gryX48TSI+IGqD
 Uhtdgyg8aY7JlYK5SJbNjsSbx2Dxu4ybdGuLxzbeowixzUgY7igeq8okj4+RGrP21sJM
 lMPeFBrvNyC9vCQ9Xq0tnmjZQ2FZuAkyVVXopc7arkuMMuZAQq+GK7jhwzoezLOrP8mr
 dMWbx14naUUn9mtIXPCa2323UGVn6hGh/QLnrJzb1bma9aRW9137W6dgDXtEvYmS+gkO
 uQz/5eHcvud1RMaH+WNikWCAu4KMXgPDF/BFQ3wiBBtVZtuJa2H0LIJNBWdI18PsKJt7
 2k6w==
X-Gm-Message-State: AOAM531qu+YftUrBnDewUDjv37gN5fjR0HEWddbPQNseAEhkiZSoxh5a
 7Fssm42xHsiFfDwtBggDRYU=
X-Google-Smtp-Source: ABdhPJxK7nJ6x3EXhO8mMTf3wXoWFtWkzGi6+LnIsadkdyjrPZjF5qTX1txO598/jtLONqY44bQ5Jw==
X-Received: by 2002:a63:8e:0:b0:380:93d7:e85f with SMTP id
 136-20020a63008e000000b0038093d7e85fmr26142946pga.177.1647394866646; 
 Tue, 15 Mar 2022 18:41:06 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 me5-20020a17090b17c500b001c63699ff60sm4485594pjb.57.2022.03.15.18.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 18:41:06 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, Shunli Wang <shunli.wang@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Date: Wed, 16 Mar 2022 01:40:57 +0000
Message-Id: <20220316014059.19292-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <Yia5XgkGyLbIRc1f@google.com>
References: <Yia5XgkGyLbIRc1f@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_184108_275292_7E3CBE16 
X-CRM114-Status: GOOD (  14.72  )
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

Fixes: 5bdbe9771177 ("ASoC: mediatek: mt8183-da7219: use hdmi-codec")
Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- update Fixes tag.
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
