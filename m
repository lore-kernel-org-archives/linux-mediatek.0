Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C771C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMggw4eAIIMNoOqD82TuIffDCB4kGTedXkImx4hYDjA=; b=v7Ua8QuyIdAFnhLBo+bd2d5Bsf
	LLuSUwNCjOAQqCIOqT5gTv+5opu+FB+qnzE/wz5FiptNYJ0UEJkY+mKpkOUezc2LbidM2cBNxmhBR
	GvRhwrA0KUE00niv//Ak8aAhJn/dwM40sB6tx5DcHEfgt7JWu3HlsJbEwyWuf4Ih7NbFmVzi9edPN
	uKIKw9EU8ZyffqsyECsWGSn+O/Bk3wVsGtKkyisSk5m1gxPmCsmZQ79RoSmHkmaO/hil8BYGNhB/9
	QFvZny/fc1DUjiv2FJynT9RkJ1OZpagg8jSnfMu8YL1FD91Rg19QP+4anczg0a1EgD7qhprW2BKen
	c4lCKIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl9V-0000000CrsJ-0Ulj;
	Tue, 16 Apr 2024 15:55:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7u-0000000Cqoc-3Ghv
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-56fd7df9ea9so5370527a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282821; x=1713887621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMggw4eAIIMNoOqD82TuIffDCB4kGTedXkImx4hYDjA=;
        b=Qw+lzC29Djgn5xpKyUYbo6gwICldeNozB+qUZhTS908t+i45EC/yD/gizzAIgG/aQY
         Cn7mri1mOcqBuSirnPEhbQBNt6k7/P74hYNmxEA02YWb/5HCQ3wHDHZznHqMPTThA3rv
         rUpfs6L/QCSCLcLk5RqWqxuJ+FOMAANIqiazhtmDgpH+wwjQ3uuSjD5eYZ+BOSYOAIWK
         JbHSuZKYJdiNzxlO1uCAyK++gBVYUBLIc95tKHU/srMSGf1J+Bxz4/GDWP1T56/aK5bx
         QEoM/MYTc/dlXGILRIw63UASQ7XHnaMroXgz/4qOhnco7/M1cDUocoj94RYjSrTbqVvv
         bsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282821; x=1713887621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMggw4eAIIMNoOqD82TuIffDCB4kGTedXkImx4hYDjA=;
        b=LC/r07btkOftsrqikUCS0IDuS6nau/oIMkZ/oVQFz2ZN4sX11Ym9IIA4FEJaR/2AxN
         G3VZYSaHTK2bTcGxmKMImvlOJIgVGFP1a5LRncO48xhq8G2Dw3W5x/mEaLeltg8mBud4
         qdJiDnom63RNhWXbHqABxnlf7AvJiBh9jXoNAq0ajhCXf6bVKfbCbK9v5yAz8GCjS9Ce
         kQ8fLVPi6XmXIORFLPpfsNrl6T8Fof4anlNnq2GZTtt74ryJh1oeT2XiZjkCXadH7vtO
         t7Ka1nbezR3ONtazPt2K24thqDslyM+NsjCCCzyMpxtySij30pEufzdzL/cAtFolre3x
         m6cg==
X-Forwarded-Encrypted: i=1; AJvYcCWJNKky94NyThWuAylklP6qQWEV8mL/TPZe5opJlDCi0LYl/cz1ElJTvmzP+ApIiuz9ExNJLWQTeXjKq1YRUfXS4d/Nvc8KE3ydJQFnSfF96tSo
X-Gm-Message-State: AOJu0YyBzuCQnXF4kFZj3Epd6VlWhtWPjvGhRhmjD/w3qFVYcklXz15G
	Vj4ohtn3jJHXYeZtRH0IX6qe5IboSznzdvl61i0KJk6sAo1vPhA68zfTki/4lxo=
X-Google-Smtp-Source: AGHT+IG4kHPNppMzbZ+TqGer4WN/sT4qiIADE/xGhBqwrUJLC7I/hWwKiyTjJz3tShpT/DsfMFbnmg==
X-Received: by 2002:a17:906:f809:b0:a52:140c:5724 with SMTP id kh9-20020a170906f80900b00a52140c5724mr7675563ejb.14.1713282821426;
        Tue, 16 Apr 2024 08:53:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:15 +0200
Subject: [PATCH v2 14/18] drm/mediatek: add mt8365 dpi support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-14-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3PSa4tH/zyI8rzr1s/aLzOhrBB2HeNT52fzU5eMeOeM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qMcxUGRm8N5OCd/Fk/xRizSuW+tNcwCsX+kwb
 hyW8FuWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURVoZEA
 CFkEfMS2RbJUzeU6UYxk1MOpg5EO2+mBMtUQwYEm/fkmqVz8IMLq8JRBoeGwIrqDp52D3NZBrv4UC9
 zYr5HViOOH/XWzdzZRExf41VNixp1v7P+sFbq4KFTIZZAAQxFkRKOnTssfGv3neRvlmRVLK9UlVAwB
 NJWV/c5Q4XLE0uicMBKvujjV/6V5bTH9Ib7QW6PvjzHqsA4fRGsyHvalWdMaK9FcbPnxiL/h9ZhBpQ
 bcIkJ8YihSLmSsvoZ+QloMjK2kCnbpUx1jFvp2jOGkrvehOks0xj+9BretUNGKVXewIHeHl6DC90uV
 WEuoeK+eL4EXNQPWAgL3daPdSf2FhIEPleids+MByUqzmHUruYs6aNX5whxcptdbtITgjDmU9NGter
 4KnosCp4CmigOqdwDzfaFdNtvZQ/Kp05yWzz2axkq2PZoN0rucO1wLGmAiwNz7ysc1VYr4DGd3viwc
 Ct5qF/tfBu6PkETYife2PCGSSi3KyIfqCSEphmSHrnXcKqpyioJg+HPoS+NHUmz0jWWiArYahDd8Ad
 h2CD1UfpWXJ3lAeF3eYhI9Ek5Ija1G9DKMz0YHlS0TbBWuQAlbGFIk6HwzRZ1c/GhioWc90RkVERM3
 BYrWNdeIrcnO0zfoecsPlaOQQaR0Gp5bFu6C6PcQ3APMlvG4p2HnlvZTd+sQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085343_047074_989F211B 
X-CRM114-Status: GOOD (  13.79  )
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

- Add compatibles and platform data into the Mediatek DPI driver.
- Fix the DPI0 parent clock to be consistent.

This SoC is compatible with the mt8183 calculate factor.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8365-mm.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
index 01a2ef8f594e..3f62ec750733 100644
--- a/drivers/clk/mediatek/clk-mt8365-mm.c
+++ b/drivers/clk/mediatek/clk-mt8365-mm.c
@@ -53,7 +53,7 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM0(CLK_MM_MM_DSI0, "mm_dsi0", "mm_sel", 17),
 	GATE_MM0(CLK_MM_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 18),
 	GATE_MM0(CLK_MM_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 19),
-	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
+	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),
 	GATE_MM0(CLK_MM_MM_FAKE, "mm_fake", "mm_sel", 21),
 	GATE_MM0(CLK_MM_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 22),
 	GATE_MM0(CLK_MM_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 23),
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index beb7d9d08e97..a4f9376ee472 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -997,6 +997,23 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8365_conf = {
+	.cal_factor = mt8183_calculate_factor,
+	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 150000,
+	.output_fmts = mt8183_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.support_direct_pin = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+};
+
 static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1092,6 +1109,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8195_dpintf_conf },
 	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
 	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
+	{ .compatible = "mediatek,mt8365-dpi", .data = &mt8365_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);

-- 
2.25.1


