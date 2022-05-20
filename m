Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdexNNMNm/Dfs3u+bPlYctJgEfnom7+4BYNRRJ46vhM=; b=n9foGIan1vQILQ
	yU7IgEZfkVvF7h7axGY0XZC81gHISeLtTYHMsr3js6Cm3m+ndMHtSA0an0Wr7bRkGs3tzFYVLVmUy
	GDYILYBCBn54YCcnzeYpUKppPlu4qrtDln5p53dNi90WZQEM8VS6oV6ZQmfcDcgio17d5VZo82BLC
	sj5K1AMKAElitKivt8rK/IWUjF01SD1Ape60MmjdDpJ5EK0FF91bG9OsKhEIMwRMr9PtqUqwPM5M4
	AlRTn6oe1pr1njVzq5ZdaFILG7koGONWdQP1Veq9wzp6NGiD3uUt7pxopP0Hh3m2V6HeVzV4lN/tr
	F3tg0FZDY+IBvvJKEYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0NR-00Bwlk-P7; Fri, 20 May 2022 11:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzIp-00Bi6D-Jd
 for linux-mediatek@bombadil.infradead.org; Fri, 20 May 2022 09:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AvNGESyxRhAV7gvo9X+ZKpVxV8kV0aTUV2T2AAUUwSE=; b=JuHmBSQ+5HsuspmAkY6V6NXk3L
 BL22HVLj7k6aA61rEBZJIMubqu1Iv/2+R1Fzn/C89DVP/tnrF+Gcyk+xidiQtKqPAUXuAVjaX7FDM
 dwvmsCrdlGrjdk4ZikmtI1WZ/GQTG2EEgW07yD90RgXh6UNbzqz/z1b4VahNlSp930K24mfQGwDQ3
 SuHVqCjnRDgJHrDYpwfVA+1peOw7YF75qAZW/ymFIKK8qp2nI4gPqm87hZHPeYyIxETC/5laJ8t93
 A37TeahO81HTzJ0wiH2y0m1DJ9ze07IUTrndvGVD+ybyoqsnNmTgSumOfNE5t5RsFTkxbWASZNEP0
 UIrRaIbA==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzBH-002ILI-Rc
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:44:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 202so330932pfu.0
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AvNGESyxRhAV7gvo9X+ZKpVxV8kV0aTUV2T2AAUUwSE=;
 b=BkRPFP15NL4IDnXh3hlvK+h4PzJxWcyRSC5t3p3BGGZMBbn5p2tRT10c7yXnEjZ7qv
 TjwumJSNJCbWyz+S7Oq4+ikTRxyYmgHbP6LlHqFnYLRs4Wtl7jh81BBsLNinRfjORf5Q
 QReafMfp7lU1rHeO82t6+rUtgUpjsM6xenPjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AvNGESyxRhAV7gvo9X+ZKpVxV8kV0aTUV2T2AAUUwSE=;
 b=f46XRTOQhw80MvbCDuK6IKH5++sAuY0RsJXYf3TXJ2u8pvtG0b/51MD5bPFCFJKGom
 Lkj6K7a573A71xPIJgT3M8MOBvJpUxuUrihMvjOCGbOcuJXifKxD68wOyS/1Qcs73RTo
 HcmCkquQ15UleIhVtjG/4OhbKGNrpogoFFd9T07UipG3OcdEBDOAR6snkg1un3UaOBVF
 YGn98On1GbmSSAPtEtuXre2uyMisxnBMia+6BpJPVP/TcE76XwBiEGKasAOpYSHzPlaR
 6lHRs82PlnVndKssPPm/orHy//Vm8gxSlNJXzLdbEDeTUDfzvLuw7UAZWtYrb1JPZ3q2
 qU0g==
X-Gm-Message-State: AOAM533uxp196RYkVlgiFpXyIUrjVfdmGOfqjHMKnDEioX+IO0ZpBih9
 DkbOLxqGiC8yk6PdSZPMVFI8OQ==
X-Google-Smtp-Source: ABdhPJzv5s6fjmTY7cGc4/IdOJw7m4BY9pIbTwRNzDnU08TqxlxAF8ZR6ZdjHyvyfxHFlJwT2Cytnw==
X-Received: by 2002:a63:6802:0:b0:3f6:7295:7c3e with SMTP id
 d2-20020a636802000000b003f672957c3emr2804558pgc.308.1653039843763; 
 Fri, 20 May 2022 02:44:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:ec49:9912:894:222d])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:44:03 -0700 (PDT)
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
Subject: [PATCH 4/4] clk: mediatek: mt8183: Add clk mux notifier for MFG mux
Date: Fri, 20 May 2022 17:43:23 +0800
Message-Id: <20220520094323.754971-5-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520094323.754971-1-wenst@chromium.org>
References: <20220520094323.754971-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104424_309663_76AEA21A 
X-CRM114-Status: GOOD (  17.19  )
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
 drivers/clk/mediatek/clk-mt8183.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 8a755fadebb5..afef3738396e 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1192,6 +1192,8 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
+	struct mtk_mux_nb *mfg_mux_nb;
+	int i, ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -1217,6 +1219,25 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
 		top_clk_data);
 
+	/* Register mux notifier for MFG mux */
+	mfg_mux_nb = devm_kzalloc(&pdev->dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
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
+	mfg_mux_nb->bypass_index = 0; // Bypass to 26M crystal
+	ret = devm_mtk_clk_mux_notifier_register(&pdev->dev,
+						 top_clk_data->hws[CLK_TOP_MUX_MFG]->clk,
+						 mfg_mux_nb);
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
