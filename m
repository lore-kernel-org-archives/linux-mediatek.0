Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500E4C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195C860FF0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 195C860FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGs4m3wMcpVidMQWSHoTG8z8bWC9Jy3kYF3TAJ6c25A=; b=b61CUKHcaJT3Yk
	sl85m1prJePFeXd54x5fovcZSrxpCwik7t/TUNdQGMdjIRytL+9yfgR5e6IR6MRfs7z0jfUjVbAVq
	HuYU3xj2+Zo8JCRaHiK1n5/v2lY+EIfVY4qfGyylar8vXCdHD3bGq3mLPgSLBeaI49CXrpVOVpe8m
	CAv6DDaPu3/4FOcVDU9T197xQAKggmdHGTiLDhWZo/vQOE2MNOFbNT/tZb74lMI/YQ2FEYh4he3Q+
	PFHW5ghUvANptPkrNX3svRGMZhx5phgjCy31iOVs6N1rUZhDF9hsJVEuRMFP2HNOUozojVGKOFzST
	IiV5IOIV4EH+yMJfjtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAfQ-003Sdr-MW; Thu, 27 May 2021 07:42:56 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAej-003SGv-S4
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 07:42:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id c12so3001602pfl.3
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKPatIdYRxq+Xo6lopop8fgePb2STDXynanM3KtfV2E=;
 b=UzhS0TSGWLsdtGeMsRR9DXcxIAZf9yxmavKOZAwL5cSNom1Ge/Ba1Uxw/Lg2KECen/
 iW7Zv/AEndzzyqjRQt6icQYPlYTsLewTmTmaVB52vkI8cdlyq6cNV/gJHPyTlRgk2jlz
 hxRQdQI2gTCY3qLIN81UKFt5s3KHLP3Vt1TtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iKPatIdYRxq+Xo6lopop8fgePb2STDXynanM3KtfV2E=;
 b=pTQ4IkqEex+8is1vS4vTIGvyC1YAg0Jsgc5u1lSXniCZyefy56PTFn3ql1idAatDIk
 xZGyVZr1pQIrDVWFTbC+4Z50nHvQd6UpKTiGnv1VxhHLv7rCMRyQ5YP8K02MxpCJ7rk2
 0/5k4KMsf2kdaq9ddft6Cb/no0q4lJtt0bllqV8S/e3qhw4wET31ZWyyu9pLydLQs2VA
 xWn9I4y7oTJ6GdPiW8aai4Pf8j1wsQW2O/m1f4ZflQj8azXkDay/7acwO7Y1ILeaK8i3
 PcMid0bnTW3tOrFE+uF8JPSXtUeYOlYL5zmrPiV3qP4O8nQFI9DydXfnsXoo3+AUSWXJ
 GSvg==
X-Gm-Message-State: AOAM530Egn7tCCxu+ZrjUJ8podXX/KRekKhyLiKT+uUe/hakgQcRj1sA
 euv+3XFZftobtYjx/tZ+eydkcw==
X-Google-Smtp-Source: ABdhPJySHEslyEih5kQLA88oXODQQ0Wi1oBA6Q/oIq4BZUbKZolgVJv44EvipwhBEGygRsph69B2tQ==
X-Received: by 2002:aa7:8703:0:b029:2da:b87f:7d38 with SMTP id
 b3-20020aa787030000b02902dab87f7d38mr2569228pfo.20.1622101332688; 
 Thu, 27 May 2021 00:42:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id h24sm1184857pfn.180.2021.05.27.00.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:42:12 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Robert Foss <robert.foss@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 RESEND 2/3] drm/mediatek: init panel orientation property
Date: Thu, 27 May 2021 15:42:01 +0800
Message-Id: <20210527074202.1706724-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527074202.1706724-1-hsinyi@chromium.org>
References: <20210527074202.1706724-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_004213_937217_0C69DDB9 
X-CRM114-Status: GOOD (  11.45  )
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

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..9da1fd649131 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
