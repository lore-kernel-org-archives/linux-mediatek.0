Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C91D4335E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=; b=JfyekKVT3WWIQVC/94WVRe/m/I
	8t5hmkk3kK0hPXu2lDkaFU0YLM6QgzQZwis6gziTk4c8ebtc8lttwnwXe3LFr/ChjX2WJEXm/YI94
	/cr+lpvNi6VCL94IBmYsmc9vx+gaZ9uHVypQWKwQj9FHc2lh7YlUdaBh8p4YsMRIiyhOIwKYAan7v
	jG5pDYbOrKb48VnWx+BBa5GC/l4sn7uCxtDYFzdIfPTrN0sHAOCmkUOGYcfXV9Gls5jpZJeHOjFhV
	SwDQHpT3nqwzfPl2KgJ7uR7+9e88fY5ipmscmIgHvUKJ2n77lh1zf514VZ5nObudeY5vzm7ZjEo00
	8JpgRlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuR-0000000HOot-0fdF;
	Thu, 11 Dec 2025 23:17:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuN-0000000HOja-2WWJ
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
	b=M/xHZLp9rqFV2BWOyLYg+4egi6ydkqcI3HnyKm858iNzzoBG8BnizlX4KPMkYIT410PWa7
	e7e92MLAy05AielEkcKpNh1xJwK42L/x/eh3WF18du4JUMqVMxhX9Mgu9ppH386/gJDXyA
	xgwO7BIkoDJVoLygizIuhffPjhXu4r4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-fUpfleNKNu2Bt_2nh3CRKA-1; Thu, 11 Dec 2025 18:17:11 -0500
X-MC-Unique: fUpfleNKNu2Bt_2nh3CRKA-1
X-Mimecast-MFC-AGG-ID: fUpfleNKNu2Bt_2nh3CRKA_1765495031
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so178000585a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495031; x=1766099831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
        b=Xd5atPPnc4IluPdcCa1jSFgaVVTIrQpjFvDujFHWoOgXO5+/R0tsG/D7z/8W6LkWvl
         KPmO6+e7Qh+pUdiZCV6Fter6QHE7CJhaP2GK5f4nvSIv5JxdtCzcARHu1ygojSLupxTC
         mtT1R80g8PrbW9LgMsmGC3Oavvhzh/VHlZ+xGa8emFDpPtBbP59rpaydDrXOTdSA1Szy
         fdrKNxWs5EsTuGwjwIZJ8haOGLSlRQdEY/GN1bxZixzyGggl38AKkD6EVTFHrlUZhyFa
         zmXmV7GNdFJ3DhPfLkfpN0eVqG+5G5Tvlw+NZtciGaSB/kAw2hURUz4vWc1ewjO8UyQv
         r9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXiwe8puGPvz+W7qYWaPeibFfrW9Vwi4gCtrqkl9qxsRnlGY1e8t+0E5sMGTXCVIh1evhP89DHIURuZlBqjiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8JzhebrcLf80DkODZoWRcZdkUw29e3MoaNM3DVVioX2XlqjXG
	uklAo373hi8sF7R5NUMTpDhutiGeu0kxaHe6Je8ezh4sH5oULfiO3Ug0LeZxZSWaoh6w96m3ZPM
	99awn5htTajpZNHgfjbYJabRnTDUaCm9mj6xgYH5IJHUDdlG7xvE5MDQV9GTpwV+6TPEEaReZMQ
	==
X-Gm-Gg: AY/fxX6Y2+ocNAdG2CJfKrXFGs+z9D3TYwz/YbjQu/0Ofi7ZIZJiCQRYEZzb0LJZQp0
	CmtCCOgODEWSNiJelk5w3qT0AADv2FeX2C/SzSQ/K5q0ZLtIn2wiDJe4SWTM+ifas5ppbfgFh8+
	hrElWCDalN7IXHje+ClrlJ6A7B4w6OmrIsGjO0UyxfDAxloB6lxuWvemqSrfVo/DScdoyCg5m6L
	pE3wjGeynbD40Hr1e1vX624LCGgE4dKJ2gZ14F75Yqw3h0MHYe7q8JQJarA5MtfAzDJPAGA2qBq
	ncNxIsTD9lklbLtiWGIrKY1KRi1ZytlrirfraeNOJTLmr+9/mf153aWgiK9djD9UzkMHDG75xMN
	tqzKp8iifq1L+OiHXEurgowGPySPEoowNm9riUbxY7Hz0+v7rXLvG2w==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8bb3a39c0d7mr37228485a.82.1765495030838;
        Thu, 11 Dec 2025 15:17:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOzc1K0inF9u8pzCleS8AGBiFhiCFwZWvQwaIqfiguX4BE2rhrbkOrS1UeTFCK9BaNhdqc/Q==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8bb3a39c0d7mr37223585a.82.1765495030371;
        Thu, 11 Dec 2025 15:17:10 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:09 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:22 +0900
Subject: [PATCH v3 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-4-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9Rby/gTtrwRqsiL8QVGL8ZbeE5p6/9ylnJs1vpPUAak=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5NFQ+IipFUK78RHpdWFHDi1cVcbxE26yeXHc6Vh
 O+zE1XtKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJ+VQz/K3VcuHa+5pQqd10Y
 WTnjKhPnpr8+1w5c0w2UTf/PFv5UheGfooXXh12n7AWuedZrRn37XS3jEh45cYbfFtUtZt8rQzp
 5AQ==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PAcadHiz55LtzMNvFH7LdEBVkSZvJj5SzJHtgueIoUA_1765495031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151715_734444_49A0751C 
X-CRM114-Status: GOOD (  12.98  )
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

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0


