Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11977C021A8
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 18:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRH2pZA4kmPQJLOsjqXYu0tAns/ZT6YV9xTDCS0qOB8=; b=RYJep4Pm/HzAhHwxZUGOVnWmzw
	1yM2F0WoeYL1wFgpsZxgHwzDOBkj+ofuqcQve6U9t1/IK/ZfJFtgQ1l3E6vpKMNoCYbSTGdRcEEBX
	y2ygCTUZR80lExGxj6TL6eb6w/sFGPPzkbdxnCidq4Xn0Ori+WQ1d2fgw5i7MEkGM35XnEPyjGgKR
	P27u7I2ODiqhXC28SogpZ8vgyIR9OHWn7MVf6nauygbdqcqKlMRkJkmPaoxwJS7qQJ7Bu43OtDs9e
	tQlnNXi2CiuBUWmwIbvLfkAMptPOYV69jpMt+JYpqjFilamd0WzBdpb2vzn9kRF3syozSXGgVnHO2
	uOhmKkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spXEf-000000015Fu-2qgR;
	Sat, 14 Sep 2024 18:11:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spX9L-000000014Uy-0IfZ;
	Sat, 14 Sep 2024 18:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726337133;
	bh=bX3hfSvdivSwqj787dVv//EFjHQaHvkTiKg8rAMVnOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PiLdGvn1mF6o4/igmFmYwt5NOUNLrTMBo7g10pSJbl3riizN5P9WV2t2abw5+N255
	 aO1EQTfE76P2tfpvQZQk+L3/VHoMZY8W5ghfjmBZ2tQ5F195dUQe91afNPmrJmudjL
	 SWyfRqs6wd5mKbN0RbolVG1gGKW2GsmKo7Y+N+HktoHBx9siqcljeiIfKrQFXj2PdV
	 OV3+QjiSUq1qFFDir/FJSFq/BrgvB+uLn56QVKmhPpj2FmGXPxHrAiA8QF07TalXIu
	 sx3VltxJ7gjejJniMqPAiLqeDEVHdg5WiH0pqh+uT72zfLYbRYHwAXyKRxn9MzgIr6
	 KXvLG5dFRG1aw==
Received: from localhost (unknown [188.27.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F83C17E360F;
	Sat, 14 Sep 2024 20:05:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 14 Sep 2024 21:04:57 +0300
Subject: [PATCH 4/4] clk: Drop obsolete devm_clk_bulk_get_all_enable()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-clk_bulk_ena_fix-v1-4-ce3537585c06@collabora.com>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_110535_310113_F69A3070 
X-CRM114-Status: GOOD (  12.56  )
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

Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
clocks") added devm_clk_bulk_get_all_enable() function, but missed to
return the number of clocks stored in the clk_bulk_data table referenced
by the clks argument.  Without knowing the number, it's not possible to
iterate these clocks when needed, hence the argument is useless and
could have been simply removed.

A new helper devm_clk_bulk_get_all_enabled() has been introduced, which
is consistent with devm_clk_bulk_get_all() in terms of the returned
value.

Drop the obsolete function since all users switched to the new helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/clk/clk-devres.c | 32 --------------------------------
 include/linux/clk.h      | 22 ----------------------
 2 files changed, 54 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 4203aaaa7544..14a657f336fe 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -218,38 +218,6 @@ static void devm_clk_bulk_release_all_enable(struct device *dev, void *res)
 	clk_bulk_put_all(devres->num_clks, devres->clks);
 }
 
-int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
-					      struct clk_bulk_data **clks)
-{
-	struct clk_bulk_devres *devres;
-	int ret;
-
-	devres = devres_alloc(devm_clk_bulk_release_all_enable,
-			      sizeof(*devres), GFP_KERNEL);
-	if (!devres)
-		return -ENOMEM;
-
-	ret = clk_bulk_get_all(dev, &devres->clks);
-	if (ret > 0) {
-		*clks = devres->clks;
-		devres->num_clks = ret;
-	} else {
-		devres_free(devres);
-		return ret;
-	}
-
-	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
-	if (!ret) {
-		devres_add(dev, devres);
-	} else {
-		clk_bulk_put_all(devres->num_clks, devres->clks);
-		devres_free(devres);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
-
 int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
 					       struct clk_bulk_data **clks)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 158c5072852e..b607482ca77e 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -495,22 +495,6 @@ int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_clks,
 int __must_check devm_clk_bulk_get_all(struct device *dev,
 				       struct clk_bulk_data **clks);
 
-/**
- * devm_clk_bulk_get_all_enable - Get and enable all clocks of the consumer (managed)
- * @dev: device for clock "consumer"
- * @clks: pointer to the clk_bulk_data table of consumer
- *
- * Returns success (0) or negative errno.
- *
- * This helper function allows drivers to get all clocks of the
- * consumer and enables them in one operation with management.
- * The clks will automatically be disabled and freed when the device
- * is unbound.
- */
-
-int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
-					      struct clk_bulk_data **clks);
-
 /**
  * devm_clk_bulk_get_all_enabled - Get and enable all clocks of the consumer (managed)
  * @dev: device for clock "consumer"
@@ -1052,12 +1036,6 @@ static inline int __must_check devm_clk_bulk_get_all(struct device *dev,
 	return 0;
 }
 
-static inline int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
-						struct clk_bulk_data **clks)
-{
-	return 0;
-}
-
 static inline int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
 						struct clk_bulk_data **clks)
 {

-- 
2.46.0


