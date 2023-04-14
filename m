Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8D2C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=; b=29od1Y6rt7RIqMgLSTAk3NxbvM
	BrxOTnnfLiLViP5NQVKzLngqxYXthnK/aLwfOffNrZ8KQ0jKPuo3ptxfY5wuypJR1PafKPKDrEHIp
	8n97fGyFj6Jl+SPiBhrKJkwQseQKbebJHybJVDDB8r9x17CInWCg/AYXDZrtSznUobHKnBwyJxtxW
	0Lec1FeM5xZWTUWN604kGpjeCaguOXOWIAqkzWJxyg2CDtUGzdB5qjbrBUuYc95UHkn/iJ2q7fYMk
	tLMfjBA7rHQT4A7qWAmS22LLAZzsBFnK6wdvnvg7jpOQbgUSeehdeINZqU3jqISxPh5/ds6KLdQVb
	v5TTCy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnISJ-009VAy-2F;
	Fri, 14 Apr 2023 12:23:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnISF-009V8d-0O
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 12:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681474980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=;
	b=b/1x6luHPegLm6mZpHK+2Wu7u9um7zXBw4i5l0Nf8vNQ80OtffQ5G+t6Zp6VU1POQVBy0U
	hqVEro3JB2lpnud/yUB+qJ9zELPxDEk2SrvW0v3W9KtAd24y25/KehfumMKH24AN+uS/KG
	mc7xrjy9YUijjMtWCkbsvUiZl145+z8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-8_kA8cGnPjK9Vf1k78Vcpg-1; Fri, 14 Apr 2023 08:22:57 -0400
X-MC-Unique: 8_kA8cGnPjK9Vf1k78Vcpg-1
Received: by mail-qt1-f198.google.com with SMTP id s6-20020ac85cc6000000b003e6372b917dso450594qta.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 05:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681474977; x=1684066977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=;
        b=aek+MV5jXta5lAvEo284GPKM7mBoGHZwQf91FaGEblkry5FKTUwkojB959pwGC/tj/
         XTnjpGmw7LSpj2DQIJyvzJcsoOaInROer1awaGHiaggJFgkNx7a6EgKn/8vFLMqnFZkj
         Xg5sOWyAtNX3/T0Q8qhPm+e3IheVUt5rZgEDumE6Oy8WCZmf04VwEpEY4gMF8W6D1YAa
         1v0umGgwQZ8vyQwr4nVWW4ZH0OFgnTh4AmFpw3fy+liqFeBsySh3zK4o8CN0VjvXGPtw
         Cyo9GUoODpcRyxjR5RRNki8ev+jd/nPSS02B014gkzwvsFZ++BdyMkMIzSD1Kpg7UlAm
         HnYg==
X-Gm-Message-State: AAQBX9dFz+FMSzxSQHyX3s6f1a0Z8KOtjxMqNtwgfmGgQ1AonRZ858hk
	H2akhZ5Z3ybmOLZBShug0R4uaxrU0vHw49rVV8cUzpoS5M7ReFlmiQQEVrmD6hzJInyZQKL9Twt
	8hX1Nr7A+nmvai/sy1IL66DtxORkBNbEe
X-Received: by 2002:ac8:5945:0:b0:3e4:e2fa:66b0 with SMTP id 5-20020ac85945000000b003e4e2fa66b0mr7771664qtz.29.1681474977171;
        Fri, 14 Apr 2023 05:22:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrFNjLa1K+ogArho3OQ0SXUeh36MSY9HRSMAimwdY9UWoY7qElQIx2CPz+MS7Z6iLrkNomrA==
X-Received: by 2002:ac8:5945:0:b0:3e4:e2fa:66b0 with SMTP id 5-20020ac85945000000b003e4e2fa66b0mr7771633qtz.29.1681474976909;
        Fri, 14 Apr 2023 05:22:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r4-20020ac85e84000000b003e302c1f498sm1193420qtx.37.2023.04.14.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 05:22:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] phy: mediatek: fix returning garbage
Date: Fri, 14 Apr 2023 08:22:53 -0400
Message-Id: <20230414122253.3171524-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_052303_242389_6A04BD25 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

clang reports
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
  'ret' is uninitialized when used here [-Werror,-Wuninitialized]
        if (ret)
            ^~~
ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.

Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..c63294e451d6 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
-			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
-			    txposdiv, digital_div);
+	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
+				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
+				  txposdiv, digital_div);
 	if (ret)
 		return -EINVAL;
 
-- 
2.27.0


