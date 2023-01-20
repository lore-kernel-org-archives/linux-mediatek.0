Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F58C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snza9X6zJt/8WGo2gTops8lbx9NJvo+SSINcOXc+/oE=; b=wKThffWkaRumzAKLGsac3Y8tG0
	hFU4nVzZAjgUXiQdbONS+eOzrft7fhqUd0H41id1VKbKfsJWgVShdOWddhVzuE86KUo04ad2Pv8da
	aI6Bp9Hn6gu7ZgU8H5abwjiRnwE+rPSSfdMOuNENhHA2ZuoOwAMdIMaU2pLI+ApBNbdG/S8PmnbO7
	bfQFWfikRAQCk0tEpCPmzjhu8Y+vIuBTAF828LgLoC/8eTg8SsDsQXB2ExtNaErPVk/QEZ10LrVtD
	g96jBirpzhy0cHrXKFFwnvN0n8LLyH8hUHeNf90CczrloXSzbiaNjbbE/6+JOPCYsdvQNCOEAmag8
	l8tdXneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIo1u-009WxL-44; Fri, 20 Jan 2023 09:49:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInaV-009Jxv-4e; Fri, 20 Jan 2023 09:21:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45AEA6602E83;
	Fri, 20 Jan 2023 09:21:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674206489;
	bh=lcznLPtgtJvQ60PU2ET5xSjALXesFcVHBES0BrXeFys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=beMomBTFbEOHG4rWdJkH52yabPWOcak0HncGkOJfd0tX/mGC9ixXUD/yM6yEjftlM
	 jznF4mQSrdcST8eSL/EzcDW81fVY4tUqtB3QKtj0Lju7ga75wFK5fTGo/FNE6h8LCK
	 5uJ4NAA+3e+CEWJ0LBthwzUjxVeOMFyKSyK42bL8IPnoAloB4R3VKuu2pnmK5iA9FC
	 n3wEKlDA1vc3XFCEry6cEBAhoolLdp4W08OUPBcvNu2TDmp4WLxeO2Nmhwc6dRv2+j
	 hUppv2WoUI2hFwUlD7NT1y79QZIdoIF+ChvNQ0G/RyYFpk0Y8oIPehx0K4qnbNi4Di
	 tZjRAOpYdxelA==
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
Subject: [PATCH v4 18/23] clk: mediatek: clk-mtk: Register MFG notifier in mtk_clk_simple_probe()
Date: Fri, 20 Jan 2023 10:20:48 +0100
Message-Id: <20230120092053.182923-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_012131_533105_7DDE858D 
X-CRM114-Status: GOOD (  11.56  )
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
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 8 ++++++++
 drivers/clk/mediatek/clk-mtk.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 281d30d6cb2b..c90c0a6b501b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -534,6 +534,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
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


