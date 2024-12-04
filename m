Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE48E7716D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lmhyTT2gnZ9bY0N8ST8GSpbytof12mEhpjxb7D+L9U=; b=GobnJQRlyQAfpc
	bOWtSy7efdKpBLHorj8Bfbs16dt/d2NNYVjHuVvmXOFIfxxvf1oELB/f6wERq83F8JPHScPALoeGj
	IokkSBP82olVXh7+xiUwih3bqlegZy9vUbdkOw1RKFdCY/1uCHOxhpjWbE/wcIz72qfYOpLAixOPw
	blqmIyEOchmyuKOfYZ7GrhInA9Bz4z2IpVckCopL0B4pLvKEnV9TjyDQIqIJKVPIsyr7Ghavar/l7
	GSgPFq+vLvzLq+aM/CEJGuGW1zTWYAK9emcQ7X2KoANjK7r0kBmc9ifflQ1xrZV6JlO6llBrnQshs
	MjNVoAlE6lA4p7qB68hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlkp-0000000C3fz-1J1c;
	Wed, 04 Dec 2024 09:33:07 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgy-0000000C2fW-1olY
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:10 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7258cf2975fso472175b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2024 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733304547; x=1733909347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lmhyTT2gnZ9bY0N8ST8GSpbytof12mEhpjxb7D+L9U=;
        b=JJLfAW0j9ZzbJyR5J6nctm9QtlMY2T5fxEvzdEtGCXaV1iXvzQBZr4TBmY2Vdo04LL
         E/466yEx7H6+4dX9rO6faqVws8fFZXsARjfL+SZjzJlRldqWPgQceSrrqkvuhl69Pxsu
         zh42hdwzjiQFC9tEWUEg6v2ODKNOWaMUxwzP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304547; x=1733909347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lmhyTT2gnZ9bY0N8ST8GSpbytof12mEhpjxb7D+L9U=;
        b=a5YWeDEie38a1kSgmbdc0jJZ8aZ+0JElTrSDHt1ha6Fmtz2MHVm59g45fJg/N1dlOA
         pP0OquiIx3QMnvitUQkq5zDjKhhHjsz/bOncKCs9arDOvn+Cb64ESIIZW0MiUId+jb/6
         99Qws5qnGmA5pPlJyBouTSPS1RwXT+pI7KsSh1A6rx9MOXqqn1uVyA2vCgpSxQcZCMtK
         1zIuPP45ttIskKglNA/PxKoqndRVUeJq2qTeI8awiZDzpyuhoTm69Ximys+OAssOGKk2
         2uycyn0TzHFEWdcC6R1AVmvNvhnXjFdJ6iAWrQ9xEv4sEyNv9SekUdIK91N2m7JdSkov
         Ngyg==
X-Forwarded-Encrypted: i=1; AJvYcCVhhqRN51fjyuuKvUNCIv007eedEX9Hq2S+v+VlO/3FCGiw5IW6PusGXsFB3vPTvSJwDncC5yTmOrE5nKabDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXWNhqm6JaZdmAVszuY0Y2fHLjW0B15JTQ0uB20B6grUBZ54T
	h22Ae9NygVFAuehjsefcgUTM9VwFJxCjfV0FYJ9WZFespFjVQK2A4Q8LqWcvIg==
X-Gm-Gg: ASbGncuY3bKBAHl0XYVyDwY8kAE3lsV/Zp3gEESn7oxLnPvByRD5eJa+ablYTWe5f5R
	zorMOM9nc6WSYU/sRfc2uCnOvOw2RQe7cyB37dpYyOu6g3YntQXNEfu91XNIB89hagZUKqMNBWl
	FcHfjA6u2lX38YPhR1JMsyf6J9bRc52gctcwS3KXmKBtvLWot3ifQzJdBiD9jR/mpddz37NvjGK
	6WtsVSi9MpqI/D7hbozpQASqHFxzsKhmbeYrWAvLfDz7AQ8k5mEtL5wCWYQNO9UDP5M
X-Google-Smtp-Source: AGHT+IF/J9a4qflcZHiUbg+VHivDCNAN5kL5imj4FjGYpM9OWcUYV3cXUXaClbk0sydJ7WHWfxLZ0A==
X-Received: by 2002:a05:6a20:8407:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1e1653a6515mr8672949637.2.1733304547503;
        Wed, 04 Dec 2024 01:29:07 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2eb1:a68a:2625:b944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d38dbsm11049024a12.15.2024.12.04.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:29:07 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Limit getting top_base to SoCs that require it
Date: Wed,  4 Dec 2024 17:28:53 +0800
Message-ID: <20241204092855.1365638-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204092855.1365638-1-wenst@chromium.org>
References: <20241204092855.1365638-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012908_466743_C6A42CB6 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: devicetree@vger.kernel.org, Andy-ld Lu <andy-ld.lu@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently the mtk-sd driver tries to get and map the second register
base, named top_base in the code, regardless of whether the SoC model
actually has it or not. This produces confusing big error messages on
the platforms that don't need it:

    mtk-msdc 11260000.mmc: error -EINVAL: invalid resource (null)

Limit it to the platforms that actually require it, based on their
device tree entries, and properly fail if it is missing. There is
no MMC node in the MT6779 dts, so it's currently unknown if that
platform needs it or not.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/mmc/host/mtk-sd.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index e2c385853eef..1bb7044f4ca1 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -414,6 +414,7 @@ struct mtk_mmc_compatible {
 	u8 clk_div_bits;
 	bool recheck_sdio_irq;
 	bool hs400_tune; /* only used for MT8173 */
+	bool needs_top_base;
 	u32 pad_tune_reg;
 	bool async_fifo;
 	bool data_tune;
@@ -587,6 +588,7 @@ static const struct mtk_mmc_compatible mt7986_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = true,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -627,6 +629,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -653,6 +656,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -2887,9 +2891,13 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(host->base))
 		return PTR_ERR(host->base);
 
-	host->top_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(host->top_base))
-		host->top_base = NULL;
+	host->dev_comp = of_device_get_match_data(&pdev->dev);
+
+	if (host->dev_comp->needs_top_base) {
+		host->top_base = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(host->top_base))
+			return PTR_ERR(host->top_base);
+	}
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
@@ -2951,7 +2959,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
-	host->dev_comp = of_device_get_match_data(&pdev->dev);
 	host->src_clk_freq = clk_get_rate(host->src_clk);
 	/* Set host parameters to mmc */
 	mmc->ops = &mt_msdc_ops;
-- 
2.47.0.338.g60cca15819-goog


