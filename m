Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7113AC83F21
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=; b=MJANWSGEw76nnlKvhYzWKDvQiE
	L+dJQhKNf6kKGBHZd8rC7xV5FLTGFoSJgETfphEY8luPQa3Ha1xZCMf75y6UmBgpUi+Q4XvZjh/Td
	CRPYFA8ACscritTfgy1Ro5k06pnIgB8F896TCtkmtrWqhGeTH/h7/O70wfeV0d9DwUS+S5JY1nAbN
	VUcZy3HzyiHphIo5zfmsDl/px7ZNzEiSpRjZHDLfKxdtAOuqOUQVmsMNgbXQ5+lym2mvoXwtlQOK0
	6K0i78l3zZeSJ5OkgtP+82chRZ+trDRoVAgFeXJtj2E8YDK6OcqE/4+oBp5OeLv6WeztJ12JX1Bvu
	LD1geuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw0K-0000000Chdl-1ohI;
	Thu, 10 Jul 2025 18:28:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZton-0000000CMFr-0gNw
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
	b=SOtdK6Jodrc0izsDSfbemrFQ72XmT6Ba0N6mf3UUx271MndUu24d3YIvQIXpVaArokZvRq
	QvN52Sg4o5BmG0i/b355DG0UjxWFB+pxbMwO75r/W6KXU4Xw45iAxbfQ0jkVWD97Kp1VH/
	8WoQsseG5cnyUSHJJ6InJLED9d4mGj8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-g7BmrwuIN9eFEwRDaO2JMg-1; Thu, 10 Jul 2025 12:08:15 -0400
X-MC-Unique: g7BmrwuIN9eFEwRDaO2JMg-1
X-Mimecast-MFC-AGG-ID: g7BmrwuIN9eFEwRDaO2JMg_1752163695
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d5077ef51bso171503185a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163695; x=1752768495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
        b=oqqx+tNmSMl2jU79ypq4DhvhqxnsrZbswSk1V28l9OhlzhaBxWYd6X1O1oLYBJu13y
         Qi20ioDvsGY5nuk2ZxmZA9HWhqnwPY17mIYeC+qRypOqLQ1pfHzuHWRTo9hWz4ZTp9DU
         2PMJXP1XEh61MN0yDbe9rCCnaq3g2+Y2WCRCNKCQntGk14kZSJgWdqTkD1Iv3DmAYT/X
         JL+Q5Lvev2kZwEoDCcmw+NO4SnQdsi9N+SvFy0+Pu5CBP8r6Gqo2xBQt8ZYpPIMl/TpN
         luUCRg1lTGp7PzlPXwOGShrdGociq7TEk6CQ1nmJ4G1HS4V/r0wV9N8vRXaHTSUsxzJQ
         2Oyw==
X-Forwarded-Encrypted: i=1; AJvYcCVH/qNG8h8zPXWQmyMHKDETc2vuIlugjsFbpe2S9S02WHU7phj8GsHm+IpyjGmQ8sxLrPQjZCYM8Fi85FUL4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC1oabTaScpzSei6gTLLcDYi2ctOzQ41Ba9lieIjjjqwQim6Il
	mDU42sdlk6m76NiA3m183Z5jsis2pGB3tDzPgCmrw9L9mQeeLg7dgT4HH+PgrlnKkFCskz+F7y5
	eFIcHsreEZK2KHJUOExjcdtWUnc4bpeXS68ia5kUpiRTr0jUhThz6kEX9ARPc0+EN8RKAOAausA
	==
X-Gm-Gg: ASbGncuDeQ2v7RwmyQJEIgHRsOI9LzrsUnS3bGWwv1ltlWAcfECvF1ULLrVCW6WMeWf
	gbXKr7srXCyHHXcj/6ld+wLLTBiozuZn3rSwNC+XovIDHjbOjsc/jxfzoob3Mw3j/oqjM3N6+le
	qu4bnWG0MJPP9v5VatUzryYRfSrJPxts/auUAG6mUbDjwB3iL1I4TcIXANtTs0xanIFWMVRZ7xx
	dQf6usW1AXUhghtgKN+tpXZYsb5oRFLNS507wzCKe+d5cLeNpw6KIFhotxkYpPvDKl+LBs3eqk5
	D8+qkQcLbhoQj8l0eW3lCUFeCI+1kKWHC+flMU1DLde0xM9IZuEwU34/59qS
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id 6a1803df08f44-7048b79dbe8mr93046456d6.0.1752163694057;
        Thu, 10 Jul 2025 09:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEInLStwo1lDSg7F85FMOE58AhksEafUcDFpNGGZphskAtBc03MrN1OcVT08c+bAzB2AxSVXQ==
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id 6a1803df08f44-7048b79dbe8mr93045996d6.0.1752163693579;
        Thu, 10 Jul 2025 09:08:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:12 -0400
Subject: [PATCH 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-2-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1429;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iJAJsOBdjX5yU2h75u6+b08f3YAfQGGv0k5DSS+fdqc=;
 b=gM9Vog/PjfK+PD7kK6yqe+FHMUUn8OmRYlp0k9f9lt5ka6hie/ovQ2orPiYAUbVKPreNvVHLO
 BW8lUYOkRwPB/LUPMWdxoK3stAq+kbRSdWnBg6NGEyKUO9GNQDXxSDY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 48Yl6B6mTcJaFQlVy_Le1qDwnOQokmEMwEJ5BbiVN20_1752163695
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090817_264173_1972C130 
X-CRM114-Status: GOOD (  12.33  )
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
2.50.0


