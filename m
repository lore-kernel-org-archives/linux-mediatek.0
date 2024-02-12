Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946EDC4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TI8f8x/5Y4Kr2Vxqhq6Wi5Pu8tSR0ICKXsQgkmtu64=; b=di0X/woLx92kxSf1k+o2PGj/1L
	ALVR0AnedtStApc6M3HQfkm+S4IB1C++XOpu1IvHBE1E9dZTfjHTCJl+BRf1O5N9p44v6Wdjotv6H
	zWE4OrvmYMUIF6LYGCchVD+/LKxxzaerXWu1tOEozSLNi2SnKPIKzqy4bETDlAHe6gg26iw3dn6Ti
	2xF43K4UfGlWANbmypmg31z4sOfXB2B/KKL/3LNsbPavMMFbOACmtO/o8aGKmGAB+ZvOxZ89Rp4O5
	QeoOgIOOJaUVPSHlNKgjoxTBn1Z+Nlh6ve5vMwZP+Ipw1LKGW3CB8uIjz76LQ3+Af6QcReWov4sDZ
	YofxV6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZBD-000000068Wu-102O;
	Mon, 12 Feb 2024 16:29:15 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZAj-0000000687r-1mT4;
	Mon, 12 Feb 2024 16:28:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CGScsB080181;
	Mon, 12 Feb 2024 10:28:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707755318;
	bh=2TI8f8x/5Y4Kr2Vxqhq6Wi5Pu8tSR0ICKXsQgkmtu64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DrBTLoePLehswdRPNH+vUAWqNvS2RdzEsDCDcwlSakra+jODIW6BGbJ+jHKU3N/Uu
	 f50kNvK/DKr7sOwR19Zil95AEpMh2AYNptIWtLM2p4iNjarMe4esDtyIRpRwbrxisb
	 kOews5OxauxAOg9SkBR6a4MbN6N6Sv022qN2QXtQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CGScnF008721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 10:28:38 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 10:28:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 10:28:38 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSWR4090688;
	Mon, 12 Feb 2024 10:28:37 -0600
From: Andrew Davis <afd@ti.com>
To: Sebastian Reichel <sre@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Cristian Ciocaltea
	<cristian.ciocaltea@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-actions@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v4 08/19] power: reset: axxia-reset: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 12 Feb 2024 10:28:20 -0600
Message-ID: <20240212162831.67838-9-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212162831.67838-1-afd@ti.com>
References: <20240212162831.67838-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_082845_747819_DFCE5401 
X-CRM114-Status: GOOD (  11.67  )
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

Use device life-cycle managed register function to simplify probe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/axxia-reset.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/axxia-reset.c b/drivers/power/reset/axxia-reset.c
index 24946766760c3..797bf6773860e 100644
--- a/drivers/power/reset/axxia-reset.c
+++ b/drivers/power/reset/axxia-reset.c
@@ -26,11 +26,10 @@
 #define SC_EFUSE_INT_STATUS	0x180c
 #define   EFUSE_READ_DONE	(1<<31)
 
-static struct regmap *syscon;
-
-static int axxia_restart_handler(struct notifier_block *this,
-				 unsigned long mode, void *cmd)
+static int axxia_restart_handler(struct sys_off_data *data)
 {
+	struct regmap *syscon = data->cb_data;
+
 	/* Access Key (0xab) */
 	regmap_write(syscon, SC_CRIT_WRITE_KEY, 0xab);
 	/* Select internal boot from 0xffff0000 */
@@ -44,14 +43,10 @@ static int axxia_restart_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block axxia_restart_nb = {
-	.notifier_call = axxia_restart_handler,
-	.priority = 128,
-};
-
 static int axxia_reset_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct regmap *syscon;
 	int err;
 
 	syscon = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
@@ -60,7 +55,8 @@ static int axxia_reset_probe(struct platform_device *pdev)
 		return PTR_ERR(syscon);
 	}
 
-	err = register_restart_handler(&axxia_restart_nb);
+	err = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+					    128, axxia_restart_handler, syscon);
 	if (err)
 		dev_err(dev, "cannot register restart handler (err=%d)\n", err);
 
-- 
2.39.2


