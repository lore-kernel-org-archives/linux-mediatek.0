Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86290C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkQYH23p/KQN8uq6g670TziXZkelTAAZIfGLJBnQIAA=; b=v7MYpezUirMI8C
	GiJWX6WeuIg5kU9t89hxrHvOYGbHIhqVOY8AuOn/+YeT/JgQ6Cd/Urf8FQpqLVaHtsR9i3kUdHyWi
	UYdY0R3ddISszLpAmC/MYLJqHR+RcdIIxOYRusxyh9ysmg+xvy1Gd3MXj45s4bho5Jv3RsfUmXX8V
	2g1/U1uxfxB3cUJwgVyZjlYrXBnNO3onlvt5HiA2WIZ36FfwG9yX7uWdqasIe4MF606oYWaUHuvQG
	ezndUQJw4F2Tl9XqVk76eUR5+VqSoFQR4zfBhdtXHzL5ILA5NvzsjsgRoKJ9EOE7gY14p0ZsZCjpt
	JpixHZtaVJHvbLC3+IUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUmO-00DQeg-Gt; Mon, 14 Feb 2022 06:24:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUjG-00DOss-M4; Mon, 14 Feb 2022 06:20:56 +0000
X-UUID: f9d860a6156c45b5b4a5fef176bb288a-20220213
X-UUID: f9d860a6156c45b5b4a5fef176bb288a-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 206076781; Sun, 13 Feb 2022 23:20:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:11:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:11:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:11:47 +0800
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
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Yunfei
 Wang" <yf.wang@mediatek.com>, Libo Kang <libo.kang@mediatek.com>, Anan Sun
 <anan.sun@mediatek.com>, Mingyuan Ma <mingyuan.ma@mediatek.com>, Xueqi Zhang
 <xueqi.zhang@mediatek.com>
Subject: [PATCH 19/23] iommu/mediatek: Make use of the helper
 component_compare/release_of
Date: Mon, 14 Feb 2022 14:08:15 +0800
Message-ID: <20220214060819.7334-20-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_222054_758769_A52E30E9 
X-CRM114-Status: GOOD (  14.73  )
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

Use the common compare/release helpers from component.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yunfei Wang <yf.wang@mediatek.com>
Cc: Libo Kang <libo.kang@mediatek.com>
Cc: Anan Sun <anan.sun@mediatek.com>
Cc: Mingyuan Ma <mingyuan.ma@mediatek.com>
Cc: Xueqi Zhang <xueqi.zhang@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c    |  4 ++--
 drivers/iommu/mtk_iommu.h    | 10 ----------
 drivers/iommu/mtk_iommu_v1.c |  4 ++--
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 25b834104790..a2ec9003826c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -852,8 +852,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, &match, release_of,
-					    compare_of, larbnode);
+		component_match_add_release(dev, &match, component_release_of,
+					    component_compare_of, larbnode);
 	}
 
 	/* Get smi-common dev from the last larb. */
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index f81fa8862ed0..b742432220c5 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -84,16 +84,6 @@ struct mtk_iommu_data {
 	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
 };
 
-static inline int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
-static inline void release_of(struct device *dev, void *data)
-{
-	of_node_put(data);
-}
-
 static inline int mtk_iommu_bind(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..83bd10617c9f 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -599,8 +599,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[i].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, &match, release_of,
-					    compare_of, larbnode);
+		component_match_add_release(dev, &match, component_release_of,
+					    component_compare_of, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
