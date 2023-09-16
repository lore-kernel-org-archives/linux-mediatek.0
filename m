Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A957CD37B5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahEDdKJvfgvlryas2qqoUqx/YZLc0pnlpJ2dmFNr0VI=; b=rU/oDSYRBYxvNA1qfZ7T73oQiK
	kWeMY0Du8LDGnI/xhzYRVCvJ9Aq+8iAQWjuvpCqOPou9s2zigdXLTBJ7wODhYFBpWYVnjdYl8u4Kv
	r8ECvW0HjwZ7+tl+c6jrv0m+clpS36cWrsqR5VZhxQwv/f3dlmIJIFfIa4Pa5LgOxATak/lWoWUIE
	qPV0Ngd0S0ZQ3Cs6XoYS1p9OmiCc5RL2cxAyijKXZpBYfsG5TFgt8GCH3776TUuy+asy6/QDYWqTj
	IcEW1r2wN5pi3RdEF+tmWF4vJsaWAaGRI4ufjnU8+uryo+4zdwl1wBkk8sqOIVDK0ZW91CCpv2jt2
	GrsUPdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOQ-00C8oZ-35;
	Sat, 16 Sep 2023 08:11:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOM-00C8lI-2q;
	Sat, 16 Sep 2023 08:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E43E7CE2AEF;
	Sat, 16 Sep 2023 08:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14813C433D9;
	Sat, 16 Sep 2023 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851859;
	bh=QBvxkEj1DY0GKW8rngBNgzoMssSjhwO/YTw1SWluFmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tT1UDKXF4g13p6ekgVnkAUNhKK4luSogO7ZsQtDsbMGYyg5lNE/MlDTnZsWgqpLMA
	 5t9KZMLqtJ8qV5NwoKHF5AgmuhNlidGy4GcIQAat1PG/1taOzwP5evYs2OSqgTY/bH
	 yYqaCyyOGARBajosF08MOJhLoObkVpzEJnEI2qIDsDAx7O66m7wpy492+cRkUj71gX
	 ssLZYNd6WFrpp4G/eTaq6k8FmSwOsWEzPbycTqUmoJnPw9S8/98qO7vAVugt3fzsTv
	 GKx8+0bK2ZU1P7FUZBU/4lKBAzRT5i3OjZ88i6xGJa7Ozgu4jDV1/T30vYJ9U9ru+e
	 WQzUsx0OKeoQw==
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
Subject: [PATCH net-next v2 04/23] net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
Date: Sat, 16 Sep 2023 15:58:10 +0800
Message-Id: <20230916075829.1560-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011103_111388_329A6936 
X-CRM114-Status: GOOD (  13.06  )
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

Use the devres variant of stmmac_pltfr_probe() and finally drop the
remove() hook.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index 84582fc04d2e..598eff926815 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -46,7 +46,7 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 		plat_dat->unicast_filter_entries = 1;
 	}
 
-	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id dwmac_generic_match[] = {
@@ -67,7 +67,6 @@ MODULE_DEVICE_TABLE(of, dwmac_generic_match);
 
 static struct platform_driver dwmac_generic_driver = {
 	.probe  = dwmac_generic_probe,
-	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = STMMAC_RESOURCE_NAME,
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.40.1


