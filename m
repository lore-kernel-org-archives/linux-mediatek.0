Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC21C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBh4Quo3YJKk+52Ga7jHJGorUocKdfxdGFXtaloySvA=; b=CgQoK+AN5v4VVSS213sqiHSw5o
	4zV3N+/jyo/vgGgW4iQlG5KzrbVTVgTVljSFj8qtFusGFGYJ8OabSjzJN1Vtkm0ONYQl7mbW81mgh
	W1REpgbh5N2zwkbiBO0i03YpSFxUJJbNWWXDalD+BqMs+gmy5Yk2l4B5rUYvfYgP2QrXwdplzX4mZ
	wiNoaIynzgrjssms37NbUcgjX7OL3Ectd+PwjuhPPPMZK0b3rFLjzKjBQT7Pm1Bm8yk5uVJLwlhYe
	sVeNtNbDH/Kf0tYMOUu1bRMsmbN9jwvwq56FOmdxgMdUnMtA2rhjQmgTcDOBO4VlUpp+WGXl8Fx8a
	O2MA93pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LGi-00CCGN-JS; Thu, 22 Dec 2022 13:05:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K58-00BXc4-F4; Thu, 22 Dec 2022 11:49:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 924936602CE4;
	Thu, 22 Dec 2022 11:49:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709789;
	bh=BelWIyFvzZ+ppaBjnTg51Px56ewLTSYDYBP45U3epbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8NH4b2qx3jDGD9TmRBBAkZplqwp/uvBLCiDUxxmZ6cuBdAlWbEwmzvDr/lM4Mlul
	 JAlRXq6d8GQ0EHfkeGygbIpIeggqQb7E7OCqCB7bOBMJZHTYB0fGSFitwVjds2vLW8
	 O8DcPggjiW8kZvvjNQNpZ3IJe0LrZZRekhlqXeK4vbBrfbyWfgzcFzj6gYVAtodBvt
	 9MYeSwDdRmsTHUriG+uMvPN1ZjATKHbUWGcg0M8turkTwPIuELF6EIKGw/0akAO15Z
	 8/PL144AOMXaaMn30EiWf7CrdZ5Tb+Vu7ueWl2bst20PEckkXjIBKtOM0xMg5wgWqx
	 mM8PBBnV6MkqA==
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
Subject: [PATCH v1 20/25] clk: mediatek: clk-mtk: Register MFG notifier in mtk_clk_simple_probe()
Date: Thu, 22 Dec 2022 12:48:52 +0100
Message-Id: <20221222114857.120060-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034951_072010_A92B6BC8 
X-CRM114-Status: GOOD (  11.42  )
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
index b0a6225cd7b2..df6281492fb6 100644
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
index f49aea3fb4bd..aa4d469134d8 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -229,6 +229,9 @@ struct mtk_clk_desc {
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


