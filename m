Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60245C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoneurH0MluNpfLnf8sv8GBQdUs/KOAR1EeHNzV+DyE=; b=bEyYpAEt8X/fc0
	2JDK6RO3nniHx4JiHOaRobjarovsa3r4+jtJSpAj/SJcxZe3jcI4pcH4SMc1cRNe/70KMKET6pbV8
	F9xRm+/Ys9yv8mHxqZFyNXAUetWULz9VVkFwxGibzF5ussIogVR8IFehPFFyDucTjM400vjZISYk/
	nZBC7TGzzO1m81ZrE2ed9/bKDqzTAp361m8m+V5/bDRVe7RbzDzS27U9G4lLIF6jMWdlDQaX/bqlu
	+fbvfpV5dmogijduZjGdXquhcLHUmf1Ny+NyvWfOdotf7kAQ9riyUk/QAGZRurzsdNQRUsd6fzpQJ
	BR+wCgUxOs7dFoBiCIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPwu-00Drwn-T7; Tue, 08 Feb 2022 12:50:24 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoE-00DnWw-Go
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 y15-20020a17090a474f00b001b88562650aso1537043pjg.0
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R3JoellM0j3/drkIwePqf6xNXC0okTaVtKIbynTeAOc=;
 b=cDbvFXn+++jD2RBihOfm+4NuHtNk8YlQxYmPjF35O1yrsUbdXxfadniAuG4XR5nFwS
 6AjlYWaCgdXKEQ9wtER+Kay6SUeGumXjw601aAOrw5/VgQcSA14qgibFM3JGqGXyIn/9
 ETByjiRDfguEMxbmnwqFjDAIY6/V0+X2N5eCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R3JoellM0j3/drkIwePqf6xNXC0okTaVtKIbynTeAOc=;
 b=Q7IYXRiq1t29l6Jb/GxYr1kaZuSUkadzS2P0PaysMt6jmaSI3uEPYCCfAPGY0X4lFO
 GxaWMAf6QdAp9oRlN/53BoFdN6S8kqQQHIy3V1dHq6WuOFDnEWDgkF4QxUcF39WFT28U
 UeffxVicVUh6/HS8TGn55ZzR+WvXBGPn4ITa83MFgPao3MZckAuTuDQffVRVE3bKwL5H
 bwfbvuct4GlUcItW5TYSBXJm66ncziVL94XXli7rvaGKBl40bFQsOrnaalx10nJmUEVR
 AAcSwfVBnX5JMVGjuP7Rl9RTu7k5LOpWRsGyuXQP7HsAlQZWwcBpvOatncY6pE8b3Bnn
 odlg==
X-Gm-Message-State: AOAM531nLFqe8H/Y6B6wKwxOkVU9qgqvYFCFgY551DMtkvdi5ztMFJ0G
 VkJA4bpOd+JxQ2538vSVI/+Rqw==
X-Google-Smtp-Source: ABdhPJySG6k3d+lfO+J6p0YF76ehegEmYbi/IhHoJqpoMykEiunvLKUkSg7jAzY0zepF1RSOzn+Q1w==
X-Received: by 2002:a17:90b:3a86:: with SMTP id
 om6mr1151521pjb.99.1644324085808; 
 Tue, 08 Feb 2022 04:41:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:25 -0800 (PST)
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
Subject: [PATCH v3 17/31] clk: mediatek: Implement
 mtk_clk_unregister_divider_clks() API
Date: Tue,  8 Feb 2022 20:40:20 +0800
Message-Id: <20220208124034.414635-18-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044126_578108_50ECA3D8 
X-CRM114-Status: GOOD (  15.75  )
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

mtk_clk_register_divider_clks(), as the name suggests, is used to register
a given list of divider clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  8 +++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b267b2f04b84..3a6dfe445e63 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -286,6 +286,25 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 	}
 }
 
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_clk_divider *mcd = &mcds[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+			continue;
+
+		clk_unregister_divider(clk_data->clks[mcd->id]);
+		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
+	}
+}
+
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
 	const struct mtk_clk_desc *mcd;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4db1a97c1250..e3ae22fb0334 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,9 +176,11 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
-			int num, void __iomem *base, spinlock_t *lock,
-				struct clk_onecell_data *clk_data);
+void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+			       void __iomem *base, spinlock_t *lock,
+			       struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data);
 
 struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
 void mtk_free_clk_data(struct clk_onecell_data *clk_data);
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
