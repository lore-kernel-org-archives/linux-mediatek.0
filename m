Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE63C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjnMVKR3yPkYOoI1Y9VGbcEeOMtv/+Morf1sK0Xj30Y=; b=17ydVtgb0G30CT
	LyDjIkzREfrk5l2ODPpJkBwPIDzgd7RkWGhrSCBkS2ufbZV1EmFd97ajb2v/BCUfxjNXfa7RyMfS4
	huV2vQj1cs51wYYEGs/FQoBlYdFA3wjeY1vQ3mfFhAuZPICYe4IkDYxEjjAtq9QMpzYXf2GINJTEu
	wWbiUH1h0XFokQ9oXo9xXfbXXfXgpxD6eCqzDv9aGHoiTcn2wMyW347SN43WSrFkrP+5JDMRf2YeD
	uEaOW2JWfevrJjYX5JWtpkB9kQry0rtWPaaqqZtve8+vrhoNgsN4ScXGaO56tpekUPgWLmZcp2W7j
	2lhXaqwLFF+pT1HttRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPuq-00Dqzv-5N; Tue, 08 Feb 2022 12:48:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoA-00DnUx-1M
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id 10so5818975plj.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPoHx0MxVy2mprDlmk7WfXEAU5PM2SDXULV3Mk0XUS0=;
 b=OfHhLbHzk0vts8tueG1EzqqelkQHhva27fwdv4krb3Fqvz8/E1nF+x19VySsFkliJS
 QWpDJWRJFXUmL6Vs+5UTz8L/HVVxgqR7JTPnT6sc5tF+oL15DU1X5WddfafuoaVI61Bn
 UoAL6xF9lxyN/QfNm6ivb7WFoGU109XuRiHx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPoHx0MxVy2mprDlmk7WfXEAU5PM2SDXULV3Mk0XUS0=;
 b=iGUtdHtjWwjLmcNTerU9JDLRB5Bamark9Ma6S1YKN8/Wav7qP6FVxfLdejnCsYmXEJ
 IkrtQPEUH8ZiFxmMV/sX2gmBOZjjaCQwdOZ+umvaTJwZOipTAAJ0T8HoC2yrlOpxmuY3
 BD2XCgAtSf/fwQonnJhIvt985R7ZedbhwLbo4pWPR2vLaJ3ZHWUUBdDFO4cMWXqEKNax
 VygWziNPrEQ+Iu35AyBcklPEaY4jWrERkncKNdf9r+b9pxhOXRPhYH8RzOfK6zcX8boJ
 gGZcE6XuiIHV/rgZVaiYO33vFkKBnBVOCHlfETaBITzC/cCCTXWbSZcESr5KzEfNyKto
 LVRA==
X-Gm-Message-State: AOAM533Y6/lX27GjSioAwU7DNvE85hC32UFLON3fCHC4s55nJeQyJ/KY
 TyrrQgGuodALY9dvQm/ZDEcc7w==
X-Google-Smtp-Source: ABdhPJymp3eMV72+HQHSFM6knL5LU/F4l+dnd3TBAdTXc+SFrQG9SpNis495KvAMIpZm6L+mhFZQBQ==
X-Received: by 2002:a17:90a:c283:: with SMTP id
 f3mr1171840pjt.138.1644324081530; 
 Tue, 08 Feb 2022 04:41:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:21 -0800 (PST)
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
Subject: [PATCH v3 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
Date: Tue,  8 Feb 2022 20:40:18 +0800
Message-Id: <20220208124034.414635-16-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044122_126658_52151322 
X-CRM114-Status: GOOD (  14.98  )
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

mtk_clk_register_fixed_clks(), as the name suggests, is used to register
a given list of fixed rate clks. However it is lacking a counterpart
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
index 0c5db3c71fdd..7c0d5706eed7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -80,6 +80,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
 
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_clk *rc = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+			continue;
+
+		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
+		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
+
 void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 		int num, struct clk_onecell_data *clk_data)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 168220f85489..cc7f920eabb4 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -34,8 +34,10 @@ struct mtk_fixed_clk {
 		.rate = _rate,				\
 	}
 
-void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				 struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data);
 
 struct mtk_fixed_factor {
 	int id;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
