Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0481FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZHibQGfP2VDkUEJMsQx85fu0Vz8frQJ1G0AiMFoQ1M=; b=LOFmInEzl6ZUzD
	CS+Jgstj0sZi/H13PYsC+fFgQMYrWM1xGTmKrXWXPqQB/qyYm4VYnvAMWX7EAKk5dL3WX8lHZm9pH
	HiMjlmkvpQyzwoiSBhDR6AieBs+/odQzcSkHRlmaWeYSUmtOR22XYnzeTHNzxnUBymLKrIwxJjSM1
	xJeZw+NYWAcPBo9pmRvAVNYdhC5tR20rGGAKzDhGHHpGczk1M5+6Rqj9v+YRLNx7/4EvyOnXJommm
	DwKuZjZcaFlynpCCCgI253pIV203Olnw5gwgeOzRiEqijb7zju4q31noIkrn8Dc2GveTXL/WW5Bho
	r1/YiwZU5m0/ClpsOC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrHho-001T2l-FG; Wed, 18 May 2022 11:19:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHfz-001Rtt-VU; Wed, 18 May 2022 11:17:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 316B81F44F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652872630;
 bh=tM2NCHISdeqiBeyAihI46o5xT7S0JD/iOFvY+O5f134=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BJv9xjvcP4IElo/guUDQn5PT6u+KDJYzf+uNfc6sUGn63+hDRxLT4T3bTFO9Q13ua
 E4UmbjTVxkCJoy3GuJ0XR0tVBuHj/NsnWzuDwa0ZN8jUXAZDCaPmbEdt9Z8gf6AQj2
 e6Gom9ZD8nfsNRaCChwSFda3R9JQ0wAvhySHtCodyUrU9BEuPK7/3oqnRtR5mFjuy3
 zWOdHydzu+sI24gBX0DUB5D3VaQL4Khea7jsQ2HH3aH52+yyIfPSucf5Q20Axo5eU/
 gXhtPHViaX/74Xzul1Cl2/Wj/0gEQWVjqCrGGn1QzrR5g8uwnlnwGZwX/7Dw5huwoq
 3bXnMGq9CL/VQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
Subject: [PATCH v2 6/7] clk: mediatek: Export required symbols to compile clk
 drivers as module
Date: Wed, 18 May 2022 13:16:51 +0200
Message-Id: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518111652.223727-1-angelogioacchino.delregno@collabora.com>
References: <20220518111652.223727-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_041712_218001_7BA20184 
X-CRM114-Status: GOOD (  10.63  )
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

In order to compile the clock drivers for various MediaTek SoCs as
modules, it is necessary to export a few functions from the MediaTek
specific clocks (and reset) libraries.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-apmixed.c | 1 +
 drivers/clk/mediatek/clk-cpumux.c  | 2 ++
 drivers/clk/mediatek/clk-mtk.c     | 2 ++
 drivers/clk/mediatek/reset.c       | 1 +
 4 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index 6b0ab0a346e8..f126da693a7f 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 
 	return &tx->hw;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 2b5d48591738..25618eff6f2a 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
 				 struct clk_hw_onecell_data *clk_data)
@@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
 		clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 05a188c62119..41e60a7e8ff9 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	mtk_free_clk_data(clk_data);
 	return r;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
@@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 179505549a7c..290ceda84ce4 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -228,5 +228,6 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
 
 MODULE_LICENSE("GPL");
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
