Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ACDCCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=; b=OhCmgr6pqYGMyXXha8nOEnfhRx
	dKZyiV7jaIjevLlRYeIdrCTaHNQCyMmalxaE7mUZB9JW5b57jWgtOl73tbEH9yy9qRua5cIr/X1aU
	tJF46aNJuDk2wAC6+Qthnfq5Q2AL8pV632Y9fDU+BpeIdjT3Kz1DiG32r4DLtmC0f/xOEGAtz4td5
	hB05fJuRM1ppjprX/hYrBH+d7r1TNL0aIv5eMIErQRf0v81z9rQSiYxSvpC25U+vWEv7GhqETXcYc
	2Sdw/tEsILBNa+nxjEoQhyycT2NrB2oICWjCKFutPDaSdeVC7u8R9fDphyc2v2cyd3g2LKy9iKexS
	BjT0RkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nq-0000000GNbF-0r8A;
	Thu, 06 Nov 2025 23:27:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nl-0000000GNSq-207D
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
	b=RIrWru6kywONlL9XBLNuAw0K1Bah3O5BudCPQlV4bCxBQYY4goqk7KJ8Pcih4MHEO6iCth
	i7yjOoRpZS3+/IGV06RKFBktdcCaAhglSsL0zvwycGzlcuIJjcNgVYRKCScxAUbODZC191
	WxyBi9E6EVk+np6wYYooklZyf4FOF2c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-knEKq6tKN0C2QxqCGQ0H3A-1; Thu, 06 Nov 2025 18:27:07 -0500
X-MC-Unique: knEKq6tKN0C2QxqCGQ0H3A-1
X-Mimecast-MFC-AGG-ID: knEKq6tKN0C2QxqCGQ0H3A_1762471626
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e88c912928so5164871cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471626; x=1763076426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
        b=DlQDAFCoJizuvyInPjfYAdtvxDHGKx+ZDfbdqZTbXBpP4XEb2PHIo/YuaWsTX13tT2
         8fE01Q0qepFczq6Yr3TnUQc//Dy1l67FG5aDkjrhlkHM8INV/Sk5CMzGBsgr8Xlj3V50
         VDI7QrQxcDhzXs6cwqc13N5eiZKSFdnrQCMvtBJmL5vnxuUtTQvns1IlUtG6IvgJePAo
         X39QJvkyJMzUHT43bK5MfGhML2acQRe7IdGlEYVZo0ozQa0LX+F8+j6N8pNzIVdzobtm
         guRatQaqP6wYOnWSQPxOmkSD2YLICjbXOS72JmDAaKBLhjM5Vsa3hhPzeVZ4uj1dxW7F
         JQsw==
X-Forwarded-Encrypted: i=1; AJvYcCUz115o1qohVQ5XOSEDp3GaBzmQlU+9+y1Y8zOK1GaEc1xNvlp7KUpggU5KmvL0GPIxY+py3496iUSfivZKag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4HPoVG00UjG2d8iTS0+l76WN8+XC61r2VF59F+diapoP4RgA7
	zvDCCbKyCG/tuao2rYUeQGUi5QAR6dA28O+G3XDs+a4hBQUaJnfebfTNEIXreW3O1ToPgfUNWnL
	H2+l+JohVim7toYNC0jOFd9vOE1s+0C1JsnaUy8i+O+GedRRaU3Y2j0TnRD2POpJIMGnUh4x7vA
	==
X-Gm-Gg: ASbGnct6Fmpj2vRXlFMvbwkS4NH+o+hlon64CNGmmFpRDw0YtXmncZ7rh51bIBIFVON
	JSYOxsUCybcidIyp08LT/oiQS6dNrO3o+4zzcmp00L9aWaFZGfjnY720ABXJ2iI7mP/QPzDhmwg
	Uft6pZBdpu6NHn7L6F5iUljZb72EKvpDub6W3KkYuYbBoxCtUooDAlE607iXPr9NsHAuygSq4yO
	ZcXw39nlaX1nBKN2wye+rT0ah3UtTNM8hEO0ZcBHJudpbV/ijCk7uOxw3nY7VdEL65UccVeTojf
	2GtNHi18VYUPaWzFW2wmYY0OWr68e1Y5mSfLL1hvDbz2Na5bzP2ACYXMs+iXsaVkKHlmIC/uCnQ
	TlI0V6WkwAR6pQZDvYqb6LHNIIAM9J1HdPAURqyyEAw==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id 6a1803df08f44-88167afbb01mr19476776d6.10.1762471626532;
        Thu, 06 Nov 2025 15:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAKV5Z7B7KevWNhDrMQhaFFBe79yFfIMSER6+SS9G7GG9yGBlDbjxgm5e37vbwHrzd8zri1w==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id 6a1803df08f44-88167afbb01mr19476536d6.10.1762471626163;
        Thu, 06 Nov 2025 15:27:06 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:27:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:53 -0500
Subject: [PATCH v2 RESEND 7/9] phy: rockchip: phy-rockchip-inno-hdmi:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-7-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=B3cRh6p3LgoB2SM5XPxaNOqjVUw8A6Swuk8MPDVITuM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Raa525zMnJS/r9qwT+FG4FH7p/2ecBceX+1fMSF5
 feuhew/3VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEAv8xMjSUXVyxZ7uixJnX
 YgUTf0if+PYmbwaXxuFNHqoeua3y8fkM/2M+/Ld89F1Hxzyt1aThga0O43ShJKVrPI/Xnd1dkHL
 +EAMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OiBVVao33mjbwpe_7epaCphcxd6sn_8h8xEziORHU7Y_1762471626
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152709_601435_C872FE9D 
X-CRM114-Status: GOOD (  13.46  )
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 8dcc2bb777b5455d21a10f06c5ad842b2ddbc834..1483907413faa5ce1dc8614db05e6e929410404d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -749,22 +749,23 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 	return vco;
 }
 
-static long inno_hdmi_phy_rk3228_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && !cfg->fracdiv)
+		if (cfg->pixclock == req->rate && !cfg->fracdiv)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
@@ -835,7 +836,7 @@ static const struct clk_ops inno_hdmi_phy_rk3228_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3228_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3228_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3228_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3228_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3228_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3228_clk_set_rate,
 };
 
@@ -906,22 +907,23 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 	return inno->pixclock;
 }
 
-static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate)
+		if (cfg->pixclock == req->rate)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -989,7 +991,7 @@ static const struct clk_ops inno_hdmi_phy_rk3328_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3328_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3328_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3328_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3328_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3328_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3328_clk_set_rate,
 };
 

-- 
2.51.0


