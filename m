Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E21D3C533
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGiARXDj8/cLqJLDAlux5uSBVt1VOp2NkvItPfC66LY=; b=L2l0aaT79JkpcP50n/mdl+20ln
	sGK6YwerLpOqsgZmzaW3JtF4FLzUvxHSp2Kw57OKXkL/dAnE57n5cUircNngTNJHFLYhnWBHyfRnD
	ofS7a8HBTiFPmm8ipmVvcwAcllZiVfAnXm1enKmp759ujU2FYxY8cIVoZngzDGJftoy/eDPzfsde9
	vJ4A/Qy2mAtXmaYp2/BNzoOLvrMrEardjkI9oPkhUHSVeskoMk7XR4oL/DmJayAt/WcNgfJQqqIcX
	voDF2wmUryr+XSDqo9Ma7X3OOdPDy9oFeB7j484MtrmQWFvHDDw/0YDwzIAt4LXMgbbZwyewPfi3P
	jVBracDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Zrn-0000000GQij-3yJI;
	Thu, 17 Oct 2024 23:25:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Zkh-0000000GPkm-49dB;
	Thu, 17 Oct 2024 23:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729207074;
	bh=+v4i8SuZvvhEqQkHlKh3lLDEBDoh8ci5Kiu8HXeA9H8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZYHuTNQMJnryRyaZm9XZa2hJkih8wK7/1dL1UP2sdAnfV3ggqQ7zAy/2R8RVjaqee
	 rX8I1Lp93FWp+n9jNbXzC6yWvE9yxTSoywv09/UY0zZRbKk7LRz0DUPSC91tBiU1FV
	 EuPerdCXZyYM0qhNCsU1gAk1+26uZJStpvCMvpagaLycOZ+gW+S+tlj0e/zQ2/CkIK
	 hX0ijWb1LVvnd8y85dX1ZjpQKan/NCbqGvf41Yw6hMM7puDWKpUj58PEkc42Sl2mVg
	 BhdII88AWt0o+tJnWkv9P9MWFzHLhsMbF9F3vReb7IKGCKXenc51YWGm6WUEDRO7Cn
	 8A87bIKVBA60g==
Received: from localhost (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 794E417E0EF1;
	Fri, 18 Oct 2024 01:17:54 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 18 Oct 2024 02:17:32 +0300
Subject: [PATCH v3 4/4] clk: Drop obsolete devm_clk_bulk_get_all_enable()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-clk_bulk_ena_fix-v3-4-57e8bb82460c@collabora.com>
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
X-CRM114-CacheID: sfid-20241017_161756_219474_B5539493 
X-CRM114-Status: GOOD (  11.97  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/clk/clk-devres.c |  9 ---------
 include/linux/clk.h      | 22 ----------------------
 2 files changed, 31 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 0d0fe364b66a8590d5e7c63dc6c1e70c59d53e89..14a657f336feababe8588f3eda90b9a6ae0e6297 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -218,15 +218,6 @@ static void devm_clk_bulk_release_all_enable(struct device *dev, void *res)
 	clk_bulk_put_all(devres->num_clks, devres->clks);
 }
 
-int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
-					      struct clk_bulk_data **clks)
-{
-	int ret = devm_clk_bulk_get_all_enabled(dev, clks);
-
-	return ret > 0 ? 0 : ret;
-}
-EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
-
 int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
 					       struct clk_bulk_data **clks)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 158c5072852e36c1583dc47ca7516fcdd928fe59..b607482ca77e987b9344c38f25ebb5c8d35c1d39 100644
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
2.47.0


