Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeRTcGlY/QEc1NBGTy5yMbAd4ccKXeM+/6f3W6Fgyjc=; b=v25Kc966a3ktgd
	MMk23jyveDhh/NE5Dh8OQmPw/Bovk6U2rOAzvNeigSLICZErR0yTmZMcy9V5IyDQUrUoZ1C2pa6SZ
	zcBx+Fp75AkRz8i2tdAw0znYR8KTRGKZBR2wUGj+ax7uSHVpR3p0ZBzLYNESP+EpVTcVkP6sad6Vb
	Iyg3mh/2/UEpU1CF4KsSuxE6er1Os46aAjQGDLBK1nYcRizU4k49dqlkmEdOMxeWy0KXugCuIcXUs
	ybNcfYzVslka9d7Q+JSQHAksr7dw7UWgryl9opPHurU1aLwZjz1ZBy9ksmYAnacOabXMveJeKpUMA
	yKRvNlUox2FePDEYTUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGGP-00FX67-0c; Wed, 02 Feb 2022 14:05:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1d-00FPK9-3z
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so6901097pjt.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cx6a8R97PjsjOv6cebI4Z/2hIOUwaDl4/YWSX9mOExw=;
 b=LECTsKvy7t8JOP59Uuw4WqU16hg3GYtSw3sCr0w8VJYVeRfS9yHbZOGJqoXab7B9u0
 tlEfn86K0vk+YtlKRJTlsdK62A7mWfXsfsyGm/ptvH04zxs8M1w5q8zsW13X+Uy8a3VH
 PmrtpQZ9Us4qnZFpKDO84gckboYbX79QVwqJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cx6a8R97PjsjOv6cebI4Z/2hIOUwaDl4/YWSX9mOExw=;
 b=2GU8wMs0TJWi9cwrxh0TO+V3dvy5LmdwzpqrLf/Nf0wJPCm+PaX8n32vsFMTXrnYPl
 zOxX0q/xsPa9gA6CyXeaPuptfUQV1IRCDkh5Gl0qQOomsBLwNTKiho/cbitmn6a/Lthe
 0dmdp8hmwR0C7hnQt2Dhdq0FR5AONiJQ3tJJ7JBz9YBM8fDF5YnOI0rQ+RnLaex2RL91
 ahOnl24tSco63MzShDa1BwRdKrYWeCG7fxdJSmiPFL28yuOv03ee7rUbrwpyXmfhuy+O
 RIzYnWcMSskPnqiplQ0acvkcFnHZ01D+R64GuAL90HnsV6nwB41SSR3hSPqHOEPQMYV3
 R2kA==
X-Gm-Message-State: AOAM531oVuc/TVIxy2PavpYcSxz4AYQOzh7S2xuR0mpX0LerqWPRhIY5
 dSqOhcr0CmstEFMlPEcC6fE9MQ==
X-Google-Smtp-Source: ABdhPJy+zXksxAcSN75EufsBADoPuhChK3JsWvZAjPXNL3ClKCXJ80y1WkJ/1oQJsghUAMYjzltDag==
X-Received: by 2002:a17:902:6807:: with SMTP id
 h7mr31294827plk.22.1643809820674; 
 Wed, 02 Feb 2022 05:50:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/31] clk: mediatek: cpumux: Implement error handling in
 register API
Date: Wed,  2 Feb 2022 21:48:24 +0800
Message-Id: <20220202134834.690675-22-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055021_218553_C8804AA9 
X-CRM114-Status: GOOD (  13.68  )
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

The cpumux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 658aee789f44..499c60432280 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -123,13 +123,26 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_composite *mux = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
