Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G93HCyM+/H3qnVlOaZBKSPbAD73hrxpt4Cg1vgsLThM=; b=Z2xg3ptHLt2pMI
	33T17TJer9bcWg/r6fXvhIpccAsnatXJGpSVWg+ExThH2XSmB1jtKw7YXuS4V8r7O6EHaRS8Wn0J4
	L2Vq2+7MlQOu0ogmGyFStirc7K+nZ4rfIQdTjW88SpVQiHHqO6daoyicTO1GQTkM9D9ZhO0iireNd
	BX285MlBdZGrZAtbbgYd2OJPdYzmrlts+JB9PmTMrDHaPClmJUvYxPQkkGT7NkIJXZ3DRSc5H6zmd
	IER0BZic2+rjQiP7MG27mWVInwUUL71nwIhff2xSS+25/y/MRy0frnWRCNP1vuDCJcWkK+8nQs0wb
	xy0WN39g5j4tOITrdxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPyB-00DsXA-02; Tue, 08 Feb 2022 12:51:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoH-00DnY5-8R
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id p43so1080020pfw.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLQw4RJqDZVMPw30M9uz1PhQpXBhvEj1u6VLau9OtwY=;
 b=jL2a5QDyajKzOUAWV5B0Nd19HhIgfINHJvM9WNEn6b+LxDB4bDUyKQZLkDZMB1szH8
 sSKODHRSvOsJrGymmMHci7fr5tCxsmLXcZm38aNquOg8tvsqskd0Of82WHAiGSpdjBVg
 LJb7i6DxEMHHloBmjgN+29AbkGYR//LBVbPzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLQw4RJqDZVMPw30M9uz1PhQpXBhvEj1u6VLau9OtwY=;
 b=RpxbxlBrOfGF960THr0pB6noCrkGC264Pa/oJXzc30PjwNS4tio8J0/RQQHhImxaMx
 P1a7N8wE74GBQJ+p89kNn3OpHSV1sBfJlsvZclrRaF4DvC2oWMfJwcop7l8iFa7GKuVu
 xMqRGQhEmPPDPGVwY6CoaXiSK1bycNLndxX98N2vUDSGbykgDdM9V3Y9OZneacCsJQAF
 V68NlmI9c2jesSvCwZBcuHFYhoPQ/HDunMVUWg+fDoICQT3rsQ398bCeClr6AqP2BkRF
 xAWHs6ZrRMdhqGSVYHCUG4zSHGebaKzrlg99f3Egi0yEBn8MFMGIZYHZOxgDFL+Khn9Y
 1+0w==
X-Gm-Message-State: AOAM530YwT5dtqt0KD96Eqtc4lGOB3vMJZBtcnspSNgACby9ye5Jf0Jy
 +5NrOAGRtJ+tflAMEVCEI+TH/A==
X-Google-Smtp-Source: ABdhPJyoH//QGDvsw16k4jMFINHEtKQ6bLu2VPWjf6rsSG2qmmitjA3mxEh+PsT2umh3po921k0HrQ==
X-Received: by 2002:a63:2f82:: with SMTP id v124mr3314490pgv.139.1644324088094; 
 Tue, 08 Feb 2022 04:41:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:27 -0800 (PST)
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
Subject: [PATCH v3 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
Date: Tue,  8 Feb 2022 20:40:21 +0800
Message-Id: <20220208124034.414635-19-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044129_314125_5926C24C 
X-CRM114-Status: GOOD (  14.52  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
