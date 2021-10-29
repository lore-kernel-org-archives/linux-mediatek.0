Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF4BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 08:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE3461151
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 08:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EE3461151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKBGwJEDA4KKVW4eoBEmmwam+gd7gapplHw97NoP7rY=; b=hJjeFBq5wQniHp
	kqE8DjmIpVtJCdQ715MQyyy44aI2iJb3EUi2kW7QEnBvhr6VdM94+VTdz//cOCwAl2O3kRuw8Ez0y
	Jczq266PXosH+rkd0eFjLDInLqANdpzAv88veQO7uSRTdFKQD0uYWiIkOJOGjmsWioI/LW+cUHT+f
	ST1qIcI5IxbEADnQGebjzQQkcXdwig6as1NqHT8xKbS8r5GHkR9VKH9+RneL4aga1HYz/Zsyvm10Q
	dyTmnT2d7uHj3DpF7lMH7En1oZmuUgf+btOhrIJGYcQz2dQnQ8LLvApy77PQ1oXSoH7FGqKfTGuAe
	E4SqZhfh6BpXYbPUWOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgMql-00A8YL-1v; Fri, 29 Oct 2021 08:02:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgMq5-00A8Ik-I2; Fri, 29 Oct 2021 08:02:14 +0000
X-UUID: b9703da6cd654b00b145ee94e146fc80-20211029
X-UUID: b9703da6cd654b00b145ee94e146fc80-20211029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1951506710; Fri, 29 Oct 2021 01:02:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 00:52:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Oct 2021 15:52:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Oct 2021 15:52:07 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v7 17/20] drm/mediatek: add mediatek-drm plane color encoding
 info
Date: Fri, 29 Oct 2021 15:52:00 +0800
Message-ID: <20211029075203.17093-18-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211029075203.17093-1-nancy.lin@mediatek.com>
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_010213_612661_EF2D3D89 
X-CRM114-Status: GOOD (  11.59  )
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

Add plane color encoding information for color space conversion.
It's a preparation for adding support for mt8195 ovl_adaptor mdp_rdma
csc control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 734a1fb052df..81bd5d6e8df5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -137,6 +137,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
 	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
 	mtk_plane_state->pending.rotation = new_state->rotation;
+	mtk_plane_state->pending.color_encoding = new_state->color_encoding;
 }
 
 static void mtk_plane_atomic_async_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index d454bece9535..2d5ec66e3df1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -24,6 +24,7 @@ struct mtk_plane_pending_state {
 	bool				dirty;
 	bool				async_dirty;
 	bool				async_config;
+	enum drm_color_encoding		color_encoding;
 };
 
 struct mtk_plane_state {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
