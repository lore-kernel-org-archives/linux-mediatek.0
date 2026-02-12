Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A27EEA84C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=; b=uPQGfHY4XmlUHElZiCaG7PrZsz
	Hc4GTpu5xupZzpN4HWQtffzznLddN1xO1UliOk5ri2gu3lb4NNrvZw+pfpBqTfd6BtKgEpXjdLwTm
	dlUr1Bl2KajteatcudYPAhtQiSUjKFtNQ+Dfg+RkhR5J4Q+7p6vxF7MVReIxRpbxFcTUOO/6271hK
	NxvNmjM8UTmTQ55NKeV2OMdtYgc3CK41l05btauciFs3k7Btv/ulEv2b1D5j2XoouI4h7BP9JwD5h
	S8RUCC7o4KeL3rSIKwIuh9byg8orrTIdjh1IGIhgR/f+lK2qvkF4cHtTHzLIe0rXMYM3EpyUmaM49
	ofH7i3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcKu-00000002Zmv-0s4P;
	Thu, 12 Feb 2026 19:26:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcKr-00000002ZmA-3Oz7
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 19:26:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-482f454be5bso22975865e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Feb 2026 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770924403; x=1771529203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=;
        b=T2WJwvgCO7QIgxGUmeDWVhamRJiRiP5mB1zKJvwgZFOqxFPxlxDo/Vu20Jpwv6dEXz
         QLWcUrbZdiI7jNXOgt5z0Nv5CMev0W3StQnGlTuJzmPg7HOGfbWSBZ8uW2vEMNy8aDWQ
         jfHEFFF/fXID6phSRfGlOtJD6xewhn/b0n+ZYkDnq1VgTAEcWIkzzNlWSeSKEoQ69FAY
         +RFoOcThkCqVoLeh7ApbHwAde5JkM1B1+Ba/4KpIUzpLpE6mROlKPyAkLrVyErCltW+V
         T7533W+HMsQfsCmt72BtRweeTTI6XWzkN5K8QvkamHTwjDCelUniHbmnfNj4f8THrCFW
         njXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770924403; x=1771529203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=;
        b=mbu3hI5N2NeJUrS4PIztzs8hob11ykL9ndjpWSRgLnLYu9yLdJwo1bpN4MpMlkFStE
         lY9ehyB/K+ZgRZ1uWE/v0mhTuSUkcSU6tw0bpUPccozZWR/WETKlB4vWL77SZTsOnVmo
         iYdOn53cG+dyW5MrUQgW2sppDdaqCLKEstAx/jma9B3Z6d2FvXoWsig+U4uRDB1ThHDV
         Zr0NkJt4PwCX4cUw44V6++hP6Z6uF9d1rkeNRCZoAgYbXXAmy5fecKV/tXZi53xYLOB6
         LulTIZMhtwQdfKQ0PXUaRczGVnmZrdtcsdoXybdov3MBmtErtiUilqs0XcKjR6X2LLsC
         KGCg==
X-Gm-Message-State: AOJu0Yx8avufItgbBlzn0AsqH68Ojkrf9xymLSbDAJeolOmT6iiYqI+3
	TykjL6taNPIR4W3IGyeXPnjVrZ5wkin0Tj45/S0tton1HIZAHCMmu9l7RkyHQw==
X-Gm-Gg: AZuq6aLdZBRC3KBTMd76nUGsWw8PWANvG/xWCovN4boLNEkYOBu0IMi8cWah9z5zt05
	aKkkcd6gtw3AZMDFFObs9CPR9F+StVQ/LBNPPZGoU58vZlYdJQQbBz6vyIAy2XWp5xG/9noFq/F
	Il963G2/vxP/YuOftRuvkqSS7YhqSTYpquZKIcvyBnGf0k94ebeoJiTj1GCbY9jX41QXZWxxybk
	LF4HfHMfbUFR0HO+qEtlo5cQAswi3QWGTqSx67FJdpusk5qnwEKkBZU90xaPMVvuGnhTI5CDWGv
	a2SdzatNqtwtXT3tHQFrNYXvEGZnk289pm/8/eeHz0SHNRDQMSj2BuZfPxjG0x725RMaRuTStb0
	PdIefeyZql1llXD9E5CKfIplriPy5PF+71EHVR1m3miaB1otv/BBOb/awrAScSP3e0aLiZQwZDb
	LEijHOvvJhUnH2Bng5NCM=
X-Received: by 2002:a05:600c:1f8d:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4836601387bmr57305525e9.11.1770924402981;
        Thu, 12 Feb 2026 11:26:42 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm20405e9.2.2026.02.12.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 11:26:42 -0800 (PST)
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
Subject: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices during probe
Date: Thu, 12 Feb 2026 19:22:47 +0000
Message-ID: <20260212192605.263160-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_112645_868155_01D64BB7 
X-CRM114-Status: GOOD (  15.57  )
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
display by calling aperture_remove_all_conflicting_devices before
registering mediatek-drm. This takes care of unloading other fb
devices/drivers and disconnects fbcon which then automatically
reconnects to mediatekdrmfb as soon as it's available.

The function is invoked just before drm_dev_register() to kick out
the existing framebuffer as late as possible to reduce the time the
screen is unresponsive.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
v2: Moved the call to aperture_remove_all_conflicting_devices to 
    right before drm_dev_register()

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..02effd9fc698 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,7 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -670,6 +671,10 @@ static int mtk_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto err_free;
 
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret < 0)
+		dev_err(dev, "Error %d while removing conflicting aperture devices", ret);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
 		goto err_deinit;
-- 
2.43.0


