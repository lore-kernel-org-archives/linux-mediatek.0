Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A8CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMyQ7hrfNfp1EckA35PaZZqW+S/XWzyPF0ntAKvaEvY=; b=NfZiJD0xHjUrW6
	uUQJ9YP+Da8Qba5ZU/rYfxjnru4IPKmMAMOWhlIeOG9GMY3rLNcxxA6UscO0k3/4uhpX5HIRtHMqb
	ueEaqSYuKiRjDVmmTBPyOGUBqfxl1PulL6wkVBpl79ixpcn8iwXha+14LnraWk/ylIGOlzbxlqN+q
	N3+dWJaX367tfr2giW6o0k45MJt1jMFWQC8a7TE5GBpHSSjcteXBZtrL0Y8G8thBw1pga1EVJsFR6
	Vjz1FcVsVfVF08p6vYXDf8pCy8gWziOZVsWtshP8hgAgJTC4t7stufqrJ0hK4zhkQSeJywTuNyCC0
	HqR/f004uXB9oIJyT9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGB5-00FUda-BU; Wed, 02 Feb 2022 14:00:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1S-00FPCp-Ng
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:12 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso6078914pjm.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Wqt8bANP5ifvGkIaVLK4/SfxJUiMOM5777d8fxcmLM=;
 b=m2ksXmN7GxvSJ/YH+L/9081yGbKbVptVViQ7mbt5uZRnW8oCM+USFPKAP+awj9+dFG
 jO235c+pDT2bEX4Nr7VfDXg1JwB+GOzcK6xg5uUworwikrQ4prvPI/CJ3qNxqaLTyMGD
 paUb6rV0mbYbYGkmOIZ+tDuDktrRvNfBZkToM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Wqt8bANP5ifvGkIaVLK4/SfxJUiMOM5777d8fxcmLM=;
 b=FkPhi5qSQfRxcdX1yAqT/ytEWk3RE5/fqYJiMV6AkEiaR3zD8cRL5KUDQY1krpUsbV
 6gDRokdeqfgeaGBOhG8Wp86FS1Mp4znzQg7hS0TyUuSWg3ta4Dxr3uuxSWDXSG/K85QH
 NQp5kHnen6e4DexZWXie4SEuHB5J+C9+9sn9MOGv+in2UpKgFWjtULLGyc2fr+CV7gR+
 FhJt7M/mExD3YLciRDyLy9+jGJrQHKZ69LJkU2+QXcX/sdjK5+vKnfVHDin5/sV0TwMh
 FEiNU7zw9Lvxzo11g7e5k5bNSUnySfdZ4ORVxcp/n2i+u98PdRyOzgyLh0qPf2nefIkb
 GWYw==
X-Gm-Message-State: AOAM532bT9YXhuTQ2GZJ18hoGwFlMpn2DJWe44bVE/97bE57CrDBo2Bc
 3SIP7bq/75yxKe9d38PNZt3PWw==
X-Google-Smtp-Source: ABdhPJz8hyWt2PyEVsnlaUWVM4Es83yV7JTMjXR/JmTG23iFKVNdT73cJkCBQTXNY12fQ41KC/4EBg==
X-Received: by 2002:a17:90b:358e:: with SMTP id
 mm14mr8052020pjb.229.1643809810312; 
 Wed, 02 Feb 2022 05:50:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/31] clk: mediatek: Implement
 mtk_clk_unregister_factors() API
Date: Wed,  2 Feb 2022 21:48:19 +0800
Message-Id: <20220202134834.690675-17-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055010_821311_8386153F 
X-CRM114-Status: GOOD (  15.40  )
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
