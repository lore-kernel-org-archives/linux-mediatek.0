Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oIAeSzZvD++RXKD3zC9a+7cBXOAoQjNIO/MZY3csvo=; b=gQcCgY4aRcs/Wb
	7At4cg8jO63LGso6kxA1YYFepux2Jk6Jkb2oG+FCNk1MCuEd3QQGPShoeE8vzN15P0sx/JPQ4A47x
	tms/DvQtP58qfErO+pKx2YgX9m0PbjpzeXhGpAod6xW6hccaddwdX3GwapE4YSPRB4PjuqbgGkouh
	pa0Muchn4Z7bjDUPRfiWIF1rOF081UkNoyYGKyaS4wSn4TB55jjEHp/RHyidvMXi5/ZKukVv0BlMt
	gzMpIHQsnBX6CLkHIgQD6sA+x7Bn5XZWi3golOttZVDO3X2l9zkjMEPuvqXXeBw9+Kn5ikZczBhnD
	8TjE02Gz1MYki6ZMq9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4ur-0034t8-Vk; Mon, 23 May 2022 10:03:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3uk-002dmT-Cn
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 08:59:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id w200so13087708pfc.10
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wYj0gPoFTJBwWJLt1P9KNSn0ODKjU0wkvs8hBSjSO3U=;
 b=lUaPQYzSVRFDMwj2RPF+1R9q+pfcZR/5b08tFuDgr31kRQFFXMunwOdCF09PUZb8VH
 96Re5E3yBwqHOq0b40EpZ3CI9QuM0kvk9vzCNZEZjejN1lNz654tcqwoMzyIbdOCYtEO
 Y/03XGT3SUMeD9Vu7D4Mty0laSQn6lJCswa3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYj0gPoFTJBwWJLt1P9KNSn0ODKjU0wkvs8hBSjSO3U=;
 b=0H1AUL5Oi5JldGd9XhBC9j8tU6SEa7f7GM8x9jCoKYChiqSVmx+JO/tcCg/CgeyWFR
 umRbacDsfuivvddm4cSryIOJllhtWZ5PyRnyti7i3IKCapf7ALErZnKzLuYMlTVqnn8W
 SCAUFpi2ydIUr2rFtUpI0R6SuBg5Wp5SYaDClcsn3OpiDW1AzVbqxB/TuRN/dpEuVQEa
 DsdnwAQJ3ioMx4h9Hhk75st3OQvfnhmjXozHF5+79ihzp1hn+g0QOwgRJ4xjKcL8TP8W
 TYRqeS/fLyrq4QzbD18+B6N2wCNvd+7E9Vmq7YhBWI2QOkJDDggKxLku8WhOXazG8pp7
 SR7Q==
X-Gm-Message-State: AOAM532VQm5d1Nl+fK6CXF+hVOIbZO1EuGlcWmspZghZwL7Ve3OWI9f2
 Mn33N1K2/KK1fYNp4VLsppEk0w==
X-Google-Smtp-Source: ABdhPJyB4buwfxnegQsQ1aY4kRiRx+ihTJre7LqvqL8FaxfcZg66cU+10Z3INwywene+LPduhmYoww==
X-Received: by 2002:a65:64c8:0:b0:3fa:91bf:a5d8 with SMTP id
 t8-20020a6564c8000000b003fa91bfa5d8mr229545pgv.473.1653296386141; 
 Mon, 23 May 2022 01:59:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1b8:7eae:9793:ff95])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:59:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] clk: mediatek: mux: add clk notifier functions
Date: Mon, 23 May 2022 16:59:22 +0800
Message-Id: <20220523085923.1430470-4-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523085923.1430470-1-wenst@chromium.org>
References: <20220523085923.1430470-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015946_589204_BAAF6D7A 
X-CRM114-Status: GOOD (  20.57  )
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

With device frequency scaling, the mux clock that (indirectly) feeds the
device selects between a dedicated PLL, and some other stable clocks.

When a clk rate change is requested, the (normally) upstream PLL is
reconfigured. It's possible for the clock output of the PLL to become
unstable during this process.

To avoid causing the device to glitch, the mux should temporarily be
switched over to another "stable" clock during the PLL rate change.
This is done with clk notifiers.

This patch adds common functions for notifiers to temporarily and
transparently reparent mux clocks.

This was loosely based on commit 8adfb08605a9 ("clk: sunxi-ng: mux: Add
clk notifier functions").

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 42 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h | 15 ++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index cd5f9fd8cb98..f84a5a753c09 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -4,6 +4,7 @@
  * Author: Owen Chen <owen.chen@mediatek.com>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/compiler_types.h>
 #include <linux/container_of.h>
@@ -259,4 +260,45 @@ void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
 
+/*
+ * This clock notifier is called when the frequency of the of the parent
+ * PLL clock is to be changed. The idea is to switch the parent to a
+ * stable clock, such as the main oscillator, while the PLL frequency
+ * stabilizes.
+ */
+static int mtk_clk_mux_notifier_cb(struct notifier_block *nb,
+				   unsigned long event, void *_data)
+{
+	struct clk_notifier_data *data = _data;
+	struct mtk_mux_nb *mux_nb = to_mtk_mux_nb(nb);
+	const struct mtk_mux *mux = mux_nb->mux;
+	struct clk_hw *hw;
+	int ret = 0;
+
+	hw = __clk_get_hw(data->clk);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		mux_nb->original_index = mux->ops->get_parent(hw);
+		ret = mux->ops->set_parent(hw, mux_nb->bypass_index);
+		break;
+
+	case POST_RATE_CHANGE:
+	case ABORT_RATE_CHANGE:
+		ret = mux->ops->set_parent(hw, mux_nb->original_index);
+		break;
+	}
+
+	return notifier_from_errno(ret);
+}
+
+int devm_mtk_clk_mux_notifier_register(struct device *dev, struct clk *clk,
+				       struct mtk_mux_nb *mux_nb)
+{
+	mux_nb->nb.notifier_call = mtk_clk_mux_notifier_cb;
+
+	return devm_clk_notifier_register(dev, clk, &mux_nb->nb);
+}
+EXPORT_SYMBOL_GPL(devm_mtk_clk_mux_notifier_register);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 6539c58f5d7d..506e91125a3d 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -7,12 +7,14 @@
 #ifndef __DRV_CLK_MTK_MUX_H
 #define __DRV_CLK_MTK_MUX_H
 
+#include <linux/notifier.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
 struct clk;
 struct clk_hw_onecell_data;
 struct clk_ops;
+struct device;
 struct device_node;
 
 struct mtk_mux {
@@ -89,4 +91,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
 			      struct clk_hw_onecell_data *clk_data);
 
+struct mtk_mux_nb {
+	struct notifier_block	nb;
+	const struct mtk_mux	*mux;
+
+	u8	bypass_index;	/* Which parent to temporarily use */
+	u8	original_index;	/* Set by notifier callback */
+};
+
+#define to_mtk_mux_nb(_nb)	container_of(_nb, struct mtk_mux_nb, nb)
+
+int devm_mtk_clk_mux_notifier_register(struct device *dev, struct clk *clk,
+				       struct mtk_mux_nb *mux_nb);
+
 #endif /* __DRV_CLK_MTK_MUX_H */
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
