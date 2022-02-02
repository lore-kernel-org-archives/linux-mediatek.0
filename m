Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85015C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9RCfkag1AiVtLQJJe12OKOBdJfsvfvRJraVjbzd2Js=; b=1fX+b5Zvp9qNQh
	W7LVeVJ/HuNLjLfcMIKMnvlx+TwPxsHLKtTUjvrvt5p3c3uLJJpcC3fH72v/pLccUErPV5dALhAo0
	Wb9voKXranefJrV9U2oDb12TPBB+ofv1pdBpd6Nja4yGXmP4RDlsqSicSFNX5/ByUtjBVOOVtvQUx
	o4XzvecAySw0HhlU7glvQH8zjud8SkfgcOLU3yYRvSMmznOQJ/F8bHOikvDHAj021o/h6BhVvLHe4
	BNq095ySD9qpokvQL/nhouaeoYDugoUPrnxqBYnAe01L1+u9kTrX85StdaML9hR1zRigYfj1JX5F8
	3xHRXBSTn/gTghbOCRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGFN-00FWbU-Fh; Wed, 02 Feb 2022 14:04:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1Z-00FPGD-A1
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so3950633pjy.1
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2rFtWf6KqBF9xTPNkR58mW4Ft7tifSnYgDGOnwZWmM=;
 b=A2TEbWyazowLCHaF4sxnFrf/4MM/80w5Zdz/MSmRbHBlI6qrtBt0Of872ysILEMFiv
 dXzigYiyj8HuPfx1+CcFTvhZ+LKD2BhHfWQRjgyMaV9if77Y7HZzO7aQfsUMNKPhBPx+
 MJqeBSg80HFwiQO6wfGOeSCdZs1aft8j7xe1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2rFtWf6KqBF9xTPNkR58mW4Ft7tifSnYgDGOnwZWmM=;
 b=uuPLQHOiu4WA73wl6NcWaTDZ6GIrE5QjeRhUca1KVEY7Rr2i1B8xZ920rTsGV3bNrF
 EaGsjlEQiOY9ka3JLW1mQFRmYce90y1XvKBW1p5QvMgVdNDUIBM2GNp1cq7WGBjO8+rE
 J96LoX7doWggkNwbkzIFMhKwG+ym0VuB7qoZDA4Rm89pTdzESzJpxFdJbmY9Uy/hToQL
 c5P8bALqMb7iFJUvcMS8nh2k9OOGwc4lSKOzp+sVgilraVMYz3UnjdzCzESbb6WmyD0r
 HPTGN0GxALW4YLH9k0+ZONudnqAEy6X7xAzcKznvFmP5ZcxhKqzCuu5IoGkolYT+scFv
 QAHQ==
X-Gm-Message-State: AOAM533waCB7lOb9LiKco9kABzRktLAy0V+L/gusgFRjwVsa+JH7dLXb
 ld1LnQrDw1y2fIKT1C5LnGEaCw==
X-Google-Smtp-Source: ABdhPJygRG8bYFhtlnVoNGsOJ6b3CgRc73OX4/Ug88WdrqeRvZXVJKZrLyD9KeAy+tMCvIi8t72LFg==
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr8071807pjb.112.1643809814237; 
 Wed, 02 Feb 2022 05:50:14 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:14 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
Date: Wed,  2 Feb 2022 21:48:21 +0800
Message-Id: <20220202134834.690675-19-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055017_389401_587E3C9A 
X-CRM114-Status: GOOD (  15.04  )
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
 drivers/clk/mediatek/clk-mtk.c | 46 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3a6dfe445e63..869e6ae55c82 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -233,6 +233,32 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 	return ERR_PTR(ret);
 }
 
+static void mtk_clk_unregister_composite(struct clk *clk)
+{
+	struct clk_hw *hw;
+	struct clk_composite *composite;
+	struct clk_mux *mux = NULL;
+	struct clk_gate *gate = NULL;
+	struct clk_divider *div = NULL;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	composite = to_clk_composite(hw);
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
@@ -259,6 +285,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
