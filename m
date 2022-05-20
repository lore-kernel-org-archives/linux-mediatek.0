Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09938C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oIAeSzZvD++RXKD3zC9a+7cBXOAoQjNIO/MZY3csvo=; b=mzGv8T8ykKN7fP
	efPcLgXPM7CY22PbMyeFyrg+iQuT3waX0mWZVCScXajJqWYGIZD+aPbwfgJkVwvHDfvtoyfLDK7DO
	VDHgVi3eiHIhz2gePt6E52F/LD+qI/TTYoG4rXVYbB75qukwrTli46zaw6XTuj9f8Z6NODEqBhxP8
	nzsl/FG+kSooMOnOmOLitxsxTaAGNYKnWMJOKSjNRqY38zc8VdnDzxzLQdOE9JcJHncuDAK7AeUvy
	CVUR6Jn/kPvrzampHmU5mG4h9vXNmzHLIueTUGWtfhVxU+27+tIy1y8IahPtKKQ2c3JUHSpSsimTQ
	7fC8W6izfYq6rdCMgVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0NT-00Bwme-Pa; Fri, 20 May 2022 11:01:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzIq-00Bi6D-AO
 for linux-mediatek@bombadil.infradead.org; Fri, 20 May 2022 09:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=wYj0gPoFTJBwWJLt1P9KNSn0ODKjU0wkvs8hBSjSO3U=; b=bRkrHjfcZd3ZVMg1Q1ue3mRzMg
 kkaFKEkgz7B5uMnK9H+L4ML10JWl9CdpOWP5iCvcx9lru+wMuQVqB/VAtx8b5CyXBlefl9xcvOw+i
 IF+0GAj5FTECPQSxTirmWsNQ2i3/PGszfnxeSYLrVdRDAATgQEAYkGwHMXggZKI/vFa2F/QJcCDDk
 9YMKoscT4UHZFW/MpPsvzR94JhZS6DExIJv5sxF99wqssj23XPhY2stuI4+F2u/NM9ngAvT61rNAz
 CszZBBoxmwmtlenrvYtgsyMllMRss4KujJUy3IyyGMXQyLPucsx/HyCyvPr0GTRbKpf14Cbm70YYA
 ul6fPnig==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzBH-002ILD-Rb
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:44:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id v11so7323088pff.6
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wYj0gPoFTJBwWJLt1P9KNSn0ODKjU0wkvs8hBSjSO3U=;
 b=ld8ZB0W0CyuE942AiXu7m9Pc6o1IzPm43tHOkNtsI9ja3+ZXuaz5Fsly3T/TPHc0qC
 yK669VzcVQuMW9FLnv0lGgD5gHPf1ru3oq88/XJN0uNcvMK8LxHYFhB6djP6naTFGtHJ
 JGWj6AJghQtC93LhJLnbHADNmKxzqBYvpUn18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYj0gPoFTJBwWJLt1P9KNSn0ODKjU0wkvs8hBSjSO3U=;
 b=s7cZuOjXxM6pWaO4QEgX4VEz8LHNkx0CnEK1ekfXArGzYcN0+oIq4gUaOBbMB8mbu+
 qqBtU+8Gkyq5EQlWuue8am4to+StBzWPrGUeqCQxxRLuFH0YkaJgW5Lby1VB9RkpDMuS
 dXiuV/oxo1O75BjVK0e8zsC3UYZCufgAPS+vmfZ6KLrIMe65S9IBsIbSI7K75CpLOaGS
 Fw4xsQ/2KAf4qNLS6qDFtnIT/zChZEqCuNSSgkRrIRXMsWDwOIQtx3MDkQ3Qn9S0MRax
 oPIr+3T065WeszSYw1RxSKtZbvaag0vgeAdDD7iGcgXFlvundN5sTh3Gqi8WSqHdWFA7
 CftQ==
X-Gm-Message-State: AOAM531nFjCaGwv/+0h7VBE8yqNwf/0c4K0ZU8W25otUkTfqRwKeuJa7
 5X51BpW6096K1kSwoSvyKjkwOw==
X-Google-Smtp-Source: ABdhPJziucUgkorNxj9E4BMmeKGpBafnohBlJChKVMYUEKtYijrw73Ok7dlvQG3idGaek2YoMaMHYw==
X-Received: by 2002:a63:e655:0:b0:3c2:84a2:2ea0 with SMTP id
 p21-20020a63e655000000b003c284a22ea0mr7837735pgj.86.1653039841013; 
 Fri, 20 May 2022 02:44:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:ec49:9912:894:222d])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:44:00 -0700 (PDT)
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
Subject: [PATCH 3/4] clk: mediatek: mux: add clk notifier functions
Date: Fri, 20 May 2022 17:43:22 +0800
Message-Id: <20220520094323.754971-4-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520094323.754971-1-wenst@chromium.org>
References: <20220520094323.754971-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104424_461117_C69CFA27 
X-CRM114-Status: GOOD (  20.08  )
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
