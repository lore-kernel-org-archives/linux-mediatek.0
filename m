Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEB6EA3F28
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=; b=MhoTGJEVjr/0ziWr0H3VK2g3iy
	q/c/h9uTM2YS6y/echqNZELh6eeVu+itvS1v5s6TTDCNVfbdtolOVESQC2cwa5xOyg3ps1hca/ei+
	W9ROWtn45n1JPo4cZLSDiJtPiLh1HGgblyGNtt+CtMGMmkg0FVsX+kYp1VZpLgvS9aWYL4EJc0MUi
	+D19yOnPyq5SUfFRNzHDMlyaUiqFzjUl3ZbE/biOttilVMaRObOqw3I4t7bJWPv3tLhS+z50Wc5A5
	cvOk+pEbwM0UD35oaEROdRXY8gC11BbBOTEHljtoMld2YKYvogC1bvJ1qjLcBWgBUabUDFXU2LyQW
	ZUelIAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpk8U-0000000Gkgb-3CrC;
	Tue, 10 Feb 2026 09:34:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpk8S-0000000Gkfx-3ITE
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 09:34:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso46482055e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 01:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716058; x=1771320858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=;
        b=OZzc3rrbvO8th5jL70Wyr5kU4yBAAD3gBkbNiy83eVY9pqa0B+c08oqoJa6GsgtAk2
         Etqmpi9LW9wkY+9o2iCX/u7LvIhZtierrKzDyOBdxyca2MgJZX5pWnZz/11VtKcGD5ba
         HhUzmOWMSjtF8D38v3W7yyBHLZ509KHZbwoODywDPBQ06ipI+QB6lIHZaR5SBGmGDfhi
         nHMq7/ixe+GUv0ffTKyFXIVCZ/ONKDEOIMwrhLVqq7pvW7aIgxzPdjQoro5bYj+mm5QD
         aqHBnlUEft2EC60Od2mAl1eNdu+9ct1q8iDrGPb0OuBn2ScU3ZnEUxm4iiiPJ+J/8rxv
         EydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716058; x=1771320858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=;
        b=vv6RVmGhVCz3wCQ0WyoSe95Z9pTmabqugiJ37NkGqGm4tR/bNC7MHmq1lrp8QDs2+M
         zEeJTOZtbfYCSqBm9cwyjtNrp2DKMjBf26kWeHF2ax76t/jcXd9jGStJVgmgiFDLqtGg
         LE8z/oXqOv9Dv+gY52FUe3GEhvQenDoyAuqVgO0vxu6XX5RDWvf4GswDsLluqM9JnMgu
         FlU+m6v6esRYgvNz0eJ6J5n2LsmrTH9bOo5NO8T/pEXRhyC75cXMQO8iS/XM8H/HHjP8
         4Gdu7YCPOCcpxC62lulONlxU2zb1g1GiF6CbgqkpDlnaSRdThzuK54/W/+UGxEb+q5/S
         qRAQ==
X-Gm-Message-State: AOJu0YxlXQvbCeCb9fblFGGMEf8BO8E8uNQ3LQ0YPMN7KXY3vKEvC43p
	97TgU+FbazydImCwbrULCQciCq+TrGI4v8UUMWIJkxzhtzM60QCkeR27HIszMg==
X-Gm-Gg: AZuq6aKK+OGUrBOC1wdgZq1hvU96Eh1dHbuvTsSl4tru2tr0vzzuCpvDwYetEydSgr8
	HPxhxE84mhEcirnlLn62FEZi9GXfcVmwFOf7bEY+V+0g8nktL1DFbamqf6wi2VokgZXQL103HtC
	iqGfHjUayq/WbhhCX/wxisb/oRCXHo2BaGtf8DHe3IxBDNzeSrwRsBVEijDEFbUVYQMQtaiLSHy
	5YsfQMAgNMtedl/f+UflK6zI7KxA9MLogjwdD6CEzrOsFO8cvxznq0PVsy+I2PVJ/sqpOK1L/n5
	RZSQQrmweVH8fEW7ybPFUgKr9vSmquN7fzwD6kbrdzqLhdU2E8q83486PVmZGDLT/dz+meYo/BF
	3aIRmGmNYfI4SXrG2O+E4Rt5MOvYwp8PHXHYA5T8iiaKUdyxCBeA7UyTI9Dqri7HTzS2H2XyRgs
	FK2qYuyQlgah88ytc50g8=
X-Received: by 2002:a05:600c:621a:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-48320928d7cmr202536005e9.3.1770716057605;
        Tue, 10 Feb 2026 01:34:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm16571660f8f.20.2026.02.10.01.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:34:17 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC] drm/mediatek: Remove all conflicting aperture devices during probe
Date: Tue, 10 Feb 2026 08:39:43 +0000
Message-ID: <20260210093333.5112-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_013420_831333_18705FA5 
X-CRM114-Status: GOOD (  18.39  )
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

If a device has a framebuffer available it might be already used as
display by simple-framebuffer or simpledrm when mediatek-drm is probed.
This is actually helpful when porting to a new device as
framebuffers are simple to setup in device trees and fbcon can be
used to monitor the kernel boot process.

When drm-mediatek loads a new fb device is initialized, however
fbcon remains attached to the initial framebuffer which is no longer
connected to the actual display - the early fb is never removed.

We can gracefully transition from framebuffer handling to drm-managed
display by calling aperture_remove_all_conflicting_devices as we probe
mediatek-drm. This takes care of unloading other fb devices/drivers
and disconnects fbcon which then automatically reconnects to
mediatekdrmfb as soon as it's available.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This patch has been tested on Xiaomi Mi Smart Clock, however
I'd like to get some feedback from more knowledgeable people,
especially about those points:
1. Is aperture support on mtk-drm desired at all?
2. mtk-drm does not know about the fb address therefore as far 
   as I can see we can't use the more specific function
   aperture_remove_conflicting_devices. This means that all generic
   aperture drivers will be unloaded. It might not be a real world issue 
   as I can't see why one might want to load mtk-drm while keeping 
   other aperture  device drivers active, but my experience is very limited.
Thanks!

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..17e45b93fe49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,7 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1116,6 +1117,11 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private->all_drm_private)
 		return -ENOMEM;
 
+	/* Remove framebuffer owners, this will release fbcon if active */
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret < 0)
+		dev_err(dev, "Failed to remove conflicting aperture devices (%d)", ret);
+
 	/* Bringup ovl_adaptor */
 	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {
 		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
-- 
2.43.0


