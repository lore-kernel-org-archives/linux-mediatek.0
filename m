Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75FDC87FD1
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 08:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqjUJgUJpCHNUhRjY+NfR7pAePQsnsdE4LKWsMl2ix4=; b=czHLKmQGvtIKwC
	IbY0fw+WgGpx01thBy4QvGKvyx/LxE/d6KcKrEpkU/0vWYTgforH+AvqEzcmFQmcaVGDowKDxOe5G
	FzZC550sbRpnCy6U7SOEyZpG0ajQGG5ewWzr3Ki/YOPtJOTioiPCXFpaLt4Fl1knSmTyiHUt6zO2s
	n82YE11mtTJq+KGIi+n5/3IgKwrWwFUsdw4A502KaxA7FzxqKI7slNPAQcvNsEjRKhSJb918ZzwR1
	HXoz9QNXVMyzjIExUQ+S4xLCzYSi+BlEfx9gpoes9x2cnwR6MPr5YPKGtsqMYow1UBgIlrekRTbJJ
	/797eZ9zqQSC0ek2818g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCmx-0000000C7Mg-3Qw7;
	Tue, 05 Aug 2025 08:12:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCPb-0000000C47K-2791;
	Tue, 05 Aug 2025 07:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754380122;
	bh=Gh/u3ZCeLuKT6KDNbqOx6/ww1IVasVmdV+hy7t5OtOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jH1/kIh3q5qiE4foEFCFJMAA02QWd8mIItjmHOmyPLRDqpbUG0lA4NKZmcvT+Kbdc
	 uI9Xqxq3wgK3fqIHrCTIvt8TubpXv0a8HygbMzZFD1O0ICrW4gQMRnjbKFZarijoJt
	 h9Gn6sVvKb4Dlp6o7vjVHXyBQ5ki3afJ1Sn1CHSRc648pw85nhwBm3+BtLcNCB0TUP
	 Yc/u5dtEH39wdmLRMQenSKX3lByg3atU+0PBhH3gDqKodloCBa1qohSafCw8yEEf4n
	 1oBhWlelQC5C1eKu2VjeQtLhvj9W0qVcemay+cqC6InH9EEt4uYNtByLnSGZKrvfT5
	 J9we0CNmCLHcw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BCE517E0B11;
	Tue,  5 Aug 2025 09:48:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 06/10] pmdomain: mediatek: Move ctl sequences out of power_on/off functions
Date: Tue,  5 Aug 2025 09:47:42 +0200
Message-ID: <20250805074746.29457-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004843_688836_5E9B6748 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation to support power domains of new SoCs and the modem
power domains for both new and already supported chips, move the
generic control power sequences out of the scpsys_power_on() and
scpsys_power_off() and put them in new scpsys_ctl_pwrseq_on(),
scpsys_ctl_pewseq_off() functions.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 57 ++++++++++++++--------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 6118a389244a..d84f0e7cde12 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -244,11 +244,45 @@ static int scpsys_regulator_disable(struct regulator *supply)
 	return supply ? regulator_disable(supply) : 0;
 }
 
+static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+	bool tmp;
+	int ret;
+
+	/* subsys power on */
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
+
+	/* wait until PWR_ACK = 1 */
+	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp, MTK_POLL_DELAY_US,
+				 MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+
+	return 0;
+}
+
+static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+
+	/* subsys power off */
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
 	struct scpsys *scpsys = pd->scpsys;
-	bool tmp;
 	int ret;
 
 	ret = scpsys_regulator_enable(pd->supply);
@@ -263,20 +297,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
 				  pd->data->ext_buck_iso_mask);
 
-	/* subsys power on */
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
-
-	/* wait until PWR_ACK = 1 */
-	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp, MTK_POLL_DELAY_US,
-				 MTK_POLL_TIMEOUT);
-	if (ret < 0)
+	ret = scpsys_ctl_pwrseq_on(pd);
+	if (ret)
 		goto err_pwr_ack;
 
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
-
 	/*
 	 * In few Mediatek platforms(e.g. MT6779), the bus protect policy is
 	 * stricter, which leads to bus protect release must be prior to bus
@@ -342,12 +366,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
-	/* subsys power off */
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+	scpsys_ctl_pwrseq_off(pd);
 
 	/* wait until PWR_ACK = 0 */
 	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
-- 
2.50.1


