Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F423C83F22
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=; b=UYE+WUm3wWJHSoRq/UJBCJTpJi
	b4Z8gYklgHYhgFs23Tcs7ti/ifXSOVNvskmXkTrXeR13giDpO474T5ixrQq/ixcX+d0Q/jImei8Mg
	QvmMM92aaaEniCwZEz2UuXVZ5h2A9ZI98+ZWf9SwiQUrFSkxILI9RQJAyMdz11krYHQB7FaLYOMYb
	W1dnoMpQB6FprHJ7BTG9RNko22ZM+F8GITuOjsA6Io7kEyVSwR+YFEdBjx8OQT8+noqjkQ1X/o+aQ
	+EWBVAov0znXw7A075BUTpFlIcXKSTlW9larwF/RRXTuS53wjSoq3n29sm3QDzVLhDjVmQ5D13UCB
	WRPwK0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw12-0000000Chzp-2NZa;
	Thu, 10 Jul 2025 18:29:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtqH-0000000CMdW-23OD
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
	b=P/1l0pYHHSmaVDbueDWOUNlEWimszBC1o4VPHzIAHP+TtJmFZwElYeOs8znfYVHOGyFi/M
	QQOaJUFd38tdEA5XzrB2vl9a5c+L02tJI9au8FbI4GGZSeTqGz1rzlVnDV8LFhsS9MKX1f
	5Js9eQObGNWMvbm8gZgRUHVrLEMkZKo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-Ni0BY7zaPGeaZ9SXgCabQg-1; Thu, 10 Jul 2025 12:08:21 -0400
X-MC-Unique: Ni0BY7zaPGeaZ9SXgCabQg-1
X-Mimecast-MFC-AGG-ID: Ni0BY7zaPGeaZ9SXgCabQg_1752163701
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so394810085a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163701; x=1752768501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
        b=TIZ5dpFsCpwTVDnLvV8lCzqTuwzXcDASgLNoAL1kiFVtnNVirxSdAIahy2H+8+9+uU
         UBoPFFhpRZx/g4O3uX/6x4csCo+YBMTkUQCTbpfpjbOPwDIWQw9oKhLtrwsV90AImC1r
         zHoa6gEuuL0YsuJp+FOXcNhBB7PiGHu7GTRoZci5QkB7Q1QszYTeUjUoNIw7oF+OJ1d1
         l2pQCq9AGKIrpzDnAcYHsR6SVBmeGoTOSS/OLAN7FoD645hB79WQYjHFkI/JzowGjeap
         4NHbefbkgyWLDKKp8Wruc9GabIXpnmPT6RuYauLx7GX+lejJSp+KQf3149bvj1RNHFPy
         lsKw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Y6GCQn8FGJUCGvLaczjK8ld4se8LOYnFwuR+lRgt22z2BOdBJz/T/xBVCHemS43ueAjNl/obZTKkht5KYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkXXVAk6zpgNjSLaHhCW/8Gi3gHebE+pSl03o2SfoEW/EYnpoz
	WuulvlaScbtpk46p9MCZ7ncV4Xx9a4f6kKeHrgOb/TX89BhrAV++AQ4kuD14w3KyUVe4gR72U1G
	pJFx3KbRmxAnQVRcjccRWot1Gc4hafjSt+CDse0miWBOy/5textdgoOllmWACFsq2TPVfFHSplQ
	==
X-Gm-Gg: ASbGnctXHhDWPksnMh0meV8oD1/jQloaIcxWsGz9uRY3iOMyikdrd8h4mbovZ9EdLwr
	gKtiNqY7ik+LERSF4mlibRE0WcVg1gSHTzeeZfUGWMX6hQAVD5CTFhdbRVcfBzlNyXGZbzm/32c
	pApsDSaVc+pC+odAHguXKAJ0DrziemDxSTWwAPh/oMwV4vjN8IWwApPouiIv/keIkb6qZE4E7A3
	lZmGcw4QhO/yNlRjbECIGPhCWvpBXs20wSqt8mEw8AW8ycKu5rm7tZTuD9flhEXlMHpB70LUlkm
	fAgJKBwarnCc5G9qkScPvMaseWAnPMtuYIvK5ZTKFPeTPeqXU9bhOZbuBtqQ
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id 6a1803df08f44-70495a595bamr70247646d6.7.1752163701095;
        Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDRrDKWwpckJ37fdbyhC+PMLfUgyhQZCTV67/zNoDsc5Ut1ZyXEkNXO6Agbo3M33HxjAj7/A==
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id 6a1803df08f44-70495a595bamr70246876d6.7.1752163700571;
        Thu, 10 Jul 2025 09:08:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:15 -0400
Subject: [PATCH 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-5-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1519;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Sp7TBqvADBjUTdYv865HJDuwxPugQD7l6ebJ7mJAKsk=;
 b=QdRXZy3WXcCDAKY+nITPfzBZtQ8RpvdKNlvOltT6ZNVcwHEAkVhWAcnk2UBWK7KubiIjAaW2b
 RaP8yKzs4UnCzedb/XCmTGOR6M6qboXHNuqR38QkPjLse9NBJ4Rx33V
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ei6ZJDwqrB9B4DadwQ3f6nwXPGzQ_9IPla_AeXYHR1Q_1752163701
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090949_595936_65CFBCC4 
X-CRM114-Status: GOOD (  12.11  )
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
2.50.0


