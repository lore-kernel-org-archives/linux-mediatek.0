Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B81606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXUtTgRn;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OEGEECpD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=; b=LXUtTgRnGAi1gc
	7kLyINdHMP46y8fuTWIG6+WJtIT/OBSvbcqel5Twrvvaer5VNdrl7vP7UgxT32AhXCfE44GjFmwlE
	rHrHdRXoIEGILTDeJA/aIlogVBjxlwmeK6cIhdCFnhjMrpZ3pXHz5ZS+1mzkzP1nbwFFD6Sy/QOZ2
	bl943gVNSMFRCTz5UFVNbkfQ04FCFQLIb0gRaYESS3rDA8m7LnJbsGNKtS78luUV42dj43kv7yBKC
	dBkuHrtDxEVwyfdxXJcvOEsg7Cy7KmmXwghGVPXrTSyxVx18SpWuTZF+yGHQUHA/RYfcJ2H2tHj/x
	wjco+oKrAigiWFGYLDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOfJ-00000006q82-26cR;
	Tue, 17 Nov 2026 19:16:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf6-00000006pyJ-2KMv
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 19:16:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so2415975e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942971; x=1795547771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=OEGEECpDjNwBA0omHILIPSZgmPmmkqiHFOKLyhb90XgtM3D2YPopXlC8JaU9aHujOl
         UeiaXb+rjnjMLIFveZC+X6fK48QPuB95gadxvLCkdo0w29wgMaNw9b5e3v3TxJo4rYSv
         0O5hoCBPNCctGNuszYG6WaWPKDwBe2T66Ciyb6KgV3LtQTp9Acs0L8lM3UkLsdQXsP0L
         jAhrajHbzd/QQJcmeSOTVJOJEr4RB0TyodhAGDnO481/jXUvQpLsHL+NJ1X5+yliwXof
         ZUqs/NmGuRBs81xtwn36MBkUdomqtOjXeaboar6ticq69Q5/r2NnxToTht5nIQtk+QVI
         jl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942971; x=1795547771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=xW4TAE+ZfyFaRWKEifUyAmWQ+n4r6v2rKfAqcWgJHBVybYy6TYZcv+2tT6YQAfg6Wh
         YXD6m5mV3AbQD+/ImCstMevF/sT5B0owtrUj+vlW799zAXmlSYP1Tag8RzM/TcdXs/9W
         +X8DMiVqVHkn9l7mLlZWZN2V/MxD+MaWtbHiO90x1+/JRNZ8SIynKCbBqI7xGIPGgpGK
         e6OILPtzDbY9g1nHqL8AHpY+j91E+KtQkI1901c3aUJ3+0pmP2LDT0kqLWn3bnaPGMaM
         dxPQEkgSHYdBe8sQLJ8TKNezFhkyp4vasGHFbwYcL2NdQH2WihAKpukNh+HApui86J7M
         UrlQ==
X-Forwarded-Encrypted: i=1; AL+hErEIMyqPdHShoYe1++QmW/j3APzyYCZwVwSiPF5r2DoLDUdkT8fTDVfwqovHQKFKzOnmC+WAuLDJNPPcZC9xwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+hGWpzzY89sj+mokq9yqg2XNRmQSPn1DfhrI6nlhGnUaInX2X9
	8oOWXrV6CeUDxdZU0MQJX/mMuWwXjyAUmPUjihJTE+DCXmG+SooW2B3V+ROgA3os8Rk=
X-Gm-Gg: AYBFou0gHGOdvkn4Dbw00wG3iJUmc8GgqwgS+bcgCfAxR2tyKEqdkWX99P7TcAjVom7
	jBOvz4FmMPfU3Q9ghvn6znouYtY8Q2Wlb8KJQDpE2u6snOaJZgk2dGKXrVF25KTjmiKPGT2VkdD
	SPFDn3zYFazGbFGaPIBTsCRSD/Ji/RuOd52zGOQRaJm0jIYsUd4sYrGgh8Yqm8Fxkr8b6Xx7CpP
	O138it9zZR/gmurmITqnr0tY7yXiMtcQ3vz/Nyo/BGygHbtGcpVo5pDfxRHh9O7JCzK1RrTwOHW
	gOW/3Vi//cpCIqvq6fVc4U7TVGTLsECFTO7b+dnTUJgPcACed7Mt53krgHUmSztoYsmT83KG8ef
	CSi5R++gDG4C/sMRTktkjhyOulc5vNfnMUjJqP6Ir0EPPrDfo3lfsbOTfG6QuqvOeKfwkNlkGSO
	8ZsKQz39YOS1lD4ajW5lu5ALYH0w8BXIiitLF2rfSDkns9DQiuV7L0EgbWu8O81P1SmVKYrq+Vp
	1ppJxKe3zJ5956AO6PKt9elIGB7E1znzZC1tg17jILOBw2UeQOZBTfof5ke1zNgv1QrZMALVsvA
	i68YucBLr1k71eEPEf8OCVHFm5hWrsbwuTh6KbcXiYkqif9f6MloO1n3
X-Received: by 2002:a05:600c:4fc6:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb7da26fc7mr2486695e9.20.1794942970661;
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:04 +0000
Subject: [PATCH 3/3] clk: mediatek: Add MT8196 PWM source muxes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-3-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111612_616959_0AE09851 
X-CRM114-Status: GOOD (  12.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The four MT8196 PWM channel clocks and X16W_BCLK each have a source
selector in pericfg_ao, choosing between clk32k, clk26m and the
topckgen pwm clock. The peri_ao driver models their gates as fixed
children of the topckgen pwm clock, so when a selector picks another
input, CCF reports the wrong rate. For the channel clocks, the PWM
driver then computes wrong period and duty counters.

Model the five selectors as muxes and parent the gates on them, so
CCF reports the rate of the selected input. The selection made at
boot is kept, and consumers can change it with assigned-clock-parents.
The selectors do not forward rate requests to the topckgen pwm clock,
which all five share.

Fixes: 212779900009 ("clk: mediatek: Add MT8196 peripheral clock support")
Co-developed-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8196-peri_ao.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-peri_ao.c b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
index f227a86c5d60..00873264c18e 100644
--- a/drivers/clk/mediatek/clk-mt8196-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
@@ -85,11 +85,16 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO0(CLK_PERI_AO_UART4_BCLK, "peri_ao_uart4_bclk", "uart", 4),
 	GATE_PERI_AO0(CLK_PERI_AO_UART5_BCLK, "peri_ao_uart5_bclk", "uart", 5),
 	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_HCLK, "peri_ao_pwm_x16w", "p_axi", 12),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk", "pwm", 13),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0", "pwm", 14),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1", "pwm", 15),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2", "pwm", 16),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3", "pwm", 17),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk",
+		      "peri_ao_pwm_x16w_bclk_sel", 13),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0",
+		      "peri_ao_pwm_pwm_bclk0_sel", 14),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1",
+		      "peri_ao_pwm_pwm_bclk1_sel", 15),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2",
+		      "peri_ao_pwm_pwm_bclk2_sel", 16),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3",
+		      "peri_ao_pwm_pwm_bclk3_sel", 17),
 	/* PERI_AO1 */
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI0_BCLK, "peri_ao_spi0_bclk", "spi0_b", 0),
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI1_BCLK, "peri_ao_spi1_bclk", "spi1_b", 2),
@@ -117,9 +122,32 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO2(CLK_PERI_AO_MSDC2_HCLK_WRAP, "peri_ao_msdc2_h_wrap", "peri_ao_msdc2", 13),
 };
 
+static const char * const pwm_src_sel_parents[] = {
+	"clk32k",
+	"clk26m",
+	"pwm",
+};
+
+static const u32 pwm_src_sel_table[] = { 0, 1, 3 };
+
+static const struct mtk_composite peri_ao_muxes[] = {
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_X16W_BCLK_SEL, "peri_ao_pwm_x16w_bclk_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 6, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK0_SEL, "peri_ao_pwm_pwm_bclk0_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 8, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK1_SEL, "peri_ao_pwm_pwm_bclk1_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 10, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK2_SEL, "peri_ao_pwm_pwm_bclk2_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 12, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK3_SEL, "peri_ao_pwm_pwm_bclk3_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 14, 2, 0),
+};
+
 static const struct mtk_clk_desc peri_ao_mcd = {
 	.clks = peri_ao_clks,
 	.num_clks = ARRAY_SIZE(peri_ao_clks),
+	.composite_clks = peri_ao_muxes,
+	.num_composite_clks = ARRAY_SIZE(peri_ao_muxes),
 };
 
 static const struct of_device_id of_match_clk_mt8196_peri_ao[] = {

-- 
2.43.0


