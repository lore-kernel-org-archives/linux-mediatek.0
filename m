Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A760A2605
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LaaZ7xBD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDYGS9tU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=; b=LaaZ7xBDaDf4+75PUDo2ntv7KE
	ThM6CdwcyyNGrpO9gFTE6NGSn0G8ASsBsRMv5nOsTyGKel1Dh8MNwwfoViMQEj+KJgcgY9RoIlVuv
	41JJY0QAopUpMUuTrnnvdPNxpdSFgYruBGcDakvLrfxIdxuYb9baIGHh+FQLiFmpv0tuaPdSRlBba
	ju5pZycgpLExwzzDQ4BszyrotlDHaltG6VH+i/RFkMnfPdOXPVctimvMQr5ly+8IOPDnUakZ9Mu9a
	vY6QC57SNYhpApO7MVQosmF6CMKrda0p3fVBjWbyzYNgVzMmcj8EJRczTLVPkt2MIOW/8iHFQoSf0
	ShPAfTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUrL-0000000GBa1-2rXY;
	Fri, 20 Nov 2026 20:05:23 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUrH-0000000GBYj-3TLe
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 20:05:21 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4b0348a4c79so905501fac.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205118; x=1795809918; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
        b=sDYGS9tUIkpfLQ2TABnAvK6KkAblfCwqrC/jsRJtjLDnbmPcDOIZwLtAOxCDCcHKBT
         fBYFf9YEqqTE022KCN3tdx2jo/K/2LoBxJgPUE/61pLOx4cS/pRPgFLbh9gJ/+MlxBf1
         LhiI+fCBiqwo+IWhVlilLRvrA22jp4RbXFMYTQOoDMN+Ol5vdLCI3PWYlQ3aqw6Y5SgG
         OFyGJnoi6CKTDiFK1Hx4OXRFKTj/pffbrpIaNaZIHXoGcowZkW/Jm3LKBaS3jTRbQTUd
         lvQ/IuGmxk9KyqXw5LuJyjUFAs4b8x+dFYhQmwtJj+QRHVrorbmwpIvZaSKdFGeuWUSm
         yK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205118; x=1795809918;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
        b=MX6LP3U95j+BRaBZMVB7rv2eqQfRvMjemksJ1wr+BdkSCtl6egg45f8Nuys5VmMrha
         Rqhi3moPfjCxzpNTyCQfa4Ft0AUTPs8eBup8BI88gzrrQbaQ/hwgjE692jHFZgA6JIRC
         qq1WMPhS61yKj6IYx14W9zcWwaCWVCd9KZE9vB9cPGzoC3bQ1YQAjUr/IYQSCWCD7sNr
         +6suY+6xWsO7x4Bkm0OLfm1Objn+ucep9qh+ImdlwHMSEzADm5G6mAHL/werEC8JI/xk
         sY6OpKW2RbrV6pOTcp462IYqSkPNK0FKceyoVlaxLVyzC5RMgg93ZUWa3v15dU3ozp5l
         eYSA==
X-Forwarded-Encrypted: i=1; AL+hErExrFDt5OUQppwo5FDrTnrXY3tfdqEODD4TI+c8YW1HdT+Zy9IOMlUYFe/LSmzlN1Y15pPfNULTop3uZ0Ii/g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+nyqtza+QBRgw4Yg3NGuiLdFGcHlp1OIq/LEKefmX9NQ4qYNWn
	fXlJrbquOnTNMqS1NIs9cRb2C18dizF4BBHgBk8VH1kgYPlppVOCwMnn
X-Gm-Gg: AZFdTZe/+AE1DXwow9BuwPIJ2kU1LINOZLHTaZi26+uL3DDE7I2HbjFbH68wmKZr7jl
	nmQ9TRaC2LKjYWoZQtAQ7/c1l/kMeaq1Huc2BK3Z8sMdgyVwxIXoxAiK1l4lzI8DaGHr9QICbvw
	x7FVRup+Lg7cTDXkCgoCWYKT9x+D1AruWDh9rEA/zhmdAXc/8LvcxrW/1Hcpg6qLotn3j5iKd1d
	eox+QC/LevEoQmt4fYFPMyZH1S46ga3BSxEsAiHSnaz6XxkOCOBJFh1QA+7WdarTGYm8/T0zu9U
	XRH/1knmUTYeEgV7eYfhb1CN2hGLmr8/79HH1YPFpQmc+sUNsfql7MduLVTZhFXFJsJTZTM33JT
	ogJ5ej9X+pk6WW9dIVH0fTZ5c+PkMlpLrMTlujz4JgnQH8kHkF1obY10YNfaBhu3GAK64i1I0MZ
	VNAAs6/AwytG3xtddZ8A9zCp7ULB2vgcFzjSIgmtDQykCMu1lCTiufwY6mi9mro/m84cLOfo3al
	zEWOiyolSSbNpWzuKy59LOYmwwX7DaPV8aUMs2PM0w4ZaJ7mwR188I7dgD8D/UlxgQe9afo5MlI
	qW8yGYck+1BFPZDXLxzVsUC8ejL5XGqc1KuH2032D0V4kSxRLW6m0Okzs/GQmWwt4BQGLvAClZu
	GfNbFV7gMjJHhxp0/Qyw=
X-Received: by 2002:a05:6870:4db:b0:4ad:8d9f:98a3 with SMTP id 586e51a60fabf-4bc87de13e3mr3153094fac.35.1795205118467;
        Fri, 20 Nov 2026 12:05:18 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm4122200fac.4.2026.11.20.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:05:17 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 14:05:16 -0600
Subject: [PATCH] drm/mediatek: ovl: Report coverage blending on older SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-mtk-ovl-coverage-v1-1-35040085fc37@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuEPC9ghkjtVcSHtv7OoK6SuiKO3
 V3wO8C3coMbGkda2dGtWZ05kg7E5ZbmCWIXjsTjbjyoahDPvkDagq8833ep/SGldniaIHoMRTW
 nkHXPA/HLcbXPfz+dt+0HCGu2Qm0AAAA=
X-Change-ID: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795205116; l=4367;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=h4Tvd2gLk6BmOFdUxw3JC3W2Yz6nDyqzW/jYqV5h1bo=;
 b=jygRYnIZ6A4BG1IGZuzzTo8JDeciKHrqpHygmrw7zjCsTulx4jjcQ4bzto4hZFbM6Q7yhLwFt
 4qkyVhGaLPOCo2whLDjeAKzLnJWJLoLWJ/JFUVijZG41BSFtOvQ8ye8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120520_535955_9A36E25E 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed"), every OVL plane on MT2701, MT8167, MT8173
and MT8183 warns at boot:

  [drm] [PLANE:37:plane-0] pixel format with alpha exposed but blend
  mode not setup. Please fix.

These OVLs expose ARGB formats but don't have blend_modes in their driver
data, so no "pixel blend mode" property is created. They can't blend
premultiplied pixels: mtk_ovl_fmt_convert() always selects the
non-premultiplied color formats for them, which is the DRM "Coverage"
equation. Since commit 9813e158d13d ("drm/drm_blend: allow blend mode
property without PREMULTI") a coverage-only property is allowed, so
advertise it and drop the comment saying it couldn't be created.

The plane state now defaults to Coverage instead of Pre-multiplied. Both
are non-zero, so mtk_ovl_layer_config() programs the same registers as
before.

Tested on MT8173 (Amazon Fire HD 10 2017). The warning is gone, every
plane reports a "pixel blend mode" of Coverage, and the OVL0 layer
registers are unchanged.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since 7.3, MT8173 and the other OVLs without premultiplied alpha log
"pixel format with alpha exposed but blend mode not setup" for every
plane at boot. They blend in coverage mode, and the blend mode helper
now accepts a coverage-only property, so this patch advertises that.
No register changes; tested on MT8173 (Amazon Fire HD 10 2017).

This patch was developed with the help of an LLM.
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 5445870716f9..81a4143f294d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -412,12 +412,8 @@ static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
 	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
 	 *
 	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
-	 * If not, use coverage mode instead to set it to the supported color formats.
-	 *
-	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
-	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
-	 * will get an error return from drm_plane_create_blend_mode_property() and
-	 * state->base.pixel_blend_mode should not be used.
+	 * If not, the hardware only blends in coverage mode, which is the only mode
+	 * those platforms advertise.
 	 */
 	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
 		blend_mode = state->base.pixel_blend_mode;
@@ -667,6 +663,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -677,6 +674,7 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -686,6 +684,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -695,6 +694,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -704,6 +704,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


