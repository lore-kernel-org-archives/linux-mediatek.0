Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F92BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb2+s6uCDLTmu7VyVgeksLbxxTlwwgbR0H4jLwpXAEE=; b=kI5BtEhujWvo+o
	JH2PjhKhRPzPjaJuYzlxvgFYYM2RZk7JAl2w4+lEf6P5ju2OPiBNiMkAzEWoK0fyTc+eiJlu8cpcb
	1LyEbcp3UOA7a02Dw4hVWVvTfgmMA9viB/SHFEv7hoWxV47HNROLEpJQj+plKc1k4nz9DgAH6LYPK
	hRx4MPH0Q6LPRmhJM9QmMpkdqZEXekfcsGhSHQvy5s7gY+tjr87tH5jS6TlnaP7MQ22zCnRci1Rnk
	oN/qV/zAFtxjBL0TXXLJuhRLl1mEdJc3Tck04wGnZA2QDb4HX9lEILrBz+jF7KZF8jfzVNRruFpkQ
	c+r7/XLjc7Reck6pUnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQ2e-00DuRX-6T; Tue, 08 Feb 2022 12:56:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoN-00Dnbx-3S
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id m7so16088163pjk.0
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=haCUKocersM2g//bqn162Qgjk6DgHWiyvTJMF5LIhWw=;
 b=M5jgrIfhxC3Ll3awR5T/EnAv44rvXW+k+Lm7AQnR3Voo/+J434lWom64lKJIfHW/cl
 bbJ4/NkcAMG7j9u2VNGPeha843F9tsH16GYZcBXjNE1AifaS85v+HaHEIl1Evh2aglFz
 VWZ5L03Ul4UGHHUuej8bAw7/iQcTu3MZubKqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=haCUKocersM2g//bqn162Qgjk6DgHWiyvTJMF5LIhWw=;
 b=vpa5k7px5A2HML9GdQZtOaxKAtmqHjP6ktLkdjHQIeNN/hA33DyZHqUQUWLouPAvH8
 wqe31AEO2LEI/SnHIrT6Ui/FKUtuPUQ3z3DC8BhsljbF4NTWi7+1XkUVuUirUmFFbhy0
 ou9ocHLPaqgOOQ2cIh5raqM/yOcgn0BZvOmAEb/1XzS6C5ZKUlwZk9HID0B87HzlMo5h
 ezD9BwvjxwU79Nnzgat344iqKUtdpvv47RzKBLhLF/S1KSvJ9LbedKC6ufOwgPn3+efL
 s4WWNT82S161/RTvxVZ7EuM+T2kaP8mioivGIqgyDtGlpoD8WK9l1wpB2nTKCwyO2t5t
 Kxnw==
X-Gm-Message-State: AOAM533gSQK7LSIdY6LLc6+vtWmgnJZEyf5n2HSgdV7RPyBNbLWIWHOV
 5JdytvsSgfrIhEfgHRpdPWB2Mw==
X-Google-Smtp-Source: ABdhPJwC7im+Wu7WK7r8anEyQqm3GCI3zaun1ihNvzqAS141M0dKaySmYd4Yoapf0HcUrCF7/0wMeg==
X-Received: by 2002:a17:903:187:: with SMTP id
 z7mr4252301plg.123.1644324094451; 
 Tue, 08 Feb 2022 04:41:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:34 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/31] clk: mediatek: cpumux: Implement error handling in
 register API
Date: Tue,  8 Feb 2022 20:40:24 +0800
Message-Id: <20220208124034.414635-22-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044135_276380_955C69BE 
X-CRM114-Status: GOOD (  13.25  )
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

The cpumux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 658aee789f44..499c60432280 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -123,13 +123,26 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_composite *mux = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
