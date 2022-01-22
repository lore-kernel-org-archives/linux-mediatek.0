Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6917DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBlHz6Cs9PGJEtVdwXyewnTiDwsJEkkpgK+19tRWRvk=; b=02RHvOacZdI6k5
	O2pMWLZsiFiL6lB2U9eP0Pd4v9ogsAFkJv1n9JwUnpRUD7pNFyP66t8D8guomxEMQ/vujWBLRvqAK
	yv68XnOKcEnfGDWgjCz0YulzDUjJUKRhgk7VLxPam2CFKBsMDnTntw2+nfjOahQUu8hD5jf9ykbgn
	P5i1wV2eQTBhnNyhQXDyDWI0uO1rPkS7X4ENiXp8lohoXD9EBGvcBO6PjumJyJKwaoBZm05Lu6JfK
	MH0BERDdvjHfD0X6Nfna1LmlJ80I9fdvlQnjJlXHRLu1xW/ZdWnV/c70+4mcPkp0RaTxhXHweXe3A
	zWyvbMxXB55wTaFLf23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCi6-00GwZu-4U; Sat, 22 Jan 2022 09:29:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXP-00Grgd-7q
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:24 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o64so11345088pjo.2
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OL43s5I7LNHYgmLD2gKEH5DLtt+mhRAmKo34NJ8rtwE=;
 b=Ggo0kYpwoWnwSolmdIbTiIGBqEoKYbbJGe28yVsffQtRCfNStfbzu7ufp6Frh7kLje
 tP7/f8uW+0pNL+bOuvU/y84/uITpHYEb4voWNxDpRawsGCYd/r3YXYAKeQhm0MdB4Mlt
 UhRx3i9YIEqpmxfnvwv7tKZDw0i0XRfWQqIWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OL43s5I7LNHYgmLD2gKEH5DLtt+mhRAmKo34NJ8rtwE=;
 b=j5g230TrVkIbO2fQNGnHmrNR3gKYAQTmOggX62g8U4qJb9s2XTgvOVh+GxuVaQEqIU
 BY4zKIiTD8igwCJI3rdnaBdHRGfiHZGZayopl1JopioDTF1WSgFhkjp1M2NuqfGOj0/V
 V8E/WpnqPLISl2WU2AD5cPpwNArRe5IdUoW6gDfptMhhx/mvIZbWedJ/WiJ7jiZUTvJm
 MVLu+S21wHYHL1mm/E6Bb+U8PfEJhTUv/I+LzHgpKlS7+HtWM7RugmwQsH5C50bEowgz
 XCsJcVkB8c64g1lDx8qkHY5PRjmrjk8T3oo7wIHb6QauCZOpyH58Xg6ZPN+Sdd6bpU+c
 lo9Q==
X-Gm-Message-State: AOAM532u7I+Bd8ckKYIt+1zK9RANXD3Irh11NmGN/ukoy+iqnETX9x0m
 vFSP0gymsUuwZYtCWqq9CTg98w==
X-Google-Smtp-Source: ABdhPJxYWG1G6A9uuQSoK+hKtiVNFyIt2rfYZvu/Rc9m92uJiLRu3G1sp2IZGb5nnUAghww4dGPDEA==
X-Received: by 2002:a17:903:32c6:b0:14b:3f5b:e9c6 with SMTP id
 i6-20020a17090332c600b0014b3f5be9c6mr89273plr.136.1642843102481; 
 Sat, 22 Jan 2022 01:18:22 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 17/31] clk: mediatek: Implement
 mtk_clk_unregister_divider_clks() API
Date: Sat, 22 Jan 2022 17:17:17 +0800
Message-Id: <20220122091731.283592-18-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011823_312111_FF1D8460 
X-CRM114-Status: GOOD (  14.83  )
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

mtk_clk_register_divider_clks(), as the name suggests, is used to register
a given list of divider clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  8 +++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b267b2f04b84..3a6dfe445e63 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -286,6 +286,25 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 	}
 }
 
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_clk_divider *mcd = &mcds[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+			continue;
+
+		clk_unregister_divider(clk_data->clks[mcd->id]);
+		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
+	}
+}
+
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
 	const struct mtk_clk_desc *mcd;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4db1a97c1250..e3ae22fb0334 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,9 +176,11 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
-			int num, void __iomem *base, spinlock_t *lock,
-				struct clk_onecell_data *clk_data);
+void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+			       void __iomem *base, spinlock_t *lock,
+			       struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data);
 
 struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
 void mtk_free_clk_data(struct clk_onecell_data *clk_data);
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
