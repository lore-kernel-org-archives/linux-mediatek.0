Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D451BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=humvfl9iEwQt2+gLLVAHrO/ihO0c0o4ioYLNvVLXhH4=; b=pIoZsI0RYsx6Pl
	YnyGJuzzFz0nCOpCDm6Qy42lD/3wSKYz6lqMJKqMfmYqAVRA/Ft/PI8gMLub4/V5Y/i0q8iTmK8NF
	5A7wuhTgA0+8j/Y84PSJbfGuRq8vSfhuC9xm+HP+Qk+KN2mgAlOqjIAM+jC37RuHV461Jt9tGCTG9
	4qr9AOJNrvw+gLYWKMk7TELSd6cZ/iXfJF+6egavcd0vddwAMotxjUW38JeGPTjTJhjbVNXPN2iW7
	i2aenrK1a9GRs/O+wBgKIVbqc6wUx2TjXMRV5TrFSvYiBhvtVDwhOrhU4dBm2JZlPFWjAGr5ptZeC
	SNTSGJHdiBgRYtzIQKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngizb-002Dtf-1D; Tue, 19 Apr 2022 08:13:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiz5-002Dgg-Q1
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 08:13:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id p8so7865234pfh.8
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9UGfUGNG7X7pDsugCO6c2wWlLkIg3A+ba1SS8g2x2V8=;
 b=kE8h371r7KC1WaB3ptxODLKDwE0ME5VqByHNlLGRopQPgn2hRU94zG31+kIXMHFiWH
 sK2EgH2cU6NQzQ9myTtIxaTanQSuTrC4/Yt4PkcmH7iYRm8WPWkbhB9rxnHwSlUzi/Mh
 cTo1xx5oc5nXSEpwafQUqpsyUwugP+wJC5S2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9UGfUGNG7X7pDsugCO6c2wWlLkIg3A+ba1SS8g2x2V8=;
 b=ABcEFoHDa5fNE9WDpWn8V8Zq1FjjMV7MB4fDW++mIIHhMSTh/Nzx1PFYX7LSodHfiO
 ElqgVFthfLCTyisKHHEGLY0FRqS3WoV1v49GkJmMxdxt6XWoNqA/SjKenh28vKaWif1V
 eTbI8ygLy1bmhIrNHY9G7m7F8vs/nwhgCv9sDEuSuvO2qXGK2+M8IFCP5zSSx10vtYBl
 vI4y6sBOWC5mdPlWMjoKsH0nYGkiRHwjUYIpaY1s0Vh2qCg+ZZl+aJL7alnMab3DMegO
 vLDR9/tZHUoV37+EDC9QcfgIvjQONrHpQtv7tOSnS9hf0E/zpgPC2bVfeNE9kcwheeA0
 /TWg==
X-Gm-Message-State: AOAM530FQBxaLBSjKz6537aX79FAZZLSPOpG2w0UN5obyxE66hI24IjP
 8d9QV+5UlU03+Qr+9k6vGqmxHQ==
X-Google-Smtp-Source: ABdhPJwFAqU0I4hg06PcLzrE0VtXM7yjQUzD3S0oIMtis8FukDJaRIF7kf/NYED/Wq9Kyzv6atT9sw==
X-Received: by 2002:a05:6a00:cd2:b0:50a:7685:8055 with SMTP id
 b18-20020a056a000cd200b0050a76858055mr9021699pfv.37.1650355984158; 
 Tue, 19 Apr 2022 01:13:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:13:03 -0700 (PDT)
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
Subject: [RFC PATCH 2/7] clk: mediatek: apmixed: Drop error message from
 clk_register() failure
Date: Tue, 19 Apr 2022 16:12:41 +0800
Message-Id: <20220419081246.2546159-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_011315_944908_1FB71418 
X-CRM114-Status: GOOD (  13.51  )
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

mtk_clk_register_ref2usb_tx() prints an error message if clk_register()
fails. It doesn't if kzalloc() fails though. The caller would then tack
on its own error message to handle this.

Also, All other clk registration functions in the MediaTek clk library
leave the error message printing to the bulk registration functions,
while the helpers that register individual clks just return error codes.

Drop the error message that is printed when clk_register() fails in
mtk_clk_register_ref2usb_tx() to make its behavior consistent both
across its failure modes, and with the rest of the driver library.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index a29339cc26c4..06400c043fe7 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -91,10 +91,8 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 
 	clk = clk_register(NULL, &tx->hw);
 
-	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %pe\n", name, clk);
+	if (IS_ERR(clk))
 		kfree(tx);
-	}
 
 	return clk;
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
