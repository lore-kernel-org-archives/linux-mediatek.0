Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJKpr7SpQHiEddDo0lz+4rztS2QgI1nAC3124V+0uZQ=; b=BLhyHX7sC+3VQM
	xsWpjG1qpd8MP3bhPpfgIWNTepn0HRZQH7aVuMFjeyzW2q27lT2a/OZDZNw9/iA42uGcWNdoM9cyH
	XoPyZzn/SSqClUeY+SZxQ/zGW+yPzLbfJLt53ixfHKv7+fwc89ShcECO/9NT8o4lmN3B2Tl2xkWm/
	prfc8/Z75dpYWjEhbxrmo0BNAJzoXKVbknbEc6rIs5XPoNFzg0PXs93QPapcRt5GzcUJglEV2pCXn
	eiNsxtAE11pIAD4WwsDCLW4MQfBo6r/Ki4scZXkp+9NB5jGxJSl8ImDdVMDojgh/k14nQuWEQf2BY
	pYfyVYO5Bj3i8MTvGhzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG5s-00FS4l-Bw; Wed, 02 Feb 2022 13:54:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1H-00FP3e-9K
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id i186so16367466pfe.0
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=koVwH4W47ZnmdMQC+i7F7tu84t6ApcfQpNxUmrQL9bs=;
 b=EUM4BcWxvZOnU+GfCT/HmA+o6iiYZ40xeNYZXdyjB43nQld9ZRzxpOBZJN3lPU1dkh
 nNfqSuXf5AQE4HSoKTJJowRfXBPTAHMVVa4V+AwB2qZoP1hvwei1qItoMr/uwbVyENfO
 R/SOqvzD2gT1TnOw+QeTbgU2hZ08ncFdINjaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=koVwH4W47ZnmdMQC+i7F7tu84t6ApcfQpNxUmrQL9bs=;
 b=DRUNNcC+3hbZ3IPf8q+H0ojwxQRBpi15RBlIEnjJf9Iz4LVd9CnEg3J8Jkwr8PF0qa
 RQQCbZ3jn72LD5fCHnNIsb55ye/0gEG0tSEcqwJzsKSPW7BKusWPE1cH2SdgKsZx5P+c
 SYNeJTXcKr4ymCmAW17VsZKnxuJAQdYdzzei2XALlJgVHIxvZHDQ1O2stEqYI2jTPC/E
 KkFKbL7JSJIxA5kSTdiXxlQ6SoiaEV455ybxdVllL6D8KNve5pfaXdKP3HGZET+z2GYM
 eMXhTOJ5wGK9LBUZ9lVLwBVNIxgGVlPz6PSK733BJjb9SyFv4s5L5xaMvpFIC0/Oa9w6
 QLBA==
X-Gm-Message-State: AOAM532Y3kCFXygWyFJ9Ga2k9jCnWZQwlbJdiI2b+jhE/a8VYczeP2Pj
 b1IwKRTZCN5oJ7i9WMVRv6nFDIBcS26BGA==
X-Google-Smtp-Source: ABdhPJxTnVZoIVxU07+X5AzoQO2ik1+O5errakn66KV31/A9bAV8mo0hGkeH+5Qokg4S8y6zDVCYZQ==
X-Received: by 2002:a05:6a00:841:: with SMTP id
 q1mr8267625pfk.21.1643809798495; 
 Wed, 02 Feb 2022 05:49:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:58 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date: Wed,  2 Feb 2022 21:48:13 +0800
Message-Id: <20220202134834.690675-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054959_362394_12ED515C 
X-CRM114-Status: GOOD (  12.87  )
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

struct mtk_clk_mux is an implementation detail of the mux clk type,
and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 8 ++++++++
 drivers/clk/mediatek/clk-mux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 6f0c22a699c3..2d4d8dc0120a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -13,6 +13,14 @@
 #include "clk-mtk.h"
 #include "clk-mux.h"
 
+struct mtk_clk_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	const struct mtk_mux *data;
+	spinlock_t *lock;
+	bool reparent;
+};
+
 static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 {
 	return container_of(hw, struct mtk_clk_mux, hw);
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index cb2ac4f04c58..38a2b6014b08 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -9,14 +9,6 @@
 
 #include <linux/clk-provider.h>
 
-struct mtk_clk_mux {
-	struct clk_hw hw;
-	struct regmap *regmap;
-	const struct mtk_mux *data;
-	spinlock_t *lock;
-	bool reparent;
-};
-
 struct mtk_mux {
 	int id;
 	const char *name;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
