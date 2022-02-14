Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D1BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaucdnOPVHeXfY6X37miBLgDQt2QIyViJ4YgMErdTGg=; b=1NANal/6FcyHll
	WCT97GOmSDmy7EEnX3UtaLvbOeb19e7UMrkZ9ZBxQg2C9HW9LEUULVSfpZt/xtbpIajsAI+Cw2wyf
	02r0wQYnEvmGQ2CFrRXYuVzdz8JVucrGyCuo0IqyYnhOzs1KvaiDm2JxomZjTTTGOy7o6fYqKGV0o
	RNLoIqYrSNV/+ZHf+UNSmkR74zieDb6kZpeE1aAec1DTYSGC3xXbvxuaSOcHniuczviiW+Zb8UNjl
	P2voFIUwKDocctYSHVzhfPAoHW8F9Z3q0NgR/0HvCny0dyN6SmXopPDDVGvUeb+VYxua5FSVIhbvu
	9ANnugSGW3SAzvONexIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUjG-00DOsk-Ca; Mon, 14 Feb 2022 06:20:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUid-00DOhC-NT; Mon, 14 Feb 2022 06:20:17 +0000
X-UUID: 51fb8c5be3704fd8934a056b483a08be-20220213
X-UUID: 51fb8c5be3704fd8934a056b483a08be-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 467215582; Sun, 13 Feb 2022 23:20:13 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:10:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 14:10:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:10:28 +0800
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
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Orson
 Zhai" <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>, "Chunyan
 Zhang" <zhang.lyra@gmail.com>, Kevin Tang <kevin3.tang@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <maxime@cerno.tech>
Subject: [PATCH 10/23] drm/sprd: Make use of the helper component_compare_of
Date: Mon, 14 Feb 2022 14:08:06 +0800
Message-ID: <20220214060819.7334-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_222015_803154_2582CF67 
X-CRM114-Status: GOOD (  12.03  )
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

Use the common compare helper from component.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Kevin Tang <kevin3.tang@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/sprd/sprd_drm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a077e2d4d721..5d534a8db913 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -134,14 +134,9 @@ static const struct component_master_ops drm_component_ops = {
 	.unbind = sprd_drm_unbind,
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int sprd_drm_probe(struct platform_device *pdev)
 {
-	return drm_of_component_probe(&pdev->dev, compare_of, &drm_component_ops);
+	return drm_of_component_probe(&pdev->dev, component_compare_of, &drm_component_ops);
 }
 
 static int sprd_drm_remove(struct platform_device *pdev)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
