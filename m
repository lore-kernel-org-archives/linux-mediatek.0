Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F638CDD0F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEFo7BD1oIAuDiZnvSmWjv5wnv258VyoeJThoykpJK0=; b=qTogIa7awVqp1KZ4a+nUc0LwAQ
	mOiUzrI/luwpa26V+esisEt2F/tpqI6nXTfPhFZdLfhsVPkhG9DfMCfIAYSuNE99zHwMX+FmcYl/7
	vEBJGNhDozRpxjBKTf36XCGYYEDrUwBK8l0wEdyjhJOZPDwg6XphFBI4yg5GdUN9B882Lg62yzWFR
	oQ/3BGSVd55rPd9+op1Yiy9NuQp75orHtH+rwXmZuMKWTMKeh+dVvDBiwa/3lZoQ2w45Jo+p59FR6
	fB3YkQTZzzLVY8qcVU2Fwa4bI34EXiGqF3vEHaoWLXWC70/JXZ13j8V3JickXGtxF6wZ7kWSZfW+6
	xKXiSBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3M5k-0000000CAhC-2FVD;
	Tue, 22 Oct 2024 21:07:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3M4C-0000000CAW0-0u1q;
	Tue, 22 Oct 2024 21:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B13785C5D54;
	Tue, 22 Oct 2024 21:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEF3C4CEC7;
	Tue, 22 Oct 2024 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729631120;
	bh=bJvQz9MiC/VgurH813d2V4r5Zs0ZMaCBNkCiF5+fGYo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bwm6Wyj3RPaPraAlcmvAbRAZqObSQRJe2bWoon+CeM3CxXWDRXTGMM/adJVqCa0Jl
	 lYOZYOo9QA4oYRAIDvt9eSuiLR6oeCeth/W24QCnX4q9U3SObA3PVnK5y9L/o8ZOcd
	 TtIIjLuI7T05fQsjo8nePYCkRynbGv3mFRcZlZpH1XQhV38CruVJfmyCVB9i2d15nY
	 4Br4LOO/1E5IYAoXfDaaFN9Uu5GOFBk7lHrpE3ur3LHw0CAlp7g2lAnUcxxFHD1D1h
	 QcDTWsIqNg6qGKH1hzvxHv4H+nLUvoI1K3yDnyLl25RIFUWB5BxaaIeT1wuBTmVS0O
	 w32DLwpJeaYCw==
Message-ID: <df9044e1f49f4b6567708693f41dbf9c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241019-clk_bulk_ena_fix-v4-1-57f108f64e70@collabora.com>
References: <20241019-clk_bulk_ena_fix-v4-0-57f108f64e70@collabora.com> <20241019-clk_bulk_ena_fix-v4-1-57f108f64e70@collabora.com>
Subject: Re: [PATCH v4 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Date: Tue, 22 Oct 2024 14:05:18 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_140524_371053_C8D782F7 
X-CRM114-Status: GOOD (  20.70  )
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

Quoting Cristian Ciocaltea (2024-10-19 04:16:00)
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.  Without knowing the number, it's not possible to
> iterate these clocks when needed, hence the argument is useless and
> could have been simply removed.
>=20
> Introduce devm_clk_bulk_get_all_enabled() variant, which is consistent
> with devm_clk_bulk_get_all() in terms of the returned value:
>=20
>  > 0 if one or more clocks have been stored
>  =3D 0 if there are no clocks
>  < 0 if an error occurred
>=20
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
>=20
> To reduce code duplication and improve patch readability, make
> devm_clk_bulk_get_all_enable() use the new helper, as suggested by
> Stephen Boyd.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

I have minimized the diff further. Applied to clk-next (clk-devm). If
the other patches can be merged through clk tree I'll need the PCI
maintainers to ack, likely Bjorn?

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 975fac29b27f..5368d92d9b39 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -218,15 +218,6 @@ static void devm_clk_bulk_release_all_enable(struct de=
vice *dev, void *res)
 	clk_bulk_put_all(devres->num_clks, devres->clks);
 }
=20
-int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
-					      struct clk_bulk_data **clks)
-{
-	int ret =3D devm_clk_bulk_get_all_enabled(dev, clks);
-
-	return ret > 0 ? 0 : ret;
-}
-EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
-
 int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
 					       struct clk_bulk_data **clks)
 {
@@ -239,23 +230,23 @@ int __must_check devm_clk_bulk_get_all_enabled(struct=
 device *dev,
 		return -ENOMEM;
=20
 	ret =3D clk_bulk_get_all(dev, &devres->clks);
-	if (ret <=3D 0) {
+	if (ret > 0) {
+		*clks =3D devres->clks;
+		devres->num_clks =3D ret;
+	} else {
 		devres_free(devres);
 		return ret;
 	}
=20
-	*clks =3D devres->clks;
-	devres->num_clks =3D ret;
-
 	ret =3D clk_bulk_prepare_enable(devres->num_clks, *clks);
-	if (ret) {
+	if (!ret) {
+		devres_add(dev, devres);
+	} else {
 		clk_bulk_put_all(devres->num_clks, devres->clks);
 		devres_free(devres);
 		return ret;
 	}
=20
-	devres_add(dev, devres);
-
 	return devres->num_clks;
 }
 EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enabled);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 158c5072852e..1dcee6d701e4 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -495,22 +495,6 @@ int __must_check devm_clk_bulk_get_optional(struct dev=
ice *dev, int num_clks,
 int __must_check devm_clk_bulk_get_all(struct device *dev,
 				       struct clk_bulk_data **clks);
=20
-/**
- * devm_clk_bulk_get_all_enable - Get and enable all clocks of the consume=
r (managed)
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
  * devm_clk_bulk_get_all_enabled - Get and enable all clocks of the consum=
er (managed)
  * @dev: device for clock "consumer"
@@ -1052,12 +1036,6 @@ static inline int __must_check devm_clk_bulk_get_all=
(struct device *dev,
 	return 0;
 }
=20
-static inline int __must_check devm_clk_bulk_get_all_enable(struct device =
*dev,
-						struct clk_bulk_data **clks)
-{
-	return 0;
-}
-
 static inline int __must_check devm_clk_bulk_get_all_enabled(struct device=
 *dev,
 						struct clk_bulk_data **clks)
 {
@@ -1160,6 +1138,15 @@ static inline void clk_restore_context(void) {}
=20
 #endif
=20
+/* Deprecated. Use devm_clk_bulk_get_all_enabled() */
+static inline int __must_check
+devm_clk_bulk_get_all_enable(struct device *dev, struct clk_bulk_data **cl=
ks)
+{
+	int ret =3D devm_clk_bulk_get_all_enabled(dev, clks);
+
+	return ret > 0 ? 0 : ret;
+}
+
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. =
*/
 static inline int clk_prepare_enable(struct clk *clk)
 {

