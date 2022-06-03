Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F772C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=djWY8jNwb9ImsewaiitUkSah3HpYowid9R2P2ynFvjo=; b=hn9dBPmbpAgzKQ
	2Z279K1p5eSRWaQwbjPg6BjyOYnOmoKknDoQOC92AenwoqoeIyJH0WUc/R5eb12FxldKv05yfUIPU
	QlrYHXd8FXCclZFFun54PD5NkKXcjvhn3zr0+MtkAyodkTwTZdEOs6i3o4vpqAb2bKgzMUWPfXKOI
	1bcxKLk1X7BdYePOT1dslLPqHkaigXrzuKROCRgvx8Vpf0Up9Pu588mH5/nej7wvEw+pJhZj+xYTP
	0Eggn8QstecyVyP2R+s0PsQ0X+k49rrK8VJvzjpxvHPUq7X0Hp4lWpz63GULtv9NX7qR1ngR4d7Xn
	6GI0X/8NRAByzSZNIEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2lW-006frm-2B; Fri, 03 Jun 2022 08:34:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2lL-006foZ-E3; Fri, 03 Jun 2022 08:34:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d12-20020a17090abf8c00b001e2eb431ce4so6746207pjs.1;
        Fri, 03 Jun 2022 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GpfF8ItPMk0VJbbfMj/WC62xrovcB2QttagaUM4KJ38=;
        b=hx9nlXm+saSHa0qlQPDeVf9Evb9JKM3WDBSe/Mibf0IxM42umtirmqRX1DYDq9SePl
         Ee+zwR7LTa6mfdGdKNrLO++/HcpuzfJU5qcYnaBqCqy9tPJc9ZOMDI9uF92+Xi+rWDpf
         tU3ysW+XZ2xPe3SqAvyHX9btz9ou+ZwGqhCxQuGDhc2NrMQXH4UVJISjH5yrP7pQCFmt
         LdweHKNZwj9FwGZKLsc0ShA03be9Ok31txrcHV6dyxliOrh8VDHZjotcuo06d9Qjst4X
         ECtzZWJU5jmNsk8eNh9sKDu5PZ1xXDLVi31/FppMY5b61Chhl9ckWdtuzKAdDEAMS0BV
         2WqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GpfF8ItPMk0VJbbfMj/WC62xrovcB2QttagaUM4KJ38=;
        b=qjKG8I/uB5yL9ZkoyT0L+eZPbvGoLOAcnM45VCa15OJyumQMAlhi6LsZQoA7ukCsfF
         rbxK/gIWtgsl1/Unh4PvnhjSGx9iEbFJkudHh55FZxcmLrkHx8yD6DseIzUhZbi/BQbT
         5kt2saFMYgWERIOgJ76s0CtBKrfTU1LcIpfRXw9eJjGlgM71tGC9hGpPcObMYQ+OK6cO
         Fnkn657fWepgcK39rp8gOdWKHnzbzCcSJlKS0UQCM97poY9CAuWGZzA2MTrNXuBmFobL
         NcZ1wcI3BOzbStH4VG4rW6e7XU1EgMBl3g2882zRk82dUqLeNQftjFUeBSUtwaPsEmnp
         cvtA==
X-Gm-Message-State: AOAM530eMRaxcljZUdQIRcOBc0ngaRZJKa16jv9JUQ8qyfRRYktuOXlG
	L3FZslm0FkJuSDuc2+X/+HI=
X-Google-Smtp-Source: ABdhPJy42CKbXP1g6HSFgMNfnYKPHDiOSTgrA1jna9XgHfAtjIeZISzUg9TczCGoz/8M5puUSJSJvg==
X-Received: by 2002:a17:90b:17c6:b0:1e6:8486:b324 with SMTP id me6-20020a17090b17c600b001e68486b324mr8464340pjb.24.1654245269977;
        Fri, 03 Jun 2022 01:34:29 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id k5-20020a170902760500b0015e8d4eb2b8sm4809485pll.258.2022.06.03.01.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:34:29 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
Date: Fri,  3 Jun 2022 12:34:15 +0400
Message-Id: <20220603083417.9011-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_013431_507145_75C2C941 
X-CRM114-Status: GOOD (  12.56  )
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: format:f0ab0bf250da ("ASoC: add mt6797-mt6351 driver and config option")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-mt6351.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index 496f32bcfb5e..d2f6213a6bfc 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -217,7 +217,8 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -230,6 +231,9 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+	of_node_put(codec_node);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
