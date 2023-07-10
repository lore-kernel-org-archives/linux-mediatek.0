Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA56EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVtFhd0Km8syItagysZcPYxDGwV5P+/dGFTOfEg0+Yc=; b=fGrkU9ZrJZHZs1uN2uKqUOOqCk
	g643k9mRfo15aHfcnnSB6VqQBLne9aDCCIZUXpSfQpaHCeWqxVkpgI3WkQYdmnWENeLFvWFW9dwJH
	W9rGVpZH7sCRfZfHA04ydlE92a4scMvY5kDEc/TszKy0EK6wOHrk7nOdaJEtglrGTwJenEU9ZcgBM
	E/jgbH1vUBbgdgMsONu5xu96mpc1bhrctG9r4w9ijJRxpTDdJMJ2K4Y04jxwuCLUxxh4zeNoaxfvf
	nNspQn+iqbKXnrj4cNkOW0gyKZ51TPEi3WTl7V4n5WgBYbVbBieeIrKrzivWIAMDGZ4zQ+5I+emA6
	sjAn8+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImlN-00AwCi-0d;
	Mon, 10 Jul 2023 09:00:57 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkw-00Avk3-33
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 09:00:33 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so65074291fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979626; x=1691571626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVtFhd0Km8syItagysZcPYxDGwV5P+/dGFTOfEg0+Yc=;
        b=CddbWTskACPRtMQSrRi4hJeH5Iup7rrWzy4Y8GGk40YSMoIVZ0micpUHWhleaEjv+U
         wKS3OBd0Nl397l8bwV8e9M1orYGwEMc0VG4rCfFxqiHRmVhQGKLtknOwXuDKrva7rglX
         ecl89XAzYl15aSaP8fCzOsRoecFyyGAu1YUaZr3d89Mfdb8ZmSgxo8+ONF6EVPjlJFPd
         OV+5BOOxYHddIf1neWL3qxjyUfhAEVkA3qZqZlwQt1hSI/UXdRieUC/ZQQvRVA7FEz4o
         +mAK24YMtG1mgMKy7fLp4WmXKocn32um2M+EeyMIzwCrCYQZ30cjEt/orHyh2Y1Cw7c7
         6pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979626; x=1691571626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVtFhd0Km8syItagysZcPYxDGwV5P+/dGFTOfEg0+Yc=;
        b=dlgAf12C2suUp+CXbINSdT5ZuldxnMxUn2Fs4a0X6Ci5SOwW6TurRWcid2h1ig8CrJ
         3Jm8rUyl12Exo8DfNjG/lASGVfrxIIPqFVWImGI9B9zL000J63C2KUAO1o8vRvmd3Eeq
         CxnKCuKJaBwdZ7vJwsWgoOA3KB4lhZhziIQRXTDKn3DPjDCWdV1eZURugGySJx7kv67O
         eoLSvIn9iSEj8t1EDMFAJnUB3bCc7badmG41FJa13nJ+kJqIpWLy1LPzxhIAuBTn4BYU
         n5OW3uU6JFB8XnI/G6DXs4OaNztR66KRqnrUGPN68sECmFQc+8nU0hiM9uHh0e8dQBsi
         ArzQ==
X-Gm-Message-State: ABy/qLaQhwWINdgWh5NY10RqqTOtYhSAbrxAEy+yZ0u5iY/Px8SyTZb+
	xAWfSdHwrJtDxyHBxASQpUr/xw==
X-Google-Smtp-Source: APBJJlEP8RjYI6mEVqb8E5PCwkoT0tyhZKt8ufMjMDNngPcNAkchhf2+a4Mz1t5LkL2DBdggALs1DA==
X-Received: by 2002:a2e:9815:0:b0:2b6:d8d5:15b1 with SMTP id a21-20020a2e9815000000b002b6d8d515b1mr8428218ljj.50.1688979625880;
        Mon, 10 Jul 2023 02:00:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:25 -0700 (PDT)
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
Subject: [PATCH net-next v3 11/12] net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
Date: Mon, 10 Jul 2023 11:00:00 +0200
Message-Id: <20230710090001.303225-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020031_004249_648055FF 
X-CRM114-Status: GOOD (  12.95  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 3 ++-
 include/linux/stmmac.h                                  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2692ccebea50..fb593250c2e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -780,7 +780,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
-		plat_dat->rx_clk_runs_in_lpi = 1;
+		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ebe82e7b50fc..2d68a6e84b0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1085,7 +1085,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (phy && priv->dma_cap.eee) {
 		priv->eee_active =
-			phy_init_eee(phy, !priv->plat->rx_clk_runs_in_lpi) >= 0;
+			phy_init_eee(phy, !(priv->plat->flags &
+				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 47708ddd57fd..c3769dad8238 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -214,6 +214,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
+#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -280,7 +281,6 @@ struct plat_stmmacenet_data {
 	int rss_en;
 	int mac_port_sel_speed;
 	bool en_tx_lpi_clockgating;
-	bool rx_clk_runs_in_lpi;
 	int has_xgmac;
 	u8 vlan_fail_q;
 	unsigned int eee_usecs_rate;
-- 
2.39.2


