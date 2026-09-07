Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E0C79F9E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=; b=M/Fe9gXL7PvP6fm+UOF8u4jG1L
	FWWLnsCkimc+Nav3MbPNir0oocnjZvC9e27isnsf6Z6IiJzSESJmzwQ8+aKWMxQAOg/8Xv7243Kvi
	tQg3YqpJFf6aKxwu1HcRQVjq7cljjPMJWJoB+bzcG0iphFxUoBV9IIOVM8vmjORSnTZF0Xa0XvxHr
	tK1qb/CxVjOaXA915z5pnmT018E9SyyQ9A/XIGCoD3O83ufzuHal8BaA+NcjUpwk+3KZjfl0dV5cH
	4zx/yuzuLf5wW9/3ex03wfsixS7xb7bO7u7LQHW8M+i5oFimvejE/vCVNEshwbkitDv8EzPxGLGsd
	fZgVWXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y54-00000006keZ-0oxH;
	Mon, 07 Sep 2026 12:04:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y52-00000006kc8-1mkW
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d7195706f1so37097845ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782648; x=1789387448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=;
        b=n+UuRDxwQ2PgEkKYZZPPfCQYJUmVL94aBBejO1lpHYdB5nhkITPhQkk8Fy5hYvgQm8
         GCXObn590Mbnu3TNO0Io2ANMPgv3wmqCT9EhnWifkmfWppiVYXHkURoMeiw3XKJWl2v5
         pX0jOs/ESWlXqrWUBC3Kq6K+FGwFOXvP9bzvUUhnFkNhTRj9lPkpt/G82lAKGNQApBE4
         sNQYliBiRiGx864uFpYssmZ/18YsUjU4qcQhF3ZzmYB8HqmjIjRhasmu1Eks2KSmB7xw
         IMzTcKCsdH7TGQ90FSIeIAOj8LIiKuWALHuk/e5dIc9HS7EPhuDF45Z0mi5yzaZ//lT3
         jRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782648; x=1789387448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=;
        b=IER+hNym4Jk3lKWIUHuBENL9VNRt5oEGkKLimXPbBvwHi3oSFQM2lq/xZwJ6G1dcQi
         lJXEgbjjDcW9df/yZf4+M6WnVJ6azXkHXA3IxqY7yJSWCtdyHvo6GXTRSoIdAUdgDKwm
         eOR+y2CWMaKxvjfP0vLcskSDe0SwnL53/9z4dimDXU8+3zjwgsJp07C3vufNV25WxVcG
         sm4PA8d9OGSIe3lDIiBuw1RbcAaBwjd/ky+NDD7LS5lftiefyU0ihYTxj10lKms+6JtL
         vKYVNakwsTfxiYRo16O7bbnQuRlwyxOoZvY7WHnhmcxsBG76SmqB/YoEj4ilRxnns5Hv
         btqA==
X-Forwarded-Encrypted: i=1; AKwUvBwSmc7daFQLysPh9970YpBWcuUcer4F8M6v0qQHVSJ2x3PfNX+aNMipBn+GeNUH5Howkq7Hqpxd2nOOBaXgLQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kr6IglvQ7xBdtxTJ0pyl4fV/saqHinPQSOsfqz8JyYmdRlCxPS
	ie49dY/ROys1nS/4J3//0ZN+EzSJZCL4INp5Jww8pxcPg/ZcnZrofehahwCtaw==
X-Gm-Gg: AYBFou2N2C0iBVb0SA1XsaGaEu7o/kyYnJ+j6jNpcyNY06r59U6+marNi4X3S8MHBIb
	A30i0+5KgL4Cx2FB1YnQSBjdei6wn5PQkWNgJMiEUBkj7X0dmy/ay1OfVddyFrJZOD1RuN6nIPE
	NuHla52gX2P0nkWo1nUnzvaalPQM0+/ppjKkmwsxsgu0Edi3kYX7QrSob/IZsvU5nNg6n1ISzOS
	fOWJix2VGQ398ZLlyvOmO4vvxaySMDBSmxr3TByUOL7G+aISPm1y3BKZLZ/vlE3d3Dh4f4qhY7H
	aOsXGPPN/m/RqPnbmH+XGeGpWM5hDjkAUD5v4LSn7eqZ+07wAwdhrCIKInDfXk1SOYfNPAcIhoO
	KRUHJPRnTp863rPmr4VGdX76D0mMYm6KFkywlVAhOBFAHTQ8LwdX3UPQK3xoT5AC1fgPSY7Msl7
	gJI43zOXhKxDAcWllrkoUkvyEx8iJNUFE6XHcD1ez51Ex3IgekuLxuu/geU1QKE8W2ArW7qguo0
	TpLxkXAGufXFNidT6lOXJ2QOk+5BgIAi/CM29hgRFTffpH29g+3u9uXCqIm11Q6KEKOYh0jBC04
	1b3tXA==
X-Received: by 2002:a17:903:3d0f:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2db12637ca1mr316713255ad.8.1788782647486;
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error messages
Date: Mon,  7 Sep 2026 19:03:09 +0700
Message-ID: <20260907120310.135693-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050408_470285_5044EADE 
X-CRM114-Status: GOOD (  12.37  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Several probe error paths print error messages that are already
reported by the called functions.

Return the original error directly for devm_platform_ioremap_resource(),
mt8188_afe_init_clock(), platform_get_irq(), and devm_request_irq()
instead of wrapping the errors with dev_err_probe().

Also remove the redundant "err_platform" warning from the component
registration error path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index f8cbe7bac36d..efad0af977f4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3232,8 +3232,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	infra_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "mediatek,infracfg");
@@ -3269,7 +3268,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8188_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error");
+		return ret;
 
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
@@ -3302,12 +3301,12 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3363,10 +3362,8 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
 
 	mt8188_afe_init_registers(afe);
 
-- 
2.43.0


