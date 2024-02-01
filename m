Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E23C48BF3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjOs3HQelK8dD7ON+CKELNocYhGYtTpRb3RjtcpZp+M=; b=QRcZWnlL94vbN6adDOPyIsZWl0
	l6/P0xypmRYxBcRMx1WmgZ2cZ2XgeejNDdLJXbFuuKvH+GMFeJ1Bv7rMwqdMdaX8TOSs84BMlhQkU
	2JXvcllX/w1TB2jbGDtthxR145Rs2HvVBnGB6e/5S9KPVYFOze+jUfwo3EzgJrbzcMhS9JNUm7kc5
	UIHvxEUrcSWImjzF0ewC8HANVlAQlcXBy/v19NmkFSmPhhQqbwzEJiWPTsLD1CSFuuf906Q3Arxq/
	7IlXYcXGh5MccdAGS2DuB8OORE2k191UhG4QC/up61SwFJ4ybEngIWqylgZHJix7ngSHH4RTktxBO
	sgWGem/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbOM-00000008uLT-3k3e;
	Thu, 01 Feb 2024 18:02:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNM-00000008tSk-3394;
	Thu, 01 Feb 2024 18:01:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I1EiX049636;
	Thu, 1 Feb 2024 12:01:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810474;
	bh=rjOs3HQelK8dD7ON+CKELNocYhGYtTpRb3RjtcpZp+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=alGgElcIFoxueD1e1sbl7KER0iExHsEMJHWdamR5M0QH+QPfnKGNyvhDBrQOFecGG
	 q4tGqqYwHJuILBQ2p7m+Nb9aQ6idMYzD3XqDbK5fLuP7sESOqM50+c4uM4ZhuVTuqL
	 XlckU/hX0u7tdX0M2Hm96ueyrhr8Qd7PoM5Djv08=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I1Eko004643
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:14 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:13 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gv117221;
	Thu, 1 Feb 2024 12:01:13 -0600
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
Subject: [PATCH 17/18] power: reset: syscon-poweroff: Move device data into a struct
Date: Thu, 1 Feb 2024 12:01:01 -0600
Message-ID: <20240201180102.70395-18-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100125_173147_7430138F 
X-CRM114-Status: GOOD (  14.09  )
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

Currently all these device data elements are top level global variables.
Move these into a struct. This will be used in the next patch when
the global variable usage is removed. Doing this in two steps makes
the patches easier to read.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/syscon-poweroff.c | 36 +++++++++++++++------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/power/reset/syscon-poweroff.c b/drivers/power/reset/syscon-poweroff.c
index 1b2ce7734260c..4899a019256e8 100644
--- a/drivers/power/reset/syscon-poweroff.c
+++ b/drivers/power/reset/syscon-poweroff.c
@@ -15,15 +15,19 @@
 #include <linux/pm.h>
 #include <linux/regmap.h>
 
-static struct regmap *map;
-static u32 offset;
-static u32 value;
-static u32 mask;
+struct syscon_poweroff_data {
+	struct regmap *map;
+	u32 offset;
+	u32 value;
+	u32 mask;
+};
+
+static struct syscon_poweroff_data *data;
 
 static void syscon_poweroff(void)
 {
 	/* Issue the poweroff */
-	regmap_update_bits(map, offset, mask, value);
+	regmap_update_bits(data->map, data->offset, data->mask, data->value);
 
 	mdelay(1000);
 
@@ -35,22 +39,22 @@ static int syscon_poweroff_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int mask_err, value_err;
 
-	map = syscon_regmap_lookup_by_phandle(dev->of_node, "regmap");
-	if (IS_ERR(map)) {
-		map = syscon_node_to_regmap(dev->parent->of_node);
-		if (IS_ERR(map)) {
+	data->map = syscon_regmap_lookup_by_phandle(dev->of_node, "regmap");
+	if (IS_ERR(data->map)) {
+		data->map = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(data->map)) {
 			dev_err(dev, "unable to get syscon");
-			return PTR_ERR(map);
+			return PTR_ERR(data->map);
 		}
 	}
 
-	if (of_property_read_u32(dev->of_node, "offset", &offset)) {
+	if (of_property_read_u32(dev->of_node, "offset", &data->offset)) {
 		dev_err(dev, "unable to read 'offset'");
 		return -EINVAL;
 	}
 
-	value_err = of_property_read_u32(dev->of_node, "value", &value);
-	mask_err = of_property_read_u32(dev->of_node, "mask", &mask);
+	value_err = of_property_read_u32(dev->of_node, "value", &data->value);
+	mask_err = of_property_read_u32(dev->of_node, "mask", &data->mask);
 	if (value_err && mask_err) {
 		dev_err(dev, "unable to read 'value' and 'mask'");
 		return -EINVAL;
@@ -58,11 +62,11 @@ static int syscon_poweroff_probe(struct platform_device *pdev)
 
 	if (value_err) {
 		/* support old binding */
-		value = mask;
-		mask = 0xFFFFFFFF;
+		data->value = data->mask;
+		data->mask = 0xFFFFFFFF;
 	} else if (mask_err) {
 		/* support value without mask*/
-		mask = 0xFFFFFFFF;
+		data->mask = 0xFFFFFFFF;
 	}
 
 	if (pm_power_off) {
-- 
2.39.2


