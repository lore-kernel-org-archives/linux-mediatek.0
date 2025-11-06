Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAB3CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=; b=UK2IzT7rgzXKF0J3pVF59V/zv4
	W4MrFrNr7oE/uo3PPMYHsxqw+JPjV6kxTAjm3qCPWl4hp8+7xuJhhSqYxH+1XxxXamcyMMl34I6ss
	I9vpOsSW8pmlK58VxwSiX6aVbCUuiyahR68UmI3K7vyRbxgAb1slOJAz0KA2Zi2hbpULab4AFuz9o
	aIk/Y7FiYzB2SL1PfIZiGg6jEtvqmXRp0YcHMiCYGzjAcgz2gv4tgpXFwb4U3J85+WWdY3IR9FusS
	e8bzzk+L2FVnSq7c0Nt0uB9H9JKZtcHCcO6GUIsNGQ3v0Pl6m4JN8iFen0XDBzlJF5FarFe14R/aq
	mup5LNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nv-0000000GNkM-2xhG;
	Thu, 06 Nov 2025 23:27:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nr-0000000GNdH-4BLc
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
	b=SPOw2ttHPW9o0igLdIZKkgNz8fTGOTAQcOwDNoz+Ocft09peQE82YPpMZ7eYSD44VnUgkv
	Q6jhNDlzlPm1my5aAXwsWhavLgJ0Xpa6lPe2N4T8LiKFTXHLT2RFyRJ9DnKfXlKGDizDb8
	1i6DRJPFTT02vr+xDKsgsrgAEy0G7s0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-XVsc3R5SPGe-Htq7cQ5M2Q-1; Thu, 06 Nov 2025 18:27:12 -0500
X-MC-Unique: XVsc3R5SPGe-Htq7cQ5M2Q-1
X-Mimecast-MFC-AGG-ID: XVsc3R5SPGe-Htq7cQ5M2Q_1762471631
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e884663b25so4692061cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471631; x=1763076431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
        b=dCQCN5suI9KbYJAN0G8f6p7M7aLxdlHXRafrxJzTulqEzNQ197crS+fzfqyCdyfsSu
         iWJX/t3QcPEozkRIsroBgaJAZo06rvwbF1SVs+ntRLZZRPXUe02/+98VxpEbrmf1HMmM
         iCPfHEBaor8pX6HlHH4Qnsy4sfklRDtpas2X93QsNII36feWyiIWX/1wxrnN0mJ+6nvo
         M2B7JHjPLKHvxkistHH3vW/1akmYxuwhrNhGZnd6gYPpQ64d1Tnk362qeVjLzuSbBGkO
         mKVlqvUgaRGczmhzZXt05FEXQLlrqIHw+7+vhaSw2PtKkCrMYnshVn8Mw1T0ynqT7rH1
         1gtA==
X-Forwarded-Encrypted: i=1; AJvYcCXZQav/VaBtJ3WMHQvWEP8jyimY4ZWHXBD4qqk/JPkRtGcOf7EC7du39LOU14CCAn1uBRDiWtKUT0cptWgmlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3C2KFShMtDB62VNqgauzzCHx5/AyZYjZR6Q4RBRHn2MFqw2M
	GxTj7/GVkek4X4jjAHmtnlfKt96qEie4BUb4GeciKXCCGL/iWzUn/n/IZs6ppN0PVnd1vGDjQKI
	mCUlzEvAR8kdHMDBf20tVJDMp+5y5lw/sqOR774H31avA/+HvlupJvkCVG/XpO/wj0HyuXB7/fg
	==
X-Gm-Gg: ASbGnctRKsryCl5xyec66wRyqe8d//KBAF3Qb/cDcvdC33Y+oxFmWnqkxe8gZCExgGH
	nMmah93+OQOs0RYz2XgGvESkxT7cwlK5EnaWROEZI6G5W096ZNAegnZf47ZHSHU/WfOhVJlkYwL
	7bJ5c+pj9rXhw2FUDWNR4QG08CaFTdzfncURyB35VFj/Uo4gIo8kVOOeOWvYMYe9xmEbDUhMShG
	Y7HeSVeKP/DWIoWDUcfcOtI/HTWsHKbOi3Ajitp0Fr3osrh1px+9PPscymPQnQ8reBaiD+Gfpji
	5YQoOvHh7LV9t2dpXrZEw5LFikz0HgyEBinNx+6G6cCVUTJkPRc1shIL2803XCi2dzKya+6Mq6c
	wwe9rfLLFsSSmEGBideVBJaZ0KMHsYhO4sZIOtEDpEg==
X-Received: by 2002:a05:622a:189b:b0:4e8:affc:29a7 with SMTP id d75a77b69052e-4ed94a4c31dmr14935691cf.69.1762471631421;
        Thu, 06 Nov 2025 15:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt4j9euZosp2hZeGEJaF3Zc+V1HHaVy/kAkeKIc2HE/iGD894+L3jbsBB5eqZssh32fH0eaA==
X-Received: by 2002:a05:622a:189b:b0:4e8:affc:29a7 with SMTP id d75a77b69052e-4ed94a4c31dmr14935481cf.69.1762471631061;
        Thu, 06 Nov 2025 15:27:11 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:27:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:54 -0500
Subject: [PATCH v2 RESEND 8/9] phy: rockchip: phy-rockchip-samsung-hdptx:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-8-e2058963bfb1@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=XNrncR0wdrogri0mOccJ1j7cRKzm0SbJrI8uS65MUBg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZa/lLcfPtOav3l31tLb3NLLrj9XuLfm2MKzO8eb
 lmSfiJesaOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJLLFjZFjls3zG0W8X965q
 XmO0fd3SSvnMpefLahKc57Dc3CGSpOjH8Fe6eEW0erXU1wzZ+KO6q++4quybaPjtwWm7bfZNNya
 mn+QHAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I8I0NMFgj_i521XvG5hC-u_vjUK4vBsCW2LTwSRjDn8_1762471631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152716_127162_7FE4631E 
X-CRM114-Status: GOOD (  14.54  )
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

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 01bbf668e05ef94e24a3fa11f96f219c4f942451..e5436c99a3c435715358a07da73b4d10d78ef1fc 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1868,8 +1868,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1878,9 +1878,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
@@ -1895,7 +1895,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1924,7 +1926,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.51.0


