Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AE0C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tooZlTqbaZBvodytaADUdZi65+batlJUmn9b99AdCT4=; b=D/qt6sCkXY2m/S
	/dNq/pChiEte4cKOiBdstIyxnuGpD4NUwvWIZzoUsPFo+gsrg1z3gvv3Sy4T706JsGEjvo91v/Pht
	JYxXdFRxugMSdh+mQuIRRLByZ4VcTLOTG+820ydHQXinyFdedsJyJfl/fxlpWnJbbOLZczJSiTYG2
	EAYjp/dzPxRvzgyvxohhaeArV0dv+7lW77Dbv3VZu9bAsBWNfMWA25jFJwnIXGi7dpD3BVzRWtrSA
	apqec/V9wC0HK/s851LTgEWe9kIF9VDb5MxIvyu/pkwHAA2VfD88VZDKnKqvf6PkrpuuhBWOwFdAe
	kEP6tfeCM8Tly7NbltWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUYH-00DJSB-VU; Mon, 14 Feb 2022 06:09:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUXu-00DJJg-OH; Mon, 14 Feb 2022 06:09:12 +0000
X-UUID: 68f19dada9a948bda1bea5100492d223-20220213
X-UUID: 68f19dada9a948bda1bea5100492d223-20220213
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 268987049; Sun, 13 Feb 2022 23:09:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:09:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:09:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:09:01 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
CC: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <iommu@lists.linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-kernel@vger.kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Stephen
 Boyd" <sboyd@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, <srv_heupstream@mediatek.com>, Rob Clark
 <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 01/23] component: Add common helper for compare/release
 functions
Date: Mon, 14 Feb 2022 14:07:57 +0800
Message-ID: <20220214060819.7334-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_220910_818799_505E99DF 
X-CRM114-Status: GOOD (  15.67  )
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

The component requires the compare/release functions, there are so many
copies in current kernel. Just define four common helpers for them.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
I have run "make htmldocs". Due to my poor english, If the grammer is
wrong or need more comments, please help to correct or supplement.
Thanks.
---
 drivers/base/component.c  | 58 +++++++++++++++++++++++++++++++++++++++
 include/linux/component.h |  6 ++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 2d25a6416587..3d72d2820d7d 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/debugfs.h>
 
@@ -287,6 +288,63 @@ static void take_down_master(struct master *master)
 	}
 }
 
+/**
+ * component_compare_of - A common component compare function for of_node
+ * @dev: component device
+ * @data: @compare_data from component_match_add_release()
+ *
+ * A common compare function when compare_data is device of_node. e.g.
+ * component_match_add_release(masterdev, &match, component_release_of,
+ * component_compare_of, component_dev_of_node)
+ */
+int component_compare_of(struct device *dev, void *data)
+{
+	return device_match_of_node(dev, data);
+}
+EXPORT_SYMBOL_GPL(component_compare_of);
+
+/**
+ * component_release_of - A common component release function for of_node
+ * @dev: component device
+ * @data: @compare_data from component_match_add_release()
+ *
+ * About the example, Please see component_compare_of().
+ */
+void component_release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+EXPORT_SYMBOL_GPL(component_release_of);
+
+/**
+ * component_compare_dev - A common component compare function for dev
+ * @dev: component device
+ * @data: @compare_data from component_match_add_release()
+ *
+ * A common compare function when compare_data is struce device. e.g.
+ * component_match_add(masterdev, &match, component_compare_dev, component_dev)
+ */
+int component_compare_dev(struct device *dev, void *data)
+{
+	return dev == data;
+}
+EXPORT_SYMBOL_GPL(component_compare_dev);
+
+/**
+ * component_compare_dev_name - A common component compare function for device name
+ * @dev: component device
+ * @data: @compare_data from component_match_add_release()
+ *
+ * A common compare function when compare_data is device name string. e.g.
+ * component_match_add(masterdev, &match, component_compare_dev_name,
+ * "component_dev_name")
+ */
+int component_compare_dev_name(struct device *dev, void *data)
+{
+	return device_match_name(dev, data);
+}
+EXPORT_SYMBOL_GPL(component_compare_dev_name);
+
 static void devm_component_match_release(struct device *parent, void *res)
 {
 	struct component_match *match = res;
diff --git a/include/linux/component.h b/include/linux/component.h
index 16de18f473d7..6bc1c6e7f76d 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -82,6 +82,12 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
+/* A set helper functions for component compare/release */
+int component_compare_of(struct device *dev, void *data);
+void component_release_of(struct device *dev, void *data);
+int component_compare_dev(struct device *dev, void *data);
+int component_compare_dev_name(struct device *dev, void *data);
+
 void component_master_del(struct device *,
 	const struct component_master_ops *);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
