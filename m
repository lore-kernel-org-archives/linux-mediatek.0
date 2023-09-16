Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BA9CD37B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raURXtsDsmO8FQZ3EqpFfDzrrvESmVA0RTWV0kDTmwc=; b=0UpNgUbi7D2yNLMPIkjQVs2UwH
	Mw/1Z8VDrMvxY+XejTu6kt+3SXmmjU5ZtmbYnDm4kW8XrkATJuBLJoLUnUQCt3t3ly7JcKH8z4P7P
	h+oTYJdVczdhfnWIj9wJAXV+y1oac9CPKtRJH38UOLMtRxWtYPqMs0Dw3rB4TagKcMtes6cI0z7D3
	Vs6JUZnDrvlhY2s53bA1EEv1Cj/B0zqgLhVHsDXhGG+3EL7TWJ0tA/yZfY/E7q9S4BQnQFFwqkSYn
	I7NTeXQV1aJxVjA3KDGxR4oGiXCK7iRqO4XJTb2ziJchvx4QYMme3ZexKjtZUMu6KFa0pfUH6MTZq
	UnKSsA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQd-00CAZz-0L;
	Sat, 16 Sep 2023 08:13:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQX-00CATE-11;
	Sat, 16 Sep 2023 08:13:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 40FE5CE2C88;
	Sat, 16 Sep 2023 08:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754C6C43391;
	Sat, 16 Sep 2023 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851993;
	bh=SbggMlwJmGCB60uPWKaRi5TsR0G979nd8MU9xOIf0lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uXSdb0bhIxN0kQMA76OEwrbI8wVWljqxCRLq7WOcHzQBXC/VR9SL7OiaBND9bS8Ql
	 UCugoEdaqhd0REzK1bwto/i5rtvyfhl8jQI1CDtt6dEbsk0yNu4edCMJz9Gdvkgq9+
	 +kF2rbFNV1v7YcKqKtLORvAiNQSdiT9wvY7PfB85hCgpefuSM5cKL6xfGvcpMvZtkn
	 uD3l0NZRsXjdlgmwkZgH/Sz9IloouFroW6TE8xiAfi8o0GynY8rrnPLj3N5vKLui1n
	 ZZXzIHJWxCq1WDxT7bwirT80KL2/joCYGfPGGsbNespTMauW6p1LPvxAbgBjGCtTRz
	 Njkq0gUGcXwBg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 23/23] net: stmmac: make stmmac_{probe|remove}_config_dt static
Date: Sat, 16 Sep 2023 15:58:29 +0800
Message-Id: <20230916075829.1560-24-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011317_729761_2973D6B0 
X-CRM114-Status: GOOD (  14.15  )
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

Now there's no external users of these two functions, make them static
so that there aren't any new usages of stmmac_probe_config_dt().

To avoid forward declaration, move stmmac_remove_config_dt() location.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Russell King <linux@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 47 +++++++------------
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  4 --
 2 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 716434b58321..2063de1683b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -384,6 +384,22 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/**
+ * stmmac_remove_config_dt - undo the effects of stmmac_probe_config_dt()
+ * @pdev: platform_device structure
+ * @plat: driver data platform structure
+ *
+ * Release resources claimed by stmmac_probe_config_dt().
+ */
+static void stmmac_remove_config_dt(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat)
+{
+	clk_disable_unprepare(plat->stmmac_clk);
+	clk_disable_unprepare(plat->pclk);
+	of_node_put(plat->phy_node);
+	of_node_put(plat->mdio_node);
+}
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -392,7 +408,7 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
  * this function is to read the driver parameters from device-tree and
  * set some private fields that will be used by the main at runtime.
  */
-struct plat_stmmacenet_data *
+static struct plat_stmmacenet_data *
 stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -662,43 +678,14 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	return plat;
 }
-
-/**
- * stmmac_remove_config_dt - undo the effects of stmmac_probe_config_dt()
- * @pdev: platform_device structure
- * @plat: driver data platform structure
- *
- * Release resources claimed by stmmac_probe_config_dt().
- */
-void stmmac_remove_config_dt(struct platform_device *pdev,
-			     struct plat_stmmacenet_data *plat)
-{
-	clk_disable_unprepare(plat->stmmac_clk);
-	clk_disable_unprepare(plat->pclk);
-	of_node_put(plat->phy_node);
-	of_node_put(plat->mdio_node);
-}
 #else
-struct plat_stmmacenet_data *
-stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
-{
-	return ERR_PTR(-EINVAL);
-}
-
 struct plat_stmmacenet_data *
 devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 {
 	return ERR_PTR(-EINVAL);
 }
-
-void stmmac_remove_config_dt(struct platform_device *pdev,
-			     struct plat_stmmacenet_data *plat)
-{
-}
 #endif /* CONFIG_OF */
-EXPORT_SYMBOL_GPL(stmmac_probe_config_dt);
 EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
-EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
 
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index bb07a99e1248..bb6fc7e59aed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -11,12 +11,8 @@
 
 #include "stmmac.h"
 
-struct plat_stmmacenet_data *
-stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
 struct plat_stmmacenet_data *
 devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
-void stmmac_remove_config_dt(struct platform_device *pdev,
-			     struct plat_stmmacenet_data *plat);
 
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
-- 
2.40.1


