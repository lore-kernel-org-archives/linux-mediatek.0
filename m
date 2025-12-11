Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7612D43361
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=; b=Fdw9+0cuqT9e0VdnifUGrSYd/G
	VCgIJrvWtal7vUJq+4cYbOPC4zqTI5Pq3s+AmuQGnX9f14UkZSjG8kHAzHPY6d6tOLb0Lyf0yXMRa
	qb9QZ158iYJinj/HD2CX5rUW52FTcpBopEeJ4qvqTagDxWH2eqyxHCmb7dmWmoDb7JuMLKyrhyIyJ
	pn3JaDAcelj8upSMzOLlg2MU5pCEaZbEv1F7velLNVTMlB3qj5AfFCsjuE/m609czy8Py3RRKTS0d
	BRZTwCQroVX6Tg575nDXZUQ7OMgE3CioxeY2JW5gk0x4BaVecKj7AHmoulhXJF5wZ5Ve2DF4/oYn1
	Tu79/4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuU-0000000HOtf-3fss;
	Thu, 11 Dec 2025 23:17:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuR-0000000HOoq-35hU
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
	b=UE7T4vvd4jnngGbwNuAxSpw2up4+Rbh0NRtdnvSDt2wbzWenEKwwJo0LXlf2V/529q4zq/
	Iv+89Qu41dBXEbj5aIw1+P0mPURJ6wOj0owV9xvFiKAoLII2n4ySYa+rRA/NmYYLKM971R
	JCBtWhlXbOx3ekYv5YkS+RzRW0Bb34o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-q5YJPHIVOoydjqpOBGSAtg-1; Thu, 11 Dec 2025 18:17:18 -0500
X-MC-Unique: q5YJPHIVOoydjqpOBGSAtg-1
X-Mimecast-MFC-AGG-ID: q5YJPHIVOoydjqpOBGSAtg_1765495037
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so105132485a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495037; x=1766099837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
        b=fDded160YBQCNPh35I5I6Vd/qoAlQ3FK2N26iLGStefS/rVoVIUzAHq3T/GpR0S9wo
         4/hiPa+/naWNwPoSG7daMnpzMEGz8N/GGdHKQyyECQklHRyZlul1QCGAwiv5PcuLnkKQ
         JmU79o7fer6qfb0TweS1THSMjwlNQ0r6DP5747lUT2H3luNye3aYnR44KrPywayxzQvt
         BSGX8wPA4Ecn1fTZBentP93jPzh14SyVyajeLDXs4OOI8KbZG4QkMs/nTs0ZeUGy8GKg
         3dkYuFk8CR+mE63hLp4OBsiIMBvDc3tqXoIbGzL/6LFLP7DORFkH4LwvgXE0O1jOCzxA
         AtLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy95ny+N94fhpxvkeu4jyX2LlbzrwpG7K9oxQMId8itj1+lVFgohap3WhSWxMcbT/+cvF/AATPHlaYSQgSdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6qO9nQxB9g6M2dRWyf1ozEu6ww9ismaFlqXxSlbCsKpF+oZN2
	2vbfMgH9dc+D7OcAmSyb08mdqcm77drZ42x5QWfddFX8kjjK2GM5DUNlc4iszyr+U8ryGPAczlO
	xFuWGsnu2vdj/k069jXxgyabIjLb3qyiOjtD9z6Egahnk3G5w6bmEnCV9f/GUWRBs3f4ei142hA
	==
X-Gm-Gg: AY/fxX6nLc1msuo5+vvC1VVvPOiVFSTJIy7XJM6Q9Cr+4Xs0w/H/l/hXEDKumhI0Qfe
	HDg0Ueiabtv83dj55+YCBgC4hjabP+d6zgPsKuDKo4YAChe0kEnP/4xPrGGPdEGMN5RCkTNs/+n
	8lLevpuag+PFVBGcBMnkrWWbvqeYubQiJPZ+IHD4A0URLlkOA6cczDVC6I3IBSWekbL3anqrROP
	N0ClHS57D3csmaNXrVZIm5uDbEuH+lUU0A6Qm0xUY4rH8RA2g+niLBIjoIKqDJPjWX7+0MUzRSe
	/bg8WAjpcQQXmtKvumrPuviHKqqAct8MrV7KiCzcbogfnoY0q5oIW49BCNUmzOMMEsCl63MMtQv
	qLihFmvrrF5X7mAsLnH8AYyhHvfA668fJYv6TZkICgdVCP0PSr6V3SQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id af79cd13be357-8bb3a248c9cmr37436485a.52.1765495037250;
        Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb7AhIjE8zPjDhJfU8aDdJaYDnutBjCMxlmV9mYKDpi24B9muU+pgkYMBUg4HwaDmRYFGfZQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id af79cd13be357-8bb3a248c9cmr37431985a.52.1765495036753;
        Thu, 11 Dec 2025 15:17:16 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:23 +0900
Subject: [PATCH v3 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-5-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vrNhEauHRQ5KoNoMMi9AesnXBPWl/Gp5yOh2A0W6gms=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4JBrssMboevWX54tAvj//eOnz+u+ekf63rRB59E
 46P+ym1raOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ7JRhZHhdsj5E7aTq9jcO
 T97sYPf+/rX4c86W8toYzZ7TW7mNTd4zMqwJ9ZdIXKvRpntlr1TQhxi7aRs/WWw1fXTt7j6W+l6
 mubwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k7wjFp0kV5H_e111xc3DH-xoFbmuwRh02uIXRBgRZ18_1765495037
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151719_847218_3DDCC2EA 
X-CRM114-Status: GOOD (  11.78  )
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 673cb0f08959e0e4f2b1ade2ebaf796e8b76f8bc..438ff3605d90121b7bfe02b3ddca8194437ed9ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -237,16 +237,18 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 50000000, 1250000000);
+	req->rate = clamp_val(req->rate, 50000000, 1250000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.prepare = mtk_mipi_tx_pll_prepare,
 	.unprepare = mtk_mipi_tx_pll_unprepare,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.52.0


