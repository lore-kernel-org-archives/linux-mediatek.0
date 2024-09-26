Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F465CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEBtQGEISvZPitzTMXKKfKxXb5DENlYny58Y9mj8dKI=; b=4kjZg3jFCArLG7puSkEb70JvYv
	l+udKtlAAiV7LaKbmg2qgeoTjDvOu0MU5QPgAiXdvU94wT8cWuIPeMKFzSNOJSXNd5GJrAt/rRzT1
	g0azxiXfOWIwdS53AeJa+dmPPgCpc0AhEuvboVpNxc9TC3zYx41Hdte6+FzpxY1KS7Fo0XDh3fazG
	EsrxrUMFJy3L3BT28M/Kr690/Q+ENejY8/JfBjmEAuWeWpCf9LDlMAGpz0OGbA0BN6L7vzsjlIMIh
	QNEv9O/i5gGI72EYj88DplmrDNyUDN/DbdhQBntrHtO7fYo2u0Z9oAVnTrefTZa/wZ/Ad64HrGqLA
	ZME7ddpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stm2F-000000087Yr-3yyK;
	Thu, 26 Sep 2024 10:47:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlyV-000000086WA-3VEm;
	Thu, 26 Sep 2024 10:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727347433;
	bh=UWkx5xlyNvLP5psq5yb/wchMlUuTkv6Jgwny0fleod8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eiBehqut23NyCV/lfTj+SQlxkHVH+w11+l5Gi0tI77WdBej2T9md5ZpPyDXies40W
	 kgti+R3zACLZ5IcHZ5m1SYrX1t1NmoEF29BHDJPrHCCrysh7JRrJLlZ8srOTZQ7cAs
	 6vboJp0fk9+XunsAeBfXLuxQScvJlAiDEB8/pDEx2LZ9a/O0/2yjw3Kt5wgcrGS/Xr
	 LaLtrOX1jRFheK6H15NQHQMZ2Pya5gX/Pk0tigk7/9lvT899KKZqDZDfSPQLBvJuog
	 1JWkdScr1D7JQhZ0AHOzvQteCBKU6IMsEOcZRurZ+f7n3xGeQwVDKlr9AD0FyO0kLz
	 THHrWAqocXKbg==
Received: from localhost (unknown [IPv6:2a01:e0a:d1a:1250:792b:136f:2a18:fd70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DC7917E11FA;
	Thu, 26 Sep 2024 12:43:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 26 Sep 2024 13:43:20 +0300
Subject: [PATCH v2 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-clk_bulk_ena_fix-v2-1-9c767510fbb5@collabora.com>
References: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
In-Reply-To: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
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
X-CRM114-CacheID: sfid-20240926_034356_227188_93A6DEB6 
X-CRM114-Status: GOOD (  16.97  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/clk/clk-devres.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/clk.h      | 24 ++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 82ae1f26e634..4203aaaa7544 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -250,6 +250,40 @@ int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
 
+int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
+					       struct clk_bulk_data **clks)
+{
+	struct clk_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_clk_bulk_release_all_enable,
+			      sizeof(*devres), GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = clk_bulk_get_all(dev, &devres->clks);
+	if (ret <= 0)
+		goto err_free_devres;
+
+	*clks = devres->clks;
+	devres->num_clks = ret;
+
+	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
+	if (ret) {
+		clk_bulk_put_all(devres->num_clks, devres->clks);
+		goto err_free_devres;
+	}
+
+	devres_add(dev, devres);
+
+	return devres->num_clks;
+
+err_free_devres:
+	devres_free(devres);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enabled);
+
 static int devm_clk_match(struct device *dev, void *res, void *data)
 {
 	struct clk **c = res;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 851a0f2cf42c..158c5072852e 100644
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
2.46.1


