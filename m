Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860ECCCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=; b=LQuq+Q1XXNrkgolybBLGgedVXs
	wfqf0jc18ko/C+MLTIaUJIvgmJhThQuB8Ktgew+NawJLzzzFNSyJJUtY5Q5hbgjMptdbDFDAs5tqd
	Mj+Wl+MihNUPvTBcOThgC94aQCu3q8zBXNNloGSQ4wgWGZ8dwrEMIcKxcm2NB0faH0yu71xyvXWNZ
	QkDx7F2TAlilC1hnnQcj1DAea69h/SHLm5d/DFRjfNMUmNkRlc/Ody+GSEuylWaMxnmKLpCYWCJbn
	modZqF83p2qF0e33HoNkhwO/UF46BVJa5iYSotD17kdJwHIGyyTb0EgxkCGleDxEOp9W0VItPbfro
	L53y9v5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nf-0000000GNJx-1X7X;
	Thu, 06 Nov 2025 23:27:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nb-0000000GNCh-1igi
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
	b=UrVCxPyDWsihDo7Dv0bPtkQEdxvQUuq14m+3IEUojFgQRMf0ZmgBrYoVa76eqbTcdn8abt
	cskvG9CEUfckbVz9h+6n+BiYT+salIuBrgu20QmFdKVqFP95IRxgX/66DH+c9NPczj7w00
	PY5jqS0I6yLkWuLZLOKU+/F4V7oCHik=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-NqdCYu0nP9K2FX_Vq1RPvg-1; Thu, 06 Nov 2025 18:26:57 -0500
X-MC-Unique: NqdCYu0nP9K2FX_Vq1RPvg-1
X-Mimecast-MFC-AGG-ID: NqdCYu0nP9K2FX_Vq1RPvg_1762471617
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804dd4acafso8996166d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471616; x=1763076416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
        b=kDs8knrkAGmTTNBRH34LJ2tghT8PXL7nkk1D0xo/bTJHBBRRkzdQOk/7PUH84c0bSh
         +q8SPlLCYlTTRLMxbjACvjmI73YF3Z75wRDo2CDAgk6IRbSzRXs/NowM9xLhcObof3ZJ
         uPxp7qa99g5PPD6XWmvg6AD6SMAHB+Xy240xiv7WvzRvZ3Vc9jxJ7bNWxyGxwcwpJk49
         QrT/lTQT84FkCsPVKCBNsXm5u/qs/aNqeFIy2swa/Wg+AJOEY3UWbDdWs9ujyvxK4dJI
         XlzsmFZFJpvYOYm0i41zSYf2sGICoCXH8Z5v1j3/QtAeHTFXvbJA4CDCp7lJcsakXBHP
         QFYg==
X-Forwarded-Encrypted: i=1; AJvYcCW3atEH4KwoRFj2Ka6S4WpzLoAVr77GVOJtPft6sIP+ocxIpj9FizXtZMaqw6JWBZdyAwXqpl2frgtww+ojDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1ArEwcFgVuOTmHTDX54LjGtJd90zINFJg6jiauUifd9PxaDkc
	6CTJhWsDtUESiec6YdbTt2XsJhh3EFGd3u5DAZbJBb3Nx7ID4qpw6BfhSu+XdaYYDx3207lELSG
	kOE2M/DrxTI0FKE1kptxLBVZX3cI2IXjcx/xwATHVENBuSicgwRwY6gt771M0C5rkVRcM6Fi8wZ
	yiR/AkZg==
X-Gm-Gg: ASbGncuGaHcXVWkfOhbGCkt/lORcnsA4Q31VCUT/lrkzsdFjc+RbbFcxVR4phgqWJwY
	hpSjUDhxZHblLmHUsSogHUoxIJWebuw8xcW2bJFRi6CNDHLyKEZePiRKwfSpOPwWR6H6lHKt4fy
	DuE5c1L6C/luS6RLne+o80c9wF34WU6LC3NA8Xe08LoYKnbDjXfa6cW50cZ0PecPaxEV8mjpDXg
	TlwFLn3GV+5JkdXBuuCRi/fNxGCwv0zTT058PDz4Le0fpU1TTh/mts4ojGv4PhW+hn2DuK5U9fd
	XfJOSFEhQxEHQxqAYyZ0s3K5zQa4VhmIQU9w27+dUGSfRYutPDf8T04SKnttKx0E+g653yaeqdZ
	VkAC4I1WtCiRYd+fojPkxX1rJ1DGA2bfxITuOrPSrEQ==
X-Received: by 2002:ad4:5e87:0:b0:880:5a05:925f with SMTP id 6a1803df08f44-88167afd114mr17958016d6.13.1762471615994;
        Thu, 06 Nov 2025 15:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5Z5NCJiDJsbMHVlrtUlpGjakDqi2/fs01RriUHfEFSw/5HUZvbsIZYCzQ2U5thVfZ2fi0FQ==
X-Received: by 2002:ad4:5e87:0:b0:880:5a05:925f with SMTP id 6a1803df08f44-88167afd114mr17957826d6.13.1762471615658;
        Thu, 06 Nov 2025 15:26:55 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:51 -0500
Subject: [PATCH v2 RESEND 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-5-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0ONTyRyj5ognfzdcLi6VRYwQ6d+KVHGkkiYfjM3qIvg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Rbkf3oWx/vTtHDr4ZNVHnvrgjPm/1vnKvxMrOSmb
 750m5RhRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZ+pWRYV4nm13uT+GVUvvf
 X+i7YP3Pldvp2mr/m16xsrMLpB9/nsjIMFm0TLfkQZN196ctK6/pBDG+ze6XNL4ZuiJg7iIPl1U
 XuAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EqiA2QOVDcTppUfU-nSMDI7Vgl1AuwOi3vdup15MOe0_1762471617
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152659_612881_EA282FCA 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 673cb0f08959e0e4f2b1ade2ebaf796e8b76f8bc..438ff3605d90121b7bfe02b3ddca8194437ed9ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -237,16 +237,18 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 50000000, 1250000000);
+	req->rate = clamp_val(req->rate, 50000000, 1250000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.prepare = mtk_mipi_tx_pll_prepare,
 	.unprepare = mtk_mipi_tx_pll_unprepare,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.51.0


