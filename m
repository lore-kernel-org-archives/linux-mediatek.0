Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOm6I23vCDBEuJ0qjcxdZkU3WtPCI2+DO4RCDshMeLo=; b=J1uzaeUCC82HWZ
	CIMKAKRRLmZ56O2/9fihinbPRyRJ/+5w/96AhW9YTsshDmfVW9BljS2k4MHTJwM55wvM2OTwmg2UZ
	Gd4mMYJNgVEeqj1kPZE72gd0h/SYe0f/b3F5MAxuKA5h+TlmMspP6Zz/nu5m9Z2f2CJPSBkgtDLzI
	VcQfMapn+PNcQX9piWebNXhIuv8IFCmJlRTVriW1Beet91IGNFne2kG2jtDR9bkoJMP8ZeqP1RTq/
	tdjwqq4VHQa0ahw1FXHUDncYAvErNxIKHimwt6ttF9WqpDgSKJfv7ZcrqRI41GG3HOKM158Ii/241
	/ViqUKBKNQxKFK/HMx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV7zS-000mov-MT; Fri, 18 Mar 2022 08:29:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV7z4-000mZR-VD
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 08:29:20 +0000
Received: by mail-pf1-x432.google.com with SMTP id s42so8956150pfg.0
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2qDv8+2Xs33bi39/5/bjWNq0xuzMLMZxKb+gV1x31A=;
 b=eTONqs9Y3piBGOdMGuMMcivDYzwSqMFZNucfhrjl17FHlTN4WIDwk19K4HOLMrk1iG
 Z9JW2BgOFS6i/9zHUZ4edoYzRasX/YYBjOmMTiYZs7tNSG0obMlHx/UiAhEyi5mPC4pm
 v6CMgLmDzK6uqrkCKkhh8Yn/oXduyc8b1UTyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2qDv8+2Xs33bi39/5/bjWNq0xuzMLMZxKb+gV1x31A=;
 b=Eu3oedlT3o1PfRc4cu69X+5WgJ+4AmReIoC6de3DHoZXkn9M2HHyPz7jkAj5EpTiS9
 Ejc0ktTlRIv6i3Hm4rf/RHM4+Sgcs2+cK0LQvZzpc8qYXXK0m0ISCvtz4RyGwjp8AZh/
 Nbk06pFRvbaPKfPVned3yCx2cT/WCNBjMhQNEiDlXgAgGOlJ2cEh7lJru0LRP5lsNOuB
 frfChKxqzAYM/Rg6FD1JHJaJ1onZdjhPnrEiD4wkw721lIdZx3PKH5fdnHSTMHU30wLq
 8Lv8Kccaem9LmP0kspI3JTt6cI1HfoYJEwu8Wzw6UzM2TghCItwGfgeST+50u59cGNnm
 UPZA==
X-Gm-Message-State: AOAM5307E6t3jNe/CPyOJIeq70kgSp5zV+rnW46M1+xczeM/4Xa08VBW
 KIdx803ok/OytVQYD6Q33Fn2Yw==
X-Google-Smtp-Source: ABdhPJwY+UTwJjQ5VdFDo/eVbZpRc9OL3AwGqrGv0hDioITcQk7K+bwpwLu/Vcu5+u/31peEfDYCaQ==
X-Received: by 2002:a05:6a00:1310:b0:4ca:cc46:20c7 with SMTP id
 j16-20020a056a00131000b004cacc4620c7mr9191847pfu.44.1647592158327; 
 Fri, 18 Mar 2022 01:29:18 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:18 -0700 (PDT)
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 2/4] drm/mediatek: init panel orientation property
Date: Fri, 18 Mar 2022 15:48:23 +0800
Message-Id: <20220318074825.3359978-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318074825.3359978-1-hsinyi@chromium.org>
References: <20220318074825.3359978-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_012919_032170_C2A0E686 
X-CRM114-Status: GOOD (  10.93  )
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
index ccb0511b9cd5..0376b33e9651 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -810,6 +810,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
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
2.35.1.894.gb6a874cedc-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
