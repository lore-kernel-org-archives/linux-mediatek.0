Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389FEC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+bdDDj0VWe7zaMtFzYBbfXedAZE41lkIPMySVUx7xw=; b=z24b6cmNPbtl6gtRiq0L+bnzEO
	byzONbao3ZZP/Ss43n5YqtFabhE5/Osbxm4RQ20ElWFnpj7Y4chfLEYQOG6jq49yxG9MCb/IjGUQB
	FQ9wG36y5+qBUOaVSc+3V2/xoqFDf+7wTpejRlHpTw0iXosj+7Tv5waUzKNpfEgcZcA1G9om990jk
	+FiIgtQHK+/QX4KiJrcN7nWJ4upN197g5s1RRf+Zn71TDN/j6eG87YdnUhekt3v1S99s+/K6v1UoD
	e6PWMVIeWJTNBLVTtrkNWyRm7arDf/6ktbI1jggZjKbfYWwZevKoWb4HmoAFEgZ/J4ifVnvv7yTy/
	H5ee4OGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIFi-002BGw-A0; Fri, 13 Jan 2023 11:29:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHuC-0020jD-Ii; Fri, 13 Jan 2023 11:07:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D97596602DD4;
	Fri, 13 Jan 2023 11:07:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673608047;
	bh=soqoVSF9tVJj9LPbEsm5KtjYNzQFuQRSnoVxuMrxji0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItpW2T2jfkqnJ2rCC2xgZRIqfoVTm/IwuJl8MxbMKnuLQEGDZurmM25ORskRKAt9k
	 yeM/g+97m2gOp/Y8Xd5sgyVPB3HrGQy/czHNl35bLKG50vfOTggOyB1zw5TYt3MCKI
	 jzD+AifSOzhQ5Ibdls2FQRZ7DnTD6TLs5HdDNfFiZWlAEl4amwZkm5Hhn9PWDgMCOn
	 EaZA16rq/+J2e8jpsJqNerINgHmCoVKVFe2HZN3M04Q9xr34E3+vdKRvR2potk80MK
	 CvIs5SxB5zdeB07JcfMbkGfbjjOkdKKSa3L2bV/9jNTzEd25uY+HqG9c+VBgom3yu7
	 hG8uE2/Ai5xrg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 18/23] clk: mediatek: clk-mtk: Register MFG notifier in mtk_clk_simple_probe()
Date: Fri, 13 Jan 2023 12:06:11 +0100
Message-Id: <20230113110616.111001-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_030728_828946_A0EAB6A4 
X-CRM114-Status: GOOD (  11.71  )
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

In preparation for commonizing topckgen probe on various MediaTek SoCs
clock drivers, add the ability to register the MFG MUX notifier in
mtk_clk_simple_probe() by passing a custom notifier register function
pointer, as this function will be slightly different across different
SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 8 ++++++++
 drivers/clk/mediatek/clk-mtk.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 171d6dfc880b..82faca9a8771 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -533,6 +533,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 			goto unregister_composites;
 	}
 
+	if (mcd->clk_notifier_func) {
+		struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
+
+		r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
+		if (r)
+			goto unregister_clks;
+	}
+
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		goto unregister_clks;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 1bdaa0acb909..41f4fa3b0c21 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -231,6 +231,9 @@ struct mtk_clk_desc {
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
+
+	int (*clk_notifier_func)(struct device *dev, struct clk *clk);
+	unsigned int mfg_clk_idx;
 };
 
 int mtk_clk_simple_probe(struct platform_device *pdev);
-- 
2.39.0


