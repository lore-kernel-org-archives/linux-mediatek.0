Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11782C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LALXqPAqW+7Q79gDKDTzzbguncwk/m4qbImzXFUbIpM=; b=V8Sh8f8blcfAaP
	GYQhgBloiBYEXqXQu8C2us9eQNqwm/7EVPKDxDf7AFp5AVnCsc6Z7FPThaXrQpa3tAIptRSaJ5aOs
	Djks9EJWZ32hP9JisiBluLvJa7MkVpfn7K6DvQDVcRqpINLAQ/IDtQHjCkWAgmyqBBwwFkFZBSN3z
	kpaLJSPlBLKvPRxmdT43I1vzY1Ed4aimErRjLftBf6aYTq8nNoKIeBdQbOqFPapvqcqn1C9JqjpyI
	sFYlbNU2cA5fUkwC3NwJE1czNkcQoKjBsXmtTq9oBbvkG5RyDKfb5L5rIdy7d0r073Xjz7X3Ubu/+
	j5QkRc2vhI44MNXBcc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk4z-00314M-65; Fri, 10 Dec 2021 17:53:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvk4X-0030r9-GB; Fri, 10 Dec 2021 17:52:42 +0000
X-UUID: cc7a13090ac0424bb594e9f73d5ba116-20211210
X-UUID: cc7a13090ac0424bb594e9f73d5ba116-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 375882121; Fri, 10 Dec 2021 10:52:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:52:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:35 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 06/12] soc: mediatek: apu: Add MT8195 APU power driver
Date: Sat, 11 Dec 2021 01:52:17 +0800
Message-ID: <20211210175223.31131-7-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_095241_596479_74DDB914 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add APU power driver for MT8195 to support for
subsys clock and regulator controller.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/soc/mediatek/apusys/apu-pwr.c | 34 ++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/apusys/apu-pwr.c b/drivers/soc/mediatek/apusys/apu-pwr.c
index e8e54a767aff..73e08b442558 100644
--- a/drivers/soc/mediatek/apusys/apu-pwr.c
+++ b/drivers/soc/mediatek/apusys/apu-pwr.c
@@ -578,10 +578,25 @@ static struct apupwr_plat_data mt8192_apu_power_data = {
 	.ops = &mt8192_pwr_ops,
 };
 
+static const struct apupwr_plat_reg mt8195_pwr_reg = {
+	.opp_user = 0x40,
+	.opp_thermal = 0x44,
+	.opp_curr = 0x48,
+	.opp_mask = 0xF,
+};
+
+static struct apupwr_plat_data mt8195_apu_power_data = {
+	.dvfs_user = MDLA1,
+	.plat_regs = &mt8195_pwr_reg,
+};
+
 static const struct of_device_id apu_power_of_match[] = {
 	{
 		.compatible = "mediatek,mt8192-apu-power",
 		.data = &mt8192_apu_power_data
+	}, {
+		.compatible = "mediatek,mt8195-apu-power",
+		.data = &mt8195_apu_power_data
 	}, {
 		/* Terminator */
 	},
@@ -597,13 +612,30 @@ static struct platform_driver apu_power_driver = {
 	},
 };
 
+static const struct of_device_id apu_combo_iommu[] = {
+	{ .compatible = "mediatek,apu_combo_iommu0"},
+	{ .compatible = "mediatek,apu_combo_iommu1"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, apu_combo_iommu);
+
+static struct platform_driver apu_combo_iommu_driver = {
+	.driver = {
+		.name = "apu_combo_iommu",
+		.of_match_table = of_match_ptr(apu_combo_iommu),
+	},
+};
+
 static int __init apu_power_drv_init(void)
 {
-	return platform_driver_register(&apu_power_driver);
+	platform_driver_register(&apu_power_driver);
+	platform_driver_register(&apu_combo_iommu_driver);
+	return 0;
 }
 
 static void __exit apu_power_drv_exit(void)
 {
+	platform_driver_unregister(&apu_combo_iommu_driver);
 	platform_driver_unregister(&apu_power_driver);
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
