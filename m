Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13441CD37B5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HihMrabtMUvc3Og1PWrpWVQt7ROpK4++wOC/ZCIKRTo=; b=x5cw9Gbit28/IBkOmeeXT7Zydq
	xcnLAXl6NSc5KSuyTilFbs9BAVi+60ROsKt0mq4J7LmJb2jrQgxAwIc0oThd7kjotoEb/zYCebbuO
	6ncD5utYQtCuZ0MkcSIhws7Qk+tcxcHmWY/JvkLk4ICQJ5jzY311UP0vHU6CFBCVoQeSoLk9tbwnn
	pvNzB9YtlW0bK6kPqSo2kH9pWM3ozubNFJ2cpCNSmKowWLAo7TfOfJBpNfYY06Sxv9wTxvvNwfDzR
	2Iw19reOx+ae+enWyk1b8ReJ8XM8L43NclKCcWlvAh/dXbD7gtF9PQmgPlJslRL2olGjd7B76i+Y1
	HEbW62fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOJ-00C8k8-2W;
	Sat, 16 Sep 2023 08:10:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOF-00C8hv-2h;
	Sat, 16 Sep 2023 08:10:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 515F860AB9;
	Sat, 16 Sep 2023 08:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A202C433C9;
	Sat, 16 Sep 2023 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851852;
	bh=R5nkuuiNFkrWBoIZMqvZG0C7QkTrSVA812AJPM93YC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T/H1dwtuKgkjIYunzM9xo/2q+uyUSMCcCmfrGmFm0GqlpLd05n0eoiu37nqU9B14F
	 ZDdwZp+HFLlYofBUYbFRlSmxg/Vi7yg3Fc0VnC7u0EF89aj8D8hRE2OU5yP6yQRQBv
	 A90KjCUCDlyi+wbVJQRI/BPvgb0oRRv9lH4UGAT4wAW5UeZLqxrwzLkTUxZFrC6R0T
	 6HEQ6WyCBGHJ+VBEiXNSCu651TrgKkzjevCH7ZUnCPm13PQVuWXWMb72h8bI4sbSxl
	 eQ3Extw4R+KwnNGTEZ3NssrkTVnJ/jd7UPN8ph6gKMB9ygkBDdzyUC4QTHUqn5Mnki
	 QAOXOCrf8hnpQ==
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
Subject: [PATCH net-next v2 03/23] net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:09 +0800
Message-Id: <20230916075829.1560-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011055_960125_72274825 
X-CRM114-Status: GOOD (  14.33  )
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

Simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt().

The remove_new() callback now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-generic.c  | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index 20fc455b3337..84582fc04d2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -27,7 +27,7 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 		return ret;
 
 	if (pdev->dev.of_node) {
-		plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+		plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 		if (IS_ERR(plat_dat)) {
 			dev_err(&pdev->dev, "dt configuration failed\n");
 			return PTR_ERR(plat_dat);
@@ -46,17 +46,7 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 		plat_dat->unicast_filter_entries = 1;
 	}
 
-	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_remove_config_dt;
-
-	return 0;
-
-err_remove_config_dt:
-	if (pdev->dev.of_node)
-		stmmac_remove_config_dt(pdev, plat_dat);
-
-	return ret;
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id dwmac_generic_match[] = {
@@ -77,7 +67,7 @@ MODULE_DEVICE_TABLE(of, dwmac_generic_match);
 
 static struct platform_driver dwmac_generic_driver = {
 	.probe  = dwmac_generic_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = STMMAC_RESOURCE_NAME,
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.40.1


