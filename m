Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F199D3C538
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 23:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcK837Dzkq8sL35Y7XDjGdg1f6y2o8ogt0VrgvXA7OA=; b=FI4Dbd8Y3EUxi31tUe5yig2dnK
	91QqUJFqoD133VwjCIiUn4NkR6liI/FhwpePylARr/zQv/srHgy1UVsv7SksdFdy+pCzdhhZYrEGQ
	tefgfsdHvZMXwZaEvkF54Rx7gUtOYzGDzOKuBbT/75jYhAM/CtRG2R2i8+kazp/gttQmWOslsjFop
	gCO79OJNku8Md6XPKrciEZsT7/NplS8GfJ7FZDrzVIESG8gnq+qD+nPzxp1Wpss+6CcgqlDroX2X2
	Jqa2Qy9fkn1jV5vLqZZ6U4eaiFpV1Cs3LsHf1b03mzJXdHB4xHxXDFRLnWEN+kOrm4Xtkwym51Gp9
	t00H6Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Zoy-0000000GQNQ-0XJp;
	Thu, 17 Oct 2024 23:22:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Zkf-0000000GPk6-42mQ;
	Thu, 17 Oct 2024 23:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729207072;
	bh=gmHCYMEBb8C25V0D6R/CZXdticXewklOMZwOmzHOpTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SOKZq4OkphL85FOM+b5RqVc+9FoRVEtIsgIK4tYnUc5gJRiPOl9IHaYJmjMSRU/XU
	 USiyNJWwCmrOXnNrh3RHT6nC54NFieYXzqw5hNC/OvprY2K7ztVXUfKGtb03qnemNK
	 MelolRe2QsK3LgMiNi3abaRZk5owJ9QJF2Poc9PEBYOQzrI+H4urbkwcN5ApbuIFY2
	 knvU98INGQgHbPLmrfH0NhEqk0ENi4Uf0rOnjhm4y/Mqe4xPaNsUQozayOFRBR5lvR
	 85F+nxIlNnGLQZZlVasgBmhEp/MOXd07f+0E7jhBaufwypmcm24hprNV8ZboTvevfK
	 6zHRcM/dHh+oQ==
Received: from localhost (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A00217E0E01;
	Fri, 18 Oct 2024 01:17:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 18 Oct 2024 02:17:29 +0300
Subject: [PATCH v3 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-clk_bulk_ena_fix-v3-1-57e8bb82460c@collabora.com>
References: <20241018-clk_bulk_ena_fix-v3-0-57e8bb82460c@collabora.com>
In-Reply-To: <20241018-clk_bulk_ena_fix-v3-0-57e8bb82460c@collabora.com>
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
X-CRM114-CacheID: sfid-20241017_161754_230214_7C4F10CA 
X-CRM114-Status: GOOD (  18.69  )
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
 drivers/clk/clk-devres.c | 35 +++++++++++++++++++++++------------
 include/linux/clk.h      | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 82ae1f26e634572b943d18b8d86267f0a69911a6..0d0fe364b66a8590d5e7c63dc6c1e70c59d53e89 100644
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
@@ -230,25 +239,27 @@ int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
 		return -ENOMEM;
 
 	ret = clk_bulk_get_all(dev, &devres->clks);
-	if (ret > 0) {
-		*clks = devres->clks;
-		devres->num_clks = ret;
-	} else {
-		devres_free(devres);
-		return ret;
-	}
+	if (ret <= 0)
+		goto err_free_devres;
+
+	*clks = devres->clks;
+	devres->num_clks = ret;
 
 	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
-	if (!ret) {
-		devres_add(dev, devres);
-	} else {
+	if (ret) {
 		clk_bulk_put_all(devres->num_clks, devres->clks);
-		devres_free(devres);
+		goto err_free_devres;
 	}
 
+	devres_add(dev, devres);
+
+	return devres->num_clks;
+
+err_free_devres:
+	devres_free(devres);
 	return ret;
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


