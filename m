Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC2D4335F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=; b=WG09dHsBfx2vdTv6qIx9Mf+qrR
	tLLc75LnX+df7V7MuRfX5H7h1tQOJiqS/LkDKfd/cXVdygCoQzHRJxW/S/T2WO2Y84zq3vHMej2V1
	JWE+xW874y4mjk4H65rneZ/CcyoGm9ZNbrWhJDs5PdGX2h5dLRef2Rt+Yvn1cANSSoVmvyLbVC0LR
	M6dMniBwNw69MRNvT+L35Zmp3r/YGl8TfccoxTuPBFghbGWB3KJrbS12KrwwjaVgZFAqNiChZ47W7
	ZRaWNLCpSB+MtKvwNWiYBMKoIE9INuRI9ZXSgjTJKwGFlAVn1ZVENi5wixbzprLtMl885v4VaIqZM
	NtSJYWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpue-0000000HP5Z-0117;
	Thu, 11 Dec 2025 23:17:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpua-0000000HOzi-0Vis
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
	b=i5ky3BTbawqo2mrmI6y2QpA5Enex92fqZym/c52Uzh6XZgf17NH4rPxcPjJ10hDWBBOIeI
	VVOikBxyBzFxwVmMc5FlzWDquoBEUuUR8awOr4KCfimS/UZ4Alhggh6ghQeUsUVjn43Gou
	tdZJbIxuLxOwwUonJnT1UGeqt4aOLn4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-Xg7M2YzvOvSvyIPylW9VOA-1; Thu, 11 Dec 2025 18:17:24 -0500
X-MC-Unique: Xg7M2YzvOvSvyIPylW9VOA-1
X-Mimecast-MFC-AGG-ID: Xg7M2YzvOvSvyIPylW9VOA_1765495044
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b51396f3efso113180685a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495043; x=1766099843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
        b=Uvp0aXj5Mbt41UXbKtD976FWrMt8oCQQmvTKaDEtfCTl5bmOBP6TUVtMN8O6/4Ksu2
         8FBl55VnZ/Eok5BS1UgRPJlnXrJUScGt2Kplihs1h7+Z4qeTrgSfOqiXrO1sbtnXU7XJ
         ZiUHWVCJSoppDrwT/j5tcEM3B9eduGODVIyHqgBOXxqnOIIilkv9eA2Z/i2EmmHbrGTZ
         7WO5NjOc0RZPvBAnhWR8zqKbzFn6W0VWZxnyFts5QX1GQei3AEVuJUuaQcrIT2VAVbG0
         cbqB80fANWl4FdAiEHQAmnuFrPWGBRAFPzlUed6gjGBHc7pD39j0EVELMrVC2/ZOuBaC
         Lj9A==
X-Forwarded-Encrypted: i=1; AJvYcCVinMZE2ZgYp7b7kc6nTdi1+dYbBRGP7bu8mfXAjlE1wQjL9xHYoMBAZBWkHww/ug4jnwRpXAXgqEyN6fASCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDIFB7SeBbQuEs9IHH2EVvoZmHBegCQFv8XDt/PZIzVj0UaDco
	5uiRaw33rJMaqcHRnuQrsK+Q6BzVp4A6ULxXt5slc5aklgn9WH2/hfK1bxuUgxRyfa6g1UeG+Yh
	21YWQrlgLEcQ7z8MwnQUgIEIY7/SqvBsEHP090eyTFV84fuOQuSqshr/NED//hl75YO5T63oIww
	==
X-Gm-Gg: AY/fxX5G3McW6HiqsW8XOZSTrvmFSrB0i9nIu5JPbn44XCjBQiN1iRq6pTDqZR/VU3q
	DcKb8ZIVJeT5UMQux/NiuVnPTMUciZa3IyMF/FBSxCG+UTgZVcVsIjPwEvtaLYjX/mA/aepyE/I
	zE3XphQf5ts+77w3PnP8NTAbgUGaqLirUPYIPDPl4BozOFitMC8YUmcxUf5/4Ad/4Uh9AnJHg/k
	OpSfxI6BlrahkoHDbSx7/lO7jM6pr9QnAvdpDvvM7TnGIKJZtc16HK6YcuCG2BGewIzke9a4WuD
	lbXHEubTdhBmzRBzynZ8DHhOamgfv8UtvloSCFZqVP9o+xU/Q1s92CjCMfUmzOxecUZVK7AI2KM
	8kQFywJHMk1xVGX1E4JCuvQXQsbbdFfqSk0HGGSlhTv1CnAk9UwguBg==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8bb3a39ef0amr29575885a.87.1765495043606;
        Thu, 11 Dec 2025 15:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEKudoWCpFXTWryHiRn7BIWdpxq1jIr+pxWiYKNOGd1R/M6vLU3ldrF09g/tRZdBf2bnSeqw==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8bb3a39ef0amr29572785a.87.1765495043242;
        Thu, 11 Dec 2025 15:17:23 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:24 +0900
Subject: [PATCH v3 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-6-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nor1PtsS8pW+dX0xsLXLZpeucCjaBZDzA44P1ujZuN4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5JPn9olfEuTvvj3tw1GWwBGU+VG8TbX8XtsrQ1s
 d435bd/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNxyWdkaGhpmnjR5MTRYrET
 y9b6nJrZlTA1uHYXU6Dd9BPilnsqrjAyzK5fnHRCReH6NOn5sVMKMza551xlcVQ5G3RQ+MnShfx
 2DAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V4kRb3r7r-V7SKhnh46wsz21IEQlQZqjipP4JncbCYY_1765495044
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151728_242259_D848099B 
X-CRM114-Status: GOOD (  11.78  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.52.0


