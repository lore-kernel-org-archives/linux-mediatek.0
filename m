Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D76CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8MD2B9MozJDs7Nhnrtb89FH1Zrge3OmuiWe0fCEue4=; b=d6xI4R9dzbnNIw
	aehKKSJOVGgIc7es/lp3tFLJX//0tVmiEOwMY3pOo71h1+Wc2D+tjQKIj0dh9ghg1XG4kbLJm2VXP
	5qDeMIywPmWASKOenCFC4Jc/q7K0H2yQ3Yz8A5LfAEKjUDegd0IoNgguexeTdkG0y/RuiAIY949cy
	uomAJGWPsGc9zs5a+IEI2j2VW9WOEwToQNjCxPoJup45hHvdPu1hYpJwQKp7fZEnXTkfZ15jiJubK
	0huKnwTD5nmg5EyoJ8dc5dmZT5Sf2i8xjvFyubeYj5ReAaO7fu10pPXlBdTtyCsZr73+clivId9gm
	ReR3DWyMfs/o+/VTEVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPpA-00Dnz8-56; Tue, 08 Feb 2022 12:42:24 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPnm-00DnJG-Qy
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id b3so149527pfg.7
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBFx2NNySizl9K48zr+VPwNldMAmerPdyAm7Jk3BRWk=;
 b=dKOOzV/fLazBCNFOIEnm1JNdL32Rklrc3AbJNCzgIvQQSjUM4aXSr94j4xzxA420JJ
 D8hO08EooGKH7idQcvWrNue3Isw+YvpvtEimDh2FSFcw7oRHBX0zj8OIb+SVz4BL/Hde
 g44pgl8RqHpLGee8woAw3B4+pA2cYunOCzqlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBFx2NNySizl9K48zr+VPwNldMAmerPdyAm7Jk3BRWk=;
 b=e2hmd6Hwu7K7TADuiDly1WmIblGzFYXmWHkL2p2w5SqalVl5Sg/RlJG4xv+UNXpO9N
 LRaIcIq08NzC+XyPQDwOc17noX3lFx8pLcNMLiNFKFHCdtcJqXbQQOrDxb9wfXPLXSz9
 1lMDhGXmAzFxTHNUhiJVsug0TDPzLAd7417WdexWaECoDCKBNVTsamtuv8JdEHQ8kTEh
 gcC92pAoStdt+9lzhD8OxPNJrSTSKKB7qysYO5ft/VDsyz2PTJHZ0TqIZ5D29E885yCN
 JWbLJ7av2h09pzpIIwnyT86KKErtw9jnSAoC3r+Lek9ABSqefMRWf2C3MLZSEQP+p55y
 NfRw==
X-Gm-Message-State: AOAM530z3cJETjxeLnR0a9+Ju+M5VSlQI7CxD+nxCeXPPFoWe9zRKlgQ
 4sXXyw0PfH6DRwKVZ3hJug3cug==
X-Google-Smtp-Source: ABdhPJybGo2oMnaPzu5i0PbVYfVuPU0yopXfczB8i1F8jCKZPXGGmiUODMzI2ZCp579316g2u8sY3g==
X-Received: by 2002:a63:5460:: with SMTP id e32mr3327867pgm.330.1644324057786; 
 Tue, 08 Feb 2022 04:40:57 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:40:57 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/31] clk: mediatek: gate: Implement unregister API
Date: Tue,  8 Feb 2022 20:40:07 +0800
Message-Id: <20220208124034.414635-5-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044058_913712_F555F36C 
X-CRM114-Status: GOOD (  14.05  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
