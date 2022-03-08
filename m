Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF00FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 01:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g2+bVk8epdTqnd/gN9SuXjrtbjUFDVM21U5NEZ8oNfQ=; b=A5GZfqwNuEJmDQ
	1DfrcGURpED9o6ns8HYgfipFh6aC7riBgwqWXDA74gfzLxO2uOHQDYtHvL4MbtWtP60Kl6VPZQ7+b
	i/0udZNBk9kC8Np8GpJY5oEWWgmYWrTVjP66lYw0F8EQE4UQO5UhmD7dppAYdPjvLQV+TQHdFwY0W
	GtMOhJqxhBMWYyrv9azErE9iEogcuTEeYUWT2AzXIJY1FmYidCnODSv0PDZgsQbhXfsqJ3+Kwt4jD
	E3JmWBGLFFWyOoRrhhpLb+Rm6arY9cR7dmM/Kn2/ATHieqrF5RybqZtG+d9k8KRD8HNBDD6gpYxHe
	l+V9FL311+4erwGbToCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRP1p-002NPE-RB; Tue, 08 Mar 2022 01:52:45 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRP1c-002NJq-6Q; Tue, 08 Mar 2022 01:52:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id bx5so15745560pjb.3;
 Mon, 07 Mar 2022 17:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=58lwskYug/llHkpIrMRW+dy3O3RN+GbIpdAcgfBEttk=;
 b=HSCYAeLoHcpnnM2uKaIA5lifN/t97U2w1M5ioRJjGdZ++5Thz9qLLXuH5q/V+ioCpJ
 B7idQN5/gHfstOY+ov8+wbbGw2JRhsWSbIXivdKSDdTjBQMdQSKSpbhMs47dVwah6oPX
 Cdw95MMMXeJfH+NbYVToxnzsV4ATd/bMKUbC+mBicPFKU5UwSVTZB6u2IkCPHWFW4ezg
 EiUVoRYJ3oIqF1DqnUZ4HSXwSPgLTtVK+2I/P9IWNrr5wEok0ATlQItCDJ/rHikjkIi/
 3sITJfYrTlT+L13h6lvijlT1xW0UsPl4LoL+AEbFNMRYi8Llyj74Jat8B395qAzctYcr
 Fstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=58lwskYug/llHkpIrMRW+dy3O3RN+GbIpdAcgfBEttk=;
 b=NPD1v7awyfjRV4uamPxDClnrJ0hvmtQ4iKUHtE4roVymBZoIrucSF61vtnCulxg6Pm
 j+kQKUw1YON5lStYqy4qqorFuLatsjw8/Rsm+Yylhg652V8Npq8I9CJ0aUftdz1Sa4u6
 U6SeafjdfbItY4ktxqGKcAecGWaz8fyHGdQH1uB2w/4nmxmYXZPCPerzDQExZfMAia1e
 j/sMJKSLfZ7Tq2f9sExEeLRDWtWWgcWlX9vySos+vEVPapkrbqCRTFOxJflKcdT/E1Yr
 tuQVFZRTpcUCNkCCSw64RMwTgdyAnlWFqiFpNPPLbO3md5e6A8sBkLktLZpe9DjsJRnG
 nkWg==
X-Gm-Message-State: AOAM530gWeD+FT3OrRS++Aq9ThjfCa4vXr4ru3485IIu0XMqn9Ne1rwH
 Nl/wfGwRI7vUKpVdTszgEih4K9UTckShiONkTc0DZQ==
X-Google-Smtp-Source: ABdhPJz6lbpi9VHXqUtR/ZCOi8FTsWcSS1kfqtODKavlvexuo70DQjYtfjWCTLdBrNr2bb1jMtcHAg==
X-Received: by 2002:a17:90b:4b0b:b0:1bf:764c:1bc1 with SMTP id
 lx11-20020a17090b4b0b00b001bf764c1bc1mr2012864pjb.85.1646704351035; 
 Mon, 07 Mar 2022 17:52:31 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 pf15-20020a17090b1d8f00b001bf5d59a8fdsm645663pjb.2.2022.03.07.17.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:52:30 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8192-mt6359: Fix error handling in
 mt8192_mt6359_dev_probe
Date: Tue,  8 Mar 2022 01:52:22 +0000
Message-Id: <20220308015224.23585-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_175232_273915_E5546095 
X-CRM114-Status: GOOD (  13.52  )
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

Fixes: 4e28491a7a19 ("ASoC: mediatek: mt8192-mt6359: fix device_node leak")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c       | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index f7daad1bfe1e..ee91569c0911 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1116,8 +1116,10 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
+	if (!card) {
+		ret = -EINVAL;
+		goto put_platform_node;
+	}
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
@@ -1159,20 +1161,24 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto put_hdmi_codec;
+	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = mt8192_afe_gpio_init(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "init gpio error %d\n", ret);
-		return ret;
+		goto put_hdmi_codec;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	of_node_put(platform_node);
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
