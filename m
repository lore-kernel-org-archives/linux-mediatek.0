Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A4C5B572
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0TVCaE8Q+34m7ChzAdVqyf9wcVW6q1366258ZKAIuQ=; b=DrJX2AH8gBHAd2cDGaplKVae5z
	UqgB2SaOjMfj1DgcMlWNrhd+NHj/qKRzLNmysh3BpQlqn24jgX+IxRpPEldrgRczCfU9BtaQ1G5D9
	JTjK/exLLqnyUuvMYLZoQ8w8u0aiMJep55pQhP5uKpnjbqBP/Q2bYaCxpooKTpswfGsic91M0oJEC
	YLjxE+GW0dF6EOTeWvORbyqzriHjj4CHwZWisCBZiMKpYfpJNVeuh9uO7BONvy72nKRS4zAf7p/aP
	37txtUYP2B58wDISW8AiOr4rTCigyHEQ9QicvsJU2hQdr2Rb+Sz2yBX5kJZ+rv+uGD2pxYh93BSF1
	zsMpbzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDXc-0000000GmJu-1r82;
	Wed, 12 Aug 2026 18:19:04 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDXa-0000000GmIl-04tY
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Aug 2026 18:19:03 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7eb34c17b96so989436a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786558741; x=1787163541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0TVCaE8Q+34m7ChzAdVqyf9wcVW6q1366258ZKAIuQ=;
        b=OHZ5FabsCffAuXuDZYg4BYW1TTrAZptZVFEb9xzQwLJQ1yaLQg2VA/9QQbp3swPgeX
         stPpp4CWJPGJKsKc2N6sEhP0U6xQoSIVioBG79LJ5+LVa2IRL0WOb5e+22VeP0e91urX
         0Z+2yT6IggAfiPtz9Msptrhs7iPvkrxQk8LDFiCwnGhpfVVUY4ezDSu+y7psgru7kDWE
         Ns4YLNeGggwr1sM2IM3tHSe4CwBM0q7DsjzjLFssUmfJ+8Ch2ZZ/pr9vED+pVHNzMT6f
         Pbe5lD68033ejJ/GRm/iM4i0QK+o+2oNAxF7+3HWLj4HUGBiMfAnzETak4BlVd6sZNGz
         +rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558741; x=1787163541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0TVCaE8Q+34m7ChzAdVqyf9wcVW6q1366258ZKAIuQ=;
        b=ZRFsB/D5I+WxE+7iXvEZ1r0TfxRUtIjnWwrri7la2bXT0m75r4YfXPyxisM8/b0SEP
         DUjH0SS9YiKZEa/M9ZRrcMOWW2J3n9onL9uUDQ0wFnu6MtoN46DNwGkqOSmr0T8t1a1X
         268MgbVLSDz8OYh7kUL54MrupFQKTQZlx4BggNR27BVbSZUOmbtZz0voFWbw1LgMxkm+
         MD/4QA3wT+KOjl9h8ngEhfkagbT1qNATjDPfA9GupgtBERjsj+m6qLlhiarJggMfh9Bt
         i5ycmNNGdt8qhR2L/Q4v2xmY3pWsQVYqCmtOQxkQzVRTK1MweXdXc45hwcYFVq+IJuEW
         /P7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVIrqKrRhoKtaNJdQRuyWC92GMnCMa+nWfMMdzKpBsO8/r8S7YkOESUOIO6QtNlgpAMC8B+bpi7snieg/2mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBAqrLcIbrAD1JQnLSoY6lM2XV/nz0s0fmwDj8/LHZkteJBVAO
	WHeOxeUR/eEFFnnb7bMbE/T3aMxlwM1O7d6ckm/tupomkDGz6E7MJMDt
X-Gm-Gg: AR+sD10Rimb65jL3c7MyhrjVNcPv5doUmZNtNE7iqIFc2vaR5lujjGMHZ3wV6uNP5ca
	aFFEe6XxIwgP9qecj7T1YrynqjXpcsH8h4yzKbLlKJlM0+bQ1B0ukI05kcGXaavdFje0c5YGd5Y
	J4dqbuJn86l55XDgf4JIrEDq09tHA3NCxCQu2oap4ymMM5+3AaWtJO1aXm33DtODfiF7mwk1Zwd
	Y8gBP7CV0yBli8VBrfy6kKQQTPPk6SiTi+jFMusq0gwOQ4obTIX8iCAs7YJQOmsWra/jsZqLZlW
	SZDCgtZhDh1sJv7r2vMsZVODwklGCXVikE9nqu0esU21oV3M4EuVwwQcOabgYdQtMbupMEiTZlO
	2pcut2vz8NbEaAoh1CPXLQeYgqSYlOf0MK9tVM43ikZsGNACOMxkELX46PybZhYyEgCzZob6ryw
	WN/OQpyfeCKThrQd+qmBx6AtzGj7EpD5RoIJzapvQ5K7OZ7sEsvgTkqwQPLwLFGgkz2NKpbidEV
	FvHFgU8QTMlXvx0yT1rZccgHM50YQR28wNZiDmE+ISHS4BjNLsPQSIfME14xiBgGiMOk9Ql9f38
	kO94k/fZHdbFmSZXunqT5WBrMKcimqKS35x9jw==
X-Received: by 2002:a05:6830:828d:b0:7e6:f582:955e with SMTP id 46e09a7af769-7f3b79a016dmr6963465a34.10.1786558740714;
        Wed, 12 Aug 2026 11:19:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3420373sm3589768a34.19.2026.08.12.11.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:19:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] phy: mediatek: tphy: simplify main allocation
Date: Wed, 12 Aug 2026 11:18:57 -0700
Message-ID: <20260812181857.64544-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_111902_086037_88B817E6 
X-CRM114-Status: GOOD (  12.43  )
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

Use a flexible array member to replace kzalloc + kcalloc with a single
kzalloc.

Shuffled some code around as __counted_by requires the counting variable
to be assigned first.

Removed NULL check from of_get_match_data as it's never NULL per the
device table.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add back NULL check
 drivers/phy/mediatek/phy-mtk-tphy.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..e9b9e667b319 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -340,10 +340,10 @@ struct mtk_tphy {
 	struct device *dev;
 	void __iomem *sif_base;	/* only shared sif */
 	const struct mtk_phy_pdata *pdata;
-	struct mtk_phy_instance **phys;
-	int nphys;
 	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
 	int src_coef; /* coefficient for slew rate calibrate */
+	int nphys;
+	struct mtk_phy_instance *phys[] __counted_by(nphys);
 };
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -1572,22 +1572,19 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	struct mtk_tphy *tphy;
 	struct resource res;
 	int port, ret;
+	size_t nphys;
 
-	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	tphy = devm_kzalloc(dev, struct_size(tphy, phys, nphys), GFP_KERNEL);
 	if (!tphy)
 		return -ENOMEM;
 
+	tphy->nphys = nphys;
+	tphy->dev = dev;
 	tphy->pdata = of_device_get_match_data(dev);
 	if (!tphy->pdata)
 		return -EINVAL;
 
-	tphy->nphys = of_get_child_count(np);
-	tphy->phys = devm_kcalloc(dev, tphy->nphys,
-				       sizeof(*tphy->phys), GFP_KERNEL);
-	if (!tphy->phys)
-		return -ENOMEM;
-
-	tphy->dev = dev;
 	platform_set_drvdata(pdev, tphy);
 
 	sif_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.55.0


