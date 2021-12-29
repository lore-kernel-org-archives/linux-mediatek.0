Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93197C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 18:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiHyV/S2CktweEQiJMDzcqclqdnu07BrRuf+VkApLe8=; b=UAC0tEUye427uZ
	169pRNhBZE8QDK+CsTeEUHv7Q1VFrQzdvqIuPCuz3zrLwzyaCMtCk/0ObAzSPfZhP2bCij5LGA9jw
	l16+LJnkWdh1h7lHjABADBKzVja2VfDWkt2EgFoH0j+WHoXEtjVjD6bCqKxI7V8Lt5+hDLtFxiqZz
	a2kV2ysKLzUDt2ZtyHVgfPE6AVT/k9MihK0FL971WXlDmniHRGnSmGwFGrH+req7aRHquVr4gjmM6
	SUSZ+RSMD2T8DliA/ismx0HkOlyVFNwYD06YGndMYcUFArqi/P9VZsBHaMr/XutBXWooF/JHCTZEF
	4Oeox65H83fXVVIyJfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ds1-003HVE-5t; Wed, 29 Dec 2021 18:40:17 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2drq-003HTY-DQ
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 18:40:07 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id kc16so20020735qvb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Dec 2021 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBrfMQBHSFL3SwPa7Nc8DH1A9jwH7Mgo9sxeYlvNd9Y=;
 b=BEv/5Y4SVKKX3QEEMCdR7CZ+MjTuAUdiJRaJg3TbEd2GDZ8pTaYPIBHtnuSPAAYQUK
 PjRBTTBzf3I0XyjNx+hZTAGpbrpf9JcUYPdLbDmblPljuYiARBKd+2/XCUXcWBk/nVz+
 8dLbBNd6iZZiBLPKPrQS2LIIXbiqIEmrCCVHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBrfMQBHSFL3SwPa7Nc8DH1A9jwH7Mgo9sxeYlvNd9Y=;
 b=vx4oltLl+Sa9XN5fQAGEK6qdL/OHT8nPeYtDA804ZXIu8y5VAEgBDevBf5Ruc6PFAu
 VMQru8wPOHcGvr7U4pBFi+5NceHbNrlj/6JFr1IbNew5l+/teNH+TCp2JI8N/+nuClhJ
 14iDlwNEWbmr+1zcW71S8VnN7EY3edhr87MWWdXm4Skallj04hb9nKpS2qSKw76ZtuIp
 LYPLc2cWWvSRM3DCC1PFkLw7UwuHCIqMHgmpx8/S2RvTSUZQ926lkQA9KARr2VtIu7bJ
 L9+esISE4wCAF2FaoS9Hh5dYHZhsrACUrTOEVMCEkIT8LwJoA4EIL9Jz/qPA2ZCb7ji0
 qejA==
X-Gm-Message-State: AOAM533aG5gwCLrTZvE7EQtdHynNx0+BnwTMfJS6RJY9QnDFYSKgIP++
 XksNHBEDD4KxhUQPKFo/xS5jvlHRBOIWQg==
X-Google-Smtp-Source: ABdhPJwLJKiEU6WeYBu00grxag0IJalt5yCfThPEhv3NPi0FDfPo6yK8gzVJZDdRCvmSz4Ae7gLLcA==
X-Received: by 2002:ad4:4752:: with SMTP id c18mr24170961qvx.96.1640803199453; 
 Wed, 29 Dec 2021 10:39:59 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:2258:17ef:b383:8855])
 by smtp.gmail.com with ESMTPSA id u11sm19256334qtw.29.2021.12.29.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 10:39:59 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, tzungbi@google.com,
 Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/mediatek: Set default value for Panel Orientation
 connector prop.
Date: Wed, 29 Dec 2021 13:39:50 -0500
Message-Id: <20211229183955.791957-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211022172413.195559-1-markyacoub@chromium.org>
References: <20211022172413.195559-1-markyacoub@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_104006_462527_5DA3A5A3 
X-CRM114-Status: GOOD (  11.90  )
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

[Why]
Creating the prop uses UNKNOWN as the initial value, which is not a
supported value if the prop is to be supported.

[How]
Set the panel orientation default value to NORMAL right after creating
the prop if no DSI panel exists.
Panels have their own orientations, and panel orientation can't be
overriden once initialized to a value.

v1:
Set panel orientation only if DSI panel does not exist.

Tested on Jacuzzi(MTK)
Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0ad7157660afa..7cf71705775f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1040,6 +1040,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		goto err_cleanup_encoder;
 	}
 
+	// A drm_panel can have its own orientation. If there is no panel, set the
+	// orientation to NORMAL.
+	if (!dsi->panel) {
+		drm_connector_set_panel_orientation(
+			dsi->connector, DRM_MODE_PANEL_ORIENTATION_NORMAL);
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.34.1.448.ga2b2bfdf31-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
