Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA3CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3AZVEKgXxnOMGT1dWeJPZiWUoFdMUTiY3ERa3wBvGWI=; b=rYzEV6WPpv94JV
	FvgpV1FtitX1HpEgIixWPz4nxKBSGy4VF91eGwy7gkqTTjXGjw5Pnldp7nkrxudM+VYtBw2eQbpcG
	uEE9EzBb7O0JhEmkTrutkHniesdBi6hKCc/4iyQFFXOOIlz+qRwmnqMAlN+kgApm9j8RLbZ1jdQzz
	MS+zbCO61F2BpA3NayiZ1VL5TF9HRZUU+VhjvfngEXalkxLDnIhRGOnTle1qKIsIduh9rg3LRTsCT
	GDIp4dREYy6RrwXJfC7JmIp7gJ0T6FcxdJQVTJL24Mj/bO0QuKHfnXI8YepkQzghDdG8qs6nJ+2yc
	t+WwZFJNaCAQ09/Hh65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGN1-00FaB1-AM; Wed, 02 Feb 2022 14:12:27 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1p-00FPUy-HQ
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:35 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s16so18250493pgs.13
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+daluWI6BZRIIo6jD7cHJViSYXk0pP6IWtsEBRin450=;
 b=Tpd1Y5ycji6S6pWD2XDf2SPMtoJdCSlWpqa5WQ0rz036vkv6p90/OEXloIQ1CsAkGL
 buh3iG4TyghoF0YDogBgAeLC2VzMf1iYDwfXL6Vf9G6tOqVf1CLVbGsBl/FZOAP822jB
 VuhIm7GlgM3Uqijk5XMVny+frQUbsvt0GJ/P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+daluWI6BZRIIo6jD7cHJViSYXk0pP6IWtsEBRin450=;
 b=GmcMeFMxaQQCQxwihwTxM/qjEek70wjZYESrODb1Asn34BRDN+BEkUNQAjkOaU1eQb
 ofDb0dLfmgIESaVx6K/sbqqztcPEG1wH2w0l6WEsEeXKqk54LHt1oSZBPYTdBcYwqBdE
 bZ9QR7RNloqE9oSVhCOywG0it48TYHBLS0GuLsg3Yd3F240i1jlocUMiTsQOr8x7WdL2
 wdqeyTcCCzINxGu44SuPbw9MidjFNOVKh/ojEAPMpoS9GiW9DTTzNWY2bBqhLeCDYTfW
 SXseCRfs1t9oGMZoJF71z80+6xlXyz6baoFUGKmpeQYqgJNiUQl2cpEIH0CxT/IQBG5w
 hyLQ==
X-Gm-Message-State: AOAM531c7tDALj6EvPmYTufzufoYE/fNgsOmU/Kq43lsgj8Awe0JxKay
 QAi84dhi/wkLhjBubxRB5NXvpQ==
X-Google-Smtp-Source: ABdhPJwgB9Kfv9ToZpcQLJRwpxFqkgMwlv0Lnc1Fod0ARERNSW52V7MEPKDRm9oXXveifEe8s/FX+A==
X-Received: by 2002:aa7:9498:: with SMTP id z24mr29584316pfk.80.1643809832727; 
 Wed, 02 Feb 2022 05:50:32 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:32 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/31] clk: mediatek: Unregister clks in
 mtk_clk_simple_probe() error path
Date: Wed,  2 Feb 2022 21:48:30 +0800
Message-Id: <20220202134834.690675-28-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055033_594326_C94BC72D 
X-CRM114-Status: GOOD (  11.88  )
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

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of mtk_clk_simple_probe() to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8f15e9de742e..0e027be0d5fc 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -439,12 +439,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_data;
+		goto unregister_clks;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
+unregister_clks:
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
