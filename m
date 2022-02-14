Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DEDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGyNeirnTq9+knXrkpEe3U26qgR3kMfh06y4vxrTtJI=; b=dydPQIv8r/r/bw
	g47EEroFAFkJR3ISyZOQTM+S25VcccTJh+zKkR8kAfAAWnoZGA1+CHAGQ/NDw5UXZ1UHMGseXdjNu
	7WzIOQnISAb0hTVg6OpCmIRtfG6wuPXjB79LiFWcrm5GLXILuTH0RysjlVf86rpnwBbpwvlsqs+Hi
	KaGG9xmTUk/fxsbUOp8aSnQRYSsQoosQONnRUTMmei854m1hp4zUvak3iHq0LYDob5u0IX6rsBHfj
	tj5Kuz3nl4+YW/9ELl0A7wrUKy453Myb3/OzmQZKn7yaBz4S8h15Fd3HoOdfaBBAJz8JIg9/PwJJ3
	6jUG6LZFpm96sKFjzveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUlp-00DQJb-BJ; Mon, 14 Feb 2022 06:23:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUii-00DOhM-G0; Mon, 14 Feb 2022 06:20:22 +0000
X-UUID: d6e371a11b51471c9d09b895d9ed67b0-20220213
X-UUID: d6e371a11b51471c9d09b895d9ed67b0-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 848160423; Sun, 13 Feb 2022 23:20:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:11:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:11:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:11:39 +0800
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
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/23] drm: of: Make use of the helper component_release_of
Date: Mon, 14 Feb 2022 14:08:14 +0800
Message-ID: <20220214060819.7334-19-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_222020_577235_D702C6BF 
X-CRM114-Status: GOOD (  11.37  )
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

Use the common release helper from component.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/drm_of.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 59d368ea006b..9a2cfab3a177 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -18,11 +18,6 @@
  * properties.
  */
 
-static void drm_release_of(struct device *dev, void *data)
-{
-	of_node_put(data);
-}
-
 /**
  * drm_of_crtc_port_mask - find the mask of a registered CRTC by port OF node
  * @dev: DRM device
@@ -94,7 +89,7 @@ void drm_of_component_match_add(struct device *master,
 				struct device_node *node)
 {
 	of_node_get(node);
-	component_match_add_release(master, matchptr, drm_release_of,
+	component_match_add_release(master, matchptr, component_release_of,
 				    compare, node);
 }
 EXPORT_SYMBOL_GPL(drm_of_component_match_add);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
