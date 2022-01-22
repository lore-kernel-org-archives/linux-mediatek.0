Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0166C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Onv5mRs8sHCS/RtqNECy9Kle7E7LcA1DW3Wkg1ult30=; b=cexaZAsM5/g33E
	PR6DkP19aAnazefcaT/84EIMT3q2Kkzobnxhqk/BuJ0Z9IYLtT9cyMqFfLVU+z+SrIgROaC9ckAjZ
	NY/4Nqonj2J0f9b+f6l89Wj7Hp2VA0VkUSedNHI2YQlJlJS+EGXj92V/Nq5XVIvZ1G97/AkcjuHhT
	omsbm2RyOu0pWLBO9OHfqGNO+Yu4ZHVJH5zBFHWYrSySljmG7rkWhSwjp0LT7e65bEoiU15b1EYga
	RFDcQWlxEcYiupacMY83Noy/fr7j+a9S70GZzSdTHHCQXQuTEwkNQv6cfewx+EaN8OSXXxz/GOunb
	9ZkRKFLDYr4wnVYqrN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCci-00GuNK-IP; Sat, 22 Jan 2022 09:23:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXB-00GrWg-OQ
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id n8so10903174plc.3
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0spPJqiyNma/JSwRciV7mlMnnEsvRwtK+rQFLo/is08=;
 b=R5I+rW3l2T7KAn4/rCa8lKm7eS2I2p6sSb3KmPPOSFkb/KVSuHM2ugYPUK2urOucUw
 c5fT9x7ax3oC7MX6mJoQlM1ax7e3Szh3BjrHbbzk/rFWLszCC+ly912TNdKHd4RpV+7V
 yJzMESoZicfzqEsL148u85ddGQQPdAixS56Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0spPJqiyNma/JSwRciV7mlMnnEsvRwtK+rQFLo/is08=;
 b=EDMrIZa3oV1iA+gp9LhIN2vey4WMIg2WVtuMG+SJbNq8VGOh20QB/wP4BPDtDyZrhK
 a1oLp9PGYTtNIN8h/VBnIRbm1iNlS9oTcXF7CY8DrFIC2xdgMoElEX9YTl/Ao+wtrd2D
 iesWRxOshWB/1SuYd1pXiqqGUPoL/vvKF54tahoBDVLaiWIHzbymnisI3E/d+ZifkRFk
 xH/vDSE8hHZLX8GAhFPPgeuLbFiLyJCvCHL+1J5KCvDugDRMVJMDRsHwiXwULHBrvQxI
 HzBuMrGsAa5jovtMT7XVzkDR3orVm3zcl5zWYq8dJr7LXQlqgcYwp8OA2BFyRiclZI1d
 DQKg==
X-Gm-Message-State: AOAM530VDGfVn4CcbXYMrcrS9ZjJ2BqQcbdPDhSEQHWH8lTp0JmxWjU9
 VHz/enjk0PRl+tHVTh2rEDfHOX00iobpmw==
X-Google-Smtp-Source: ABdhPJyVK4Mt3oHJEIY99aJdCQK6gKiDhx4ht4FV9+3LLoe55aexZOXvspZbiR84kJ+rQS5uLuDxzw==
X-Received: by 2002:a05:6a00:2151:b0:4a2:5c9a:f0a9 with SMTP id
 o17-20020a056a00215100b004a25c9af0a9mr6679544pfk.39.1642843077957; 
 Sat, 22 Jan 2022 01:17:57 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:17:57 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 06/31] clk: mediatek: cpumux: Implement unregister API
Date: Sat, 22 Jan 2022 17:17:06 +0800
Message-Id: <20220122091731.283592-7-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011809_840735_CD356C95 
X-CRM114-Status: GOOD (  12.19  )
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
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
