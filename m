Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C90C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViUOP3M6/yK5oSQg5kvUCkbwl/miVci5lQ4qqdfwltQ=; b=kLzldXIzx+5zUI
	KNQY2yzYdx6zTRXOXGqdHa4PcxyL28/TORAlIi7a7o5ZfjiIgi8JnOHaWCSn24k0dPDGetIVKuGDd
	9OsmkUL949Sr0469kJplWV8JTI2u5173Vym98Bw45Th61CQQKq9Q+PPGq/65s7Gw2Oh5+u30ptKMe
	zIooBLQz327DpbbtnxqiuR8lWZbaqOu79c3tYwmfPAgFDomeQs8Oudie/zw0sEo9xx8qaj06R7unV
	U76N34C/OrZ5FJ5AdgyqMnRtwKDpxGovD9Ilz//1OfujYYp6yoOJqKdpMo9ODjVWqi/T6kUYEpKVh
	O5MHBW2EVxMn0lkiSEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAnR-00B2rW-MZ; Fri, 04 Mar 2022 16:28:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAaa-00AxqC-OS
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 16:15:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ay10so13433141wrb.6
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Mar 2022 08:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+My/nqfiMsUFME5jSzdOaKmEvDAySulF7VBL4+IJf4=;
 b=PnqV9wYmLqfFTc4OFJc5UAuaMvtmWEJJN1yL6Rm7H2Q2mStp4J3ChxMgn06ydCvXyK
 UVRtV/otmLgWI2azaSmPvS4xLdRkV3dkpCcAM6LMGr8w+AwDloylveLMcJBdDQosT0q5
 KPsoJe0mc+UridMf98U3NAi8nlEXwLZWoGI3R2UzOvVn1t8KlwaJZlZvWSBH4JdmARrb
 akkAOnaXLWabkA7OwsKaB8vjC2N/RQOQJb3V3D7vfckSt1zL+lkoaFiaTEfO/g8DDgbe
 zgYKdl4HKH63UGK6xrr+AByFwFqoA8+ajW49r1XlNolMOOXw3kyLLtWl1STMzHFKGZZ+
 zIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+My/nqfiMsUFME5jSzdOaKmEvDAySulF7VBL4+IJf4=;
 b=79ATAVmz0UPouXb42YZMT5AJqLb/6JUHW5bNw8lHluYQ/L53xVPp76pr3dsZjWGzE1
 smPvwZUaHGy82RaNxCG86DrwQni9KZiRgHCaPbpH7iQ92QJMaq8VM0Rh7nlEhuE2OmYs
 ITKq2HF2AXNtBCea6w5wXxpg4Usf/xNoUxa/D3WxjUVi3KuuBRjkVQbb+QT9/jE1eYOK
 4XW0qbboF4vNYEGJ3ZnvDVpDhmA/ujgXkV8ZZO+iLb1vsEA6orO7PWggKAQTdVN9P17/
 w7X5h57Vk9GGnnCWazFKOYIRXwTCr+sOHUrWkpY5qAiR58/CdVL3uZQP4UndXxxiTsZm
 a9nQ==
X-Gm-Message-State: AOAM53042ktpqD+b5mUbV4KYKS+2Dvdgecwam+y7LPlwVl+a0Zfs2BnA
 QeX6qn3XKZQbcuuPLczJcx63Jg==
X-Google-Smtp-Source: ABdhPJyfHIvzkrsMlpfQsnDvygOuOwOVs1EDwFq3zpjNDBuNMMUBYWWaEnz39fCgj1Cxh74/FkXKDg==
X-Received: by 2002:adf:ef81:0:b0:1f0:95f:30a7 with SMTP id
 d1-20020adfef81000000b001f0095f30a7mr13676692wro.636.1646410531281; 
 Fri, 04 Mar 2022 08:15:31 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:15:30 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Julien STEPHAN <jstephan@baylibre.com>,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 5/7] remoteproc: mtk_apu: Use match_data
Date: Fri,  4 Mar 2022 17:15:12 +0100
Message-Id: <20220304161514.994128-6-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304161514.994128-1-abailon@baylibre.com>
References: <20220304161514.994128-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_081532_901313_11F0EEFE 
X-CRM114-Status: GOOD (  17.13  )
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

From: Julien STEPHAN <jstephan@baylibre.com>

This commits prepare the driver to be more generic in order to support
multiple platform using the compatible property.
To do that, put some register values and the clocks names inside
private data.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/mtk_apu.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
index 3905eb5b7174..deec51b86ba5 100644
--- a/drivers/remoteproc/mtk_apu.c
+++ b/drivers/remoteproc/mtk_apu.c
@@ -58,12 +58,20 @@
 
 #define APU_RESET_DELAY				(27)
 
+struct mtk_apu_conf {
+	u32 core_default0;
+	u32 core_default1;
+	u32 num_clks;
+	const char * const *clk_names;
+};
+
 struct mtk_apu_rproc {
 	struct device *dev;
 	void __iomem *base;
 	int irq;
 	unsigned int num_clks;
 	struct clk_bulk_data *clks;
+	struct mtk_apu_conf *conf;
 	struct iommu_domain *domain;
 	struct list_head mappings;
 
@@ -81,6 +89,13 @@ static const char * const mt8183_clk_names[] = {
 	"jtag"
 };
 
+static const struct mtk_apu_conf mt8183_conf = {
+	.core_default0 = (0x10 << 23) | (0x10 << 18),
+	.core_default1 = (0x10 << 0) | (0x10 << 5),
+	.num_clks = ARRAY_SIZE(mt8183_clk_names),
+	.clk_names = mt8183_clk_names
+};
+
 static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
 {
 	struct mtk_apu_rproc *apu_rproc = rproc->priv;
@@ -289,10 +304,9 @@ static int mtk_apu_rproc_start(struct rproc *rproc)
 	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
 
 	/* Configure memory accesses to go through the IOMMU */
-	writel(CORE_DEFAULT0_AWUSER_USE_IOMMU | CORE_DEFAULT0_ARUSER_USE_IOMMU |
-	      CORE_DEFAULT0_QOS_SWAP_1, apu_rproc->base + CORE_DEFAULT0);
-	writel(CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU |
-		CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU,
+	writel(apu_rproc->conf->core_default0 | CORE_DEFAULT0_QOS_SWAP_1,
+		apu_rproc->base + CORE_DEFAULT0);
+	writel(apu_rproc->conf->core_default1,
 		apu_rproc->base + CORE_DEFAULT1);
 
 	/* Release the APU */
@@ -565,11 +579,18 @@ static int mtk_apu_rproc_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
-	apu_rproc->num_clks = ARRAY_SIZE(mt8183_clk_names);
+
+	apu_rproc->conf = (struct mtk_apu_conf *)device_get_match_data(dev);
+	if (!apu_rproc->conf) {
+		ret = -ENODEV;
+		goto free_rproc;
+	}
+
+	apu_rproc->num_clks = apu_rproc->conf->num_clks;
 	apu_rproc->clks = devm_kcalloc(dev, apu_rproc->num_clks,
 				     sizeof(*apu_rproc->clks), GFP_KERNEL);
 	for (i = 0; i < apu_rproc->num_clks; ++i)
-		apu_rproc->clks[i].id = mt8183_clk_names[i];
+		apu_rproc->clks[i].id = apu_rproc->conf->clk_names[i];
 
 	ret = devm_clk_bulk_get(dev, apu_rproc->num_clks, apu_rproc->clks);
 	if (ret) {
@@ -611,7 +632,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_apu_rproc_of_match[] = {
-	{ .compatible = "mediatek,mt8183-apu", },
+	{ .compatible = "mediatek,mt8183-apu", .data = &mt8183_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_apu_rproc_of_match);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
