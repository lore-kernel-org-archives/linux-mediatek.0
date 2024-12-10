Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A871BE77180
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIYaaljMW1uOvyE52JKpg1mRNjsi/3D4cn4UsNQnmlk=; b=1jv32+gvgDTV/8
	ag2fetgZ0hTo+ta9lBkj0BUBMNfDrXrd5ad0H/emDYxZlqXQIeif13piiHET4Q4u9dbgPdKyWKa7N
	h3qA6Bl0slzjrtNa3tDMph2ihdZbKkbNDXpqxhK0dPg62+AS52tUxCpnzrsgGDycux3zc7qp90DPN
	+bJP+dWjgywY1C4J32VSW9RPhWLZwtZ0aXE6v6l3U5iWcMvzxvaLfSK8id5yfii5VJP+UG3Rfrrgu
	fpMKEZTBJ9D3kvc3i9MRBm87b4vHXktXR87z+kNlsKCiO0i5gR2UZdwC37gogKggGNOE4p4CBJAYl
	ITkwxphow9zX8pIPoPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKumJ-0000000AZaI-3ISm;
	Tue, 10 Dec 2024 07:35:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujI-0000000AZ48-3ZNh
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 07:32:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so28165085ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2024 23:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733815944; x=1734420744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIYaaljMW1uOvyE52JKpg1mRNjsi/3D4cn4UsNQnmlk=;
        b=SKF9z6GpLlR74X6XCE4QRwqNaJpeH3q6LtErFk3WWx8mK1H6aG/lKzDxkXE5xT2xid
         oz3yERxRevoxzAoNy27SZP2hlbvy0Tj46IQGbVGub1ziJnCjVe54B/9dvlAtTzlqaPBx
         nwME+K+kWv/Z2FFae67C/t824/6gtKUvcHevs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815944; x=1734420744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIYaaljMW1uOvyE52JKpg1mRNjsi/3D4cn4UsNQnmlk=;
        b=iBoXn31YvU2uEYq1fWuTKE2OfmKwsZlqb98srdq30e9hWAZsIck9uGBQBbcb4vezk/
         lNV8nS112OPLdULkUg7kDoLY+Q5VPMqKiF+UXJJ7VsdTyZ5A/o+7lt/TEEFVT5pvUVie
         cK0B4UYYPNr1O4uKBD1cXoc6HnlUucpd6uM4ID9eehU/gQ90FUPy2PRrLdxsvg+rTGq8
         RdV/1qqvOhdQixyLHyuvzrvKSQkmvWRs4A/exkpWq24FkAPwnwmOj3qHwSqs+NHSFVh1
         rmQGxYUtq6TCTWQW95zIGTeNkmary6nkB+3bF9J4fImdOE7THCXVtjLPzeyvBr6qjOgO
         PO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMXgDZEELjdzDxP8zXAIBjQ+quJkG4LuqeWlPwS4nzu/IwASWS9B9mI+bCl6FNFWlQLDvJlcImuOTDfWBOlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6XI8cHu3lv0Algmhzf2weqCgd1Zy3xeonEkulz4kk630iCR7o
	ENwKMRrMgG9mYp27i9ke4JPix0odaAoUy56vaA6B74aYgSXTJy05dR4JAB9U2A==
X-Gm-Gg: ASbGncu2hd3QEX+Ao4Ln43yjdG4Ed1f89aUk1WKZ+/O2hY1xzFUTeDXOHbo/Sap7Jqf
	p+x7VBGXew5NxqqDJBmNkLmix3WpQVI3IErlV5Ui+gaq6OaAUzmlgx6mAV9199sNCP1WuvhJIua
	oual6JxhwmXjA1EDexZ0rNu84GsKI6tr/qL4ZxFsHWHPFILb2jJZUUt0s9uyMl1QFruiznjURxJ
	s8M8c3aDVafIJTCnenOExFC7wuJoZeAEwfFio/NoEDEl7lmFBfl/d0vo35wzyCov9qHrk93
X-Google-Smtp-Source: AGHT+IEljjpPjIkRAq9lZ+wjZ9Q+4usk5mFRZZW08ysh+jkDMPJ/btZlL9SUPYyzmbG9svkENmEq7A==
X-Received: by 2002:a17:902:ce88:b0:216:55a1:35a with SMTP id d9443c01a7336-2166a0097c0mr55964065ad.30.1733815943958;
        Mon, 09 Dec 2024 23:32:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09146sm83693295ad.199.2024.12.09.23.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:32:23 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Limit getting top_base to SoCs that require it
Date: Tue, 10 Dec 2024 15:32:11 +0800
Message-ID: <20241210073212.3917912-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210073212.3917912-1-wenst@chromium.org>
References: <20241210073212.3917912-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233224_889302_E598BE28 
X-CRM114-Status: GOOD (  16.54  )
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
device tree entries, and properly fail if it is missing.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


