Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE37ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWLsSlf3IY6/8yP2iqyauT6KiWT2hdw6ljD/AqQrWes=; b=cOoV9CEEnKEAThRocBwxyQL0Fr
	a8HOs68Vuv51Z4gHPQNedMXhnS1HgG2LlVgUADj4xIsV+MKOlfG1RCdK1rIOB3QkvYLuuXT4RAJZN
	vmEPf5180QHxXxBFVa5annax+Q+zcYWFKYtX68nSd3Y2BhBWOnEKwth93V3xRqlB6XeO9FOtASqar
	ChJbWOxbsG18SiVueYB3y4hDNe6diwPzFp4vuS0R0gHnR6nEEDzrJVECEg6QblEWkxyUlZtWtFITq
	FhsvFWmOhYFtvaGNWZTBwD/Pbp3OGCMrrOv78aHPJ0s9rjn8jWmGv4XOPRXagZ8CNdvGQez/TebCw
	4cFOIrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavuv-00ALa1-68; Wed, 21 Sep 2022 09:21:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavpA-00AIon-U7; Wed, 21 Sep 2022 09:15:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0207A660036C;
	Wed, 21 Sep 2022 10:15:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663751719;
	bh=YKJyJNNGaW+Q4DqL0ADjnRQPV9Lw4hEMcJktaxCEYTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mtP2NztjkPUrI1OIyDyPgUhS+d3V0Wn8dkdH9bmem9U2ylLpcupi16ATgAnv17hE2
	 xpD1UB7Gyad6NuW7GPz/fCod4JLl79Q3PRb3aSc93ktBHq6kQx96ekYdUpftcxGiKT
	 i7BmybwNhTr+ZTALtDnCzxdOA8ogzsVkt0YvXPSVjzmmHTdJTimjmTza21fHTdYIxA
	 P1iYmUI5mnKayVw39CnRJlgoRtAJknCA/ozCHFy11UOw70zWdXBKpQvPeruURemyuB
	 kGpxCfkEbEIOjLF7v9bZ0YAigf/0eBhv2f+zJdv5Mj7hJdgiMB1oySwODBdw4zUzL3
	 +ET3aMD2tzKGA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	ck.hu@mediatek.com,
	fparent@baylibre.com,
	rex-bc.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	ikjn@chromium.org,
	miles.chen@mediatek.com,
	sam.shih@mediatek.com,
	wenst@chromium.org,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel@collabora.com
Subject: [RESEND PATCH v6 6/8] clk: mediatek: Export required symbols to compile clk drivers as module
Date: Wed, 21 Sep 2022 11:14:53 +0200
Message-Id: <20220921091455.41327-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_021522_691782_73D1E68F 
X-CRM114-Status: GOOD (  10.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to compile the clock drivers for various MediaTek SoCs as
modules, it is necessary to export a few functions from the MediaTek
specific clocks (and reset) libraries.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.37.2


