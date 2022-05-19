Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B069EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vx4dkketo7ZIiE7gPfUd2GLxi9f7zhZoS2/aKpRplA=; b=AqbvPo+XQmKyPw
	RxFZZZlyN+m9ukFu1bUG1HlPMR75aGLtkeeJnj6bDyZnNFBm/BNVqGGuSNvb+0nl8GhfYUEJR0UMX
	tDuWK2bysMOB+FsukFlsg+xiSJftWf2TaLeL9wIaT85JMLh1AVwv/3E7IVqeTKl3UUDLXFd4Ieuwe
	JWmhhiF2O+ZbtsgG1eWpP4dRqFvR0yo9w7A4b72AgtdhPCJhMrxxs0/TCM/RxJt/Ph5uaK/Imz1g/
	bLdKFnCrWD52KFPgCgIMULcRbmacxNN4VQY9GhClWi6BIbLyrk/kIXa91usmfZZql1YxurtlZuU1H
	04x8eHsc2JbMTbuPyZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nraQA-005U96-TZ; Thu, 19 May 2022 07:18:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nraOz-005TQf-9o
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:16:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y199so4363345pfb.9
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Lobr1vMx7rDaM5B+yUv81HVaD1u4SedAKGtA+u9eB0=;
 b=iR0EAiANHpgr6qqiXvJm8TqFB+PzivUbHjXAByQCTPk+RQfY2cGvzwMkoow9PlOcVW
 463hMSQao/hqbeQ1WB96f4CaYMV456vxf+1BjGIhP8k0GXT6Ub2Ja0amLXUK0yIltbmh
 qmBeFKkgPHy4W0AOQwgYpcRgI7ZdFfaaZXEF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Lobr1vMx7rDaM5B+yUv81HVaD1u4SedAKGtA+u9eB0=;
 b=aKOf3uVhZxlg7lfHrpToPjCEqJfzTNjmkkNHjyxygBLtDcLw5VdIb51JKeK0SkT/tQ
 wIIJKHeRTFDQAkj5Mlwa/OSLyP4RJOSDGaTKXH/QhSPjLMETTQARZVey+gkTrn4DDp2b
 ILnXZjEtNHM58AyudpSg8A5aOC+wISn7+bRUnztiS9+Qkns9GRSsZyktR3Lemj7E9kDL
 qMTr20ecT4vBljMGyOZkIAb3/z8geFdIOXP9/N9CCoTExVRY1EY9+s7KdhgKfgBM7bWV
 +jWS8OrRTatCndVHThX2cwBmhBWjd02mQaEdMX4bs2XFlBzm47ESb+reKWjtfbUxIGZl
 4FQQ==
X-Gm-Message-State: AOAM530IrPzRrGAv3Znu672cM1qQGfs+mpnlnJNG6X9dYvMYOWZSCi1E
 HO26PqNR1rOmVkdq0LxdU6gojw==
X-Google-Smtp-Source: ABdhPJylSUfb3Z55yfaTqVg3bRO6QxvkbPPkHOaMcXrMUTD5T6cI7rFyVdO46NS5CA47zzipp9of8g==
X-Received: by 2002:a63:381e:0:b0:3c6:d5e4:fed9 with SMTP id
 f30-20020a63381e000000b003c6d5e4fed9mr2797165pga.553.1652944611201; 
 Thu, 19 May 2022 00:16:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2338:2871:9320:bed0])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902dac200b00160c970eeb7sm2972945plx.234.2022.05.19.00.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:16:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] clk: mediatek: mt8173: Switch to clk_hw provider APIs
Date: Thu, 19 May 2022 15:16:10 +0800
Message-Id: <20220519071610.423372-6-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519071610.423372-1-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_001653_404973_BFE988BE 
X-CRM114-Status: GOOD (  14.45  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Miles Chen <miles.chen@mediatek.com>
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
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
