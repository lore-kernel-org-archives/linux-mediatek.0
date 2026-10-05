Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3A8CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=; b=LidZwRhrZyNo85oQ76U/jEjl7q
	5fJXLaZd6q0txq+T+qn2eTIrZGnp7N2INR/zhtZ7IpS3ycEp0dHEF0nUErY6paUb3ciW+hfb44172
	nCTF27nqp5tzTN2wpVTeVDRcfj72g75eE4bW5hFG+gRWKqlcMrly7OXwgvRG09eF09o/SINDB+SB5
	NakymDcHhcfKPxDO8FQ95mV1wTSrGvobnvKqaTn6hWFfHDMXKUuG44ojtJEON6EfGw9g9z70HwQbR
	RiVWsPDUo1QwfWYm38Rm0AFKT2zy0AHYLEPIkXm8ooF4MNPkGlo5oyFdBzDJm6xIJgw85F+gNE2ZX
	dbCusAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUF-0000000GHYz-3SK9;
	Mon, 05 Oct 2026 11:04:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUA-0000000GHSB-3E1y
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:03 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-88b7d853b11so659099b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198238; x=1791803038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=jQYEPVB29PLOg5xkQjCIq8GLz5b71d2cFukg8/ecPMFiepsACN3Dlk4/8+JRTM4BOX
         7EzGnRpQFQQr1uxQJq2Es5kCpGWFmo1IoUIhMwil2rSqPXxeBpezAYRLwOaIOMcWioFD
         uIeHpUTii1vOP71ObJjvsNxvHkIdJObwYNsXA744TPH0iRxJ+iZ1mhPUoUC70O2RTTht
         08byhNS6IkrTZGS4Pm1V0xlXqml8RnmtLJq4SIRF4mN9V1hGeR5aA+gWsVvgJOK11nyd
         Q3VzQ9Ok9RpM0OTqs295WrjSwPRbiOOBUmiS8b0EI2ZKztNPQxzqP/1tLjBu5rv+3O7I
         RhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198238; x=1791803038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=QOY+eQFI2iScCHlSn7bv5E8Zj86TjX75pH2SbWWFh6XADj0rL272/AFIbrXJjqrEBt
         0ZKeyvEnBMAmx92ZMjijnit4cuXhQmzVCehDUqn9aGBZsZZq4daShzIiOaAt3zOshJgh
         c38Z4VozdD5Jsf2EDcWdArYGB/ZFlH8dVZpvDxrWemsB/5VzFh76w20R/HV2+i4ZxOKa
         UVV/CalYerLGYM+Sz7iLbw6b10a1c/h8p/HTDUlXpXwq+mXpj3IghDQ50PjxRRnaErGp
         evu60LilVwF4aRs1Xo+wOtV5QdrGi2F7vdl0XOcKGDyKIXzXsh1loSTPXlGIZzOcvBwu
         MRIg==
X-Forwarded-Encrypted: i=1; AKwUvByfB9o6H7DrawXJ5l03NRwALb8taiFBW5a/e/QvM4e4cN3Pnq81qKo2Io/Rwr59puegk5dfZfjmW4ZCn4dItw==@lists.infradead.org
X-Gm-Message-State: AFuF++kwbH/5RhLt2wghcpjhYs0pSNwmQnMCqSt9OspezP7T38Bz2dfo
	Gh7JFNdWee9imOYCRlPdaKA408p8YBNbtpZbabGhU5OiAY6Fu9uTUX0s
X-Gm-Gg: AYBFou0Jpj/6Q7K9zU5YeB05CGKTAYUju1mJ5kAbnz0yTUIzcSNLUhlccBRBKfa9Mj/
	97rG2F0lxhBtCQssI8BBOZDuIR1UCY8yoLGIw98jj79X/Vwi784GEfSt5wyGKkSuIrl8Td0Zj/p
	iTOX0S93z7ZacLV6195LN4jPwJb9Fmp0LhNu4pFjlVnQD51L442+B6qiGHnL6TnzDqoFCdkGry9
	vPNRopIu0rTNoj+IocSbrgYWkjMIY1/9Cj/8DzWOwwuSc3sVAn5yoyOGaqZ2ivZJNZdgSZveBMm
	OE1PUHviyOa3FwwoT5xVox9IK8SQtCYfko5o0Yo3/HGs86Xk3xljpX45PrBzijE8/lfpAwhWISp
	myDkuO9gHRpDDQlNZCjC7NGAfriMkhUuwWAEOwb7ow+L9lTpWCNytdGtsxkoXrrxNCWjr5GKX0H
	gdXeDwWQfjfxiDsGwR8cAfMDWcQ4TZCTTI8TtLICM4PEIfCj/JItr5yBObZJVVgdh7f1UeV/gWE
	YboiOrbZda0DRu4LrrJVZGnXMQ0+IEjgeMY3OEWZTKSrBGo7IBeGcKNkR2sWTNX3LFN0FmeBtRw
	CdhF6hKsxkGqWQ==
X-Received: by 2002:a05:6300:2209:b0:3dd:57bf:7248 with SMTP id adf61e73a8af0-3e0d6b554d7mr6668842637.18.1791198237926;
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Mon,  5 Oct 2026 18:02:52 +0700
Message-ID: <20261005110257.50145-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040358_845122_DA94F42C 
X-CRM114-Status: GOOD (  11.49  )
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

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1bca2f62e76e..4ddf2114a1ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0


