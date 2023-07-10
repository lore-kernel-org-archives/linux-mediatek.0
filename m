Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C31EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldjnmfjuHGS5I55mzTOKMh4kE3v23F5j9MAIR1nY9bo=; b=iAjHpicp8kknPstoiEy/kWgov9
	grnjRN9bWvhaJDgqK2mmAnV1DnS0/WWNY6O66KAWQGpuPGpynUoHdc/n5jRDhjWuJNcyMpqlRF+yC
	8NlMDtcJQRDRS3Kwl3fmG92AWCW+2zqoCukEIZWudcq4rToBqxJHh7T88qfKuRr8ckfLreSmljwjV
	4RYFBv0tCCyR3nSFHK9MgDy8Rk7oAkDzh2p0GSlS0mlHkmrd/DEk4Au4zd+1ycnKnYt12sUxXDktF
	7evCSyHOm799Ac5UVrHIj7gobBD9ioFUP8r2+BhEezwT5Hu2/64oPURGe2jm5jveKUiiyKi/UdihO
	regdD1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkj-00Avbv-0F;
	Mon, 10 Jul 2023 09:00:17 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkg-00AvaO-0N
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 09:00:15 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b701e1c80fso61652751fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979612; x=1691571612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldjnmfjuHGS5I55mzTOKMh4kE3v23F5j9MAIR1nY9bo=;
        b=F1kreUToXPsJ6Yq0Kp9qLuCQkZLUPy75QODJ3HdKF1/6Wb8XYkh0/S/J8tGcClnA2P
         BY4rG6HGWiTt0gQsow8FV5oMqOS1ShXp6Rpe4Dfl2irBlMpBUgauzJjlwZqY1Q3Yug/Q
         mKCf1UvS8uWVUcYD6YktLMEFcyRifoi1oXdxJxTpdNhbNYo4L4A6ddRtFR7nSgv/YZL9
         XJCwhCR9oNvvTrexaB19zQ1DuHyNUJMoQ3z3HpHRNV4MjcA8Fv2z84CrzwlrapLafucu
         LE9Nb9DusQxelX3+kz/7mcklvosGUpSmiCoPKiIlNN17LwIaR/UwFZMucGxUe5XDhGEG
         2XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979612; x=1691571612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldjnmfjuHGS5I55mzTOKMh4kE3v23F5j9MAIR1nY9bo=;
        b=j5NTQN7u7SKOGry1ZQX4BD0+FujXbF+evf34ZpNQLTz0s6SIMnxmO+aROjCGhWvf8x
         3V29GT3ARvfF9CHO9ice5TYC8EUYz9jXo8Z1EJ1bfr2X8XYDX68/Q5KSGGikQcVHJqEF
         vE7597FWF1Q97H7Z+r558cHwbKEOy0QbGFJoLwvRj5O+QD+x0KPNMuV2xX+mW5AYxo8p
         U8WpoUzCaoOdH+u7Q62eqdN2Z9nUvifj9nMeoUZokMvcoruiJ/mMsajlEJWJA0VjHKCo
         8myjIHZTf0qe4F7e8an0PdR17kLixeKIGlke1OQphOTSLNALZt3nXkQZ1ARL/WK4gAvv
         ZWYQ==
X-Gm-Message-State: ABy/qLYeZQaxkw/PRwIaPFN9zhcQdDGSmsLI5gHnQCeBjInZpZrxfena
	Cw0YeKKzkLJ2jMeFhQKUDuoWqA==
X-Google-Smtp-Source: APBJJlGRPy2fogXy7drxV05ZgYXiWSbfmzpdjVgo/I9+7T7LTWJ1gWiMUYTXSdrpwIrkoBvCiWBwhg==
X-Received: by 2002:a2e:800a:0:b0:2b6:a76b:c39e with SMTP id j10-20020a2e800a000000b002b6a76bc39emr8578441ljg.35.1688979612292;
        Mon, 10 Jul 2023 02:00:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:11 -0700 (PDT)
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
Subject: [PATCH net-next v3 01/12] net: stmmac: replace the has_integrated_pcs field with a flag
Date: Mon, 10 Jul 2023 10:59:50 +0200
Message-Id: <20230710090001.303225-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020014_153336_A01163F3 
X-CRM114-Status: GOOD (  15.01  )
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

struct plat_stmmacenet_data contains several boolean fields that could be
easily replaced with a common integer 'flags' bitfield and bit defines.

Start the process with the has_integrated_pcs field.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 3 ++-
 include/linux/stmmac.h                                  | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e62940414e54..a5e708534730 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -780,7 +780,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
 		plat_dat->rx_clk_runs_in_lpi = 1;
-	plat_dat->has_integrated_pcs = data->has_integrated_pcs;
+	if (data->has_integrated_pcs)
+		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4727f7be4f86..38b6cbd8a133 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5798,7 +5798,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		}
 
 		/* PCS link status */
-		if (priv->hw->pcs && !priv->plat->has_integrated_pcs) {
+		if (priv->hw->pcs &&
+		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
 			if (priv->xstats.pcs_link)
 				netif_carrier_on(priv->dev);
 			else
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 06090538fe2d..8e7511071ef1 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -204,6 +204,8 @@ struct dwmac4_addrs {
 	u32 mtl_low_cred_offset;
 };
 
+#define STMMAC_FLAG_HAS_INTEGRATED_PCS		BIT(0)
+
 struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
@@ -293,6 +295,6 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
-	bool has_integrated_pcs;
+	unsigned int flags;
 };
 #endif
-- 
2.39.2


