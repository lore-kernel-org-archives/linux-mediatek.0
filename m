Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA600C87FDA
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=; b=YFp93ofrb4WhKncjbZXoiCowNB
	6T/qSI+U7MjY0lvHh1P/JRqE8zSlWoDvxGAPp1pdXLfpBNgFZmaNJZhMurYPVp8Pu/MMJFoGYPaCt
	VDxrvuRK9RwKzQ4eRSQ8uWiZZOLTno5RKaz2zaLlID+JUKuokTZoWnUU23+1OBDhsQDnv033LxhG4
	qXtJgyn58nDncpBMgpTx0/EsXriPTMUimHgNcdW4D8yjSpKSW4jWhcYtKZxGxuSNhC/bALlNBcLEh
	MXznTriTtxYa+GmEPAJ2SNKuM2vULnlthuoCKYfsnSWKuhTtx1ca+yOeJm7ePIrvLFEPhy+bKsub1
	GYcGaqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulF5W-00000006A8Z-3KWN;
	Sun, 10 Aug 2025 23:04:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEoT-000000068E3-3uM5
	for linux-mediatek@bombadil.infradead.org;
	Sun, 10 Aug 2025 22:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=; b=oY0jWovlmW263DqfArHYDEL1PF
	tqQ4BYaArihRAspGOdkqT25TltPazSzzNaYb4iltSIyDcO1kKtgbA8YGS5hHdG5ST4HFbQ8kJcRSX
	Z2Dc6MiZKKrtYoSfRtJUZmDtLKgXkS57CSAy1mu9Xtrv+0ERdMrDKIm1Co5wrsm/nMA15DV2hJUEy
	LWL4bmQv8DYxGk8Ikg6V85aEFsAEMGLkTksma/jxduh3SrI6wQpwe6+0utdCYIk4OtgvLl09iyK7q
	a6DrdQPI8xW5RgS0mAsS6+r4gbJ1ZSwrDiH3MhR4EWt9uP0gfcFaPoGZ9Ozy3sYOZlE2N4z5TL+6Q
	K9gY2wUA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEoP-0000000FJiQ-279Z
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=;
	b=GCNb9DtDQZEZiZxY11qWu8YIJIJVxhzI8urWBMzeoHU3oxDp0c7PR/qIPodhu/KFSPg3hy
	Xo8Rgq5NyKjnfMTfP2yLe8FRK7tN8ySZElun6Zq1jIr9fu5HT9y+2bRSN1eczOZLm/8ZZC
	80uK1UwIyEMJuFX19J8eYiYW+yBjFqY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=;
	b=GCNb9DtDQZEZiZxY11qWu8YIJIJVxhzI8urWBMzeoHU3oxDp0c7PR/qIPodhu/KFSPg3hy
	Xo8Rgq5NyKjnfMTfP2yLe8FRK7tN8ySZElun6Zq1jIr9fu5HT9y+2bRSN1eczOZLm/8ZZC
	80uK1UwIyEMJuFX19J8eYiYW+yBjFqY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-g4JkLHz0PcCB5f2KPyfHPg-1; Sun, 10 Aug 2025 18:46:43 -0400
X-MC-Unique: g4JkLHz0PcCB5f2KPyfHPg-1
X-Mimecast-MFC-AGG-ID: g4JkLHz0PcCB5f2KPyfHPg_1754866002
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e6a5428a76so1248713885a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866002; x=1755470802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq8kcIcUVamqXRpaO0muDR92j7XbTu3OW8hMLpghTgI=;
        b=FSFS/qM0NY7fSRopchhnuhmxx5NS6dMPnISfuFLgGje58HtlrWoYXyTx81EDxtchbm
         FPXj2eIdp8zH2J7q0t/TRwfSUVMz0PtWDel2o6pV1C21hGfVkkASuyhmMp4FZ9sr4pI0
         sOPpnp0PPyWL8O5azbdCfZiNQqZ/Ds9GlogRtk2y6SVHPZz3f5v2mDq0XUwGRlzv8ljX
         w5B96nY1pih4PZU+ddCNaOirEEBaS8PZVeOiIkQ4iU9p498MrSpGqs9ZSMiBdU1XDuxQ
         95cmkkqwett6Hv1j4cXrQ164AHXUpPxSGj2f9I6SS+Fa8FqiMvNJPqHHqMqgo9fEbqal
         gpGg==
X-Forwarded-Encrypted: i=1; AJvYcCUnk1vwlvf/aST81XGA4T10EMgpDSEIE3P2/9ZTpq4jXoWscTqBBfyZpjG7XAOcFuD5czbv2eWTocdGMxX8dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHgP6Ov4iONHctMMiecbxPiNEjdtm5BI0W0aXGSpYhcoOw6BRl
	T2ZAkGQ4U2XIPXuLDWMf5O9wb2C1AmEck79FgO1Ao4lpqoukOVkRd4dTCmMZhn9+y9WBqfj+AuD
	SCSl26hNRsvrTyvN7xct2fTYNP9s3l0StY6oTC1nrFsoxaVz+2gMvzSi9iZIZZBoLlSpgIMEA4A
	==
X-Gm-Gg: ASbGnct4evmWzeZ+jO8fC+X2JUfB8vNuzJTIhYs9ooI7VYbPoF4mpT0fGMmBuHzJjZT
	W7igmozXaR1sZFGhI0oxtw7A7OcXdNN4EI+DSS1Y+N0vXoJdcFFLYzXXOfJFD6XEF6+sGZ4oAli
	Fo9mYNxXztnLr9CFyUEl26SKcmSiRdUmGLOrE36yoaUynMryeWYbE7Foj8mRrg1PxRrg4Jqd9OD
	0ISElGVAxLxewzEK+N1VJ+ViOHCkY2Mk7eblannrByk5zRWNLf3cWXZb6lR1N0n9qD6MVlZGpss
	LK+cFknbRpbhCkXEMXzvKSlnayU9FjtaGmtJwE9GBe6CmqjlqyeVivW9HCAp2zALxBnj3DiEuTc
	oTNiNbA==
X-Received: by 2002:a05:622a:1487:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4b0a06eec4emr195091121cf.5.1754866002601;
        Sun, 10 Aug 2025 15:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh5lS/n97PBNJSxOrFycNhagzbIhlgW9qQ3w8XV40W5m4XhN8ds0cjQ0NNa80CSmcd6Go3LA==
X-Received: by 2002:a05:622a:1487:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4b0a06eec4emr195090871cf.5.1754866002209;
        Sun, 10 Aug 2025 15:46:42 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:34 -0400
Subject: [PATCH v2 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-6-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=tcM4xXKkkn7MFiutyaRVfeJ/7drFohogN+jyo8wqt4g=;
 b=q0MF517SEn6EZmLxnbXxB6XM3YYpy8tWmSgApsuH3irA3Q16tHw+AsuYoggeySatst9jw32Il
 A73zaG5FOWFDy/zGALRujdwgvPQdV6YkqHRZBcR/ePkMLWkrWepZFcj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EiHG54apmvBWzZgBrlcwQNttoJcgPdTltP3U1wRRjME_1754866002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_234645_835282_7E119386 
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
2.50.1


