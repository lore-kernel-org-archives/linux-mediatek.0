Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABC5C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnHQ3fi87K++JEC2M0ntC2YZiqmq2Ji0WvPuznxbUTo=; b=jYZdr0eE2MKRlOFaExgxNM3Qum
	aNECagqljXFuKiYXxw/3+7m2BMau6kwDbJJaHhntwROIZNYMA3DAA86PElj6VMSg4CgaIM8SImxAS
	2vntYcRZjsMmuC4ls6bR/g0JP6qXHJEWV+fpNBlJ/WeLeQhuZkH27CussR3Xf3A4PidRST8KLfdXE
	HqhiRSyOfuE6az617UEjs43IMXrIia2Z4Pqrfofl3sKey4J41of0Sl3RdYjknZaick9Lc6zcoxhLu
	pFNP0jys+vnZb319Hb0BJzVT9dn9xy+KZmsuhuW0Tch7LBJZ8l8rR1gWNOtjECbVCb9dwXHFeXviN
	j0UaUQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIml0-00Avrt-1I;
	Mon, 10 Jul 2023 09:00:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkr-00Avdx-28
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 09:00:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31297125334so3082070f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979619; x=1691571619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnHQ3fi87K++JEC2M0ntC2YZiqmq2Ji0WvPuznxbUTo=;
        b=N8FoaXMEK+aMYvF61rZfw/0IJ4HERniJB6QHkMAJLUCUK3l2YkHzy70XCo8BjSzWPf
         h1QZhe8KthJWFMd7Nq4hp97vsECYuL6KopLzZ2hJjvANNDOwIsV5Axlg4AItZDisHHPO
         1ut/nE84+pvgcYK0xK5Rg6D6YnJuRasLI3LR46+t+HtSx5GgO6m9ygYRX2fsH6JzSrMu
         5SVw/1bT06b2c8YRBfH9EJDa7AJrt0ij7pF6ZECKfvt/DT9+RxGwlH3OXzGHm0fRszzy
         yGbOuISYexvTTbCpcOr1NiRh9012pOpNrUmBvTYcNRDByckYTOog3YV6qKqssLdqcTaT
         QaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979619; x=1691571619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnHQ3fi87K++JEC2M0ntC2YZiqmq2Ji0WvPuznxbUTo=;
        b=UO7J6R1E+BGGUjY7SC7//MPVHx5OxcePSW2w31vSXVyBWjmuag16jl/4hSNrbgy1Yi
         W2ej/92P4datp8gBVN12b9HyjwZHP81D/QCAKkuGPFQjR6SQc42LET9pX3898BzVbZnX
         bBFC9zy+NGYJvn3G5byaHf077wpuNNouuIZPuc7bmy+d6p6yTBcMzOnIbiCwB9PnoRSs
         qKpNxiWnG+4usbkhyaZuowyVrjsphIJSjfZ7om7vMfzaJPkNF2dL/TPmyN8iwfWn0o39
         IrZMyrmDamPZzagLxZRowRjFCeRwzr2p5rImsejoKclAgQjQx0zWEq8RuBno6AMKL4+W
         okbg==
X-Gm-Message-State: ABy/qLb3E0olvdQ/06WrPQYE660GAX92rj32zIvZdqTZ0mRVLPpY3Lr3
	DidCcHkVO5TIPbS9TjpPOj103A9pI+cJsY0iJ/Q=
X-Google-Smtp-Source: APBJJlGaYeE99qIjOJtk3m8CcGSQgsKCJBRsAEzPeWRKB/MswF8PGLBEKsqz3/EZ5OF3Hz63KsveXg==
X-Received: by 2002:a5d:4529:0:b0:314:17ac:5bac with SMTP id j9-20020a5d4529000000b0031417ac5bacmr14239778wra.33.1688979619525;
        Mon, 10 Jul 2023 02:00:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v3 06/12] net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
Date: Mon, 10 Jul 2023 10:59:55 +0200
Message-Id: <20230710090001.303225-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020025_737027_83DE0D4E 
X-CRM114-Status: GOOD (  14.93  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the boolean field of the plat_stmmacenet_data structure in favor of a
simple bitfield flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ++++++---
 include/linux/stmmac.h                            | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index 5e8aa03cffae..99e2e5a5cd60 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -337,7 +337,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	/* Program SID */
 	writel(MGBE_SID, mgbe->hv + MGBE_WRAP_AXI_ASID0_CTRL);
 
-	plat->serdes_up_after_phy_linkup = 1;
+	plat->flags |= STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP;
 
 	err = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (err < 0)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 73002ed923aa..d444514db07e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -991,7 +991,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	u32 old_ctrl, ctrl;
 
-	if (priv->plat->serdes_up_after_phy_linkup && priv->plat->serdes_powerup)
+	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
+	    priv->plat->serdes_powerup)
 		priv->plat->serdes_powerup(priv->dev, priv->plat->bsp_priv);
 
 	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
@@ -3838,7 +3839,8 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_reset_queues_param(priv);
 
-	if (!priv->plat->serdes_up_after_phy_linkup && priv->plat->serdes_powerup) {
+	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
+	    priv->plat->serdes_powerup) {
 		ret = priv->plat->serdes_powerup(dev, priv->plat->bsp_priv);
 		if (ret < 0) {
 			netdev_err(priv->dev, "%s: Serdes powerup failed\n",
@@ -7623,7 +7625,8 @@ int stmmac_resume(struct device *dev)
 			stmmac_mdio_reset(priv->mii);
 	}
 
-	if (!priv->plat->serdes_up_after_phy_linkup && priv->plat->serdes_powerup) {
+	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
+	    priv->plat->serdes_powerup) {
 		ret = priv->plat->serdes_powerup(ndev,
 						 priv->plat->bsp_priv);
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 47ae29a98835..aeb3e75dc748 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -209,6 +209,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_USE_PHY_WOL			BIT(2)
 #define STMMAC_FLAG_HAS_SUN8I			BIT(3)
 #define STMMAC_FLAG_TSO_EN			BIT(4)
+#define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -293,7 +294,6 @@ struct plat_stmmacenet_data {
 	int msi_sfty_ue_vec;
 	int msi_rx_base_vec;
 	int msi_tx_base_vec;
-	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
 };
-- 
2.39.2


