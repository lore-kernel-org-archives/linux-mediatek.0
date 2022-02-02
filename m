Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EClM3nv+B1bzR0myFHOk8eJi/kR0O7dHc00X9G7fVk=; b=3KcTMEFjBFDDln
	ciebhGVGp2/oHpXZyQjOjuN3qKAhl0ALRo4mXKobyATqGsDCDRlBLw/eBSYAmKvOIww1FzU/yi2nN
	r4CSYy8pNFcrENwG307Sa2lALPgxMEERf8L8wAqFf7pCWGmMuFcTtRJ1McG6WZXdKnMz+fdqPhAyc
	e+8NsHXJpJRoZyQjmrkj1xuGtVVxGo0RlB0EZanC64LnKk2EJOf1IouTuhCzuPpapx1Ek+GVxl+fb
	r5lv6jPdllbnLhYFNz25cRk2Kz6cDm3+Sf+/fOGPiHldpXDzppj6MnuZ7dP6MoP+pZvoElvifXSdL
	XJAy0nnZZGHC9BXQDW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGIX-00FY7u-SE; Wed, 02 Feb 2022 14:07:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1h-00FPNl-2R
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id d5so20296796pjk.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNRljrWOAeUndIQnSVvEuUfXq7FasZjB3yC6SLPOuYM=;
 b=U4vn34H0WZLQA8MoBFSj8XH+wsm8GLd/vRb1NzXQolOCQ6oqrB9XEHDXlwVR+0Yef6
 wkYdmZeZSVKK9vVy6IiPGuwINl7+oHUyqqzA63Zn+h4F4mV51am7/giIRB415XQRleoF
 nPc0iVKyIb/sVzkHaTRkm8kkWuk4z/cWbCzx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNRljrWOAeUndIQnSVvEuUfXq7FasZjB3yC6SLPOuYM=;
 b=JTx7yq7jFRON/cJYugExojg7CSVkGHJnCn+ON3zzpDP64st9GeBFmP0+xyBs8m52v7
 b7IevOlYh3sGLWeCnIUT3Rtg+cjKtJnD4KvLQjbexgC9Prx0yQYyheb/Iu7VPCOR83Wx
 hu/crT8mWwZ7hNanc7sRhQvV2MUcuos/xZuWLUi+AhtF0Pd3zY+epeF0QzpHQlKgGTGX
 8LiuMpHkcbV31P6NJlcqjG9Nxs2pD00j7UPf1rojQ7RYD63xFpfqzJyYCcv6p3CdhhTl
 vTtfaBPUbsXLjDGj/3yo3ZWDVYNVm63YKhP36rG2fykC+qFz24E6upZY2FlyXRjxb0El
 NvWg==
X-Gm-Message-State: AOAM532edFfAFo0DxJeMNZXhAtqwquC2NGwteYgjdAFBOzinLT3zrVbF
 zA3t0lk1d5xdQTLkUwvLV8YT8A==
X-Google-Smtp-Source: ABdhPJxg9luWRJ9r/j2zVez342YUr/p2ncftDzjGtTu9Ak9s1/hRg0GpZyJdP3tIQGpruvbs2nlMjQ==
X-Received: by 2002:a17:903:1110:: with SMTP id
 n16mr32138856plh.120.1643809824608; 
 Wed, 02 Feb 2022 05:50:24 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:24 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/31] clk: mediatek: mux: Reverse check for existing clk
 to reduce nesting level
Date: Wed,  2 Feb 2022 21:48:26 +0800
Message-Id: <20220202134834.690675-24-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055025_168765_1A2D9A17 
X-CRM114-Status: GOOD (  12.97  )
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

The clk registration code here currently does:

    if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
            ... do clk registration ...
    }

This extra level of nesting wastes screen real estate.

Reduce the nesting level by reversing the conditional shown above.
Other than that, functionality is not changed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 01af6a52711a..70aa42144632 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
-			clk = mtk_clk_register_mux(mux, regmap, lock);
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
 
-			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-				continue;
-			}
+		clk = mtk_clk_register_mux(mux, regmap, lock);
 
-			clk_data->clks[mux->id] = clk;
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
+			continue;
 		}
+
+		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
