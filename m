Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDAFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXnaz1jhLTD6jXvSmqDaDkgz1JHBWLNVvGXzErpIW+8=; b=AFMrrHAZ56DiLUD0qS/jweG95o
	TozTJuczRgtdVmQtlrU3LDgRSmqnhK6ox2yqmotx2ADOJw1bim4QGabjXQ6cL/GtM9iGGKZyaAVhN
	z0FOElaJbxiMiqKoR/aV1aJegnIBC+dR6BrVwAc2qqTFUfWWGJ3s6qqhUuF3tRiovv+tlzTvOjkAd
	Z41bR/uFBzNU5ooMMz3jqy3bKtfBSI/SH0VOE+Ncop1QgG4ZBY7q/ZehCFF1FL3AmOQ/0wXGwg35a
	trUEyqh+en8uRe0tBiwzuvtas2e9R2YvSdd5YVUeO/qxPS2ndSsEeWDQKbfmsT1e1PZa7lSkE/or+
	gWP8hSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHTY-00AcPY-Ae; Thu, 09 Mar 2023 14:42:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHTV-00AcNX-Ee
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DXnaz1jhLTD6jXvSmqDaDkgz1JHBWLNVvGXzErpIW+8=; b=vwpWovViQo6lDahIIbqoiRteEp
	mKUfN1dusLjxR7U9aIZ0XxRNSDrlrDgJrQg9FDRHpG+JsPPoDvpbMPl4JzMsR+5tJR8jnSvzEx+WQ
	u28P62OnKZ5yGs/LscCve+VgzcS0wx2zLTGdymJay88R8wtBqYlPZs1FAyoN2L7vvNGV0ngj39728
	y5nnzi8z0NHam+TJ6gCALzFeNQrt6Q/HGtWHHl9BIdRwR8YAm0J6R81xZMM9MZ8awHD+oheD6FbDT
	NgwDMd/Z06r03M3mkftf/h+HyI1C6fs8ZSm3qy67We8y5g+28Z9vO+bscnCZx7Rsr0lQwIF2iMGA1
	ZRdnIWIA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAx-008UBF-GG
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so3627183wms.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXnaz1jhLTD6jXvSmqDaDkgz1JHBWLNVvGXzErpIW+8=;
        b=kFQ8LRoljBL0wHvq4R5EI4ikrcQUbsFYB+Z0OC5Lc/dLpmkhLSRLxXieE/tLPoECaf
         I2rOdAL5stvDg1bZVWfyeNB/8JlSgc29D8eW7PN9jFqKblkKehsaHnv7/vLW4i30NV31
         ngEEh0CvEbW/7oFk/YvhpjcUuGOV6wckWRTVgKiMgvgsOs+eHNCWx9Ctl7pVSh6HQf+n
         5ovIREXATJfk5rLMSiXwCy6C9c4cCLjbMHpX+NCgnic3A1nuQsJ57Pe6aoCFPboXBQvP
         V7FGT3O7QP4LfcEU4eGpRF8ifOq8dQUYtX5O+dgqWLCIH7T+rE50uZiCDA3f3CyOeMa/
         BQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXnaz1jhLTD6jXvSmqDaDkgz1JHBWLNVvGXzErpIW+8=;
        b=sZSARPVn8p2FBVUtCxoZcW7bStoWuLj0slpZvgR6ivAEwzNo28h1E9b4Sea1k/YGLq
         MKFEAKhYfZ+327n1MkP06IVobiizXP7rYuB1JltwsbYWLUFz4MfSTK99of0QRNxEkej6
         EVOx5IRkpil11HpK81aiayWDDhxRCIqqRKVZpeWMLFsfAgAySOSa5tGh0KmR71eIqVs+
         NZXcBKCzMxuvyZCyD50S+vMmggykcNCDxK3VcwCq57Eockc7W5PKEzqeZyrkzGtNuLvp
         A3RfQpoMkYnYctnt2YIaGHbwRsUA4Q0gRJjt3IsJDv0czMfef4SOur0QjdrUpqG/C6cv
         Ahjg==
X-Gm-Message-State: AO0yUKWSNfHMG48sM3LTylYkFL0IZBjHymTI8w7SoPsiqMSaS0DcIwF6
	UOELTlj9tz71avLJR70KhpjTDqNirNCftukY3SA=
X-Google-Smtp-Source: AK7set+D5mqPtf34ar9Lo47BVbbVyFB97USS19hS1lH5lekATB4WmOAZdNCYYAFIULZSGsyaMRA81A==
X-Received: by 2002:a05:600c:1d09:b0:3ea:f882:bb3d with SMTP id l9-20020a05600c1d0900b003eaf882bb3dmr19639894wms.4.1678371800320;
        Thu, 09 Mar 2023 06:23:20 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:19 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:09 +0100
Subject: [PATCH 20/21] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-20-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=n59ZUgmONlb1UajjYquStIE5vhX/aVPKSxJb0sPGiU0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+k482A81ACWwejcT34Rd/p34RqAsJqbxOisAp
 SUjd0vqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURWi4D/
 0TiZe3q/k7NsRcaMTOlQHeDWee6bQ6pdAgV8j4eJRo/iHydZZbOm8dlumln1AMVKIHl1w/Zp2Qps4z
 wKOoogD3jt6pML5FVVdmYhkoGJ+4/Q3byLqqsDEcRhywMoQPp3bDc+69loKNyGqxwDuiVvzWKBOk3M
 n9fokdBO+zMT8V0WfWNnQ0lqtIHnKmYRilecNuiGGUi6giWB9hri1feen5GhkOLJiklV/9stbfh2lk
 cRTv5WfcZUAracBieuisYpfxLb3pg5clc9KLj+MW2CYNItb5GS+R1mpdIdFA2sUZWjPVNYgjmaaD8i
 kafeT6ejU9G61UxNlIQ6CmUPquFVO0J6Zpi6pngFuJT4XceRiaUajSIU5LQoat4BkJQVYCMbjJuDBb
 ueHs9qhMLCaEZ+0y4ZAcw4m30Kc504cisk59PgpSpxrmP+O+NqJBJvtqUVTlHKIM5jUE9b67Vkbnhe
 dRQo4PST5Kel2MaVamYQ7H7mg19tV/tiW8fpeCIhbdYaBl3lt9iHLuIqF2Iuu+c9Zdt9rLkomn8+QI
 xJQCX2L80MFHeVN6wn3QuJTFf8ws4rD8sqzki9wJF+CQe/s7+LPckPZuSoYUM1oYxFaqxdg6E+7DZL
 /shmh3OGx+QIYzQAmenxR8VjOgUor17JLipQp8NbwPwqAn1MHSkJd0PnvTYA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142324_048370_3904E694 
X-CRM114-Status: GOOD (  11.59  )
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..b905f38d5660 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -210,6 +210,22 @@ static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
 	DDP_COMPONENT_DP_INTF0,
 };
 
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSI0,
+};
+
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -342,6 +358,21 @@ static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+};
+
+static const struct mtk_mmsys_match_data mt8365_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8365_mmsys_driver_data,
+	},
+};
+
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -591,6 +622,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -673,6 +706,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8192_mmsys_match_data},
 	{ .compatible = "mediatek,mt8195-mmsys",
 	  .data = &mt8195_mmsys_match_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_match_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);

-- 
b4 0.10.1

