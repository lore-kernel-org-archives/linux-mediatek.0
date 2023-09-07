Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E11EE14DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0K12b/gI/8w4RhaCwn2OzPenKaNJKOwO3HnMNvMsC4=; b=sfJIG5a463SiLNo6rS/dVPm2vV
	nKPWbdrWD3JeHB8zTm+hhwX4RBnxc0HxId61fjBkGZKIThM6yIVAQeQxrAfaF/+BB1UGj8Zvnlvmz
	yDle+CoZ/90Ykot1f/3C9VUwcWVwNk77mH7YNCM+0qMp4CbXNvj61kjbOTHvtCeAzFIyBg7QudJsm
	2q3CIqUeUATqHihmlwyAcfWp8FPxAAnWzFkTIoyl3ZKfo+bWPG9t3/9zWvvu/O2a+JrQWVpf2kS92
	FEXWaHBgLAHz1ba3DMXOkJys0gZKzHt9uFmLlXhY1LUlKYWhFMhKEM3D1ANZ26R/p5MrtWMRd7nK9
	MiVLkzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBjo-00BjAl-2X;
	Thu, 07 Sep 2023 09:55:48 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBjj-00Bj6y-0a;
	Thu, 07 Sep 2023 09:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u0K12b/gI/8w4RhaCwn2OzPenKaNJKOwO3HnMNvMsC4=;
  b=IGXETRMV8AOk6o3LqgQH1rzOokANEtntin+l/G9jSGnL1sAZ0V21b/g2
   SQLtMbCI9Nxj6s+ojNYVXNs+zV8kzgWmj9XxGORhCOg+M8jOwYHmOneS4
   5L6lekDIm2/hrzqwCHO4LEM0yyhCjiK6V0jBVfKbtAH3Y7fYp2wxvEHpw
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; 
   d="scan'208";a="65324668"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:31 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/11] drm/mediatek: add missing of_node_put
Date: Thu,  7 Sep 2023 11:55:19 +0200
Message-Id: <20230907095521.14053-10-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_025543_551407_54D030D3 
X-CRM114-Status: GOOD (  12.22  )
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

for_each_child_of_node performs an of_node_get on each
iteration, so a break out of the loop requires an
of_node_put.

This was done using the Coccinelle semantic patch
iterators/for_each_child.cocci

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |    4 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff -u -p a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -377,8 +377,10 @@ static bool mtk_drm_get_all_drm_priv(str
 		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC)
+		if (cnt == MAX_CRTC) {
+			of_node_put(node);
 			break;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
diff -u -p a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -436,8 +436,10 @@ static int ovl_adaptor_comp_init(struct
 		}
 
 		comp_pdev = of_find_device_by_node(node);
-		if (!comp_pdev)
+		if (!comp_pdev) {
+			of_node_put(node);
 			return -EPROBE_DEFER;
+		}
 
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 


