Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5762C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNMz/xyi0Wuf6bpUroOTdzgXVTFsqzyhX4e3vihgsBg=; b=AvvmCBu6Z8LEz0lFl+SAUBjfJo
	EXTYORLDyG/9b9NEfZcLKlcZgySXk3lHBKvRYOGGKV/teGr/Z57ud2OBjnLSVExMaBlMu6NgOolHe
	P2umTstwZ5Ve/dNusWSQmW1LevlMB9O8ZM0mNNykDBBqVvFg+mqMuD/RyMgmjvwhsxQ8Fvqh2qxkE
	t7ByQBUHjrLBheJL/QIcc6SlEe9EdMfZ6Ft1cmoRVN6J6+YFxKk89BzFUnHu3tTyup7EcwL6oQ1aK
	UyMYAIbPlHsRtT3YYRBgIQTFmmOrJDV24m1yhZjkPjfFEamgtg1gsaurQnkNc8Ky3qytCj9ALHTu/
	WA4e2PmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw0V-0000000ChpI-2pnE;
	Thu, 10 Jul 2025 18:28:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtoz-0000000CMNG-1QQp
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNMz/xyi0Wuf6bpUroOTdzgXVTFsqzyhX4e3vihgsBg=;
	b=HQcstAgS4p99c/FfJqfTLXW5Tn3t4YNhe/uY8vYmL7ZH2KsfG7j28uDcj9rIpcYt2+y4gt
	rVa+QFYZk2z+6B1XAsro6eRlkm0Gj4YbQ3chLbSOKgZEKXfWceMMcuQ3KsgIdJAba97QFZ
	I6LF7QaSX6XE0f4o4M6bO52g1PQKDiQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-d6Di_MvZPQO7qLNorZp87A-1; Thu, 10 Jul 2025 12:08:27 -0400
X-MC-Unique: d6Di_MvZPQO7qLNorZp87A-1
X-Mimecast-MFC-AGG-ID: d6Di_MvZPQO7qLNorZp87A_1752163707
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a9764b4dc9so20731991cf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163707; x=1752768507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNMz/xyi0Wuf6bpUroOTdzgXVTFsqzyhX4e3vihgsBg=;
        b=rcQWgT5wUii+y1bW966KADFPufpSNxA32Z5HUF7X3eVRlh9O3t8Kp+QlK9cZRzyzLU
         VtALKsLkNc+WIBfxUbOBGHgPlQ/3UxDz/q1fWcWTuIuKWlzWkSEOU61uhsIS1hRjrO4a
         TJP1nZ/WymaHIZKInyMu8Tco6g8op0IGgg92fuTigKUWDiLcLq9s0cJcKAqjbFfWpguL
         elArutrQgjWNiAE95H52ctNfCOyill4eHWp52XwdVihsyKH48t3wYrnrs3/ElA5pD7P8
         DFihgzSOqeCGCW9Nfn3iC+jy+6LhPdWQTLxZ4uIewCM2pwN387plaPTVl/QcQkyD0ZG2
         56Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVT177AcHueplikIH7HGuLr4MRcw/7JZJt1USIAmqAoMc7bdDoQGz/9B087uGbA/DXA6qO17kkMjWB8nK0bUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOvDV94AV257InUf3lYKFnzfAn8p1u1z9F+QmC0FxN4YSufe1q
	0W5iYWvx+tP3G3D9dxDvRVfkzo6iN4iXiPxAQLSjCUYSVcaRcSDy8gSTaC1AmHRFgzQJG+RqLQ7
	98pbUloZ9144pesPy77QBDWSSHsQ2A5257gLzCoxy9cW1aOuigXSXLnMi8F9dFT/wIxhmyucg/A
	==
X-Gm-Gg: ASbGncuzNbUDdSel5DkOrlnmkYyeNcZt+I9FEa7RwiLv6Iu9QpXTPZwzhyZSyvDMwUO
	r3ZLlxp1bdZrIR/rrxWRb9oQYOJSJsT6ZXRcMGHT/EPhd0e62lcUBzrMOyx5ownoaU12hQ5zOB+
	8CVwWFJDio5+oCAGKaUBThlxzZcYmJ56CPSkVMlXONPCfB5+g6X3KUbGRBsOqA5J8E2TYu0BJJI
	96IE9roujxVFVRPZb0Pei7BZfEbYDr2JxfepK24/toa5GE0udTkqotbsbMZrnKVQDwoUummPXOZ
	qhNuHRgscubPWHCxk78DkqdQGpviDwZp09SK9btPrKrbVdv1TRItg1jyrt9G
X-Received: by 2002:ad4:5bce:0:b0:6fa:fea5:4da0 with SMTP id 6a1803df08f44-70498064944mr50152126d6.10.1752163706968;
        Thu, 10 Jul 2025 09:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYhZa76cHQRjJPw3H7mkaAzOvkiyujQRGMNOmHLyrMH7YSa97wvn3nU7BthDnNKd7pp0944g==
X-Received: by 2002:ad4:5bce:0:b0:6fa:fea5:4da0 with SMTP id 6a1803df08f44-70498064944mr50150786d6.10.1752163705661;
        Thu, 10 Jul 2025 09:08:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:17 -0400
Subject: [PATCH 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-7-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=3209;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NHf2WrVpFvBK9rcSwwdfI+z+ewWwe162I0ZQpinGzTg=;
 b=iJFp8tAaWU+wHaHcUB7nA5t7RfDvvhf4kk9dD1nEljg5ScIgHcdVuYZrpCfyQ1GumV9HBW7D3
 o5sEUuXM1iaDquqPWph1RO6DawQwo5Fhz2pFk4nTpsSuuAzjb7NEMsz
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4eY15tTWlgcfWOLxeCb1FLPZ5eA3NZko45rsjZBA4wM_1752163707
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090829_469972_D91209B5 
X-CRM114-Status: GOOD (  12.54  )
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
2.50.0


