Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIx32RCSs4T8ajLvqTNWRT0q9pRlmeYh5E7CqNQYzMk=; b=Da3jTVvT1uwn0E
	7wzD3VBjBMNRTu56evEPVpPoWHLSfKn0BKQKngKU7e6E1Z+HbNZYyyHJh4bHjRKBh6Pmr6uxBswtn
	iCNIJ0Lk5H8a4FFKWyEtYSMceI4WkF/tqyB4lGxaGSRXOJVmtAmR62U8W5/IeDLqREfucjNpmIVZt
	/s65knIDLtTtcQhOaZ8Tr+/Ql+I8gUErkNqDXFTOlOgQt0oz5Z4niUCIXEcjz014A7+6cAtORBjOl
	t3H7RtfAsZXfLLsKlw02wkhLYAWZUiCjOkLENQG5ebmp0KrtfFFoTQxMYxaRkIHiH6eoqb5Q1WuFy
	F9WRoH6/U10AAuSyJnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG55-00FRXD-9S; Wed, 02 Feb 2022 13:53:55 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1F-00FP1v-0B
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:58 +0000
Received: by mail-pg1-x531.google.com with SMTP id j10so18362307pgc.6
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZjlD3mrJU3KRhgIhEHQUnXO0d3r7KCSCVQooNCOn9c=;
 b=KogdZmATlMROP/F6aSz15lBpRSu2RQLF2SycEunEeLa1FXHgcV6h9NvAr67fnbWQis
 7lQEjjtlNg6iEVri/qEgOvPQNAhLS2zRUVGrZJtyfH/uYV8HiDBk8Z23Bdma80XgGK4F
 zjph6RcOMkbn7eBtStd5VnNBBwqT4IUAI4cNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZjlD3mrJU3KRhgIhEHQUnXO0d3r7KCSCVQooNCOn9c=;
 b=v1y9Zxo5i+MMvFtDk2cA8tDhNIwoARj88uWhE517gQ0b/EkuCk2XY3KvZ5J5rxMBk3
 KXAvFXuwzXa/wk+dQGLqs/K/8MNFT/daqDzMpoG8rlznVP5/+xibhO0+S60kQuOmmI8T
 oxeDhw+1AhsuFF+ImppXFZvEcpt1eNF0Vwwb4pqRfmgEy+q8BU5q4ziYIPkdoFKg/mg9
 X19oqGW0ZBMgwzhmxltSH56zfc7rBHRrKsBdfLYE9y0DQYIC5zgfmL4Ws9E/PE7fJZh7
 ZY/PFcEGUqDiGtHh6BRMBrCy1GN3MVzaiYVSnrFRDkt2PNpvq2zQBQdTZ6sPtM3a95I4
 Jyyw==
X-Gm-Message-State: AOAM532v8uCEeSZlCou4xEvM7g/iWPpVRdfykgCnZ6zIHHhKr2KG94DT
 t91J0HG1+SGDv1EoCv7my0v2Wg==
X-Google-Smtp-Source: ABdhPJyJAUdGvQ7twSvegXn6iv2II/t+vRes3AMNAo/+BTUsC44azlgruL/e4qWbpPr9iVXGt7AYJw==
X-Received: by 2002:a05:6a00:158e:: with SMTP id
 u14mr21749001pfk.38.1643809796527; 
 Wed, 02 Feb 2022 05:49:56 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/31] clk: mediatek: mux: Implement unregister API
Date: Wed,  2 Feb 2022 21:48:12 +0800
Message-Id: <20220202134834.690675-10-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054957_066977_8EAC2812 
X-CRM114-Status: GOOD (  14.06  )
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

The mux clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the mux type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 35 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 89f23e111d91..6f0c22a699c3 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -164,6 +164,21 @@ static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 	return clk;
 }
 
+static void mtk_clk_unregister_mux(struct clk *clk)
+{
+	struct mtk_clk_mux *mux;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	mux = to_mtk_clk_mux(hw);
+
+	clk_unregister(clk);
+	kfree(mux);
+}
+
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
@@ -198,4 +213,24 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
+void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
+			      struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_mux *mux = &muxes[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 27841d649118..cb2ac4f04c58 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -88,4 +88,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   spinlock_t *lock,
 			   struct clk_onecell_data *clk_data);
 
+void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
+			      struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_MTK_MUX_H */
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
