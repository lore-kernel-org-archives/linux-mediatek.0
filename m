Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6JvtNyBkau6SwbpY8CY5Q2YNmlCu8qfSEmwNfv/YEE=; b=frkBRXg7iaZDFU
	efBGCI3JnjUc7WIvbcsEGPE3dCrULjlAEVwW4mJmu4bkdR6Rpb5u5xJ3wGQKkhUstLzswNS4La2Yg
	AeOVcS5IJ+z57S5bCg6nnSY23lwBlEQcILjkYuTKBkHvccokCYBgufZOk+r998Hdr72YS34cHBW3q
	2CfhDVbiAUthS4o5WyDZSBl+vLF5/qoFOqxkYSme5pRIg/Ae1dIYoJZEFzPk4gSRlKyFqbXhki70Z
	UZFzGDiFIQatuA7eEBP6RF4HvgQaQ5OJQGGtd3X5fFilamwl0OxUCz2MX1rxiJoxc9kEet8r3zygj
	iUAl/LJtuZMzZCp+FLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngizO-002DoS-OQ; Tue, 19 Apr 2022 08:13:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngizB-002Dkh-Iu
 for linux-mediatek@bombadil.infradead.org; Tue, 19 Apr 2022 08:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Weku3tK3QsQmvTCERbGIwfFGvzqht9p9BZS1XmEvotY=; b=gSTEArgL+XYyl1uBiRlxu/zdZO
 xGuH3JQZiljFxVwp16/kaH6nK6uaWQec+iC6tC+NdZ5oFUXBoGCls0UwVML7GcV9kqnarvzcS3nkV
 /3nxjnw49rjIcgAvy4Qe19CVJPs1xsT8PDNQ8PigeUqM1zs9fjftobyFQaNoGcyIBeEFBt6jTpYfT
 1hnpSLw5YWop8Sl0qTPPHWWzKyWuJT/kloriNtYa/YpintSi/GAiwx6EWUzcgfqwx1gW/5ck6XU6s
 yOYwyfbFX/sk9BR2Y8IatTQub6mdaRzND4N9763TVfMiyGXbs8gP/qNBnsvIRoAMCZctWM4H8ACb4
 An4xkIQg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiz7-006l8m-J8
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 08:13:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id s17so3851652plg.9
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Weku3tK3QsQmvTCERbGIwfFGvzqht9p9BZS1XmEvotY=;
 b=iRJI5ml7K6kAK/onoLxDchA/ArVyOYamxU90RxXYOx6Pzg5aap3PFpRYnG/cbfGJd6
 /8vrlTiPABYe8GgWO2TOGciYVdjVpO0SLmFzLsJr3BBnNqQEkPxM1VOG9DPREEwn/MrS
 O3LSWUbVGUtObFi/zzy3ca9FJZ+wGXv0Cvj08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Weku3tK3QsQmvTCERbGIwfFGvzqht9p9BZS1XmEvotY=;
 b=QLNCnb9gqJOvBAtLgfRECbsPd7Ouk/ToYZSZ4hlYA/RWP5xV4AASK0koZBuB6ul42e
 /+glwPn+tKQqUYbq3H7qMEQuWH0poMldXg5/50rDCCXIkFVEczoCzJyMHg7PGrsI4pLS
 wnTU/JPNm9AUYINpGJYcrVyE+1V6GhMrd7+j+n4hbzfwlNvA2MsBof1NBmf0Kz/Fxu5m
 gaktaC9PSWQxUoT7c09szKYUf4g1ejzt9Tl4eFt8UjIrqbBKdjn2Vo8Hd4l7Ht/FuuNV
 78Kuzkzd8DbOhKOIgp+68O63lDJVctyrdWTbnGAJEmLKKH3SUphWvgpEsFtitIANhH7W
 hp0w==
X-Gm-Message-State: AOAM532R6pMbfzMxNmAaoMTflvCpftQ06E879CcHQF3bpQcYB/nEYLY+
 f5G0llc/LvpYbZ3mVxR0djv68SNVdAMCxg==
X-Google-Smtp-Source: ABdhPJy2WKrXlaqCJkZtZm2wuCrjHhcU/3L6VkQg+6FopUOE3aGjPtuoWuBKFt+ExdfC73sGUt8/vg==
X-Received: by 2002:a17:902:e74f:b0:158:e890:2ed4 with SMTP id
 p15-20020a170902e74f00b00158e8902ed4mr14598622plf.32.1650355993497; 
 Tue, 19 Apr 2022 01:13:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:13:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/7] clk: mediatek: mt8173: Fix usage of
 mtk_clk_register_ref2usb_tx()
Date: Tue, 19 Apr 2022 16:12:45 +0800
Message-Id: <20220419081246.2546159-7-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_091318_176027_B7890C7F 
X-CRM114-Status: GOOD (  17.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

The apmixed clk library contains one special clk type that doesn't fit
any of the generic clk types. This type is currently used only on the
MT8173 SoC. The code for this clk type was converted by the coccinelle
script from the previous patch, but the call site was not.

Fix the return variable type for mtk_clk_register_ref2usb_tx() in the
MT8173 clk driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 511b4da9e727..68d3a9749316 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -993,6 +993,7 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 {
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
+	struct clk_hw *hw;
 	struct clk *clk;
 	int r, i;
 
@@ -1013,16 +1014,13 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	for (i = 0; i < ARRAY_SIZE(apmixed_usb); i++) {
 		const struct mtk_clk_usb *cku = &apmixed_usb[i];
 
-		clk = mtk_clk_register_ref2usb_tx(cku->name, cku->parent,
-					base + cku->reg_ofs);
-
-		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n", cku->name,
-					PTR_ERR(clk));
+		hw = mtk_clk_register_ref2usb_tx(cku->name, cku->parent, base + cku->reg_ofs);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n", cku->name, PTR_ERR(hw));
 			continue;
 		}
 
-		clk_data->hws[cku->id] = __clk_get_hw(clk);
+		clk_data->hws[cku->id] = hw;
 	}
 
 	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
