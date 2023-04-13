Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFABDC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NCSyvdX0SmPc9ExxsTpFJ2greUOcRi/vLBExtrGuM4=; b=rUWzts0sOeJL/niY8C6DIdaLuG
	lWarW4sbj/pKkmL2E9+DZ73Wkpv5qRXwcUpchErlbiOsGGG1ZDpc/s5Q+VBaA9LNg1EvPGsDYfGIL
	4QeO7sxSSDB5Mn9SDSA13GJ4u7f3aeOab3aY9N5SzAUu4U/C/IzouB+mdI0Ga3QOR7CzJrsG7NB3P
	/1zNh++3O5qoM4If9gw+DPMxbPp0gP3JMU6toTNIKD6rtAeb0mqhdhV2cEehYQffoZNaGowsSYWnD
	vGm1V+LIKx+rmb5PT9Gvkq+kPQ5vOfzDiuNNRyAg19ekIKr711cUQjy/BlUXtRkWVNN+2bUkaR13S
	WmKBCI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwQd-006AjZ-2v;
	Thu, 13 Apr 2023 12:51:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwQT-006AbA-08
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 12:51:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id k27-20020a05600c1c9b00b003f0a9f022beso606576wms.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681390301; x=1683982301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NCSyvdX0SmPc9ExxsTpFJ2greUOcRi/vLBExtrGuM4=;
        b=VRVY6mW4C2eeH9XEL2rXf4kib+8LepoYm141EhEj4bMvddMWMZfWEbDgkVd2Fj86U+
         8XY43D+8ZnAkl+qpBUZPKykNENQ5Z2zTtvwwxjqsxoLGyN15QkzR6S/slTv51nhS+vNl
         5N3LR05EDvlN7cCZXDgERRZt6CthgOTM29OhPCTT9PWnp1NrXTcfWWrHxW1KAqIMjTR4
         QTTV9BH7BbOjgf1NeAgQSVmxdmGAnc8+GnrYry1RvKBlEC4Y5TjIV8VspCoEIef/ZZQk
         1JjNRHshJN85qXDV3vS/7/8E/HuDtNGgLzT1FUNEo0/qZmBLSorW4icPeTmIb4cHsuYq
         tUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681390301; x=1683982301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NCSyvdX0SmPc9ExxsTpFJ2greUOcRi/vLBExtrGuM4=;
        b=RXCFlKdH9EUsWfp76gP5M9/G1zdJ+CPfTBPcw1vwlZDIue9eTVLXGMOBBLHV87q6Ow
         EVsNRRKqUMlYzq7+sdBi28JPXuhslAmSgMRFY16sEnhqK4sf2sZfSc91AJ77dpYdxGFF
         tj3Oxq1i+79loVKsRwtBr8NzB7ewmMxkXayOE9NRHH/YBjLdAHGWARqvxgJ5kElYr4C9
         B6jCXKdGXQ96ptPnd+/ELfLdjBedJJxs5QFbsGlyINUS2vkFx5nmqtr7HAX5V1d9HSSl
         kYvlWqMnmaQKrJL4/2AB98FDlz6da5t0yhQoxraUuJ8MiLD6K8K2P8KmvVf7ug2miqXj
         wKxg==
X-Gm-Message-State: AAQBX9dl+jJnF0Q7zKaSdzUygBNImlGYqzIWZSxYkp2EwNXzAMRFuugj
	85IeUoO02KaNCEsAqIdKgdgcDQ==
X-Google-Smtp-Source: AKy350aa1i5mgrVePFwrBlQob6A/5LRh1D6/2011CW+4P/unl+t6yKRaDKzFUe2AB+mGY/qtrWZ6aA==
X-Received: by 2002:a1c:4b0b:0:b0:3ef:4138:9eef with SMTP id y11-20020a1c4b0b000000b003ef41389eefmr1450843wma.36.1681390301230;
        Thu, 13 Apr 2023 05:51:41 -0700 (PDT)
Received: from [127.0.0.1] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d66d1000000b002f67e4d1c63sm156356wrw.12.2023.04.13.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 13 Apr 2023 14:46:26 +0200
Subject: [PATCH 2/2] phy: mediatek: hdmi: mt8195: fix wrong pll calculus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v1-2-b8482458df0d@baylibre.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_055145_075276_71FDDC78 
X-CRM114-Status: GOOD (  11.30  )
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

The clock rate calculus in mtk_hdmi_pll_calc() was wrong when it has
been replaced by 'div_u64'.

Fix the issue by multiplying the values in the denominator instead of
dividing them.

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index e10da6c4147e..5e84b294a43e 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -271,7 +271,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	 * [32,24] 9bit integer, [23,0]:24bit fraction
 	 */
 	pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
-		      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
+		      da_hdmitx21_ref_ck * PLL_FBKDIV_HS3);
 
 	if (pcw > GENMASK_ULL(32, 0))
 		return -EINVAL;
@@ -288,7 +288,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	posdiv2 = 1;
 
 	/* Digital clk divider, max /32 */
-	digital_div = div_u64((u64)ns_hdmipll_ck, posdiv1 / posdiv2 / pixel_clk);
+	digital_div = div_u64(ns_hdmipll_ck, posdiv1 * posdiv2 * pixel_clk);
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 

-- 
2.39.2


