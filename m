Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D15D4335E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=; b=UcsSZvcRZked+Qs4mVXsn30Hqv
	r0mhYfo2uU2oWQeuqtcjwBY9P7FuShDQ8C856pyuwuqHLl1/AXC6Pw1D1QKKUT5Dn29Wn0Dmeu5h8
	raoOluj1VsxbX9L9CqFyFcEnw1nSOE8ghmwlnSDeAkMKl302ISloJvMTQ7e08DxzViJ9yYAHw+DkQ
	b/nWOYwxTUMhDkzcEA5ZHRNlQ0OgHJWm/p8jp2tGaoz0Ie80fRzHWDtK61IVrskEkJg0RTD1gMjPS
	EjNXpZu8U6+oPpz6AoYNe3UXPZYvJ+ARjEtOHaFNeF3I7tGoCkeR8AiviRyz2sJaPRi66pzFYd+rO
	dC+ygpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuo-0000000HPKQ-2YVT;
	Thu, 11 Dec 2025 23:17:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpui-0000000HPAo-05iL
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
	b=DqQrWdrGCJwClIhQQPtD4VdWMwiQPL/Gwc9FSd+V3ty1jBIMyBfwupuqfmQY6VU+mInPp9
	+TrETcPDikWTBzDk81DnaMzRh6VmxOeWk/t4OztcN64Sjhf2YQ++od/luTWS3rO+27/93O
	3NWi+WzDgaJHfR8ftpqw1fu/OYN4/8s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-vJpXHHzKOI-jDO_AI37t5Q-1; Thu, 11 Dec 2025 18:17:31 -0500
X-MC-Unique: vJpXHHzKOI-jDO_AI37t5Q-1
X-Mimecast-MFC-AGG-ID: vJpXHHzKOI-jDO_AI37t5Q_1765495051
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882380bead6so17054666d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495051; x=1766099851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
        b=lELqLg1eS5GnBQwZ6mpw6IORkSXqdbBBX0PXQnmqFUdWlAxCt1QN6IfL2yg59DogNn
         ppsphMKTMHVt1P8f3DIrJWzJleQmEySe2sFGqJZgLdIpZkJoJ6++bps9oX9E1Qy/PkAA
         GUFCoPbLckg7WvWhp7+MEBHsoy55dBgcrDW6qf+UcuZ9zbP4C/5lfvznQog6AJtzNV8B
         9e1gKwNZiXvfcVgYSIKYD8PDXz+zcYqRgxk8B2m6BPOWEfgyBlc3WyY8nBsLE5htHZcA
         8qoud/JhmDNbelrQ2jn57iQ4mK7gxOKFx7foX66vqKBeb9hlIibLBywwPMEsSLWZaAoE
         xDow==
X-Forwarded-Encrypted: i=1; AJvYcCXj4N9RNMkfO0NJM0Z52Lkg5cwDmMtw3AQR01BNFWM02XRv+nzIBAWMAb/l9zLgiUuFBlQPAW+QtAI3WrsTdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGtxGh1EjG7C1O2Uf2DqyjuxBvJBFuFkKAjoZuNB4XspLepuFU
	jnn1sileSiM7c+IOeYdyz3iWmF6WpzwSjhBbFAOa7PISCUrCITcwi9N6F5OeyZUdIOunW+6B26X
	w1xvrpNhAQIMwfGL40d7hBSP0SjqGTQZHPHyvfJHZb1x4k632ZSCb+BT5fIocVDWWWaEhqz6bBA
	==
X-Gm-Gg: AY/fxX6WY4fvzNIVpYs8BWSG7NNsaDIlaCdZeLYGQVorH80VqMo6lNonirP/Ok9dzsj
	b5YYqu/fwG+wfkoG1vjMQRaWlMrmraSt/0IfLq2IKlr6EBCGMSmNh2mPZOzB80pXszEYMHBrN1V
	QcKED+J67s+Iy+hjxTsFNox5Pa5MaYsH4j5hFbyy0yeRNkHm5ODwy41zeA0/6XvVhY9erLls59q
	3qzRMQAhywYaUf2TG4bxGH3xp8Ecr3WTB4cWtykuPjNs2qeZznPBt2ghi785apslXybOyoKD2q1
	La882LENRxSh4pSbo4V+7eePSKo0gqXFc8pCeIePKbF7Ayq6V6wUZ9Sqguh9y2GzIaGzPzWZTtk
	tTgehXlKFPDqrbUPFkTvJUEcMOy+6M/gW/35/PNKY82ADcgVvWoHrsA==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr776171cf.70.1765495050790;
        Thu, 11 Dec 2025 15:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ2mASGrb1uGzvUHEFvIvmoh74d2qrejs22ELk7Vj6VjgPY8UzKXQvMrAzIodArePD3T0o0g==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr775831cf.70.1765495050403;
        Thu, 11 Dec 2025 15:17:30 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:25 +0900
Subject: [PATCH v3 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-7-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An56TAX1cqo7N9lFvO25vdxikpcfbBNUoQ6JxN8UiKo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5922P1Zs7hiGnB+9TFs04zdHhsnafw74/pp2aRZ
 xsa/1Ud6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiL8IZ/tcuZ/74xmunwK8+
 K0b12kU3f76araLG+bUwwmBtXFmp8SOGn4xTJlnuvLvryMOzu/sCg/+572ItvCozoev822K9vIh
 jf3kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nNKf_DXLz6mUcW-BUC6RYd7eHpntI5q_FyUt_kmB2Sk_1765495051
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151736_163198_ED197BC0 
X-CRM114-Status: GOOD (  12.71  )
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
2.52.0


