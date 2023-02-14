Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F78C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQa1dBESky9MKK3k8OhtaXWES2WtnWLfqSX+SDsVBCY=; b=p4BQs+s9KZLcgBl8sgmoCoFSVS
	obdrQm/Bz6LmA025bprPB8jrm+aGpnD0ocoD9elZuFQh9DVMuziSIamZt2soUGsmfYG3tJ/jcn6xr
	Lu1fluitSVIXSxhEBlnL+TOgbT9zm/U3DUO6bcc13YPdF2hWa1bkPKl/ggtLbaavmf6KFHG4uAt36
	9rlNmXnGqCdeBwwHEizlpGWX2s+YWlTIIgDGzItV7pEE5PSqieZKh+pIIcNgid9fB2KvjgbhocYbS
	soZ0Xw6cvnaH9vmQu+NeS2SQhrFK5pzbKnunEev0S5PUs9EE/8LDZJ9Pf+zU/vmnQt4m7D4cIPf1N
	H4v5Ra7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvuI-001wcK-Jo; Tue, 14 Feb 2023 14:03:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZf-001lri-2b; Tue, 14 Feb 2023 13:42:24 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2580660219A;
	Tue, 14 Feb 2023 13:42:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382141;
	bh=cNa8K+0qn+HcT679QB7ARYQ4o3o54C7wLITmFg+Awgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+mRf+tJpAaSV/xKM85QuX5HgbbHmSpOS1/U6LmHeyfrryDCKFfYNhYkJChvUBiRs
	 Z1uHGjRxNBJE/AAufEbKfpkAb1bhRPt37VzyTEvKXsqTN7u9WBSKtyjJ/Vk9MW+7O+
	 bbBMSmQGcRTjAT4YlnjyWbK7amFvOPTt1RoVSMt1vtLjQd2hVXdITmFYM/QezjY8rj
	 XZvCaeunHgjOGrESlwIBBJDh6O5w+svFXnBJcSL8VOolimpmRoJiOeb3p3CiOC/wte
	 2rnslmOx9+kCIwM1m0pwHF3bEJ9MWWX/Us+7mZROhA4ZNqZM4mEsjlAcTqNDw/RO0Q
	 BOLKfu7F2P5lw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 30/47] clk: mediatek: mt7986-apmixed: Use PLL_AO flag to set critical clock
Date: Tue, 14 Feb 2023 14:41:10 +0100
Message-Id: <20230214134127.59273-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054223_280050_FE6EABBF 
X-CRM114-Status: GOOD (  10.12  )
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

Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index 62080ee4dbe3..227ca572056e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -42,7 +42,7 @@
 		 "clkxtal")
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, 0, 32,
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, PLL_AO, 32,
 	    0x0200, 4, 0, 0x0204, 0),
 	PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x0, 0, 32,
 	    0x0210, 4, 0, 0x0214, 0),
@@ -77,8 +77,6 @@ static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
-- 
2.39.1


