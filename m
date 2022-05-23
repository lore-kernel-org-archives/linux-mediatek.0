Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wFY9UFYG8hWwMZr/yWSIzz9MbMehKnq2cvd1veO+Q8=; b=VHWmZ4O+tIMwT2
	L2bP1fl1ZZkH5/BacwKcRS0GwDmzAZtcR3evHF7M1Cc0GitDoQfER79nVOg05RTm6aP7xEaIuoNC6
	Eb8hb7XGBErt/pB6cH4pwIRBKxqBGiTFgDIwA5eIxjyfLzVi4vKsvxmYzGE9lOYfVwFuneXwHtAvo
	XaFm6qB40ZpQ3s9f2ONE0QdSqWolHszThfEdCZAubhoq0U6x4Yk8hcMMHVweXQMQMR/ZqQaEnTYiw
	MvM0YDVLlEMIKYomtJ+rJ6LtJN7MmaC89HZV+gDcCaQKE71UlWyCynfyjyutG1USqaA6wyKeNn3A7
	+pRY6lJv3MrSkXPD8nyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4wb-0035dX-W1; Mon, 23 May 2022 10:05:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3uo-002dpB-9C
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 08:59:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id w3so5887367plp.13
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQjXK1tyA9xOYFhndd4nNr3xd4VXsIavQtRl5jsGh4c=;
 b=meNdqL84O1gmdVv6NUiIDJn815273OPePWQVlLCtG6TSyOYKE4v2G4PfxBLToFL8pO
 nUY0VM4BReYj05yWLnF2LyruQWkhcyhZ+XwNXzJeHEKBIZLPeU59T/CuMl7NZixuFi09
 KXxlHmNQ/PJrF206symEyu+7Zq97H8GYXkS+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQjXK1tyA9xOYFhndd4nNr3xd4VXsIavQtRl5jsGh4c=;
 b=UeAIJai3PPIm04zZbhttT/3rt31bP6Om+Z27Ilp7l9wJgtgbBHPadIoikJA3f2s42O
 tRe+ghZrjaJfIE/oRWxRB5Sk2hSkCi8X4dDth0kRuhknBsgG9I07RLeTvETkFOtQrOs7
 5Ck70gaSORQGB/BHg3WkKFfIUVQ7ArCUSrzR+BOQAqPiLvfd75sqgNMWdV2sIj7REI/X
 BQyTLe5JBDLoVKe93Iqr3x+V1g2n88Atm5V4j6phYX2btlhkQtysnLTdXavyAVJZ/3pL
 8JiqchqXrx8hkQvbyeZ8GPJrg62i+JdYdjjsEoY4k3tTQAL9wUct6bMNCn+XpzyRLLGP
 MMtw==
X-Gm-Message-State: AOAM533ZT4L5ykr7mxXdZR6Hx0VCYwyJsmwSOxcZjAhVB22EbNJycEhN
 JcaDmgYNZSquCERvz0xVbZ0MGw==
X-Google-Smtp-Source: ABdhPJw7GzZaO7+1ExzM7fCYO6HG981ADv0zp7IOz83yeRMp6UwL1C+HSBrvI/3v7TVTfgTNPEgxRw==
X-Received: by 2002:a17:90b:4a90:b0:1df:e3af:c6ad with SMTP id
 lp16-20020a17090b4a9000b001dfe3afc6admr21190655pjb.41.1653296388958; 
 Mon, 23 May 2022 01:59:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1b8:7eae:9793:ff95])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:59:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] clk: mediatek: mt8183: Add clk mux notifier for MFG mux
Date: Mon, 23 May 2022 16:59:23 +0800
Message-Id: <20220523085923.1430470-5-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523085923.1430470-1-wenst@chromium.org>
References: <20220523085923.1430470-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015950_367193_5E1DAB95 
X-CRM114-Status: GOOD (  18.63  )
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

When the MFG PLL clock, which is upstream of the MFG clock, is changed,
the downstream clock and consumers need to be switched away from the PLL
over to a stable clock to avoid glitches.

This is done through the use of the newly added clk mux notifier. The
notifier is set on the mux itself instead of the upstream PLL, but in
practice this works, as the rate change notifitcations are propogated
throughout the sub-tree hanging off the PLL. Just before rate changes,
the MFG mux is temporarily and transparently switched to the 26 MHz
main crystal. After the rate change, the mux is switched back.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1;
- Moved clk notifier registration into separate function
- Fixed comment style

 drivers/clk/mediatek/clk-mt8183.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index b5c17988c337..d66acf2e5e19 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1188,10 +1188,33 @@ static void clk_mt8183_top_init_early(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(mt8183_topckgen, "mediatek,mt8183-topckgen",
 			clk_mt8183_top_init_early);
 
+/* Register mux notifier for MFG mux */
+static int clk_mt8183_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
+{
+	struct mtk_mux_nb *mfg_mux_nb;
+	int i;
+
+	mfg_mux_nb = devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
+	if (!mfg_mux_nb)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(top_muxes); i++)
+		if (top_muxes[i].id == CLK_TOP_MUX_MFG)
+			break;
+	if (i == ARRAY_SIZE(top_muxes))
+		return -EINVAL;
+
+	mfg_mux_nb->mux = &top_muxes[i];
+	mfg_mux_nb->bypass_index = 0; /* Bypass to 26M crystal */
+
+	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
+}
+
 static int clk_mt8183_top_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
+	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -1217,6 +1240,11 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
 		top_clk_data);
 
+	ret = clk_mt8183_reg_mfg_mux_notifier(&pdev->dev,
+					      top_clk_data->hws[CLK_TOP_MUX_MFG]->clk);
+	if (ret)
+		return ret;
+
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      top_clk_data);
 }
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
