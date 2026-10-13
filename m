Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA4CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=; b=On0bQVx63XkrxTOepAMkmbFz12
	xoeF3Ripfx5OlKcUun/B0KpvyKyjMRLITTR3am0ch/+gSjUl3NI3OqrTs6+Kh8f0GrT/whScDh4cj
	npXkriMdQLsZqxFkZJz2A1KuvViCDARdKRHZUFglq9Z1be7/01rxIoo+EGxBqLdKLK236aTD3gIRI
	WBIWpm1mGqIbeQPky0tnoxXHs9pjaHsfiG8EKBx4AHY8fz1Vm640zXsIPy3isS5+B7L7DvEmR/MPT
	iIF68lDAMs+YPUGLbzwsC8xlVuJUiTwDF9FJSN2Ub8ygbuB/Jpsigrmr5U2nh5SNZz8Ta6jbQWH3H
	KX+8NkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIR-0000000DHdc-2mcs;
	Tue, 13 Oct 2026 15:20:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeI6-0000000DHIw-3pxS
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1368720a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904786; x=1792509586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=;
        b=BozTDyHZqukHuJU6BBpR01KBvoMvw7iGCnIoBj7XsZVowd9OozHFJBYestbxmpuehV
         Ay2BNChGc4prgTsFOSD1zMXPN4eAq+KEiKG14jhTXkTIc1jj9cBleJIgTXTZH3+5MkEJ
         nlyrTql404U4SI0i1QLg2ZjsPfdqCkP+ygIUDQ0ClXKHt9+xwoQv3U1/GCShY0b5bS57
         Vrh6D+m0CdIFuxId1Fcou03hxQjS7n4hvtzlgMjmM+SlrQDQCxxEpUKY5oKdW9/C//W6
         d4WvCNxomOeyBO6PTSLNbrSvSakg7k+16RQ/iiZAS/XyrTknX3C5ZmOq509V2RZVB2hI
         lrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904786; x=1792509586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=;
        b=un5VtFePc9nnrFBIuy1mWNOMCxWhjE2pHjLHKaKHT2GjTCawRqmxz4i11RBFh50AcB
         7XOo741aAVU7qwNZ16ivu4rhF2hnZhB/zu5taQoYOXv0XuPG25WAZxOsl698VLMsWDpk
         V5CA1or9N+tTgFKpsou3+ORlxJ0GRQFpdfMMAmniHqOYRkxTGut0ePKALucYx50SjTPZ
         /vkUhOhalHILsTuvmRDigRwjiq3GTNgQsnti6yo0rrEQh1KX7RJ7Rac9rZkUi5/YzIMI
         tUD/Q8IuaBWzhZ3Y5DPUJMwpwLyP1I6j6sYw5UrI195zZutVcOxNSTtczDubJMf7Bo8j
         lDyw==
X-Forwarded-Encrypted: i=1; AKwUvByGz8MFt7hu5uuZMdRb1c0GmRUbhibi6h0G5gxwv0jspYWiTkTy8hUrkS8nnacsatGuNZCTyWURUOyDJRFDVw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL29fKID1/uBZQ9AJSsx9pgQcG1ni45j9roJ4fkMYoEYhH/v4NZ
	BjHcKQsNyAbKpvbCCLgorvQ0N+9O6l/yPvGpTRDnMeSJxVNcWoKiEmmp
X-Gm-Gg: AYBFou3ZYZ2cc5SVPIWMb3u8dkcU5ssGWr9ADcLEiivO531IDMgPmtmoziO4CI6zeq3
	6pPKHF7gVWVvpb5GKwc8KW9KU/IHPykYS7VcfoPvvtuEk9fdrjFlNT7EadkgN96NdKUcHAO+eZE
	APiHsEuz1QWAkp3+YQC94VedrA0QdwK8BMSWs9JaYGAp24NJ/lti4WoPohny7QJ/uxVEER+R7tw
	vNSCyeRfxa/xxv1loLeSUMzk4PhsyYjveatrW1Sy7BrH3C9TKeTLNHWdbsYmnq3gJPOqA8Aja9q
	L4gNF/kga14Zm2YhuW8SrXO2kdkl27X9katOsCWV9Y6xP/GFplNlQXykMK91BkBvNIdogtufEM0
	mx2UniHvosh/u5yUvk46LgInzoAr2iLSr8ber/QeJGmSdRPfJdWNYrlL3qmvvExLOL7ndQ7hwuP
	QihZGOeHvZu2See0arbbrQy79kBP4ixwkJthPJBBoFDkFg4D4wvcS3LnCQD3GkpzKIZv/g5DB6t
	/2eNTNO7TW8P/x9vSIWwM5Hvlc2
X-Received: by 2002:a05:6a20:a120:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e16bf77bd0mr11175399637.24.1791904786043;
        Tue, 13 Oct 2026 08:19:46 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:44 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 18/35] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:17 +0900
Message-ID: <20261013151734.3177690-19-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081953_781353_ACE54986 
X-CRM114-Status: GOOD (  14.84  )
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

The MT6735 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Diff changed by 935ad6242c47
  ("clk: mediatek: mt6735: Unregister PLLs on probe failure")
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 51 +++-----------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index b6eb6a581c31..94cb0bee8bb4 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -77,57 +77,20 @@ static const struct mtk_pll_data apmixedsys_plls[] = {
 	PLL(CLK_APMIXED_APLL2, "apll2", APLL2_CON0, APLL2_PWR_CON0, 0x00000001, 0, APLL2_CON0, 4, APLL2_CON2, AP_PLL_CON_5, 1, APLL2_CON1, 31, 0)
 };
 
-static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct clk_hw_onecell_data *clk_data;
-	int ret;
-
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(apmixedsys_plls));
-	if (!clk_data)
-		return -ENOMEM;
-	platform_set_drvdata(pdev, clk_data);
-
-	ret = mtk_clk_register_plls(&pdev->dev, apmixedsys_plls,
-				    ARRAY_SIZE(apmixedsys_plls), clk_data);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register PLLs: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					  clk_data);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to register clock provider: %d\n", ret);
-		mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
-					clk_data);
-	}
-
-	return ret;
-}
-
-static void clk_mt6735_apmixed_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls), clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixedsys_plls,
+	.num_plls = ARRAY_SIZE(apmixedsys_plls),
+};
 
 static const struct of_device_id of_match_mt6735_apmixedsys[] = {
-	{ .compatible = "mediatek,mt6735-apmixedsys" },
+	{ .compatible = "mediatek,mt6735-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_mt6735_apmixedsys);
 
 static struct platform_driver clk_mt6735_apmixedsys = {
-	.probe = clk_mt6735_apmixed_probe,
-	.remove = clk_mt6735_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6735-apmixedsys",
 		.of_match_table = of_match_mt6735_apmixedsys,
-- 
2.56.0


