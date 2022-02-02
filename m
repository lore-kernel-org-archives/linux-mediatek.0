Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usskndCmtyBp72yIwIj+8y2Rbv4Lk4MkOqm4X1JCquA=; b=LpQC4OxwzDk/f+
	eud2Va3yn4GRAtVRsXXtvqApk9N/WGGpwUHxA1/F2DIo3VZG9Q1+9cd0rH2bYz+DiKV6suSohNRUz
	jDFBglH0HkUnJQxdhd1VwI6T41j1k1JoE9OiXd23j1Wyx0lyKwYMVJKbkPrtqBhjS0hR6/4Zqiktr
	wq3keXo7fKMHMrdlob2Fg1Gbui+GqXR4VxT1qHTJiptOLSbGvnCOCV8q2UIeeo72XvhGlpBvz+dDY
	9/wy9OaPKuxEQK6VJoKxaREmxqNGTf2ZEUSIpkpCLOznPda0GEbDfFVoNQWIXpXHzdf1r04CW+Fg4
	S7Xs9Xfiy7CsC5gpdKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGC1-00FV6J-FW; Wed, 02 Feb 2022 14:01:05 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1U-00FPEG-Ml
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id e16so18363476pgn.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdqER8KY39o0M6o27IczZWTaw020kfn22yTWl5kyALY=;
 b=n2JpvMVhjjJwqFphVfrI15VQG+1JJMJYetDB/WjD2E8sp8Ij+mxAKVC47NL1bh9cxy
 OmLwDMeOBZkgOzmt2C6eXbDqkA2Lxf814gH361WFKjl84b+IxJSHBW75t/fkNG/o5c9J
 COqyZj7X+WUmh75irkthHjmowhyJYhq9S2Z4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdqER8KY39o0M6o27IczZWTaw020kfn22yTWl5kyALY=;
 b=CPtbx5lgqeX2AjzjywQpKuxkF3NDDXWJupNka2Okkj0q6TwpUkdVCqCNPk1CYxFvCf
 7WA9jyTuuPubzZ/uO/9lOImSYaUsdhWhWvnDtCdrdjSfUYRpUEIAFj+tBbmhN3vyyY8k
 XKjNbagpZHEBbNMsz+mQLHgwHNdB1YD8qvGJMlc/KLA3t3iJwTtIaDZdBLtbidiP4o8X
 7ZtLYA3SJv4nnQWVAnDM71o2OTsgqaufLCc/jUHvcIPNpi+UcIVf0gylVw90+/G0ftE5
 xAk+YQNPfSsSqL10tmCRVz50NNTuvyqXWAX8O8FDRsTUiTCN49qxQwQnl4OdKBKL/DLR
 xMvg==
X-Gm-Message-State: AOAM531gRvax8GeQiSegaVRVQCaPr0NtLYqW0mA3c4Ni1ksfceH55A67
 mX4BZsvidLVMAMDTz1lyTDPcfejua+H+dw==
X-Google-Smtp-Source: ABdhPJwCruA99cnWXBiBLPDrFAMecZSCJ1O6DvdO/JNkZf58An/l4/zDvP7K+QHNRULGEqTyKmJi3Q==
X-Received: by 2002:a63:6c87:: with SMTP id
 h129mr24978840pgc.530.1643809812274; 
 Wed, 02 Feb 2022 05:50:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/31] clk: mediatek: Implement
 mtk_clk_unregister_divider_clks() API
Date: Wed,  2 Feb 2022 21:48:20 +0800
Message-Id: <20220202134834.690675-18-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055012_817798_2C583260 
X-CRM114-Status: GOOD (  16.16  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
