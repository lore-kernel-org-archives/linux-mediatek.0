Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C5C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TI8f8x/5Y4Kr2Vxqhq6Wi5Pu8tSR0ICKXsQgkmtu64=; b=iJNFLLgVHNOsX3S1qjKMvEpC1c
	2UJnqN7EoC9jwgHWPuPIVm7pAw+MIP0vk253RA/FpBXzY1esdVLL6g0+EQUA+GwTGATpytn0X8urc
	Rra80gUPIQN8jMutryY422ko3MNOfYJuKYfNTJboPFuNryBZm3qMkpvlWauEq6Z0CxEeVQ/Uqu5Ok
	zKN0SY/tCXg447nrbfg/KhLxhu1a7eGkYfbnT2miu2yfXH6zYg/TDk8kWPTomtO3GjdtL6jhYTr/p
	ZAr1yxxP7qlf5IbWci/MluEwgBf2nWcFhblmF5tHhdyRyEHopoir1+0qa2bGF/10/a1QDUUAta/2l
	Zs2lruYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7re-0000000EPcR-1jJ7;
	Thu, 08 Feb 2024 17:07:17 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7p3-0000000EOe0-2yQ1;
	Thu, 08 Feb 2024 17:04:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4Hj8095459;
	Thu, 8 Feb 2024 11:04:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411857;
	bh=2TI8f8x/5Y4Kr2Vxqhq6Wi5Pu8tSR0ICKXsQgkmtu64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lUW4NAlkPsJuI6D1P8bsYr+Ts/dbS0Y7PTS+OtwWD6hHYJpmfBG6gsZu0wTHJAF5x
	 nUU8aMKtSTpEQBZCDN8vVDTdZFH/IxH5KpKkxKxbOIy1LMgWB6xDLTW2+CeFlup7n6
	 XqVMPLUBwHSJOUplpIgNERCBALN4tL9UKlCU9y70=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4HY1023350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:17 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:17 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B6A091006;
	Thu, 8 Feb 2024 11:04:16 -0600
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
Subject: [PATCH v3 08/19] power: reset: axxia-reset: Use devm_register_sys_off_handler(RESTART)
Date: Thu, 8 Feb 2024 11:03:59 -0600
Message-ID: <20240208170410.67975-9-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090426_690297_EBE42766 
X-CRM114-Status: GOOD (  11.64  )
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


