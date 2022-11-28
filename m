Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84686C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8EbibBJSd7z4MfmeAczsshWIFf4TRYZ+btw4WjPL7o=; b=iZlSEDQRba+Xv1w+L6RnTwbkgj
	6SS9uP2MxII31vx9/wJ9PvHfZJNDn6TnateADcXu0dwdbAiishSZVPJKIpW2DBMVxMlB2JuH8v3mc
	cxiHYP5vem5+WW7fh4BW9UKPhWQeqo4q7NjbzXuFcuSwMzsqaKMuo5hkJ/BB5thR2DaryCh/KJ0G3
	0WLxIQXvSeGmEwJrDL8nhHAJkxqAR/pDtfeW2/e9ChqNNhAwy2bGVJHaJGr8gj1ON2Xkbrf/D+8ti
	1Sh0HH0cZTGYwjIH7Jeu/5NjL3pDxh80UXWQR3kUAtzydYnwUI4h/R5YxTWee9rxmsTABWJvBoWH8
	GdbeQ0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfGz-002FvH-3O; Mon, 28 Nov 2022 14:38:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfGw-002FsR-7m
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 14:38:16 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NLSjY0gmKzHwCy;
	Mon, 28 Nov 2022 22:37:21 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 28 Nov 2022 22:38:02 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 28 Nov
 2022 22:38:01 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <lee@kernel.org>, <cy_huang@richtek.com>, <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <yangyingliang@huawei.com>
Subject: [PATCH] mfd: mt6370: fix potential null-ptr-deref and uaf while removing device
Date: Mon, 28 Nov 2022 22:36:01 +0800
Message-ID: <20221128143601.1698148-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_063814_664901_05C5F4DC 
X-CRM114-Status: GOOD (  13.04  )
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

I got the a UAF and a null-ptr-deref reports while
doing module loading test:

==================================================================
BUG: KASAN: use-after-free in regulator_register.cold.70+0x191/0xe78
Read of size 8 at addr ffff888118fb8c28 by task systemd-udevd/261

CPU: 2 PID: 261 Comm: systemd-udevd Tainted: G                 N 6.1.0-rc3+
Call Trace:
 <TASK>
 dump_stack_lvl+0x67/0x83
 print_report+0x178/0x4b0
 kasan_report+0x90/0x190
 regulator_register.cold.70+0x191/0xe78
 devm_regulator_register+0x57/0xb0
 mt6370_regulator_probe.cold.1+0xd8/0x222 [mt6370_regulator]

Allocated by task 261:
 kasan_save_stack+0x1c/0x40
 kasan_set_track+0x21/0x30
 __kasan_kmalloc+0x7e/0x90
 __kmalloc_node_track_caller+0x55/0x1b0
 devm_kmalloc+0x5e/0x110
 of_get_regulator_init_data+0x9e/0xd60
 regulator_of_get_init_data+0x1a3/0x270
 regulator_register+0x227/0x620
 devm_regulator_register+0x57/0xb0
 mt6370_regulator_probe.cold.1+0xd8/0x222 [mt6370_regulator]

Freed by task 250:
 kasan_save_stack+0x1c/0x40
 kasan_set_track+0x21/0x30
 kasan_save_free_info+0x2a/0x50
 __kasan_slab_free+0x102/0x190
 __kmem_cache_free+0xca/0x400
 release_nodes+0x9b/0xb9
 devres_release_group.cold.10+0x5f/0x64
 i2c_device_remove+0x60/0xf0
 device_remove+0x73/0xc0
 device_release_driver_internal+0x12d/0x210
 bus_remove_device+0x1bd/0x240
 device_del+0x357/0x770
 i2c_unregister_device.part.22+0xe2/0x100
 i2c_unregister_device+0x29/0x30
==================================================================

Here is how UAF happens:

CPU A				|CPU B
mt6370_probe()			|
  devm_mfd_add_devices()	|
				|mt6370_regulator_probe()
				|  regulator_register()
				|    //allocate init_data and add it to devres
				|    regulator_of_get_init_data()
i2c_unregister_device()		|
  device_del()			|
    devres_release_all()	|
      // init_data is freed	|
      release_nodes()		|
				|  // using init_data causes UAF
				|  regulator_register()

While probing mt6370 regulator, the init_data is allocated in
regulator_of_get_init_data(), and it's added to devres of
device mt6370. When the device mt6370 is deleting, the devres
is freed, then it causes a UAF in regulator_register().

==================================================================
BUG: kernel NULL pointer dereference, address: 0000000000000354
CPU: 2 PID: 261 Comm: systemd-udevd Tainted: G    B            N 6.1.0-rc3+
RIP: 0010:regmap_read+0x21/0xc0
Call Trace:
 <TASK>
 regulator_get_voltage_sel_regmap+0x98/0x110
 regulator_attr_is_visible+0x2da/0x4c0
 internal_create_group+0x1f5/0x6b0
 internal_create_groups.part.4+0x65/0xe0
 sysfs_create_groups+0x24/0x50
 device_add+0x5a9/0x1100
 regulator_register.cold.70+0xb06/0xe78
 devm_regulator_register+0x57/0xb0
 mt6370_regulator_probe.cold.1+0xd8/0x222 [mt6370_regulator]
==================================================================

Here is how null-ptr-deref happens:

CPU A				|CPU B
mt6370_probe()			|
  // add regmap to devres	|
  devm_regmap_init()		|
  devm_mfd_add_devices()	|
				|
i2c_unregister_device()		|
  device_del()			|
    devres_release_all()	|
      // regmap is removed	|
      remove_nodes()		|
				|mt6370_regulator_probe()
				|  regulator_register()
				|  // can't find regmap, it's NULL
				|  devm_get_regmap()
				|  device_add()
				|    // causes null-ptr-deref
				|    regulator_get_voltage_sel_regmap()

While probing mt6370 regulator, the mt6370 is deleting, the devres
are removed including regmap, so in regulator_register() get a NULL
regmap pointer, then it causes null-ptr-derf while using it in
regulator_get_voltage_sel_regmap().

To fix theses races, switch to use non-devm function to add mfd
devices, make removing child(regulator) devices earlier than
freeing parent device resources, so the devres can not be freed
until mt6370_regulator_probe() is finished.

Fixes: b2adf788e603 ("mfd: mt6370: Add MediaTek MT6370 support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/mfd/mt6370.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
index cf19cce2fdc0..dd19146612cf 100644
--- a/drivers/mfd/mt6370.c
+++ b/drivers/mfd/mt6370.c
@@ -268,28 +268,33 @@ static int mt6370_probe(struct i2c_client *i2c)
 	switch (vid) {
 	case MT6370_VENID_MT6372P:
 	case MT6370_VENID_MT6372CP:
-		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
-					   mt6372_exclusive_devices,
-					   ARRAY_SIZE(mt6372_exclusive_devices),
-					   NULL, 0,
-					   regmap_irq_get_domain(info->irq_data));
+		ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				      mt6372_exclusive_devices,
+				      ARRAY_SIZE(mt6372_exclusive_devices),
+				      NULL, 0,
+				      regmap_irq_get_domain(info->irq_data));
 		break;
 	default:
-		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
-					   mt6370_exclusive_devices,
-					   ARRAY_SIZE(mt6370_exclusive_devices),
-					   NULL, 0,
-					   regmap_irq_get_domain(info->irq_data));
+		ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				      mt6370_exclusive_devices,
+				      ARRAY_SIZE(mt6370_exclusive_devices),
+				      NULL, 0,
+				      regmap_irq_get_domain(info->irq_data));
 		break;
 	}
 
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add the exclusive devices\n");
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
-				    mt6370_devices, ARRAY_SIZE(mt6370_devices),
-				    NULL, 0,
-				    regmap_irq_get_domain(info->irq_data));
+	return mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+			       mt6370_devices, ARRAY_SIZE(mt6370_devices),
+			       NULL, 0,
+			       regmap_irq_get_domain(info->irq_data));
+}
+
+static void mt6370_remove(struct i2c_client *i2c)
+{
+	mfd_remove_devices(&i2c->dev);
 }
 
 static const struct of_device_id mt6370_match_table[] = {
@@ -304,6 +309,7 @@ static struct i2c_driver mt6370_driver = {
 		.of_match_table = mt6370_match_table,
 	},
 	.probe_new = mt6370_probe,
+	.remove = mt6370_remove,
 };
 module_i2c_driver(mt6370_driver);
 
-- 
2.25.1


