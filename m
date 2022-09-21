Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E503BC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8v1jfGIlJuunw5Cpt6zmV+12J1fY4Egp4vhpiWM+0TM=; b=Ts86ELYm/6L+x+IRJ4LrOX2rCq
	1IRF9g1XifiYMjhpShoSJ3JDVUxresWc8i8crS2hphV1OGuP0aW9tkDUuGN8OZ1PBVw5E7qUE+2mr
	Qm3EO4uk5u78UAymtXA2nfKjUkWG/w6j4fK28rkBWW+I5qrpi5Nxtmg+Nw8ouRBny6HlnMqE7hagJ
	NSqLD/2rLoRn0VtQ/LOU09DCw88sdGEA6uB5uBf+EkrrDI+lAmcS0zosiGEPilc7sdaXZD5CIx+eG
	HSRPwHtzohhoXDaSLWApOiHpoUqf1c2ZS77nUhYPYA4DgZ4bPVjR/v/mnjytrbI10zHbH3SwQ98TW
	llQAYsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavuy-00ALcK-U8; Wed, 21 Sep 2022 09:21:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavpC-00AIp7-9f; Wed, 21 Sep 2022 09:15:24 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 72C556602028;
	Wed, 21 Sep 2022 10:15:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663751720;
	bh=/154pUNJ44grFXqJRcV6FEo9+3ZZSy2/vfCsiBboVF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=foJ0C5NYi0WPOm1K8zVonIYepoETfalbtxTAi4U4wRjrszmkr+BHh56zEdWC9kEkz
	 3xPW4Yp7JsCNbYJn5nJ+gF8EGNkZ5K6gjImgALxOiME+DcqVvB1xixBOX9RU45iSER
	 mLWlA84LLZm7eoHNhY2RMlEW4rMSRvZ5/s0rout1BIF2WKoAvZtt0lqHj3M+uWrN9T
	 3/0u8uMmFhql9ENBSe0lYdKuRAuOHUXG2iT4P75aXe75T8uLH9zupxW6kLsilHS2Qh
	 B0FlbKFpc+KnK7VRLz4W77IoufXNm2EAfxGPP5BQTAXVJL8jxrN2rtmwlXNfHEG0RW
	 4FpfLkPnOInoQ==
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
Subject: [RESEND PATCH v6 7/8] clk: mediatek: clk-apmixed: Add helper function to unregister ref2usb_tx
Date: Wed, 21 Sep 2022 11:14:54 +0200
Message-Id: <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_021522_605385_9E80EAB2 
X-CRM114-Status: GOOD (  11.62  )
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
2.37.2


