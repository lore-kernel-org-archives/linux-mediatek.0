Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD6C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouQnfMJo1CzXYkmmlUtYU0LD2amGMRW8DMKSiE4Y14g=; b=ZrPT1eXsaG8dLX
	j17HNdsPScMvyxTMV0jLzawbjNFZmS55DjiBCBjSNwtib8S5ZbVKQA2oNRVkCR8Ge/0zgNKd7zeP9
	LgenF7DuGt/mL7yxKru3K1tcM+FnvLM9S7B3wK/QkrgHRDyvHF/DDMakq/L311UE/lsDbjDf2iiwt
	LLNYR5Ir9OykwdGZwKks5PbOgIL5L+0Dk61xhBAcRqAmoORrQkcI4H1HhIPBKMK17qwhgscNAdau4
	CBpg9DWaDEONWeNRm75hh3NH8TrjDXs/HOO6Rry50aObdHBDIllTdXAC/Md1CCBv/t6Q7qKNeBLpt
	ulbV9GAZ+2TfAIwSAjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHM5c-00D2M9-N7; Tue, 08 Feb 2022 08:43:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHM5D-00D28n-U4
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 08:42:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id x65so3178701pfx.12
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 00:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B51vztbAqanx3odcGYslN+f+8QXuSl3IGdZkOcgCEP4=;
 b=hSZaqn46Eg0k230j9msW8ZWdSycTD9QMSFONsAMN8N1GCF9epels6qCenWB+VLnHwi
 teHq4HupE7iMOHfyDa7zXdzjdrXplNx1GCcS6au9TnF+ZWtgVkOseJI3ghUEeNeJhkPZ
 shrywUSRRfEgTRLCyYagH0Kb0aulUHKv+f3OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B51vztbAqanx3odcGYslN+f+8QXuSl3IGdZkOcgCEP4=;
 b=fqr0UUcqon4B8zxl3KR0KYiSamp24fuV6iBQDOJCr95/occ9gGmIHGbbiKk33mg5aD
 fp4EydrWKV61llHjass7c44OCelg7aF1lyqsDPKmSMSOmrD6xr86OZQBK6rERhYjYpaA
 eTHqhLeYTbDjJcEL95/6Twox5IaUAtJR5NyumQp29CTnsFgLccsbIvzLR+jAOPyimd0i
 n/XMaGnk0sRJamJhK/Lar/wdD9lh+6hcoH6xUPvLY14UQz6dqqjtj8qqNlaxLYzQ+fwT
 nvLgPpoUySmpy+ZL4Og9nHljvuEtrl78F/BNtGgjX0WeQbHu3NnLCFExwtTN5gFsdWw6
 HZVQ==
X-Gm-Message-State: AOAM532FbNfHrJ513WhCIbIdrUkkK954a3VmUBkNbcX7hB4bV0lc2KTI
 0QjKBVQDi9TA3s4jG3L0D6tH1Q==
X-Google-Smtp-Source: ABdhPJwHECSzf8M58olhYXNLvBSmJuhfsp/CcQrf6d4N0193YY0h7uxL1BuFys94fBnhwtRkxle5pw==
X-Received: by 2002:a63:f709:: with SMTP id x9mr2665838pgh.428.1644309763116; 
 Tue, 08 Feb 2022 00:42:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id m14sm15362390pfc.170.2022.02.08.00.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v8 2/3] drm/mediatek: init panel orientation property
Date: Tue,  8 Feb 2022 16:42:33 +0800
Message-Id: <20220208084234.1684930-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_004243_979747_FFAA3ABF 
X-CRM114-Status: GOOD (  11.43  )
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
index 5d90d2eb001935..491bf5b0a2b984 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -965,6 +965,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
