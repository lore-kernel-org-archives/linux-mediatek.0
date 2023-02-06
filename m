Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95D6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3NoKHmiWsyEHv9ud0FVk3EYyw/c0MZ18sFSgoiQkE8=; b=YCAfCh3BGegKyRDLRk6vVVnxOY
	tRQFkonc8CsxVIJcGQUEm0nkJefk68S5bs/YI0pr1iTFIjViHtzQ02n6/APTPB6ibvQ3PBMabkiK3
	fkD8qrKRYeHP93D45X/4PkekGHs+Yo+v5xHGvoaJkAxIIbxN/90WNxZiaxvTRADsVi2oFzzx7rxhM
	CRpKhWgHHyr1jHnozji/gntRehNesyVZWzx9GH38xHulARr1NLYUX3UDCm46nmXpoelFkixrFtrjE
	YmD+KYUQBdvLEmQT/DwTpo7jaI/pBvAFObVs4pHBuT+6B8pO2a+loxB8C+C06FEfEVTin6g2OgQbU
	QLBoyuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyKF-007zej-15; Mon, 06 Feb 2023 10:02:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyJM-007zCP-Ru; Mon, 06 Feb 2023 10:01:23 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E5F86602FAE;
	Mon,  6 Feb 2023 10:01:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675677677;
	bh=SUI34CS1BrJFmIaipPdxWm70cNWYkj8EhbTlIi7RZKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRYJBOAsI4wIgnf2YkdFZADBhOfijn33uRNwDyexhlxJw7+ZfNe4ELRmzUAGiAckl
	 x/5869CPo/hg5dgqSijs1I2ggAIs1xzVw97/Ta/2FmLhYpWBzDkLm2aLXXi2iqrNi8
	 csLUh+PB04G8Sg+0QfPGcgsd8GfSIyFlGfbH/Musk+0tLQNjYmLtFTlzjmfN4KWOuT
	 TAx02L1Wv/C2eGZSfktGALCo/K130v25tUNyMHpxp99NiJwuMKRiOQwPWXeKRdtjzd
	 ouiYnuvCsyaeoQMPPlajdcNHgUqcRxOjXEJQkKW4Nodhd72AXt1O6lASdZl8/iVno5
	 Aii5GC4Cq85Hw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 2/7] clk: mediatek: clk-pllfh: Export register/unregister/parse functions
Date: Mon,  6 Feb 2023 11:01:00 +0100
Message-Id: <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_020121_083590_9CBC5C02 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

These functions are used by the various MediaTek apmixed clock drivers
that may be built as modules: export the common functions used to parse
related devicetree properties, register and unregister the PLLFH clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index b9297726f5a0..7b6e051443f4 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -103,6 +103,7 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 		pllfh->state.base = base;
 	}
 }
+EXPORT_SYMBOL_GPL(fhctl_parse_dt);
 
 static int pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
 {
@@ -247,6 +248,7 @@ int mtk_clk_register_pllfhs(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_pllfhs);
 
 void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
 			       struct mtk_pllfh_data *pllfhs, int num_fhs,
@@ -286,3 +288,4 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
 
 	iounmap(base);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_pllfhs);
-- 
2.39.1


