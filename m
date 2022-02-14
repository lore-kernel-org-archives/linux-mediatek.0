Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B90DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UVEgL1KoIOryRui/0Ofc3w+cVEsrvJ3sBUU/HIsu4k=; b=QvGEjBYkKgkL68
	V3qXSSffpeS2ZCkFkyoJJfaN+cRAZxuo/Bgc5UW7fctG5QuyCiS46ZduaiUvvMFKDVOPqdFexL9VO
	FWyhZjeZiKeVBqXdxtX9i0COdyS1MoCt51yNVoh9BTGirm5hxR21/3+0mzSyA1SxM1hn+W0i4yrWb
	KO3mNu7LlPJTEYSRh0TxMurAywPit4zlmzdOiU2b8BPovUtOv7E4WkhjABpsdsxOvebjtrZsjXIa+
	eE3OhVhu5TiHKrzHDX6KOZkHX4WzDxTo5PHrUheFmtwGqDmbea1/MWQODvl5hL9xbXYZ40Q1r3DGV
	zBvNlxF0XBa0Qvibnqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUYh-00DJip-Gd; Mon, 14 Feb 2022 06:09:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUYG-00DJRR-J0; Mon, 14 Feb 2022 06:09:33 +0000
X-UUID: 3cdb7a8d8ebc442095ecfacbba44a53a-20220213
X-UUID: 3cdb7a8d8ebc442095ecfacbba44a53a-20220213
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1918206077; Sun, 13 Feb 2022 23:09:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:09:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:09:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:09:26 +0800
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
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH 03/23] drm/armada: Make use of the helper
 component_compare_of/dev_name
Date: Mon, 14 Feb 2022 14:07:59 +0800
Message-ID: <20220214060819.7334-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_220932_661982_926DACA8 
X-CRM114-Status: GOOD (  14.36  )
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

Use the common compare helpers from component.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/armada/armada_drv.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..224607a6ae16 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -177,17 +177,6 @@ static void armada_drm_unbind(struct device *dev)
 	drm_mm_takedown(&priv->linear);
 }
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
-static int compare_dev_name(struct device *dev, void *data)
-{
-	const char *name = data;
-	return !strcmp(dev_name(dev), name);
-}
-
 static void armada_add_endpoints(struct device *dev,
 	struct component_match **match, struct device_node *dev_node)
 {
@@ -196,7 +185,7 @@ static void armada_add_endpoints(struct device *dev,
 	for_each_endpoint_of_node(dev_node, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
 		if (remote && of_device_is_available(remote))
-			drm_of_component_match_add(dev, match, compare_of,
+			drm_of_component_match_add(dev, match, component_compare_of,
 						   remote);
 		of_node_put(remote);
 	}
@@ -213,7 +202,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = drm_of_component_probe(dev, compare_dev_name, &armada_master_ops);
+	ret = drm_of_component_probe(dev, component_compare_dev_name, &armada_master_ops);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -223,7 +212,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 		int i;
 
 		for (i = 0; devices[i]; i++)
-			component_match_add(dev, &match, compare_dev_name,
+			component_match_add(dev, &match, component_compare_dev_name,
 					    devices[i]);
 
 		if (i == 0) {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
