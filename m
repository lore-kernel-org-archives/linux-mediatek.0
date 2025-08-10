Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC75C87FCF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 23:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNnDUdz3gK4q6slcX3XODNycmDK0nBwCY+DO25+Es8I=; b=EIioz/psqF0WjueMoSEBkqWxti
	ORnIVjCKjYdlqr8a927SVFyezqw7h5OHWVryXN0cSKC5oj/wAS6uP6a3CxQz04bdELbvjIGLeoKhf
	k6JR1l6KhyVwipMtVz3k8XFTNCok0fNAsYpEcB9n7RmU0b9oruWUY9LE09PeMGyjf0GiZlA2d7YEs
	UjHORb2uC4WfT6IGGxRAs7oUkwi8oDcFavRLNSA5DtldOq15uJbsOokldjiEX39f1xvX4EAZZtg+Y
	0yZRDASmCNgo04CcNSm2pa/fcicmZzbvG8gAQ4w/JiG8E+CbeDBhIUU022nV79rUUP4mGVqnHJGp0
	N+qarNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulF83-00000006AMq-3aMF;
	Sun, 10 Aug 2025 23:07:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEod-000000068Fe-1uAL
	for linux-mediatek@bombadil.infradead.org;
	Sun, 10 Aug 2025 22:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cNnDUdz3gK4q6slcX3XODNycmDK0nBwCY+DO25+Es8I=; b=KLjLxRrdbIeCwmnDQhKGtfXT7G
	6SZxSZpsyIsEa27MX9WkD1pRLQPzPOwvzUW0ml7nUZ6Qf3VbynV0GA5WLXvIdVUTmgLXr1+YvSTnZ
	86iO3pzc4+H9SW83vjy5boCad+iNUfmZtPfw9jEYff7CA0MGQpPtvTB4Q2uJUrj7fvj1ZnRrZSF2I
	eCaOeVsTQeI/w6pT3Z3dn+xbwor96HPuFvahs4w30c61n68Op5KVxlbcCbWkT4x1JpLaw+O3Rce4B
	U/CHZZk5BGBDNxrH1D8DCDhvnloTCohSdkrMWFEaY3QTd/xVJFVwAEyu9m17/aoH03Pd6+N54EM+u
	F5nJUoLA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEoa-0000000FJjV-2cAd
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNnDUdz3gK4q6slcX3XODNycmDK0nBwCY+DO25+Es8I=;
	b=SXing3Uzk6iU/ze3GXxyzCnaBEoFoveXQb4phR7odYwSxJMH0G/j/3hucJxREKl+dh922h
	6Jujt+DOtIHsWJCxSphcVyZX5a+n7aHpHwwXl9g5TCBMzjzlLRJB98IBVyWel/Hni94Pe7
	YxSbQgq+O5uV402YojgEj2wOiO2PkpA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNnDUdz3gK4q6slcX3XODNycmDK0nBwCY+DO25+Es8I=;
	b=SXing3Uzk6iU/ze3GXxyzCnaBEoFoveXQb4phR7odYwSxJMH0G/j/3hucJxREKl+dh922h
	6Jujt+DOtIHsWJCxSphcVyZX5a+n7aHpHwwXl9g5TCBMzjzlLRJB98IBVyWel/Hni94Pe7
	YxSbQgq+O5uV402YojgEj2wOiO2PkpA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-HH80-ytGPoCCpSBbX5N26g-1; Sun, 10 Aug 2025 18:46:54 -0400
X-MC-Unique: HH80-ytGPoCCpSBbX5N26g-1
X-Mimecast-MFC-AGG-ID: HH80-ytGPoCCpSBbX5N26g_1754866014
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08d73cc8cso109522541cf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866013; x=1755470813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNnDUdz3gK4q6slcX3XODNycmDK0nBwCY+DO25+Es8I=;
        b=dd2iXx7FWJ4Af++iH51qQoslFpimQ6pz10sD40MOSSrAqGXeYjwZoenNO+uxrqn2ks
         AcCAPlz7llJ75QQcPEo1bA0XyXLDmp1GF8W9e70KV9LUjhwFd57+/Jh1ep8ppJomomzD
         QdPUwsMD/CtqLiU4TAXpH+h2qAEdIrwOkAsc2CYDpndsM/+KaiUA9IVJMnP6F47YJ0PG
         Q9mYtY30nep3Xe+DZ+VG5AQtTxQ/KwQR0+ZNSlYSLK2YpCNdlUYoUW4MD+sHLbGc73nP
         rkosv17hIFlkmjvc258v4R8+XVrTACp6Wcs8pMUn07zB5YUukvwH86+XIGiYVWljs6oA
         srog==
X-Forwarded-Encrypted: i=1; AJvYcCXd7uSjXMS8dubJkUz84EFStwNz2U1QsGV+zp8ocweeLBTfOqaYKJizRPTJ+RbQycHjlhV84kLnWmcskRJgQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCVjdn+3pdDbqQ/eUiv6juPqx14zUaZwe3z6B2JiI035wm0eTo
	zbTHhwDfMqcdL9+3FN9+lRyBSwSrlvdf9CgM095S6Zs0l3PD4k+2RbY3ystvRKAr2sQdCx4b70s
	gKTT4Q3++CkW/Jafuv4Z1BQnZsrDtmbHP6f6k5MMyKNPbBK49nzdt9pv7GqCwS3rYSU7EFbM77U
	mAeCdpjg==
X-Gm-Gg: ASbGncsmLaclhWqmfbQG2FVaK9Qmmib5bLwEy600DjG4SDp73BB+Kd1LnSWNR9jPxyP
	+0758/L1m9p7Xjck/mj+r3RPzudwhig4EPz2DKVH+x7f+OxVSkUPhaUMYCoT3hHmUGyQEyBu5od
	JLd6oO2eQp2VViNXf2kBClMXkkv5pKl9Pl2LG3y7xoeOhhcVDi0t49cbnW1hUf4Sm/EsVPTjPoP
	ds2rvii6+zBFEG2812vhPvEGE9td1FPJAf4rfn4RDan2uLsBcvKUzourkaPGBO54SsD/d13f/oD
	FW+o10eW2oISyiWtmo5lp6iBz7yx3mXjKVP2uP1Q5jaoAgn8UvTdglnm74Ejj3gpZ65YrxWlbVs
	WgujRGg==
X-Received: by 2002:a05:622a:4c06:b0:4b0:9c0c:f62c with SMTP id d75a77b69052e-4b0aedd616emr157202811cf.31.1754866013416;
        Sun, 10 Aug 2025 15:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzBkZptPsYAU3FTRK+ndIewqVNVtwKayuUxmee7QLaZcahzXf2pV/ZFq3ye47SvzpbuHnnjg==
X-Received: by 2002:a05:622a:4c06:b0:4b0:9c0c:f62c with SMTP id d75a77b69052e-4b0aedd616emr157202631cf.31.1754866013021;
        Sun, 10 Aug 2025 15:46:53 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:35 -0400
Subject: [PATCH v2 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-7-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=3209;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=cKQDgyjW9ziRVEOEeZhANbLz60Yx7I/xu3+zURpXhB8=;
 b=ubxW3dDssQ9yAkb8tdXuvrTvn/pHg2yvGTU+fNLDZ2kHxtV9S6BpsFJwTSIz6e+KtTNUexPkp
 SQMN9QW7undDFAjxcu/0ARBSNmYy90wYl7KSLg0AAAuddMqm2btJcAi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CC4VXI3mzEXT-mDzjpo6oMGNlZW4KbTtRC60j2wSD_I_1754866014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_234656_810350_8E1F0045 
X-CRM114-Status: GOOD (  12.76  )
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
2.50.1


