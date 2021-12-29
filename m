Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkbJSxQdMj6nY5YkUGIgEzsX+meBcqcRepcCNrmi9cA=; b=M+kXecuB7lgOjt
	VukAu2/dVfoJsRY7ZQx2AGAn8VsePU72pDtx7c2joxa1tjsCUuLdXoBWvLLNYvml3NQTvlC4XMyta
	pI/UdicDOXxZex5761CrZ+F7eM97cd4VNK7o7H2k4dWdBSW4N4Blp1fqWpEvaMBSne56uoIpXbz6F
	BWRRR44Mkb5QIM0X0tdK/sBfG3QHjvbNIIX+EiwoGKb0+1d8EUzXDDPqibSb2+dilyKP9CpWzrj0y
	1hGtHbLwaAyjAyQBmOBQJfZ21fq9GrmDOSio8FXCtY4U6r8cjnM8p7wD8iEhrEcttNZvofVEOLYJP
	swSwUw4dH31DR6Tdw/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2dwC-003HsH-Oq; Wed, 29 Dec 2021 18:44:36 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2dw0-003Hpo-Lh
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 18:44:25 +0000
Received: by mail-qk1-x72f.google.com with SMTP id 69so20669351qkd.6
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Dec 2021 10:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Shoj+Q3yMEhM9mNXjLtdxgk5LZJhKA/O7LXTWfiwLQM=;
 b=jgyyqpkTqrJBnuET9DIU54lJy4W8PO4nKpAL8mj0vtTNJ7L2teQmhIXYbq7PXu/bIP
 aF0tOBxel+clKcr1H23Y8mUqiVHiNuA3XeSKaES7ORtpX9JVc3Cz1vKhgW0vsIL0s3N1
 DfXRXFbSgYCEUFCzF5IigkowIGyEPx9Ac7RdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Shoj+Q3yMEhM9mNXjLtdxgk5LZJhKA/O7LXTWfiwLQM=;
 b=kTJap9Ft3raBwD4kgxfMIYxppPu4BVBx1c1RQhdRgNWz85uW1A20EwD8ofalSXJLph
 Ds32nzxKCmbKbAaVNLrGEqUI//tDnsl4S+NdjCV1ArXfg3w1wBTi2xQOY4ctm4AGutlb
 nH/X/Hfgz1y133SCNProcZTkcuzvzmCCMTU9vRVSmxIU5IOOjrGzjWiNbctOGYnpI8s2
 YPie9+mWaF8/OthyXHKkrjAz2g/sjJcNYIkYg7mKFWtkPb90bkJHjNMd1WMPqMY4vp3m
 e11ZXNPoU2Rqj+JLw8Z5uE90Zie7wiEY5hOYaT32uBvYM2t/V8bragFP/3viHQfF0dmn
 wOCA==
X-Gm-Message-State: AOAM531kinaZN+JqRbmP/UzVL7mUmqjxHoO8Ls4smp0lXk8HFmUITt9E
 dMyQYzkYS1RVnsFVoObcS9ACof5PCxXYhQ==
X-Google-Smtp-Source: ABdhPJwiO+gX4HKdmMuEU6gcsV2DoE2Pu4VLhKUqPMTz+1itpbMofq19YOFiXpnHdZkSZhR/1fu46w==
X-Received: by 2002:a37:755:: with SMTP id 82mr19397299qkh.89.1640803463092;
 Wed, 29 Dec 2021 10:44:23 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:2258:17ef:b383:8855])
 by smtp.gmail.com with ESMTPSA id e7sm19130365qtx.72.2021.12.29.10.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 10:44:22 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, tzungbi@google.com,
 Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/mediatek: Set default value for Panel Orientation
 connector prop.
Date: Wed, 29 Dec 2021 13:44:18 -0500
Message-Id: <20211229184420.793234-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211022172413.195559-1-markyacoub@chromium.org>
References: <20211022172413.195559-1-markyacoub@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_104424_718859_D932003A 
X-CRM114-Status: GOOD (  12.09  )
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
index 0ad7157660afa..9d33dd93118e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1040,6 +1040,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		goto err_cleanup_encoder;
 	}
 
+	/* A drm_panel can have its own orientation. If there is no panel, set the
+	 * orientation to NORMAL. */
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
