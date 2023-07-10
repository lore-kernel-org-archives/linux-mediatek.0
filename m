Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AE7EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arDDTzx7rlx99hkVbX8UgR21nnOMmWn5Zowe4OJD140=; b=VtbzNDu1Y8fDV5QMJFUEnzCZft
	jzVLdURLWTJTazvfLv1XB5GUE5sEZy2awKxs8c5KZq5uDMaJatXVPqWE2J91OkJQLcfiJh9CNnuMx
	DajPsgDY3EP0PHjQqUosQ2gLenaXEhDWgoPGlW65Hl4h73mtkrGe5k5Bah3gf8r5oUQq/YIMmFcOc
	tz6zjS+PE6G4rtLzjrj3xuUm4MDszTIzZhoKlbjQTlPT/DS5TedykFpjKsbuoeAEoB6OLXtMgGyVH
	N3NvcDhyZ658BWnBM2ifM4KrRlGpyDRZInjvTpfQzbHhTNJ8S+K7OCQxmXh/RZG0JvQxAg0MGBmKs
	rmQGe2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIml9-00Aw1R-3B;
	Mon, 10 Jul 2023 09:00:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkt-00AvgO-19
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 09:00:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso30873695e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979623; x=1691571623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arDDTzx7rlx99hkVbX8UgR21nnOMmWn5Zowe4OJD140=;
        b=2iSQcnqhNfZiZIZ/3gO2EIjwl/BFEdHSROCid1fU6iH8aQLxCkkQMVY13xb3zb/Vns
         +kvNsQMGcKU2c8K/sGMchwkBRNUSXyoV3JdKBe6H1LVWusD+eXI8SOmjnuo4wpIXPbFh
         0pGn/f6M49ssgJlDnCVRvYhmtvSYEGEIE37T58u098IQOj6j0bIqZKrTPrBnYsmWw7OO
         1+ogD6HVxQ1OaouOZ3x4ZNW8764zqhxNSLS2rr/e1mGc2QkvJ37cX0U5Mia/CihNyVf9
         jdZpe8LVPbGIkdLjNTxbtDCams/nhzSprJA8m/pxEDEy3DnvUR9cAnjProXIkTK8TK+D
         lRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979623; x=1691571623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arDDTzx7rlx99hkVbX8UgR21nnOMmWn5Zowe4OJD140=;
        b=RREB8MUDqUr5Tgm7X/Ga6j7feuxzxr3nygyZUoNKPUG76uNCNOP1dZkV69X2YKqEJR
         KFgE1/5GuF/X4FPnIKHAgpQMrC7J7RYFU3h4VEsnvC3acgqqHPPTsxXCL7DwCjy0Ov+h
         Sz6SzDEayh5ACdUKaTN+gOty0lA6lBOK6rDfWo4f2TIhmjaD5tf4r1ZS6sIG22+VYvRI
         UXtaNMXKKltsSlucvDmCtK8VyOsYTsBdiqVCFSGYkuw/mYwdSA6SY4C9MV7W+TYyyKy2
         e6cvXqcD4Vt/35Y2dSuA6s2ayFyDMRAVAU5zOGwm7PgZTExylgib3e3eN9ffVA9RtUa/
         eGwQ==
X-Gm-Message-State: ABy/qLZYqmXjNPmQWRFlbaFeSBtKWkCptoiT1Q4AUGLS+P7VzrOahg5W
	POkS/R7w21Thr/fYZe7624zg9Q==
X-Google-Smtp-Source: APBJJlFo6fjKgcdQJbxXJOik5SZgI9KLZeUeclm33D7nrQbeNuwS9n/s+U+8k1vsFtlMk7zw/qxE8Q==
X-Received: by 2002:a05:600c:d4:b0:3fb:af9a:bf30 with SMTP id u20-20020a05600c00d400b003fbaf9abf30mr11156882wmm.2.1688979623287;
        Mon, 10 Jul 2023 02:00:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:22 -0700 (PDT)
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
Subject: [PATCH net-next v3 09/12] net: stmmac: replace the ext_snapshot_en field with a flag
Date: Mon, 10 Jul 2023 10:59:58 +0200
Message-Id: <20230710090001.303225-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020027_443941_8CB18C8A 
X-CRM114-Status: GOOD (  14.81  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c      | 5 ++++-
 include/linux/stmmac.h                                | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index d8bcf9452197..a3d0da4e9e91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -326,7 +326,7 @@ static int intel_crosststamp(ktime_t *device,
 	/* Both internal crosstimestamping and external triggered event
 	 * timestamping cannot be run concurrently.
 	 */
-	if (priv->plat->ext_snapshot_en)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
 	priv->plat->int_snapshot_en = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 8b50f03056b7..afd81aac6644 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -195,7 +195,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 	 */
 	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
 
-	if (!priv->plat->ext_snapshot_en)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return;
 
 	num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index b4388ca8d211..3d7825cb30bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -192,7 +192,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		write_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	case PTP_CLK_REQ_EXTTS:
-		priv->plat->ext_snapshot_en = on;
+		if (on)
+			priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
+		else
+			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
 		mutex_lock(&priv->aux_ts_lock);
 		acr_value = readl(ptpaddr + PTP_ACR);
 		acr_value &= ~PTP_ACR_MASK;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 3365b8071686..0a77e8b05d3a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -212,6 +212,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
+#define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	int int_snapshot_num;
 	int ext_snapshot_num;
 	bool int_snapshot_en;
-	bool ext_snapshot_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2


