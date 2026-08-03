Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5423C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=; b=a3EbpX649desBgO1+5extryoyf
	Zm2HWk3s8Tfh5vV9nRt5IBkkCIv2K3qq138pY9rKarE/rtjwo4+EbPLE84lXmfECWiMBs2gjbXnpC
	X0lkSbF5eDFo5aBmdWUyiRlLYxAACg3rUsNn/iq/W72EDhrz2UqV3Y1BjwLHys7mm7krXlNnZVmtt
	4Fw4ywCJlwvTdqPhILiN+4ZMSrvVolP0InJKIMMc9K+8mQ59F1V+3HtMhtohTc1DxmuiLWqy7OIHv
	NeuKkxtliLlGXaSW7J3wJ2A1hNODDwS8uLepyaaSXvxxsMaNmyXzyAAvVn+KvBlXGXSiM0SJ4bQXW
	L+5RouuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVQ-0000000HLcT-2wrK;
	Mon, 03 Aug 2026 14:19:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVP-0000000HLa8-2PkW
	for linux-mediatek@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=; b=hAwUoocEkG41IojKHEXYBqDi6+
	5TSyAzyIusm/BPWI870vRDKqGhFkVmBPbpr1hoRt0qAIrtx8C8XimZJL6ClBBCY9D7TlABsBZSdaL
	nUuaMfrdRZgo0Jwq8pkMy99HLAa0N7A0g9LhLuOWcv9Mbo1ovuEzkMzUxVSuXVwi4HpsGGXGQLV9g
	tGbzDmbh1T1XwmvjMaFg6ob7CyeIqoFvUe4gXOT+rla5LeSmUcihVoJP0o64DRVBfmKlIw+QGlS5D
	8O6QTZa2XbngZBKev8M56q0/nXvggf53lv1uvYI2velqTtf8pxDkYS3Qijd/uvCWaV5SiGoRgOP7d
	wXiICWxA==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtVM-000000092FG-2Qlk
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2874148a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766738; x=1786371538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=;
        b=rHmTSBvc2UbfEaxnbk7pxl8FTGciGpa6NEE2q3b1iUR/TuZ0hDJ8gBmiTrMToNmSQj
         UMNmjSVbAe9RQPZucfxDJjDhyQYovZOiq5ybUGzmwkzAmK0rb1ZVNlhAe1OxG/3FBv8d
         7kOHwnyWg+eidnrhks8p+uprLCZpdW6ww5S0RhUkrMIIMEU8w1YfKX0IRxelFqYQW4JP
         GssIwoMc2aSvshawix/N5+c5r8Vpu0/jNd86fGCEPq5WMxTggDIDv1bXWD7GyyNyWVm9
         niPd1hW2nsRvpKcSMToQLPLCLVIVLoAmR9iMBzAY/YvNBRsm5bn3vvlahJaQcd4UU1SL
         l1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766738; x=1786371538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=;
        b=m5OLwq5G+LEY/Kdd9wJdfX+I8Li8ZIoV/9nsQQcs+qNa9qGpn03PvVl4a9ImDjqOed
         joTU05QTm88oALRzVPcuIH594Yy3J189ypfQyAOBxfrHbNqTip32ghKPlSeNOQht//0C
         fM7dlj2ErhcRAT134xWzhr7Y0oydElAbmCHNEOsKDXw1vCTK3NhOqJUgt7NdEbCrLNGb
         oDWktrQ2j9Qd6Y7AyUcEF0AL1CMU077WmF2UcxC1lNfe9Xh9ww4EqUAINgiMiEUMsSak
         sjIL3icmEWrJM+6U3X1yEmFJUUncT+cM6hEuNW5BCa1ygx6o8i9dSzZ+p3vt6JCXfGy8
         o51Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ShyAQhT3g9EwFoOl77VVNCQHJzoleLhYqJqeUDKqIRtkwhnnPKrO+P5Qi5LvUS+gjZlwdVdv+njveI08ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhZDNoK6juOJtMOIx9wLVfUb/ZcAP7kEM7Az40qfbTdLxk5R7D
	AGsbe4QU6JJdb77OWyGqGXLrqnjEYioO/1JuB+IrXrNTgQbl+efce8IH
X-Gm-Gg: AR+sD12/Om5hoZX6DyGuVEqwlfVYa3bJq1ulJBBAtfq9j8+4SMrUasp40+3pUIbON9J
	8GOS+IUwIfJNdV8YmSVFabMyzFrxeiSz8dchWzTz1mYzpTpHeCaJizMnBeeADjTwkcZZjSj4SfU
	yxdUfepqtgYGiQx1RSAx0GJr5g2F6YblWGbf4hbohO01OdqB9zGHFCedpMMt6td70GHW7IiN/cn
	IHwTT5k52C7XA8fGFuIqeuE4E4u2Bs7Qcbdf3Z6iCSeA2sBSZiIcjj0BB3LQlX6Ypn7yJJQXNvD
	HmPnR6sTJH1ANa7INLn0izHczXRpe5G/ICc7EAPQEMMTrZVWryacg7OLdK1atAooXDFTMUvITzz
	JuI3vYjupnrlEy4itKymN204GecJFGOT2xQEhf+OP9BbANrwcBj7NHH4DNqJOdDyxL6ioRhXaO7
	HLNJO2FRgMnw8OPRcmmI6DMW9Q9qZhuXIhOlVi4tbGGmeWbuor12Kl44cnLrLoFwpVbYzr6avL0
	0xB1fmEMSpjg7X2p6ku
X-Received: by 2002:a17:90b:3851:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38fbc52da42mr9027280a91.38.1785766738150;
        Mon, 03 Aug 2026 07:18:58 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:57 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 20/32] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:47 +0900
Message-ID: <20260803141659.559129-21-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151901_011260_579A65BD 
X-CRM114-Status: GOOD (  16.83  )
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

The MT7981 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
This change also makes it possible to build the driver as a module.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig              |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c | 37 ++++++-----------------
 2 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index f5460ce3ffba..6449b77d56ed 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -427,7 +427,7 @@ config COMMON_CLK_MT7629_HIFSYS
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7981
-	bool "Clock driver for MediaTek MT7981"
+	tristate "Clock driver for MediaTek MT7981"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
index 851d0bc7840a..810395aff253 100644
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7981-apmixed.c
@@ -59,45 +59,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027C, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
-	{ .compatible = "mediatek,mt7981-apmixedsys", },
+	{ .compatible = "mediatek,mt7981-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
 
-static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7981_apmixed_drv = {
-	.probe = clk_mt7981_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-apmixed",
 		.of_match_table = of_match_clk_mt7981_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7981_apmixed_drv);
+module_platform_driver(clk_mt7981_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7981 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


