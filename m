Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0CBU+PDrEHsVLfdveQBJp4jFWPrsoULJZZe0DDR7fJQ=; b=MO2iJG/9j4TfLf
	Amax53B33O3VE4Uj0aHD8E7XQjhTaxXs2zlhZt5POpy7SS2owshLp8INVeFNB1PP/Hw4w59kxdgEv
	+N8cfIYtfDnWSpmxmnaFZWuSafFXjWDKLcbE4tlVv5jXAFSG+aiJrobA+BLPRQy41mHKD7/kq0tfk
	FhpFXvhb6lCo19YbwQkfiFZPOZSRQD3kLxe1J/GmgziMPBiE+1xje+Z/WU78Zc7Ru0YpwOqmVgrGr
	a1H+v7IfRkyBX2zvelhyFqppOZEHh3klBNYMsJAhOzU/iXnsNiGIcoCOSN4wObutT8+AZqJvmMZSo
	9mulNvp/7SLCcbNssffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbJ7s-00EDiL-DJ; Mon, 04 Apr 2022 09:35:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbJ7e-00EDWH-Tm; Mon, 04 Apr 2022 09:35:44 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so2366649pjy.5; 
 Mon, 04 Apr 2022 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=NFJoHT6EmGTYBUPOupG38cbbiA5NqTvKVPy1Pb3g8l0=;
 b=hqie0VxbYc6jPuFUDUUWm1ttjYV4p5WiT7ENtpsiDJIZxfyFn8KEFNdFEfMWRv7WlT
 s4gwzU9BbT8f7aP01MHVF85zFMbgqlHDUL3hg3KSpHA88D7qEyQN8o9S1mZRK2HTupsz
 pjLzKJCvhIICpDKDOqz4Au81BgUEMVRv/nxup5iZJBKY6fktTyWz2ww03AWmpaPE8TVy
 SyzKdH5qTb00ZfGBjVS5/XU1AQBJ1SPMpZ2Od2UUpqxrDw4MvEGj1R8nbyqfxHiJ3FiZ
 Hw8k2PMX0hgXLjfsdoKXvPWmHxc/U07vws0xXytgr0GA+Y6fL1626W5leKk1qWV1VFfo
 87Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=NFJoHT6EmGTYBUPOupG38cbbiA5NqTvKVPy1Pb3g8l0=;
 b=xro3vxKfxiK2LaZ7JKGpahb7TWw7KVTZMj7vGwZHLsg3ev7nf6cfeNmi7MgRueJiYu
 dUQJurLNBb3iZc8sU7oy3TgFEJNQhS3Rb3Z9F5p3vf+GTewxHvSBnz7CG5RDB0NF+DCG
 QDh/Dr9o3rpegy8JIsLYwei010BHnuEwJ8rjAEouvDNuWploAwt/H8MCr0CjFlt0tNoQ
 phO/Qms9jh2PTF59MCp9BkRAZhaCqOC8aN3wz9J1vkNlgMAC+IpyMO21qWheqBXlIBz3
 aGS8biF72y7AqK8zp0xqjIvLNLqOef8y8hHJ8ew/1+1ceTC6xGvhHk8lBOmyymJgGDp/
 nUew==
X-Gm-Message-State: AOAM531uiGqZ0JXQSfEOSw70uwgsdbMHd0qOEQ81Ag001mT97UpByage
 oLJE9I02q9i6MKCjMbxtuA0=
X-Google-Smtp-Source: ABdhPJw99iosJV9nPCTMTX9k/SsOa92D4Q8eA8BMrDxaMJ3zDelyoQIOKd0hFHAqFwuNdvPttgVplA==
X-Received: by 2002:a17:90b:164f:b0:1c7:8d20:ff6d with SMTP id
 il15-20020a17090b164f00b001c78d20ff6dmr25522757pjb.64.1649064938871; 
 Mon, 04 Apr 2022 02:35:38 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 j20-20020a62e914000000b004fa3bd9bef0sm11032863pfh.110.2022.04.04.02.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:35:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: Fix missing of_node_put in
 mt2701_wm8960_machine_probe
Date: Mon,  4 Apr 2022 09:35:25 +0000
Message-Id: <20220404093526.30004-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_023543_038454_991E654F 
X-CRM114-Status: GOOD (  12.14  )
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

This node pointer is returned by of_parse_phandle() with
refcount incremented in this function.
Calling of_node_put() to avoid the refcount leak.

Fixes: 8625c1dbd876 ("ASoC: mediatek: Add mt2701-wm8960 machine driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index f56de1b918bf..0cdf2ae36243 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -129,7 +129,8 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -140,7 +141,7 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret) {
 		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
-		return ret;
+		goto put_codec_node;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
@@ -148,6 +149,10 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+put_codec_node:
+	of_node_put(codec_node);
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
