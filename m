Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B85C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrVA3J9vKi0Bl9jkT31MDhQx0dLGVadI/JhTCXWRRYw=; b=I+IPyVWbg7dAAJ
	zWpY5HpWzDwgCmeF+WlqmcjfwoZ9byNg9ov+BB3G4rLgzsLi87o5UK1fdTMuS3wUkXy4mYCFbj6mq
	TfbvY6zmjvTbU3DeD8T3vcGTfn4r/86EP4279ZCSnP3/ADdp/joRxVGi30JjW6lKo4OF3tI7pdoVR
	rhNNWvlUPt450wVsfkNY7fhyyMNxQwrbwsICfkiUieEHox85G+yonQ1t9NTOepi0KX/O1ulg88nwk
	cj8qKxgIah1fyoPIzgMSO4ndsWSP+xAUWDULjxE1teE47M8cp6sc8UxIoOqdwO51o45Novgzm9ErW
	A96r1e/2OMX6t9p+hdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG3Y-00FQca-Q5; Wed, 02 Feb 2022 13:52:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG19-00FOxj-C9
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id i30so18824881pfk.8
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PAT5iAIzHvPdv8HvSTIRh/VZmmqGpu7uXPWf6w5slEo=;
 b=aT66B3ceArqj3A+My12rUgKDeIZDNAyAaKTXpJwq+IRh6cHvAHtFutZl6LADWDNpIS
 6cn26Ot9iaUON3ThryQ49iPhKw7Zi0VWGJkPDD1vrz88/NX3NGIyW3XVNCnGYFb76f2S
 2MjQy6svJ/3ARBBrPlrMST7tSK3EI+QqsIsbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PAT5iAIzHvPdv8HvSTIRh/VZmmqGpu7uXPWf6w5slEo=;
 b=1XfoyYJnF1YB4I1XY2P2sha5S4EU/ANHNe6jzaBG1f/Yx9+TVq+ekUD+MTBayqCzZJ
 BlDvKY/YPhMIZTmTvVEUo4SQzPT1R5Dk/91IW+ZRAQb58Ythj1NFGCg2XUqsXjAdImvf
 /9sJBurFGPE8HB/HbO5378sO295UcgurNf1oOQnOpGSAYCdW/r9LvjvRqX/Jf/lIw2iG
 05yV+sVFnTOn/Y9js58Yylk558KfvKGXOW01kc8nR47rnYbu3TGBm6580hpg0Yb4Aq6R
 YMCUuYyws1DZkCLhLzy3C46uVyPCDRdJX2tpj0lB2EgvOGGMrJJfs9MvxH1eRhlyaFAy
 ufxQ==
X-Gm-Message-State: AOAM53303dk5A1/S3S4kyVp2twqMEq7rbibKOitr6B2ygIQQYG/6224D
 gNz7LVCtJZyP92AqmpeOwnNyOg==
X-Google-Smtp-Source: ABdhPJzG4Q3lOFHtjmjY2NY9uFw3Smv0rstZjKXfu8HTfaJsZcy3bw3p9dDCi1Cn5CUyDYqxAzg7bg==
X-Received: by 2002:a63:88c6:: with SMTP id
 l189mr24612847pgd.229.1643809790552; 
 Wed, 02 Feb 2022 05:49:50 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:50 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/31] clk: mediatek: cpumux: Implement unregister API
Date: Wed,  2 Feb 2022 21:48:09 +0800
Message-Id: <20220202134834.690675-7-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054951_425473_973136F3 
X-CRM114-Status: GOOD (  13.52  )
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

The cpumux clk type within the MediaTek clk driver library only has
a register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the cpumux type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-cpumux.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index cab5095416b6..99a819e3673f 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -77,6 +77,21 @@ mtk_clk_register_cpumux(const struct mtk_composite *mux,
 	return clk;
 }
 
+static void mtk_clk_unregister_cpumux(struct clk *clk)
+{
+	struct mtk_clk_cpumux *cpumux;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	cpumux = to_mtk_clk_cpumux(hw);
+
+	clk_unregister(clk);
+	kfree(cpumux);
+}
+
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data)
@@ -106,4 +121,20 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 	return 0;
 }
 
+void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
+				 struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_composite *mux = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+}
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index 2aaf1afd4e5f..fda7770fd803 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -19,4 +19,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
 
+void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
+				 struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_CPUMUX_H */
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
