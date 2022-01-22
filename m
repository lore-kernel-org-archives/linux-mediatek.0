Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E862C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SdRmHyclY0WWq+nA+mNZg32U9BLqgA2JzCi2+xG+UA=; b=yTM7plhFRkGnua
	biiTQBYcLmZxCYQr3EjJVBNTw6je3ZOXmDgMSiG7S17SEMekOT323OViy81V2VibeBjXF1WlM3XeO
	jNhLYgF29ZnoEwBsvj2utqcVagQ34c+FQCxX4kk0iK41Utihnv/dYEivL/eGt3NNkwGGPVhWOG3TX
	7duh9LZ+vigLkGUbncx5g2xRr4KY293mpEJudC1/vRKInWwjmSCimIKOm5bud9hrm9NlzdLz2LsaL
	c/MSOvJSDFxDxORQiP1pOcvQnlLzOwk9LA7MykEbEXNXhegnVw0PM9ED1Qizr9eQJgkFO//3CaQQ2
	G5GfSOvngHT8wOPPL5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCj7-00Gwz4-T2; Sat, 22 Jan 2022 09:30:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXR-00Gri1-5A
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso15802790pjh.0
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/W+xKFLd9pAMfBNMVJ4svP7XH9i2778pmii7z75+YJU=;
 b=gGYae5caEwlDlR3SVSNgX/JX1yhbQuv8yWgfZAa2aQstNGgg3l5EKYMgRQhKmoQSgY
 hae5FE9AcZC/I7yfenInwQdl6GqU1xGGl44VsdAoRBX4Pzp711KfRxPc7RplsHvYkLiN
 GRkaRSRjncUeyzOms95i9xiNVQSLxX0+flLBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/W+xKFLd9pAMfBNMVJ4svP7XH9i2778pmii7z75+YJU=;
 b=q2wMxsvEiBjOs+2w10l/1CSW5uS1kp0+nfqq6b2+W9wWOfLyNEY1EljgbLAzaICiZB
 DVHy+B478/3phk8h88f9/osmH5o4wn9wsTghBoH5K4Bnanjy0fsLdCLZkN/s1THbhjr2
 rY5TOIml0U7OjrcuFD5YOrVEoYiQC7kI6Y8y86zx1ve3CLSSNmmvJ9VVAvHkGXgS3h4w
 hu6SVZIB/pjUFBvcojLBw80BoCD1wMaQRGLyhINty5gpIB1Sn8wLkBoQpk6m/PxJTlEe
 Bvegjox0JT/3wyQT4alJwyRy55sczvLI3xSHUI6GVF6DeB+06vRXICMLxXoaQ/cZQBii
 gSEw==
X-Gm-Message-State: AOAM5311EPM3ZovQV02XB6kLTlRCwAxDW9w9Jsxdvo3sVql91Pz4ymCh
 b3P2F/wyg2yS6DhpiEQeteTn+Q==
X-Google-Smtp-Source: ABdhPJyv5T92Xosh6p3+LrrmQcfNNuzhflROpfIIbeG/5n22BfU1WA+DYYiAH5puDGFs3fs6pmQlWA==
X-Received: by 2002:a17:90a:9488:: with SMTP id
 s8mr4431625pjo.40.1642843104700; 
 Sat, 22 Jan 2022 01:18:24 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:24 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
Date: Sat, 22 Jan 2022 17:17:18 +0800
Message-Id: <20220122091731.283592-19-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011825_240474_E14397C0 
X-CRM114-Status: GOOD (  13.43  )
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

mtk_clk_register_composites(), as the name suggests, is used to register
a given list of composite clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 41 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3a6dfe445e63..2150ed8678e0 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -233,6 +233,27 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 	return ERR_PTR(ret);
 }
 
+static void mtk_clk_unregister_composite(struct clk *clk)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+	struct clk_composite *composite = to_clk_composite(hw);
+	struct clk_mux *mux = NULL;
+	struct clk_gate *gate = NULL;
+	struct clk_divider *div = NULL;
+
+	if (composite->mux_hw)
+		mux = to_clk_mux(composite->mux_hw);
+	if (composite->gate_hw)
+		gate = to_clk_gate(composite->gate_hw);
+	if (composite->rate_hw)
+		div = to_clk_divider(composite->rate_hw);
+
+	clk_unregister_composite(clk);
+	kfree(div);
+	kfree(gate);
+	kfree(mux);
+}
+
 void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		int num, void __iomem *base, spinlock_t *lock,
 		struct clk_onecell_data *clk_data)
@@ -259,6 +280,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
 
+void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
+				   struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_composite *mc = &mcs[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mc->id]))
+			continue;
+
+		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
+		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
+
 void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			int num, void __iomem *base, spinlock_t *lock,
 				struct clk_onecell_data *clk_data)
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index e3ae22fb0334..3c3a934f53cd 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -153,6 +153,8 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		int num, void __iomem *base, spinlock_t *lock,
 		struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
+				   struct clk_onecell_data *clk_data);
 
 struct mtk_clk_divider {
 	int id;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
