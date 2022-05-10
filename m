Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB58C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0oFDKM3xrgtTBnt8SkUufglIPLc+K8b6tr8FUrwUGM=; b=LZredGbftWoQh+
	GfgsVbGE81YzEk8fwtRb/vEni7m/+xgvJMV2OSTLvibkfjWiNrJaMLYq72vNLesUxdrIAzc/O3SMa
	NQfN+0fyeYkTVTv3REd7BokpHSzTYPul2Fcpf0jW1oMSWgHqEGX5e4HnrJe7Kr5C1hfY7Xej1fXRz
	BH91ah+YDmM6G+ZFK5/wRPteS/PipOW35q6Ygk/anbCToWmdmiavJ6EvF8QghGdwOumHMhJyT/i6T
	7Rpz6MkLiTDwZyJ4IFD5dOi8CYPwNHst1GdTiy63ckVTOZV0DskXipn8VOLWjcXn8nL9BICAAOxB5
	NtvuCu85WgrWER6VZ1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noO31-001YnU-A2; Tue, 10 May 2022 11:28:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noO2L-001YRL-RD
 for linux-mediatek@bombadil.infradead.org; Tue, 10 May 2022 11:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=a1FdjvAvBabmLm4piyf37Hjo9sFlsoGQgqNCW+UhIAU=; b=KXe1nL7qfDtvxIx5NFmydtaunY
 EvbuJVQld+Eg3tkYhVDuMeXP3ar23r5RdMKjYHbTuGYHasLYSk8+tDXNvFOgvANWG2hqDChWWiwbv
 qdCagsuZJzvW4gHYMEclbkqCjqkGngoD4t38QxetNwCBv7wswPsrJyOVpEpzYZcMn9SX0vYXJFrB5
 YHrwPO23JLxLzaq61nNp2ropLp4EyY9R5cdlEJh6qplO/nsUvb6xuPQhnzcRBK6Zq6gQ+Uaw3Ek9K
 0CYw2DIQeX5SD571F/N2ld+KTi/KN8+DljaXowPzEcRbSqA2Sg41mu8wy/OSR1SIWOBN18CPKAD5F
 2M8v3dnA==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNQ0-00CouH-KN
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:48:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id i24so14602599pfa.7
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a1FdjvAvBabmLm4piyf37Hjo9sFlsoGQgqNCW+UhIAU=;
 b=ZZiV8FDh2493+GOlLnM7AZV/ZfAixCm4kzvDQ1nO/IODoCr4uGB1REYq3dCvCCoueB
 v+z6rjTTcoU+PfM7KZLpjbvUy/9Leb07mDEpaqkxxR9K+Iig89VNPPYI9/RhCyVb23rZ
 UL8+bSzulghk0/90WI7aFZh9Fo5N0C4xCsLDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a1FdjvAvBabmLm4piyf37Hjo9sFlsoGQgqNCW+UhIAU=;
 b=CfLWC42yS0YP8JrJKvvOPfpr7gv7nTwraXJNatdhHbPuKSk3t92/j1J2OzWi/3RD3v
 gOvjunlvHwlhmaZe127Ddt7PBLNG6Ka9RVKtgbkX293wYuRlXEbcR4Vh9AnekG3gDazy
 SOYWQs1UUQKJaTURvZVCXkPWWAqApS2NwnBfXvC/hmYdLpXwNPJBKo3BjYJjkeZv37Q7
 InBsHjX6LK9MjYnbC3F1pNMw4ARW/ahgxAH31dC6DZORRYvhOOs1q8saP1gBefvbmsqw
 xZXk+D6DqCcd0FRyJx8vQRW96XNLGGgikG6aotsuh8H53Dgu0l9qO/ua02RZOmoQPaLF
 hIwQ==
X-Gm-Message-State: AOAM532uasUBfXbCU2ggeSfkSGD8DqXI16yVRFpS+WKdb2jlvIFBCpR1
 yDOHsOublFwfqDZbxfrObB+IzXwgg3AsmA==
X-Google-Smtp-Source: ABdhPJxKnqA7t1z+oo+oIn6NpFLqC9befrDq1r+7XtICHqRZ8wiJKs4Wd8gpOGmFIl6MrBte/wNZsA==
X-Received: by 2002:a05:6a00:228c:b0:50e:17ba:9f84 with SMTP id
 f12-20020a056a00228c00b0050e17ba9f84mr19695444pfe.62.1652179717922; 
 Tue, 10 May 2022 03:48:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:48:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] clk: mediatek: mt8173: Switch to clk_hw provider APIs
Date: Tue, 10 May 2022 18:48:04 +0800
Message-Id: <20220510104804.544597-12-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_114841_481462_72E2C3E5 
X-CRM114-Status: GOOD (  14.55  )
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

The MT8173 clk driver has one clk that is registered directly with the
clk provider APIs, instead of going through the MediaTek clk library.

Switch this instance to use the clk_hw provider API.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 68d3a9749316..d34b248c42ca 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -994,7 +994,6 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *clk;
 	int r, i;
 
 	base = of_iomap(node, 0);
@@ -1023,10 +1022,10 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 		clk_data->hws[cku->id] = hw;
 	}
 
-	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-				   base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
-				   NULL);
-	clk_data->hws[CLK_APMIXED_HDMI_REF] = __clk_get_hw(clk);
+	hw = clk_hw_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
+				     base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
+				     NULL);
+	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
