Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF47EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyyBvpSV8LxDog0ek0zaEgbX3az6xRdpMaG/0FwAEzQ=; b=JBOvlSxKQuxBBk5MHbnxhxPwNt
	bGT0ze/FhOTiNWPQ9MyuJAvLpYhebWQk7X4TClAQ6hlYrjuRuZ6NyxIppg75juzvavhSi6TS+BVUG
	UkGNxaTtJ9hgLcidG6fLe0xqT+PM+2C1hMG3eIPmoTnyuzsNFBphVopqJrf0bdiLOrZlo/LShWq7b
	SKBjQMuUS2dkW8fUB47RnYtr2z6KLO0BqZOkd63bWOVu5PbwMgea8k6ItQIGtBJKEbBYz3SyNRFVl
	8sbrIkzDr4Bd8IIU9hsDFZVF01FlfIHjPXTMYm+axLuZqi8vXm5Wd/NfFMCtNU6H70MqDq6EiKWVz
	9uevTVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkz-00AvrQ-2j;
	Mon, 10 Jul 2023 09:00:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkr-00Avap-0x
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 09:00:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso43061425e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979613; x=1691571613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyyBvpSV8LxDog0ek0zaEgbX3az6xRdpMaG/0FwAEzQ=;
        b=3x1HBwDRhKRpNZtS59+egzHon09AC6viqlxvkgig2u73jYmx2KoeiJv1WiGL7psptP
         oMeODFZTw3hjHXmYBX3QeVeNKw79pLtGo6r+NUK4N7fgNxD5BWuk2ZA8IRrXTOF3GNvY
         fy3dAOOguHIKIbIra8lHLXaDJ2jRzs4s3csIvTScXvBfxT2bCY0/yXUoHOeVYZyUI9AC
         Mr7vbwGBMJuGhmekxfISybKSynGEb/+sV5B81QyA/7tCGowtlyzQPum6C8WZmps/VrLm
         wx5ymFtihSkmQ9FjnCaVtJMJzrwb7VXinhrIMOtWXm5HiUsVkNJedZyIZk2jOb33wNds
         tO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979613; x=1691571613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyyBvpSV8LxDog0ek0zaEgbX3az6xRdpMaG/0FwAEzQ=;
        b=KkbaZqcJjQ+Q5ipV5CsvmDPUfTUyrYHBMhgWjP5qKx4P01nWHMvrSNpmJ0ASaqrEMn
         qDzGotnU+7AMG2JhZd2+y1bZrFk3dVE8fp50fhF/CaCJQhY+IAMLv06oYPWfhDXh5jDx
         q0HswazBOUjQYNlNakZu0Cl0zZcv5+e3Q7h0DFDY1h1dzsHz09P0OltURQejaZxu+ME8
         z3wSaBdvVz6ojsLl08JMTavhGU/013xev/Qt28YVVCZGqlntpMo+4P1kyhBJX8f2Psm3
         WkQbdoe28nftj5vcVvg+uI7suJxbhtsXSBEGt3FLVxtPk6T0+hK0/0hys27/F0qnr3MJ
         seyA==
X-Gm-Message-State: ABy/qLaXscQrMBKmVkIMzligJNc9RWi/Dq2JCX/IcBrJtjcIIA/jP1Sx
	ZbdPg4usm6hejQVeP3Lizw3n6A==
X-Google-Smtp-Source: APBJJlE0CWZzeJZ8TiwIWmaXT0WdMJVW73xR7UitbR/EEdZvdmMI1C9Osy594l6Z5i7AebtR9dEpZA==
X-Received: by 2002:a05:600c:378b:b0:3fb:ffa8:6d78 with SMTP id o11-20020a05600c378b00b003fbffa86d78mr7014533wmr.36.1688979613585;
        Mon, 10 Jul 2023 02:00:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:13 -0700 (PDT)
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
Subject: [PATCH net-next v3 02/12] net: stmmac: replace the sph_disable field with a flag
Date: Mon, 10 Jul 2023 10:59:51 +0200
Message-Id: <20230710090001.303225-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020025_379782_52FA9F97 
X-CRM114-Status: GOOD (  14.44  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 3 ++-
 include/linux/stmmac.h                                  | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 9f88530c5e8c..0c12ab67c27b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -359,7 +359,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	data->fix_mac_speed = tegra_eqos_fix_speed;
 	data->init = tegra_eqos_init;
 	data->bsp_priv = eqos;
-	data->sph_disable = 1;
+	data->flags |= STMMAC_FLAG_SPH_DISABLE;
 
 	err = tegra_eqos_init(pdev, eqos);
 	if (err < 0)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ab9f876b6df7..ae5db39a3f1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -459,7 +459,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 0;
 	plat->tso_en = 1;
-	plat->sph_disable = 1;
+	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
 
 	/* Multiplying factor to the clk_eee_i clock time
 	 * period to make it closer to 100 ns. This value
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 38b6cbd8a133..18e56299363d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7258,7 +7258,8 @@ int stmmac_dvr_probe(struct device *device,
 		dev_info(priv->device, "TSO feature enabled\n");
 	}
 
-	if (priv->dma_cap.sphen && !priv->plat->sph_disable) {
+	if (priv->dma_cap.sphen &&
+	    !(priv->plat->flags & STMMAC_FLAG_SPH_DISABLE)) {
 		ndev->hw_features |= NETIF_F_GRO;
 		priv->sph_cap = true;
 		priv->sph = priv->sph_cap;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8e7511071ef1..1b02f866316c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -205,6 +205,7 @@ struct dwmac4_addrs {
 };
 
 #define STMMAC_FLAG_HAS_INTEGRATED_PCS		BIT(0)
+#define STMMAC_FLAG_SPH_DISABLE			BIT(1)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -292,7 +293,6 @@ struct plat_stmmacenet_data {
 	int msi_rx_base_vec;
 	int msi_tx_base_vec;
 	bool use_phy_wol;
-	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
-- 
2.39.2


