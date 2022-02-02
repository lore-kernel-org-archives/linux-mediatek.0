Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC72C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcYSPG5ng0uw09ZvfPO6+ZgUzGGQHtdaOl53u5uSJTg=; b=mWtJpMn+k4mQ3G
	elNRM3CRLta8iQAbZvVBCy4zKIoo+LpAP559ZKhpLZ3GW09gVnbnR6gFcnr4l59c12Jzd9Gcqichy
	lImpgyXp6AosKj9KzRWselUHmZhuf7uui4meiwugKFZvz2VQo6uJFsjxTDxetmG3GURmR4M4WUj8U
	/Ri+nmm6fTz0j6c6XrATHUft9grcbGtU7VuvDssgTueCeRxqI/OtW6bbpTXKmc7ZzqdCABuo5FTWO
	n10/fdUqW6W4UuiNSrGo6eRmtVyLKT0dbP9cjr3XmoWafVVujIIHWJ33XEt6koeVKwKQNZrqT6O1a
	9JCt/QJwsOx37x+V/DYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG2f-00FQ3x-Ug; Wed, 02 Feb 2022 13:51:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG15-00FOve-9v
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:48 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o64so20326072pjo.2
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMf5nn0OsphTZ/Hydc0tEKhYqnEvXUsEDc+DYG029q8=;
 b=D1FG1V52XitFXeVkZqAsn3QQZcUCbdgmnDi1C+T4ZeKRV5XYbuCYvD2EJY9qjTKCpb
 MbAGy2uJfxe59OBmHq360f5NmvFRHApC5Al8uvO5R/D4delH7iNnMbbwp8ZOIzZLJFm3
 xz2mFBH6KjdxEslLp3g5Eb9Kekp0dEZku3FL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMf5nn0OsphTZ/Hydc0tEKhYqnEvXUsEDc+DYG029q8=;
 b=iUNYP6D9DUFwONUnSxcjft36/OsJoTtOvAqte/v24jDKBQXDaLua9OUYSUWWrevGRj
 Rp1rc7NI/LQGGn4vQmGVk4H9HCA3pD1menTqQuXPoJrw7azbVZOltvRJtgXZAJogSCqN
 OF8DxyJtIxu2Vqgy7Qk+qKhrbjmymf4dEHNlFymLyUxy9RNkctY1778hfLZrX8FgR+Yz
 aIDwY4OvcfftkOzwWMVYA5LiIc3eNQOhiOf+9n7C/96WgnMupxrRImwJowx2VcieZo1m
 MVcI5OfbQr7AJpKp8osBo71jaIkJyrOtxJtHA0q6WnZrDyrgnt8ooWwwit4r6cpGBfSr
 Eh2g==
X-Gm-Message-State: AOAM533K7nZYYokJeswz1KCgAoIdfP8/wkSMr18eS9Xuet0clvX3FaP4
 EuH68BWKJ+2XFAoJ4rdcf1HXFGphRDYwYg==
X-Google-Smtp-Source: ABdhPJzO/sxpRO82Jk6BAZ8mlR/cHgAnt4r+ZC3pxjQmzzd5jN8tM5TqUBAd/Z1uDl1xDWJQs63yKg==
X-Received: by 2002:a17:902:6f10:: with SMTP id
 w16mr4474576plk.142.1643809786494; 
 Wed, 02 Feb 2022 05:49:46 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:46 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/31] clk: mediatek: gate: Implement unregister API
Date: Wed,  2 Feb 2022 21:48:07 +0800
Message-Id: <20220202134834.690675-5-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054947_373188_8CBD348E 
X-CRM114-Status: GOOD (  14.46  )
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

The gate clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the gate type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-gate.c | 35 +++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-gate.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e51cfd8c653c..ed1ad5535d41 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -193,6 +193,21 @@ static struct clk *mtk_clk_register_gate(const char *name,
 	return clk;
 }
 
+static void mtk_clk_unregister_gate(struct clk *clk)
+{
+	struct mtk_clk_gate *cg;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	cg = to_mtk_clk_gate(hw);
+
+	clk_unregister(clk);
+	kfree(cg);
+}
+
 int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    const struct mtk_gate *clks, int num,
 				    struct clk_onecell_data *clk_data,
@@ -244,4 +259,24 @@ int mtk_clk_register_gates(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
+void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
+			      struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_gate *gate = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_gates);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 3d75521ba20c..344adffb6578 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -55,4 +55,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    struct clk_onecell_data *clk_data,
 				    struct device *dev);
 
+void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
+			      struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_GATE_H */
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
