Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F0FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QWZltT5Ik1403xLpYJWPCmlVFaiq2fqaz9yBCJYjcXI=; b=hqG7m2zTCjlE+oJAgQdB8B53LN
	TWWUY7V7rb1Rvc3ixtekE9W5Xc7xYjoMFW3ex4kpZ4ualfwpl1Cf/B4uLdCQ+1YJqs5/mCcwvxBqF
	jBp+EiZ/gf+LqCrR9qi8nLb4ltaGLi+zLkgHx4s+Fkx9w7Pe4+CGGlkdKad+qz4AXhbRKzLo9cbc4
	k5eTorgoHnlyeq3TlRx9GDXbpER2EZrbsmyGsSbCwZBlQmELk6oycXoQeitWxIBPSzo+eZ3GcDE7f
	wvhD4Vj4efezl07Vdw5PauLhNH1VCdc9jkE9alJoPUfmbTriLGoEiA9CPM3MrClzHcDF4A6Fl9HxG
	3ESgOa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol2S0-00FXjM-81; Wed, 19 Oct 2022 06:21:12 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol2Rp-00FXbT-0D
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 06:21:02 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1322d768ba7so19512242fac.5
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWZltT5Ik1403xLpYJWPCmlVFaiq2fqaz9yBCJYjcXI=;
        b=fHHz7Xzk5lYdiEDvHwu2jd21UdKcxPmzwJbiub7ibFHkmtsyteKF7RVeuJzxaHAhDX
         zetJ72PEeG8Sp6YVg5VSxQicLtOOjM1dVacrGrbAhczDxSxu9JP01G10ZvvpQ9vyyPLZ
         e95Ppe8WfALhzSbLN1l0LXT+pyzGo8OlieGSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWZltT5Ik1403xLpYJWPCmlVFaiq2fqaz9yBCJYjcXI=;
        b=ridaGlhKt4m7CrqIUtwnuY0429GqNRC9+9QpTwfuLVk7ufV+cyT3t28K8nW/pV5T+w
         fqaogldBxRjTHMHfMSUSUS9xuPXMs7EStQdIfEQH5nsfExcVWlHVjdNO0RTWxXfX0LvI
         kvf78SFvHto5CJlU8SHWPlPPPO8tpOOjnmlnG0kbSd4oYQ8kyxsdNkShP6KQpgZZAoXh
         ZsKXobLjUUSbU5VhBZA9Z7wwb0mTEREutZLQtu4NqE/u4HAEbbUljfcSgOS6pCnz1FrB
         6ecaqIeJ8kGrJOTuYCHneNaCcUzKuqz2yBDZZmk2KpM7whjILvH+NHlQxxmdWv+SmHIJ
         b3Lg==
X-Gm-Message-State: ACrzQf2B9oUqi7+nZl1IRcbFPb80kCdS0LQSfClOj9U7Btm0AsEMD9Wm
	8RIAXff4iN7hLJv14IoA+OOP0Ka5X5P1Wg==
X-Google-Smtp-Source: AMsMyM5BvfkKcU86WNyaqzZgxnMa/8bi2ufukanMVEw2tKbJ6454+6pNOJAwp/pQAra0ihyl78QhkQ==
X-Received: by 2002:a17:90b:254e:b0:20b:7e26:f0a0 with SMTP id nw14-20020a17090b254e00b0020b7e26f0a0mr42047837pjb.203.1666160447265;
        Tue, 18 Oct 2022 23:20:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:39a:c061:1f1:ca67])
        by smtp.gmail.com with ESMTPSA id mg2-20020a17090b370200b0020d9ac33fbbsm9346563pjb.17.2022.10.18.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 23:20:46 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sean Paul <seanpaul@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: mtk-dpi: register content protect property
Date: Wed, 19 Oct 2022 14:19:37 +0800
Message-Id: <20221019061936.3599965-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_232101_056839_ADB10AE8 
X-CRM114-Status: GOOD (  12.12  )
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

Register content protect property in drm so that bridge can update
the property from userspace request.

HDCP property needs to be created after the connecter is initialized
and before the connector is registered. Since some bridge may be
attached without connector, register this property in drm driver if
CONFIG_DRM_DISPLAY_HDCP_HELPER is defined.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Context: https://lore.kernel.org/lkml/20221012042030.573466-1-hsinyi@chromium.org/T/
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 508a6d994e831..3374ebe82aeb2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -18,6 +18,7 @@
 
 #include <video/videomode.h>
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -799,6 +800,15 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		ret = PTR_ERR(dpi->connector);
 		goto err_cleanup;
 	}
+
+#if defined(CONFIG_DRM_DISPLAY_HDCP_HELPER)
+	ret = drm_connector_attach_content_protection_property(dpi->connector, true);
+	if (ret) {
+		dev_err(dev, "attach content protection: %d\n", ret);
+		return ret;
+	}
+#endif
+
 	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
 
 	return 0;
-- 
2.38.0.413.g74048e4d9e-goog


