Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F4BCA0EC1
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 22:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Xg8hqI9hY3cckPk/9kc3e4L3WNhIKfJgnhJhXBVxrY=; b=BdQ9RU5PJxthsfd0Klg0ywydJ2
	+AAionUsyjIOPLgU1qIWLS4Odr1O4g5sUiKq1QNulHVGOB+65L6NyrMMszOR25bEDBD3H+vuaWPOp
	l0vGXVYzHGc2/T/e2hmP9jpuvOokPdShLFEgBBgOdjphBQGqfWX7gn72C0WC7I44yc8ZLS+fSluPJ
	CKbKKHAnvEFGMxC1RIOYoir9EAIXDiducBjdmBaSs7A0cC9OCnt+RFqAo2lDTFNvAgVgcSvnPq/nx
	0MMEvHeuxnbsx8Om71+zusqMbn9C6piYhNYDeJLnoEe+lN570u5PHAtvOxLK5sdNr3N2jyXcn+St/
	rOk5vZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulF0Q-000000069T0-0wp4;
	Sun, 10 Aug 2025 22:59:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEo8-0000000686Q-10LY
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Xg8hqI9hY3cckPk/9kc3e4L3WNhIKfJgnhJhXBVxrY=;
	b=JyYM0QKBxDqkCfPEyyQbS3JULEsxpOXcgFRpKK27DDGUnkpLiWCLaD8DKOvTp62PAaGbI5
	NAPIq5WRL5lCBAvJ3ykE80rx5IBCN6USQEMiuMRlEHChZXxvS4IFPqqFK0byJuxRJ3lfjG
	QXhN8xZn7cuuZ0Gr6CqhSMb5Y47McdQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-slucMM9eNdaZFTLp0y2zSw-1; Sun, 10 Aug 2025 18:46:26 -0400
X-MC-Unique: slucMM9eNdaZFTLp0y2zSw-1
X-Mimecast-MFC-AGG-ID: slucMM9eNdaZFTLp0y2zSw_1754865985
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b092c12825so110892081cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865985; x=1755470785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Xg8hqI9hY3cckPk/9kc3e4L3WNhIKfJgnhJhXBVxrY=;
        b=CKtGO9TVXTBnCdN1OZcq4P5QuXFEb1KahUhwjirXeINFSrMNur90BKcI7ehNign376
         rWZP85zpfCqcZDtXoDmegQETP7tf8p4wlk7Kufia8XbxVwiA6cc24nqKRW5a5sikLC5V
         5+YMgF75lOgSS7U6n+yXlscW+Fany8cbLr4gkTK/vUOVDD/YPgujsGSndifA2MRAdIy9
         UMSnRkjAbm+A+aNGm2WNEhh3ofHv0LXyx4C8MUG4sude7K/4uHqQJBomPEyur3jL8nVN
         RfIp3FwvqexaAHIaTeTR6A0LBxosTcWzHAXBJxCZb80F3Aa4gBmllsvrJpHIw/QqrxB1
         ZloQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQsNtpAbYPUQwCTyMhd47Q/fODEwlj7xJjEnLpE0ny5hD5UQyT28XOG5YBN70x0yX5PfmKI4mpwS/gjV9Z5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMl8pXGQjCLerAWfjBDS1FfMDGhsYoB/tyFZgJyW87YD41EQjw
	erBf325DCbEPP9JGTTMHwdJX+14SY2/DoTlbmiM0L1Sg+dmiNGeq1XG9tjkitsmTC/xSplwv98O
	lTjoWwJOhTPD/gyxVO6bfOslB3Pxr8wCoavn2s2zXAmyaY1Oqq63IZ8WgFsfu5CDebZ724wbn7A
	==
X-Gm-Gg: ASbGncvWsvtsGTCbUoCZ/8eKe7uPyVobdLexpLmMe00n7MFYW16noJRGR3kNQNvF0on
	zwRe9AaTgb1+8W3kMIbl8EZ2ut+k0CaL/3nVuDPijHlG+Ic28zXCvEnrOvh+Hy3q4GYmqUfdkKr
	C/qSceGn6Mz9C+HdVSOdvicq45Eprz20C0pYmTbeJmzV0fbwdObiMC/Wqud4MD7B03tmGsETL15
	T1fWMsIOn3er0laP1W/boATWscMnRAmZ7qa7WMqNzPwOwZMxUxsqIQ6UeyLl99rEbGLcUYhzkaE
	S0qNoOt+2eugMeQ4qOAEL1IL0rxIAdHRh8R+E7ztJ33SNzMWQ5BEz0mrjPpMEhZaJWwSRdNacJp
	2seI8WA==
X-Received: by 2002:ac8:570f:0:b0:4b0:85de:483b with SMTP id d75a77b69052e-4b0aed794b6mr191405121cf.50.1754865985409;
        Sun, 10 Aug 2025 15:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlcV+VlJl2BMsCB1be7RUmGpPT7LkQkTuorr8gQ4HxbmtzB9yCp//naKxGcJVwwxqJ9LpWMw==
X-Received: by 2002:ac8:570f:0:b0:4b0:85de:483b with SMTP id d75a77b69052e-4b0aed794b6mr191404891cf.50.1754865985003;
        Sun, 10 Aug 2025 15:46:25 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:32 -0400
Subject: [PATCH v2 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-4-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1601;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zpxjkKUS3Ja5Hl82pWOZy7M8iozPUZUnjje7JplMAuQ=;
 b=TfkcMxwokTO3SFrhfFtRnY/2TB3MjvqVvGnOziGO+YGy6Hi3nXcV6PqOeuN7niocq8BeQPo/w
 8VIsZH9GTQrClIuzbrC8guMQvM6lpDsYvdZ4R19kOLm1cKrdM3gU0VK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOTDfZtJRt0Jgt76LWDKJudoqrqLIsrwZJWBnilZx-M_1754865985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154628_345060_C96BAB77 
X-CRM114-Status: GOOD (  12.60  )
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
2.50.1


