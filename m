Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661FEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFNj5BZd6PevbxHhJM+fSVsMB1RKe78sQYIAW9HhSic=; b=ME6w82s11L3U0zpTNNXfGgWYfa
	giGBKuONOiAMzNBoLinYutV0uEHAqEVqLEnnAoF3+kA2NBVLlqR25BJKY2KxaKhHoMnKjPbu+hyVI
	wRJJ+DNwRBtT7vndBIcJHzSILwCtKtBS9nmVV0Ox8ieabmsPceSib0mjjQ1RzECYjMn/Mzd/dNx2y
	ox23HywOI+84SXdQgFIXmhiw6EBhDAw05WR04KMVVHtRyLC4iYD5lXEZ8SLItHDZkstocmsyhD+71
	bFOGokgW2qXG68S3GHTZB+bF8q+hLq6QluZOiih1L3RhyqAgOMM++9ze6EdkHC6e+C4JspEGY3+6Q
	8jlj/DSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEof8-001OP6-2l; Fri, 22 Jul 2022 09:09:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoc6-001LrO-FJ; Fri, 22 Jul 2022 09:06:27 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D394E6601AC4;
	Fri, 22 Jul 2022 10:06:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658480785;
	bh=mMJ3K3TbXn/UUL3S3d3jiPJuEaitXGiVGUupceF1OPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jrOBiCnS/BpRMjPT9WRXnEsL9rOV8m/wdtb2QAXOOhWO5TSofZfCO5+JCVNAgsAtX
	 ehbKREA2qNsN0V2/HTgCDHM/ft4MLcp6QEysX8GF9ljG/kiFQo+k0W9U8lwFkd/5QN
	 oT/95BdGOokcQmqEpGQO1yHJJk3RiArj52wreVnupD48bGw9Fu5OLK+V+jxl05tbDd
	 JjYi4V5eBJm4fwPVI+mjZ0vEJ4fLfLjo4JFv6Z8QbS9nB7MFwPE8IlDFF+ovqJ91a2
	 QZcMvHWpQxtTgwqZ6K1vjA29zLlKVDOsxrbx2z5rIpCtyAM8CPlq4oMitc+mWPxNwk
	 i9Vd23RKtivXA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh+dt@kernel.org,
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
	paul.bouchara@somainline.org,
	kernel@collabora.com
Subject: [PATCH v6 7/8] clk: mediatek: clk-apmixed: Add helper function to unregister ref2usb_tx
Date: Fri, 22 Jul 2022 11:06:08 +0200
Message-Id: <20220722090609.52364-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
References: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_020626_669352_79ECBCFB 
X-CRM114-Status: GOOD (  11.05  )
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

The ref2usb_tx clock was introduced a long time ago and, at that time,
the MediaTek clock drivers were using CLK_OF_DECLARE, so they would
never unregister.

Nowadays, unregistering clock drivers is a thing, as we're registering
them as platform_driver and allowing them to be kernel modules: add a
helper function to cleanup the ref2usb_tx clock during error handling
and upon module removal.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-apmixed.c | 9 +++++++++
 drivers/clk/mediatek/clk-mtk.h     | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index f126da693a7f..60e34f124250 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -100,4 +100,13 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
 
+void mtk_clk_unregister_ref2usb_tx(struct clk_hw *hw)
+{
+	struct mtk_ref2usb_tx *tx = to_mtk_ref2usb_tx(hw);
+
+	clk_hw_unregister(hw);
+	kfree(tx);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_ref2usb_tx);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 1b95c484d5aa..62d650045cba 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -188,6 +188,7 @@ void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 
 struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
+void mtk_clk_unregister_ref2usb_tx(struct clk_hw *hw);
 
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
-- 
2.35.1


