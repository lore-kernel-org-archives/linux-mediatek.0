Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE03C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=; b=h9raTHvEdosH8pb2cQSpRasEjY
	HYIPJQ7ZcsPZ4PeyE+09RHsUwXwsIcAcVz4xDEZ6j5nYgLbuQoGfF93tSqmtXIZD4IYwQXd2fWSfY
	EpiE9Pripxko+QMDuVxEjLO/YjJbMiUpCvOlKl84W5s+/yD5fKHw1tEfrwNzRcR+PC4FCyz8HDo2x
	nu2upQEA5fhfzlfnLkfbus1Cq5aHw+cqgm+UYDgM4IIQadJ0EEZk7m2F72Nebl5jGvIynEFb0+8fs
	ETVW8yw5ysvXnIMP+Q24aNXZhvKq4w2uMxhV0guAvrtFqRDDaLcppYiJwNjp6u+nUF84tUSyO2x06
	O2ZNytYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKyWt-00AHjf-0J; Thu, 26 Jan 2023 09:26:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKyWq-00AHjD-Aw
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 09:26:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so714982wmq.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=;
        b=nyvmsai7ZWt+8fiqIQJmJU1b5/dbt1jtvHROKxY7qs4cBunuCgFYWBS3vYtLuCEMAD
         PUtk9CgscbpUf5aVFQZ5LMQmlm5dx6m6vT9bSPEtqbRezF7snejuuAlHTvaYea4c5XvO
         EdCf+/jnIiAMhxfBHTW4qHsg/9IrLG/ewT9OboFuQVc4SK0bV/ApuUap2xiYIYpQ1uOx
         UOMR1OnbIwxxSpoB1YpkkRpDIbepNTX9bZiWWIH/UDKiyiNLbGD5Fmd9qnbnVo4fWZ/N
         cJTtarAbeTrKwcXJRTT5Pb41K5kSpL3pbKn/FipP4I7xSa2PJCuYmxDt6ltApD6EaQxj
         kV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=;
        b=f27TL6Yegg6PbCpd2fzCZ/uaWxK0s9VKSQt8RZzbO7AfqtcACYzAP9Y4bCCGFJcDHh
         37OQH2vVr39NhPNewrACRjDm/uXELUNte/QoeXfFsOKWYEMkAYe8QSFwmooFirfyaXgQ
         G4nlsEsIpnyb13j3iE7Q/5UI2kmwUpyl6PbFXJyI0f3pyaQyfQBVv4oSIGm2+3wDckwM
         cYLZwUXBQCp3CHIEmcjNqJsj/pFvltpvhYH5lasNnwL2xHUJpZ/e4UscotD0nV8mYkSt
         liCpjA2TdeJZo/r0P4iOGyH8ggOV721ivUk/86GG2L5wIoJM5nAu2cehlUcUKYh6CniI
         fLjA==
X-Gm-Message-State: AFqh2krlZE5ZespBlw3udDsjvtLnZsqRdUF3XyBkotTArF2VApNvoZhu
	E0SW4Avkcsdye/YsUq38zuQ=
X-Google-Smtp-Source: AMrXdXvBqRioyyA4099IubEJx8GR5Jtpr3rsCZ5m5Oyz8/c3oySRDIwRWgrlRYHiUeSXqbL2NsTbFA==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id n6-20020a05600c4f8600b003db066ecfddmr32709189wmq.9.1674725200604;
        Thu, 26 Jan 2023 01:26:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c071500b003db1ca20170sm896026wmn.37.2023.01.26.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:26:40 -0800 (PST)
Date: Thu, 26 Jan 2023 12:26:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yang Li <yang.lee@linux.alibaba.com>, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Message-ID: <Y9JHSwcfdNcfMjjt@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_012644_408426_F4386459 
X-CRM114-Status: GOOD (  10.50  )
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

We know that "irq < 0", so delete the unnecessary check.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 57a31330e5f4..e8e84de86542 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3220,8 +3220,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+		return dev_err_probe(dev, irq_id, "no irq found");
 
 	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.35.1


