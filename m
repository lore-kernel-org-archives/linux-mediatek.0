Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D29C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9XKG1/xcxN4TybCvqcoyslUjiuBJaCP3JRDrxtZjNA=; b=X2s7ihebW67Y3Y
	NVTqwRfaNEPgfC7EDt+XnR551U2CqGGBurA+Be/+HuHuMCB2MKmc7G/M8eT/FrycoMxpJhDh//CkC
	l+r0TUu61JJ8trYm8hlm8dHLeGeVwwalmgca4mFdZCUYZC2frQ6iqBRjLVsuRI8tafBWWqfX7oL6/
	3vIaZ9NUXkZGJa3GEMnTBgaqHfQFrdmYlxrrob1tL0M7iH8gMJ4PDQgTFoWoG+p4naL2qd25+jTfB
	rER9U66D9LlfcfzOScJhDmhnpGxyKGf/7xu4G3NQ8PrzWInNTwOZ65CHM+msDltaPeownNnsgHwdc
	gDLpDfksO6zciD9mEhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPvw-00DrWh-JT; Tue, 08 Feb 2022 12:49:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoC-00DnW0-Qu
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id e28so18650069pfj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jvgrG3Dmpy1I6S7Dz5gEHIA3LIp2Xa/xR1uXh6G5dU=;
 b=OO1r4dxadJOGLUSOKAN0tmHzPQa1/FnX57PE28Fw2+knHtrP1i77Wg2a5G/AUHfj7F
 XJe4SgQaXUtNYtLJaaI40p7JgRIe15fGPHDGLYG3xHdNTVULkjQ59t51I+2PyOThCt2P
 5n4cgfYK6ehEyeCRKJw4xyfPqumGi9TgdpYyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0jvgrG3Dmpy1I6S7Dz5gEHIA3LIp2Xa/xR1uXh6G5dU=;
 b=jKw99HZQp7k0pPMOxOAd4GBmP/7wHpd0iDYLwOSILUVSxFGTb/W01x9lnW9vDtcnys
 1S94cZhnlfcvCNX+5XoMZFj0Tpa72qLqA8KjskRRbhUBQuNzIPu5CmZ+OdWAFgj7mxcN
 SADzPWpOPoN+cNlr41qvtVXQU5JdecAkWEMg3A7KUCjNLTsNVtEi9UFN5TbqwJ1aLA4q
 fTNv+Z0+DsYX+Ym52na0FHbavgF8AD3wQwFbsBT+crVrh8zI+4PDaFXMxLL59RRuOOiM
 lB4Kg910eNn+vDr5m1x8CSKH1Imz/E1MXc7Pas4CMwW1dGDLIgzqogX2o5SE+oTgtQpM
 KQUA==
X-Gm-Message-State: AOAM532FZbFCmrtgoP1RsoBrxjN0aTlujOw7K4o+6qWTzfZNrRhUFeER
 cIdjGJ+ZLMQFVUjI/YVkzADXlg==
X-Google-Smtp-Source: ABdhPJxlQ6xRfe3jgexdVmS/BecwJ0yJF53+WUSqv5aNmcGH8QFSxeRwNVd6B/u1PMoMOp5zWvGwTA==
X-Received: by 2002:a63:9307:: with SMTP id b7mr3353508pge.291.1644324083669; 
 Tue, 08 Feb 2022 04:41:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:23 -0800 (PST)
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
Subject: [PATCH v3 16/31] clk: mediatek: Implement
 mtk_clk_unregister_factors() API
Date: Tue,  8 Feb 2022 20:40:19 +0800
Message-Id: <20220208124034.414635-17-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044124_887102_D48CC9C0 
X-CRM114-Status: GOOD (  14.99  )
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

mtk_clk_register_factors(), as the name suggests, is used to register
a given list of fixed factor clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 7c0d5706eed7..b267b2f04b84 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -126,6 +126,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_factor *ff = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+			continue;
+
+		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
+		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index cc7f920eabb4..4db1a97c1250 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -55,8 +55,10 @@ struct mtk_fixed_factor {
 		.div = _div,				\
 	}
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
+			      struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data);
 
 struct mtk_composite {
 	int id;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
