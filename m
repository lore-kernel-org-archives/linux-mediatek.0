Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C04AD3C906
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVT8i1JSnCmQJwplJOECZQJbeebSgkLQZ287mFuK2Ic=; b=uz9YNiINwGmTnwZXiLnIZH58ap
	S/N+0IAiGyh2uBSH9MEnC3n1C4YhbUe/+tQzt8bKfxZRLWgjwIITVKAlawsgjqXxZdSU4Jal8Mrg+
	fDyUngVEzbr0vMiqdqvv1AOuwgkYh4IvaM3Fpe1fXKJFMKY+ibrU6YKHow3BwCzWedHHw3rZBSB+x
	PzHPa2o/pQv/PehAJ8jE/rYoEqQMxqe8PKTVJ2FEGlXOO29fHojD5caDqqmZUwH9OBpFy/fYp4YDo
	Y74F28J4Ecg32Zyp0RgXxkHRL2pdqDRu3kvRLV4JhjZWxu0khtD2EKoNuTx5HQsptK6Mg+xkopr8a
	lXBu2hFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t27Su-00000003C2u-10nx;
	Sat, 19 Oct 2024 11:17:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t27RO-00000003BV4-1gx3;
	Sat, 19 Oct 2024 11:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729336572;
	bh=liu6AH5wskPRdG1LJazp0t8ejwo/RTs1GpUY5J41pVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVU66crBEtIarbBDM6UIaDebVYjVUIqq9OgLgGDj/8Plf7LeI/V/sFpOGlKHsdhph
	 5ZZYcIUQD8ImZqmXdLA3Uyyz5A9ifyoQUXHvNz3KQiZxB4kReTVC/2+OiyTZlvR77O
	 cQ8xAZRL2dFGwrzDlTQvPpu/aEnGQvg8sYFCfZIcslV8FCJyD5UGMe+G1YpdKXINCQ
	 aeNuUo4mr/DHSmje3jF2qm8scIs3dBfWutk5aTjGkaqGYNTcQvwb9He/TzdF9zPUvk
	 bZYFBJcD/znLVQxZMtcP9szYy7cxKI0bPwaeTl7zUGlann8CCS/xylJdgPozDzxAdp
	 vXBh9Ea7uMeyQ==
Received: from localhost (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 699C017E35CB;
	Sat, 19 Oct 2024 13:16:12 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 19 Oct 2024 14:16:00 +0300
Subject: [PATCH v4 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-clk_bulk_ena_fix-v4-1-57f108f64e70@collabora.com>
References: <20241019-clk_bulk_ena_fix-v4-0-57f108f64e70@collabora.com>
In-Reply-To: <20241019-clk_bulk_ena_fix-v4-0-57f108f64e70@collabora.com>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_041614_629772_8A92246E 
X-CRM114-Status: GOOD (  18.63  )
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

Introduce devm_clk_bulk_get_all_enabled() variant, which is consistent
with devm_clk_bulk_get_all() in terms of the returned value:

 > 0 if one or more clocks have been stored
 = 0 if there are no clocks
 < 0 if an error occurred

Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
the past form of 'enable'.

To reduce code duplication and improve patch readability, make
devm_clk_bulk_get_all_enable() use the new helper, as suggested by
Stephen Boyd.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/clk/clk-devres.c | 28 +++++++++++++++++++---------
 include/linux/clk.h      | 24 ++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 82ae1f26e634572b943d18b8d86267f0a69911a6..975fac29b27f3709e292531a114975c9108287db 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -220,6 +220,15 @@ static void devm_clk_bulk_release_all_enable(struct device *dev, void *res)
 
 int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
 					      struct clk_bulk_data **clks)
+{
+	int ret = devm_clk_bulk_get_all_enabled(dev, clks);
+
+	return ret > 0 ? 0 : ret;
+}
+EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
+
+int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
+					       struct clk_bulk_data **clks)
 {
 	struct clk_bulk_devres *devres;
 	int ret;
@@ -230,25 +239,26 @@ int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
 		return -ENOMEM;
 
 	ret = clk_bulk_get_all(dev, &devres->clks);
-	if (ret > 0) {
-		*clks = devres->clks;
-		devres->num_clks = ret;
-	} else {
+	if (ret <= 0) {
 		devres_free(devres);
 		return ret;
 	}
 
+	*clks = devres->clks;
+	devres->num_clks = ret;
+
 	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
-	if (!ret) {
-		devres_add(dev, devres);
-	} else {
+	if (ret) {
 		clk_bulk_put_all(devres->num_clks, devres->clks);
 		devres_free(devres);
+		return ret;
 	}
 
-	return ret;
+	devres_add(dev, devres);
+
+	return devres->num_clks;
 }
-EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
+EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enabled);
 
 static int devm_clk_match(struct device *dev, void *res, void *data)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 851a0f2cf42c8c1bbada49d991bc185587942155..158c5072852e36c1583dc47ca7516fcdd928fe59 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -511,6 +511,24 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
 int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
 					      struct clk_bulk_data **clks);
 
+/**
+ * devm_clk_bulk_get_all_enabled - Get and enable all clocks of the consumer (managed)
+ * @dev: device for clock "consumer"
+ * @clks: pointer to the clk_bulk_data table of consumer
+ *
+ * Returns a positive value for the number of clocks obtained while the
+ * clock references are stored in the clk_bulk_data table in @clks field.
+ * Returns 0 if there're none and a negative value if something failed.
+ *
+ * This helper function allows drivers to get all clocks of the
+ * consumer and enables them in one operation with management.
+ * The clks will automatically be disabled and freed when the device
+ * is unbound.
+ */
+
+int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
+					       struct clk_bulk_data **clks);
+
 /**
  * devm_clk_get - lookup and obtain a managed reference to a clock producer.
  * @dev: device for clock "consumer"
@@ -1040,6 +1058,12 @@ static inline int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
 	return 0;
 }
 
+static inline int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
+						struct clk_bulk_data **clks)
+{
+	return 0;
+}
+
 static inline struct clk *devm_get_clk_from_child(struct device *dev,
 				struct device_node *np, const char *con_id)
 {

-- 
2.47.0


