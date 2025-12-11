Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421E2D43361
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=; b=X9bGH6cyMN5my3oBzuMM5QuBEa
	1j/uaIuvIyZXIBT7PYdk+Sw5+kKwYrm7aT72WcLpEwzAlQ5N+F+YYxmnQK7CHP7qe9GUHfVnJFjt1
	BKNjQpsKL6L9Q3cVOnEKyglg+UsEnUukBoIYnU2ervGTz5PRwtkba0cY68Il5nB0Se3X1de1/jI10
	2RrVW6l4etJIH457Fw4gvgmzTfYEPY8rx15FwDqOHQOAsW5/TBlJmyHwYCSSPto68LIVIk1RkFeIP
	RgPuAomutGlQRfWiRZzuIBa1OJw0lTgldSN0IhsQlcNA0ccg1lLDBnc6hCDUhivHLBmx40HZR8m8s
	K+czNM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuC-0000000HOXD-0U4R;
	Thu, 11 Dec 2025 23:17:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpu6-0000000HOSb-0mSR
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
	b=hx3VIWw1g/dpeYylkTZtdcxpBB0T9t2KJkyKB3m7w4UFYFIno0bS9r+LoicOIpA1FVnPtT
	XsLPCEX5WmxnijRdh1LHTLdnODoXnGKRFz1TMmUQSS+movyuQRiU6TZ1uqF/cC/P/idIvz
	bWjojXkEhYgKGEl+mRAfGvo+N/6paPI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-k2zmtQleOcGyKIC3pwfE7w-1; Thu, 11 Dec 2025 18:16:56 -0500
X-MC-Unique: k2zmtQleOcGyKIC3pwfE7w-1
X-Mimecast-MFC-AGG-ID: k2zmtQleOcGyKIC3pwfE7w_1765495016
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so147580785a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495016; x=1766099816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
        b=u7nUTRAnlU223P45SBYxgSIiCL6yBb2qJg9YcvUh6HnLl9lTGQ/I+2ERQFf4IJLcG3
         8ecTp+5wZy8km4+6bkboS4VcXJ5fRSXX7WouEOO/TuHkD1t2maCZ1nZuJaWogFc83Q7C
         bOZqLPVXe14Eo+ldS1VHlak9OYkmw+NCyM6SNB29bNhC9BM6x+TWovPCW/JoHkA0lt+5
         957GtWSE16ZR+wWVjsuhMR7fcKha4JNrC9KiL6O7e/9T3H5PARsMRemDmu2RlHWz1oik
         Y2Bfbb1/tClDmc30FJMT74daxZDxNroULDJ4kgq3m2HmkTV3B5rewk83fXqusFYn2mvl
         4lfA==
X-Forwarded-Encrypted: i=1; AJvYcCV4a+0D2y7X7sbb5J7bi7rQ7SRVIpIy/eKnrrvxYVyXCGrwnqSAA+bv7UKgim+xyfGC2YzBt6f1Z+9qR22mAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGfjHTsgU4dEX6VfaDzQerDqhysH43Ubmsj7l1q8RrnJAWbmtO
	RgEuICUAXRsEgcTscAQhhPWwksJmJFH+COea10KlICn8EnHm1HgksEEaNAw4XpGW1YYINOdcB68
	G3S2rzxZgzk1MYsrPu4HsBCAe4tiSHieHYZxh3Ymoyqnyw2MHOOwNLsVYV6xRRFfuNYPLVe6wFQ
	==
X-Gm-Gg: AY/fxX7FuI3Ln2KcBVEm049e9F7RCF0fs/Wi7vjgyXxdTzz55yQdZGiltaVDcfVMKsL
	XTiCle81iAyRhPxSErbJpC5+jC9CsZAHqQoOExpLragCJveXsKNpodbvFAikXVjex1tBsb5gtID
	eaFMwbVXwirEeVzURvUqy9Oqh7tQCMsH8GzxJRmB6XQkb7i130FP917Us8Eouoc4FZhQX/o56No
	TZ2caZFxabEjfqb4NBpjKQVj+5nx8LN5DleA8Y4a7XU6emA9dqzLDIBpmqZ96l7mNVD+wYhqZ4r
	fbYkjx2zS1g79LqsTccC5HJbocg1FYEwsuwZ+ZSbcw2j9NyynTV55z6Gy2H3cCTqZ0nlDX7Z6aE
	qI9dLOIn6UtuJ+TOt89z5qW0u/DFX8dj9OfvCJbPMy1K5mnMNB1wK/Q==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id af79cd13be357-8bb399d90bamr39281185a.11.1765495015846;
        Thu, 11 Dec 2025 15:16:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2s8wwcOmxwXaF7bKZgVpwocL48364JqbwVZMFBYNgdRIsZcitJ0mH0HHmDGJg8J0urTG96Q==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id af79cd13be357-8bb399d90bamr39277685a.11.1765495015467;
        Thu, 11 Dec 2025 15:16:55 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:20 +0900
Subject: [PATCH v3 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-2-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=b7GdsrXKjZPd7UPmB5Kvn1MxBtjV4+5gYAk+zH2wXY4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4eruXZckDLUdGk4NCf1DMH3S23NTlWqza05L27d
 j9Mk3l3RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5vo3hv/s5eRZ5xg+sCw0l
 u954X731i2Wfsyj7rWvTHExexWhducDwP2M694nJjgtaZ3hrX35Y2b7FPuB4oXXsynttk8VNEja
 v4wYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EQqXSLrrQyS-VeDZ3ZfGqIzjEo2rpQCTB6ZTrQSwNa0_1765495016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151658_308792_B6945470 
X-CRM114-Status: GOOD (  12.20  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0


