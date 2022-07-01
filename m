Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7DACCA479
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9dig3aHD2Gf3AUlWQENSbKW6lk+Nf6n/l74e5q075k=; b=dMIAS/fZSxcZTzZP6V4WcJw/qX
	io94b3dNFN+AzPxPRZshH0G6NRILXyFGX3503xlKgqR2tF7/m24U6NtORQpwXDQrHEUuKMgaPDvSC
	UgebncLR09JO4rLXasjZwDazy1MDL57QiE5LnoXn5fjcWGvV0i2qSGDtN08o/ezuQgo2PhdRILP4S
	hdUz/TLeZVg1DNu13f7S8A54tmY0iIHfj1bQIBA53He/9T3kT0NkaTDOVVZ8SjeETf/X0Ez2njle1
	5QImIKb8ZwpddX2WM5DejhaCf4xp9oEL+p9M25f1aF+/hJZRwkrRPv4S4yPLzj3UsvW/CiDdubV0O
	Q3oFQeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7I0S-005SgA-9w; Fri, 01 Jul 2022 14:52:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hzo-005SLj-8I
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 14:51:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id jb13so2582746plb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a9dig3aHD2Gf3AUlWQENSbKW6lk+Nf6n/l74e5q075k=;
        b=gt91rdKf1CenZW38m3WWnMrR2rWxGSogpjozB73ZDlt2hOTb4QHmjW3AqZXHkd38Cj
         U/2ofksQmrVCWrMu7SCw8NhY8jCBIsA8oWGmMjFOq/ZwjcmlwLz5rcfCzromyTUqgR7P
         wgFx5pL4OP5d2Vi4BOr92cww7VU6B9ybecWbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a9dig3aHD2Gf3AUlWQENSbKW6lk+Nf6n/l74e5q075k=;
        b=fc2Uc4ZvfFKy6Ey8oJU/2JI3speDD1YECDaDu0URLZqvzIaCNt8Ou7o8eVvwasRPL0
         PPLev8JmPpgOGlzPio9FX2qOd7Xhi/4rYMiI/xBKm1OM6vYnYqEvsvhgkIUAEU/paceC
         aQ4Tuas8TgJz/wfWDpsCVNqtPpXPh7AJTy4/T9xXEFHpvE+sdn87lt05q0HTNQTZv9ov
         +vq+EtIrruV30i078MZa0pWtWlP797wUgk4iC8qrY35KFvelHd8HyLC7smUEXH4WIMCE
         t1EchEvBiWP/2FhfJtQlYrzFlsuyLZiPz5iadsfFCa7VlFqk7SgrEMLFAO//ozywsxNd
         gx9A==
X-Gm-Message-State: AJIora+gY+SiRzoVCSrUFuvT884jo2enS9S0BrcYN6bdil9rq9jkYcob
	9+VB32Id93RlZbsAQpLT1i3INVLPmmUryA==
X-Google-Smtp-Source: AGRyM1v7D2jfmjMtIFo5UkUAyGT8o2GEfxdngj6c9QDeeyT3kwzLM9N8ey5pyiDAoocoTjiIAvo9tg==
X-Received: by 2002:a17:902:f7cf:b0:16a:322d:3f48 with SMTP id h15-20020a170902f7cf00b0016a322d3f48mr20518123plw.148.1656687104568;
        Fri, 01 Jul 2022 07:51:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b0016a214e4afasm15780981plr.125.2022.07.01.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:51:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: mediatek: mt8183-audio: Simplify with mtk_clk_simple_*()
Date: Fri,  1 Jul 2022 22:51:32 +0800
Message-Id: <20220701145133.1152387-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701145133.1152387-1-wenst@chromium.org>
References: <20220701145133.1152387-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_075148_407647_9C32E1A7 
X-CRM114-Status: GOOD (  19.03  )
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

mtk_clk_simple_*() was added after the MT8183 clock drivers were merged.
They provide shared boiler plate for clock providers that only have
clock gates.

Since the driver also populates child nodes, which are for the audio
subsystem, it can't be completely converted to using the functions.

Simplify the MT8183 audio clock driver using mtk_clk_simple_*(),
sequencing the of_platform_{populate,unpopulate} calls manually and
correctly. This also adds proper remove support for the driver.

Since the mtk_clk_simple_probe() function allocates the clk_hw pointer
array based on .num_clks given, it effectively requires there are no
holes in the clock ID map. Check that the size of the array matches
the number of clocks with a static assertion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-audio.c | 40 ++++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-audio.c b/drivers/clk/mediatek/clk-mt8183-audio.c
index b2d7746eddbe..b9255e0a36ae 100644
--- a/drivers/clk/mediatek/clk-mt8183-audio.c
+++ b/drivers/clk/mediatek/clk-mt8183-audio.c
@@ -67,35 +67,47 @@ static const struct mtk_gate audio_clks[] = {
 		20),
 };
 
+static_assert(ARRAY_SIZE(audio_clks) == CLK_AUDIO_NR_CLK);
+
+static const struct mtk_clk_desc audio_desc = {
+	.clks = audio_clks,
+	.num_clks = ARRAY_SIZE(audio_clks),
+};
+
 static int clk_mt8183_audio_probe(struct platform_device *pdev)
 {
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
+	int ret;
 
-	clk_data = mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
+	ret = mtk_clk_simple_probe(pdev);
+	if (ret)
+		return ret;
 
-	mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
-			clk_data);
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret)
+		goto err_remove_clks;
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return r;
+	return 0;
 
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		of_clk_del_provider(node);
+err_remove_clks:
+	mtk_clk_simple_remove(pdev);
+	return ret;
+}
+
+static int clk_mt8183_audio_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
 
-	return r;
+	return mtk_clk_simple_remove(pdev);
 }
 
 static const struct of_device_id of_match_clk_mt8183_audio[] = {
-	{ .compatible = "mediatek,mt8183-audiosys", },
+	{ .compatible = "mediatek,mt8183-audiosys", .data = &audio_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_audio_drv = {
 	.probe = clk_mt8183_audio_probe,
+	.remove = clk_mt8183_audio_remove,
 	.driver = {
 		.name = "clk-mt8183-audio",
 		.of_match_table = of_match_clk_mt8183_audio,
-- 
2.37.0.rc0.161.g10f37bed90-goog


