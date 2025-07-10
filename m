Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE6FC83F24
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=; b=SYsWXOnUQROb/dhMxZorGBLN2+
	SRioP7KQJGO8XWvD9leHDLEBeOGvb5IbI++jTopX7B+wUljWmENEeGzsdwLdQ4Y9FMuYSmWr88bov
	Kro5IYE3mlg1gpikihqRJjAC71oEbwyhYTw+y62DOgJ7T8w0ai+ogpkxoex5dZ5qlTn/e1WrWmo01
	HW1erDbemgWB9FflhYk+gQAT+sLw2QV7xSC+n0mam9vwxeOz7/jDW9tUvhbNqR7ekc7Mlqx99MfQ/
	DwLzRFpQ7M04ds5pzf/HQHq2A5sTKsA7XAcQ+LROTRdCDGMnqYEdm6WqUKXZN3J+hEEP9zH3x5gVl
	nKl6uYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw0N-0000000Chh6-15uv;
	Thu, 10 Jul 2025 18:28:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtov-0000000CMLQ-3UKx
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
	b=Mz7duTc/s2VgEY5xR95Ic+GAlYvyBxKyfOh7VEzaKGULzP/SbIePxexbqQWI+NyAz5iqSP
	+ERRBjif4hiKoWlDfa1QQDP6gIxDXryhLnWcxJ49PqbWtt/LfGLXgvKbf1qoIRXJYsf1tD
	LDxiGacK1csstZkG4lmVG2ks1HB2tm4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-B1CRFYHMPMuFHzUlrCt8oA-1; Thu, 10 Jul 2025 12:08:23 -0400
X-MC-Unique: B1CRFYHMPMuFHzUlrCt8oA-1
X-Mimecast-MFC-AGG-ID: B1CRFYHMPMuFHzUlrCt8oA_1752163703
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09bc05b77so201674385a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163703; x=1752768503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
        b=JwSWHOEYFCPkAW+ZgdMqzLkTLt6xI3wLBHLMNyAvsofBiy0jNshcEXDdogrYkDblI2
         s0pkdmNVkxX26J35El1/fGGGCmwRw41/mvObmMQwx85GGaWl7Rp9he/BWkzudNesYWLZ
         UwI6uK6bUs8zGIo3m3hxVJsgNFbaR3uAsjscCTVxZBY+n/CT51BdXOBWiU0LL35eItvT
         IivQJ+8AYElt5tjPxj2yOMr0jdtMq1lES/lrBSXTj2RNB7lBpCZDB9HsvvEpWD+OfcZw
         rrhXe7UfZh4fVquRZvCH1tqjSQ7Ejz0e23f7xcvevawQBPrP5iR0dE/0AgP5A9IzXp0j
         Gd0g==
X-Forwarded-Encrypted: i=1; AJvYcCUknfKavKvBNGH5VCxkmv9VB+CCagt4TVBvd755nqStIWk5BZXUl+vIru7VVm1ccdyAVu4jWprg5flc/hJfEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUj2C6XIlk5gSMb9ssxvPq7aWD7tupbUh2uAa4K7oc5gP2RxkP
	n/qSxIx1xJs6ZkgcGWcAVXnccdX/OwyIhEqwK1ViFEyY9DPjmY21uvXdXpZs0I2TS27XU1UObMT
	m8jjtWVMHVCQBEcOFj0wOgtUxi3YcA/QkZbhSeiM7Ftzt/G+s002g8HK3XZa4jO259HQT0dgG5w
	==
X-Gm-Gg: ASbGnctvGFd43c80Vaaxy1dn/yBwyTArhkNIdy7hTiqk+Pf1RlPNMWUSA7BJNOtEHPH
	67fDjLhYRdjJHR1x0iL2kB2IuLfgFBTEZErlN893bjYbR8BzpWRugxoqlm+NTja1SVUGl9W083V
	rKVsuvlxA1u1P4/vwtMJGLlDyWOCMD1HwWdRnV4uhOUIZR0uhWk09+uSGO4ILokjttiSI4c5cX/
	ag3680YaZL77k1Q4Q8w8ncv9zy3SqVwBe5L7esTQsmikZI/GU0GE2WUfudE6KfchtlLWm9JIa6K
	MciU3btVSP4tK9ZWibcSBbm+0WYDNawd1j0mlUVHcQfdQ3SHkFPnbkTokwFR
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id 6a1803df08f44-704980653a9mr39030296d6.12.1752163703078;
        Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdCZQ7W3y8kThWl4w+CnUCECNX6Cyj79KFh3PeC/HpUcHl6P8QBnf3iscE4pNrdpapav2INA==
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id 6a1803df08f44-704980653a9mr39029866d6.12.1752163702588;
        Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:16 -0400
Subject: [PATCH 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-6-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZKlsIvlM5HHyda796a+VTO47/qeucu/BCMXwHXG/S40=;
 b=+r3EuMe/pzh9qF2oPdX67HS2VmnZ350abewNM1edJtWvBPtHINXt26quhidSdRFg7SeVLEzsu
 YVJmnDogbgKAaAbXcN1nbXJrSBi27Fk+BJ7qXWfiPpZHj+x2CtpRepu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wQKh0fE0vVn3sVOTaQ9FbaMVGFehY1Y7fHVPEeiZndw_1752163703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090825_946479_C5C23146 
X-CRM114-Status: GOOD (  11.91  )
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
2.50.0


