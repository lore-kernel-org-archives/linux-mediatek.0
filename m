Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27FCCCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=; b=r5UjrPGCCzUzERuO3MIIyfqBI5
	BKuC/jlumYnpCqeXV6pCELtGLJ4YkEu7shjdL7g1gG4TdmE5oIl3OIeNZ/Qpf0KCu5L9TCyT0Xrzm
	3BLuRKTQKI++uo5H3Fh4unHl0j2+1COyRzvLIT4/kzcKYDpxURsNtqdNdVoCVhSO+MN7rUT1hzHxA
	um3c1e8F2XG0X25jhp5FANN89SayP2uDfzv5cxe3TcWgaEIibKVXWIJUeXUH3LsP8YHwzTNIL0KLJ
	vj1E9OwEWJ/GZeK/Oy204WeWlG44jezgDCwcxXtyEGDsjMVw1DMYP2/mGg2IDyM06dZ3vOkeXNBw0
	dk5dBOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9Nb-0000000GNDt-15To;
	Thu, 06 Nov 2025 23:26:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NY-0000000GN8B-01WO
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
	b=LfdyMLNPbIMGvOBWJaXAHUUaTu1W1qX4xAyr0C8MhlTN+FaShMSdk1MAl2o54JpDPJAYt0
	GiBrZozAt/auQfIjHWF1nIMTc6RvyK2c5dgXAYaf4zgkEOuSzFQBRrKG+gDtdYofDgh04n
	KcrCwOLJ2VL4pSCpIiOzzcUpeTy4Ah8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-b-4hr0HlM-m8OuqNtRid9g-1; Thu, 06 Nov 2025 18:26:51 -0500
X-MC-Unique: b-4hr0HlM-m8OuqNtRid9g-1
X-Mimecast-MFC-AGG-ID: b-4hr0HlM-m8OuqNtRid9g_1762471611
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8803b5dc9b8so8613536d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471611; x=1763076411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
        b=VcVVTmLGuBJIBkN+D8d5nXt+4hJJecz/wN1Gi8yGKzsY0Gk+eFfAP5tfJcZ39tqErq
         iIB7a107uHVx0D9uxiHR68z7TB2HWxrYm6QXXbMNgb3cmVZF44SR2PTneMISVMWtHr6Z
         FrxCvThNTaXC7ojw/Lf3jZ61hEIjWVcCu6zQMSTSBxqBneF+epIq6kmwXSQjt/0gOclm
         1skjThkAwrIrQtpQmTqdPb6kxQVx0wWp2ZVYPWxttqHYWajWqKj5yYuT8+rkkln2x5CV
         lh5jieH6MUZqK0K5SjhK4SRERt+6v0M2WWZMp8Mo1vbP8D3Cawj9tKeUzQ70Ae/ahmFp
         wPvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0AQpUS2kHjmnifgpCZpTHUcmYTAe0Sj7Duso5sb7JGs0yAU6sBLq9A5YeipMaxo/Q7DykotggNYMIai2+ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh1t+F3C5vEboVPz09uaEZSbzIMS+7GsCQVhogIjJ5bVVmOfNf
	C9LGrt0aAgDUb8dLYJIj2K7n+yUdmqfbUJzcEVod+JMNF8eFCf3k1+02kwGefRf8s+Od4NlaquA
	2EXJSfPzabVZm2jVVmCK6Jhh2ZsxsUOupswtOSpuR9Qfun2S+LFdGsYVg9vJ4cpcwdNY0lRLkOg
	==
X-Gm-Gg: ASbGncsjGs7VGVuShERjJijDR38/qvlaGCsfEtegZUTkaynqcWO2Kgai7KpXs4/LgNi
	ARYlQQgorrI14e/krs73SWq5x3NBFJkbTV+ofAPe3V/cIYNdLW/C0cBlhoJPSlYQ88VYd6uvXYD
	qfSqPzh2BmbiIsK8SPP+NcN4Kkth1TOLsSIgObtr6H+OcI0Rnmb2qQjVYrn/iX+sjIpC9DVrTMX
	8c5r8I/Kz9DBsqq8A5yV6Yu0XPxxFxmvLOFXhHrlcOmRTrmLAPUXwYKe/rJdSTsYwMBhR8YM2Rk
	6cFd8SYl+JOfW/S6EFZ7jSJfhFcE8td2RTtc7cHJIqCnnRwyoyCCWLXCvswi8Xy214FKlYBCXg8
	WZQBORMRjFvwmFtU8SX+i5701y8xUWTqum/MXVws2Zg==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19319206d6.43.1762471611233;
        Thu, 06 Nov 2025 15:26:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSlSEV9dAuqFzCy0/F84dwpJ0FkW0yEvyVdQS2BVlZV8mmVJOC9OLuQQBUQWU2sDVef6rnHw==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19318886d6.43.1762471610821;
        Thu, 06 Nov 2025 15:26:50 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:50 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:50 -0500
Subject: [PATCH v2 RESEND 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-4-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9vVtfY2SWJyaK316COu6cQ1f5v68xmVdCSUMuW44eRI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RYoBp++/m+KnEwCw2Xzg4JMM1sv5LqlTfM8z3Ft1
 oPpKx5c7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiTXqMDOsmKjWITF6W1vcw
 Rsfl37GwV6cmCusab9l/nnfG61Oh2ksY/pdXORfMfrL0V9JrDfar8z4f2SCwtyM0bMnTN+tL1n5
 89IIZAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gXlb0nIrM7wEOUJsQ30If8X-mJdEZCxuMm4nhQ-6RdY_1762471611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152656_173937_805086E6 
X-CRM114-Status: GOOD (  13.73  )
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
2.51.0


