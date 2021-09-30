Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B608C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:34:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C7F615A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17C7F615A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEUtuGia89n1PQcz43Iub9cJbwijK5TE7XT29DKZEFU=; b=LDlF2/IPSCgdQQ
	v7KzqsuNW53l546LaJjhU5uItUu0ATg3rNeiW6kKPETlFk1wnaQkGXRgfNQG86LMRKN19JIw0dVB4
	UhPxPrDRIjNNwFUcIOrLLI76it7syFIkdikcyUfim/QdCGjHh5gjNAqX9DFNvznkmci7DzZsd+W7m
	d7Y6yyOdP2nFDucG5v05IX4kCFcHVFzyr+JsBijo673Lr+1f/gVzz1E1ZXPpFDPnbqItsjruA8try
	mAsyx/bcFMtDts0hc8urlpfLIr9Zhaun4QtHZsPJU7+Pqib7ypQzTxcTPm56B8VTaVlg6WuDs79lx
	tdPPbpRbx4Isca0+VSXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrWd-00DPhW-RT; Thu, 30 Sep 2021 08:34:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrU5-00DO5x-Ez; Thu, 30 Sep 2021 08:32:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 8CAA71F449FE
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 7/7] drm/mediatek: mtk_dsi: Reset the dsi0 hardware
Date: Thu, 30 Sep 2021 10:31:50 +0200
Message-Id: <20210930103105.v4.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_013205_655672_F3354363 
X-CRM114-Status: GOOD (  14.67  )
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

Reset dsi0 HW to default when power on. This prevents to have different
settingis between the bootloader and the kernel.

As not all Mediatek boards have the reset consumer configured in their
board description, also is not needed on all of them, the reset is optional,
so the change is compatible with all boards.

Cc: Jitao Shi <jitao.shi@mediatek.com>
Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---

(no changes since v3)

Changes in v3:
- Fix typo in the commit description

 drivers/gpu/drm/mediatek/mtk_dsi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 93b40c245f00..5d90d2eb0019 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -980,8 +981,10 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
+	if (ret)
+		return ret;
 
-	return ret;
+	return device_reset_optional(dev);
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
