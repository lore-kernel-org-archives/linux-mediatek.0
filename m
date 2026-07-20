Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D110C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=; b=ALbjeOoXrSzz3RbRAgG1n7i1GG
	m36x2Bv6cn8cRVVHM8KKypGuC55V2hdEDlDZZBxeNgJRYx090Vw8SnZP6dF8Wft256U5qi/ICSBi6
	mKW5NpUDOo3GIBQ9ZIgUgRPeMuFozV/csIHBfNPRsNf/Z4AfHzwTzUGtOZ25GBnIiOy03G5Yv8gLN
	lod7vkTmeLaQ/4DcLgn1B090oYWMQSkXO68Yk+yrlPAqj/e1ZPuLsp73cpL56tCuqH6b74Js7vnXZ
	ZqLOyte8CA2BY/fM0iQdJIMDymMu1Bc5WmadH53ZAqgn5ziY8HicGvse05Vz4MEgQoQmz/t3PqkGJ
	C2qP4VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7R-00000007ESo-2kyq;
	Mon, 20 Jul 2026 15:41:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7O-00000007EMr-1wCu
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso13195805e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562080; x=1785166880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=FgHE1GsnbrNmWdil2/KTR7e1iUzeeFsW7TCe3xHKtM814/aPM1Se+j+8E9JTBwwk2/
         p76ntWAKO1FfNSKcW/WcSokvWciCUr0BJfatfkCbKU/xpg9ijYcwny7jAJUuiFB/QhYL
         sTuJ9lWlegMeXepzWzJmI7W48lwGlg4vh4Q4tGSUd61DKD1rtdkLbSylsOQvo7da3MYt
         XIuaVxOIvH7piclnm4BV6EzMUS8oD2RnjT9le9NjelhvE2eUEyKxsOQY+++VtcpANBpP
         R1DJJ/FOUO7v2Pdu4XAQzBX+XzjT2dc1OZs5AwNQpoYC36rYG/KtwFhT0icwdNa4vJ0c
         AS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562080; x=1785166880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=e5BpR79vTDaRYfeFZ81UZfnjececxlgzIOuVqr5Oz0Ffh3AWCh8VJFv8IS0WUOdpve
         qVbCc7LlDP0Ht56/u1yJB7Vnvi6MGm8x26pxOChCroekHHn/J4KpZ4cunk5MpOtfgpah
         Y64JaY/PkWgRjj9YpSE0/glW94g9PyZrtEWiqW2wpcmai+I9BkHwJfMYIVn8vPxxRVP5
         V86yu3m5540Gsr3QEAM2a0PhME7C4KsTKDEhEJpWlmDk5wg9YlDtfSQlIZdlTOIETD+P
         SYp+AhgMpMnMRwEu/+Pm8dQc2f59mzs8ZOeTOkiQDBuqCPmDldQOFg4EP/zQZCoxIAY/
         MDQw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7TIvpMkTNLggtxlv8+hyhv95sufkXiTAONsS7l2I8V9qoISZXxmE/1cbG7VnWXl9tx9WvdSnLitrnnlA8jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcGMs+0p7zoQIVmjPIcLvE120aYuTTv95zwGrKxmVQeETTkA/N
	K9+VVefQ8pMSK/cBcAobi8omA3KT9p7RC9mPLXHBXhVmvdjrsff6L2Px
X-Gm-Gg: AfdE7clqcWi214XLklUAu67n0X2+Pkzt7s6wtCH0gKg7ru25RcnQUJ3u3fjWgx+eefs
	BeQSM8wdGeKP8hpRXMs616OPr0XUO8590Sr6bm4n1eM6XAbAaXzp290a8hXES/J7rV2ysYnF0kx
	ZrW7zNXiJtyepkkP8zwruuev8NkDhK65hzpc3TKJ3K5/5aVmwuVU0QmFqQqvBAHR80X15zZ6kOQ
	roRfWe5OGueiC7TX46qYbUigywSWF3Ruln6awzeIwo7uQVHnhjrVJWkJS4TBCBdSape5krtlkiv
	an88zohRcqhWi4ftzILNnkzFPvP1wdp37gBqseWTJQsgDinFTXWJY6lKvNTDvLmtQqpACqtkqql
	38gEn2EejLJwpgIv5y9i3KBUjG9WAF//CdEQVwZTbdAXNvN/oilbSYluH4bpWHqRBFy7pCdyVHM
	rdZvi3jWRs0A==
X-Received: by 2002:a05:600c:524c:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-4954e126afamr155928515e9.26.1784562080376;
        Mon, 20 Jul 2026 08:41:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:19 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:41 +0200
Subject: [PATCH v2 09/15] drm/mediatek: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-9-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_084122_671347_DA19AA58 
X-CRM114-Status: GOOD (  11.99  )
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

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3f3f56eed3f9..7cd136bd9605 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -21,12 +21,12 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
@@ -913,12 +913,16 @@ void mtk_dsi_ddp_stop(struct device *dev)
 	mtk_dsi_poweroff(dsi);
 }
 
+static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		drm_err(drm, "Failed to encoder init to drm\n");
 		return ret;

-- 
2.54.0


