Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A5FC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FMAtC5RlO7Jbgcz7ACyP3z2tGyaNf1QQubxTNs/VVCs=; b=Jas4GgHRl0QJNvnVjMjJY6N5IN
	WjDMFK6Tyg9froCXW2UcMAhbHQ+05yE5povXgM4+94vSZK6KcZLuDYADKm/NmN6XH/I0DGR9resqh
	jCLbzxO2X+rx0W54LIEWTD2OkncGGO2ycoPbJ94K7QBsHaeNNhCpC6zY/L+kKkH+sfikwDaMbBsDQ
	bYVbuxDKlOijXlVlLpEgsT313Z2Wd+G8gQJtmZ72JBv+WBY4Dcd+Hf0aus1eoYQwjEEgjwEj5oFPK
	rKAjTdOdtxv6v6A1vgTVkM5noYNERWiHyLXyFn7kA45V5U8jrtiSm7/BRb2veFgruBVm3Pr/Ddxpp
	LeEzVCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ioi-0088Od-1j;
	Wed, 29 Nov 2023 11:33:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Iof-0088MM-0p;
	Wed, 29 Nov 2023 11:33:18 +0000
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E0A006601F02;
	Wed, 29 Nov 2023 11:33:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701257591;
	bh=x16Rnq7CZEpFbM9s04wUl+znCtY6zt8f98/hPwnLU3c=;
	h=From:To:Cc:Subject:Date:From;
	b=NWrmaJ+GCcglxq208tXL5bSQmTfPx7i69hCbPXnCUxeWxkjyUeJC0uO/ZZ49Oig5q
	 D1vd0wXcKPpaG8YHmzygzS8viumQuoOrtLZ4HlGhj26Ng4Bjtzt5A4ntoeAsxblAt6
	 Xw/z1zN5Gh98+BaWWdPt6vF+esqBVJSw0vZVx2QXrBg86+oFsdfHtP7iGog8zbtT6x
	 HV63cXFbi8Pu58QlB9wIvpHYHXZZPf8i2S4Uf+fdWCm9zI8nSSx+IzPa7/fsy07Qh3
	 yfJ7ZCHeukygDPOEOD/k0+KOurbGnlyT4I8QGBSCnHUemBpwN0tLRjNt/3IOMyFKnG
	 Mqjzf0Nhp/m2A==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: eballetbo@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] pmdomain: mediatek: fix race condition in power on/power off sequences
Date: Wed, 29 Nov 2023 13:31:20 +0200
Message-Id: <20231129113120.4907-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_033317_562346_8910B56B 
X-CRM114-Status: GOOD (  18.63  )
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

It can happen that during the power off sequence for a power domain
another power on sequence is started, and it can lead to powering on and
off in the same time for the similar power domain.
This can happen if parallel probing occurs: one device starts probing, and
one power domain is probe deferred, this leads to all power domains being
rolled back and powered off, while in the same time another device starts
probing and requests powering on the same power domains or similar.

This was encountered on MT8186, when the sequence is :
Power on SSUSB
Power on SSUSB_P1
Power on DIS
	-> probe deferred
Power off DIS
Power off SSUSB_P1
Power off SSUSB

During the sequence of powering off SSUSB, some new similar sequence starts,
and during the power on of SSUSB, clocks are enabled.
In this case, powering off SSUSB fails from the first sequence, because
power off ACK bit check times out (as clocks are powered back on by the second
sequence). In consequence, powering it on also times out, and it leads to
the whole power domain in a bad state.

To solve this issue, added a mutex that locks the whole power off/power on
sequence such that it would never happen that multiple sequences try to
enable or disable the same power domain in parallel.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index d5f0ee05c794..4f136b47e539 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 #include <linux/platform_device.h>
@@ -56,6 +57,7 @@ struct scpsys {
 	struct device *dev;
 	struct regmap *base;
 	const struct scpsys_soc_data *soc_data;
+	struct mutex mutex;
 	struct genpd_onecell_data pd_data;
 	struct generic_pm_domain *domains[];
 };
@@ -238,9 +240,13 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	bool tmp;
 	int ret;
 
+	mutex_lock(&scpsys->mutex);
+
 	ret = scpsys_regulator_enable(pd->supply);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&scpsys->mutex);
 		return ret;
+	}
 
 	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
 	if (ret)
@@ -291,6 +297,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 			goto err_enable_bus_protect;
 	}
 
+	mutex_unlock(&scpsys->mutex);
 	return 0;
 
 err_enable_bus_protect:
@@ -305,6 +312,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 err_reg:
 	scpsys_regulator_disable(pd->supply);
+	mutex_unlock(&scpsys->mutex);
 	return ret;
 }
 
@@ -315,13 +323,15 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	bool tmp;
 	int ret;
 
+	mutex_lock(&scpsys->mutex);
+
 	ret = scpsys_bus_protect_enable(pd);
 	if (ret < 0)
-		return ret;
+		goto err_mutex_unlock;
 
 	ret = scpsys_sram_disable(pd);
 	if (ret < 0)
-		return ret;
+		goto err_mutex_unlock;
 
 	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
 		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
@@ -340,13 +350,15 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
 				 MTK_POLL_TIMEOUT);
 	if (ret < 0)
-		return ret;
+		goto err_mutex_unlock;
 
 	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 
 	scpsys_regulator_disable(pd->supply);
 
-	return 0;
+err_mutex_unlock:
+	mutex_unlock(&scpsys->mutex);
+	return ret;
 }
 
 static struct
@@ -700,6 +712,8 @@ static int scpsys_probe(struct platform_device *pdev)
 		return PTR_ERR(scpsys->base);
 	}
 
+	mutex_init(&scpsys->mutex);
+
 	ret = -ENODEV;
 	for_each_available_child_of_node(np, node) {
 		struct generic_pm_domain *domain;
-- 
2.34.1


