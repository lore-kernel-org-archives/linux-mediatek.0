Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC97C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqoAq+8Yzd9Xir1iIFoFZrw3bg2vQLL8st2R+juKhlY=; b=vH/vkrguswr34z
	/oAdUPyxldfOVni9DJlEYMFGvRXN3Ejr8CjiQ7vITXj4c5rJLfleOeWF7OdVBob60oAAQDZPLPsQ6
	tE7pt7PnwIF4CxPGDXUvT2Kj1OuWCr5bTHfJynjdyvfpisf9NBZef/4/3HgQ8iLK9FMBXTD4WUD39
	86vU9T4sfN7ZDGB+ydGtUnnlFArWu1CoViBbAjr3J6gjgW3vKMrBTdhfio9JgW9Q01WunVVOM5qnC
	6kwVC/fvL5zMghGWLH4BGMni9BxTJ3wY1lO120ovUpH8GhJGWPH/n9/D/Gw4PkrI1+5kD3cFIvomb
	+D1bvw3O5MWMTFvnE5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzAy-00BgLG-TI; Fri, 20 May 2022 09:44:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzAw-00BgJD-0C
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:44:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id ev18so7580495pjb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4toybDv1M53GirTn8tpXa0Kt2GdamhkRh4OIAgDtc4=;
 b=WWvNjRlc9R3ylkT71F/0tYY4edxwlaAQp+Dvd7vVK/bnjQvRih4OUAVVzo1biCrAmn
 YkhIzbWoHtuygjdR112SzgAHPZOxtb/tDDeieVB2abJW58imdO1Eo9vL3NtIFG2nqgbw
 b1p6Sn1k7r4GowNho+ENI+EsKo91JVoN3LK/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4toybDv1M53GirTn8tpXa0Kt2GdamhkRh4OIAgDtc4=;
 b=sG1MTTHmz8rfFwJxizpKoTWByE+ywZ41Q3N4d1j0MRBgXQSesw4WaqVrGi0bdSWmZX
 IWn2lwwHnau7WFT6OqEP8bY6wg6wdokfClWc1jqUzauQczT59GCg9H7iYB0LBgIruPQK
 EOrWQFJ5ZNgPPcKaJe8vqpXT/LNDp4vo+F1eBvvfFh0WC9i6La2BrlomPghwv0WZ1I5M
 YiXCcwnaU/YaJknrjKN2I0YOsT/X0RCB/c1XZO6DGVB8T0NXCzAd1ITlPcZZHvsFvkHR
 z2EPHCPUR9v0SOuWSVGG7iPzfflMCS7xt69KkR2w8N+P0Mq/MYWFboXQVEcE8eu50Bz5
 I6bA==
X-Gm-Message-State: AOAM530vRSOzicXirCnutE3UiLPX1XCp68ccUGqjF/9ssJLmCRbBk9ge
 ose2JxctIYeTBUXMm6lOGQ93TA==
X-Google-Smtp-Source: ABdhPJwnbKiL/9EFkMezmfR/RGWpPtvvom3H3Yyp6HcfhsLZSqErmLrIH1CjIf5RMqWmmYanZhLuQA==
X-Received: by 2002:a17:903:22c7:b0:161:cf2e:2ce2 with SMTP id
 y7-20020a17090322c700b00161cf2e2ce2mr8793814plg.59.1653039838197; 
 Fri, 20 May 2022 02:43:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:ec49:9912:894:222d])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:43:57 -0700 (PDT)
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
Subject: [PATCH 2/4] clk: mediatek: mt8183: mfgcfg: Propagate rate changes to
 parent
Date: Fri, 20 May 2022 17:43:21 +0800
Message-Id: <20220520094323.754971-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520094323.754971-1-wenst@chromium.org>
References: <20220520094323.754971-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_024402_085344_82168E95 
X-CRM114-Status: GOOD (  11.03  )
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

The only clock in the MT8183 MFGCFG block feeds the GPU. Propagate its
rate change requests to its parent, so that DVFS for the GPU can work
properly.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index d774edaf760b..230299728859 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -18,9 +18,9 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MFG(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift,	\
-		&mtk_clk_gate_ops_setclr)
+#define GATE_MFG(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_sel", 0)
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
