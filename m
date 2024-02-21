Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067E1C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewyp4ShvXsbsTKDV/y4IDRAf0uOqZ7IN5JGP+ziUOHo=; b=R2VArTtFJHxn8AZW6thzTxMYqH
	XchQ1nQpZOz4JH1YeUIOsdgMlgetQCTqYp3DntCXTp0PgIA/SdA+sI7VMPTuvnAkX+3MN0aFvQE44
	I0lqgyzUGyNY30dQn7CO+J2t1vyPM/2Z9HH2pmJQyaNUegZK/rwgDJpOfuOHxEJKa8BY7mf1gR8Lh
	1dPkjIqqj+H0XdB2gzQFj0kNuths21lfNKS9WDtaje1xQCVH9zyVKlO+oH6lE2aVMGgs8dJ57/jVm
	uLdOfSGQloAcdmouWqm0FdJji1YG7bcBNIpGBqWP5DHHZt90jsHP4Kesxd+KxGpDHoDc+SS0pIjhy
	iY8Xxcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpu9-00000001oWC-2scN;
	Wed, 21 Feb 2024 16:57:09 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpu7-00000001oUP-29u9
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 16:57:08 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-42a4516ec5dso52155801cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708534621; x=1709139421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewyp4ShvXsbsTKDV/y4IDRAf0uOqZ7IN5JGP+ziUOHo=;
        b=ipqPEs8pqsfP8NLZwdRpjFfEuQQvBczUy9IJzlrk5Qi3fbtvTybuF3L5l3YwhQRn/l
         jJgUazRULrIfJrKtvY9rIgk02RblfutmHaOjSOhml0g4F1xAiEZvFwzvTxISmA1rgQzi
         F21I8cWFE+M0BzVv8Hyl0YtyuqkyI1DSftgKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708534621; x=1709139421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewyp4ShvXsbsTKDV/y4IDRAf0uOqZ7IN5JGP+ziUOHo=;
        b=cHlCeaxL+Wp2imQADnMMdT+TCecSwFDBw/OeMyOWed7/U+Ow/Z2+3wCJ+9B1QhsRq/
         hXO4keiAKzYSjTZbqmDI0SuiIHL4SpuAtXFxjXTm+XjQRA65cSRavqBSj+fpWFws1dLX
         E4Kz7RhpWEhZ4OaHAa+U7745UI8ckRVV7uS78pthYpKVdNYOrEKwAolHWXghsglnM+JM
         5eEnxTQd9OyeQVuokhMt4f1weScxi2GTs5ZTqRW/udzLVeODgs5WlplTx+GE0TJrrVlm
         egy6Uuau4jT+5Z64tpaUqlDCQU3KbH6YiTpP7ZhoSGArtEQE5cj+ElPD2vYfaAyN/IFI
         kWCQ==
X-Gm-Message-State: AOJu0YyG9GElyWCoIhiGyfdHp1hz5UQmJGVkus9XSBvIIa/HE4Y6zP+3
	LmnTdzZsbgOI4jXCn+7fLgHRPfwoMdM6rxNdznOOrVZ9RHgiYnHDCrWzpdeGkSV2ScGPEan/Q3Y
	=
X-Google-Smtp-Source: AGHT+IEbyz9aRDr/D+FpIRtgYgTiDDpbYo6DXckvIkS81Eh+NamO3vbl1XBfN15Ja88kFLe04Tc1Dg==
X-Received: by 2002:ac8:5841:0:b0:42e:3d12:8c81 with SMTP id h1-20020ac85841000000b0042e3d128c81mr1556148qth.64.1708534621045;
        Wed, 21 Feb 2024 08:57:01 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:5e8a:4a60:7390:1fc9])
        by smtp.gmail.com with ESMTPSA id x23-20020ac87317000000b0042dff5e7c3fsm3811639qto.1.2024.02.21.08.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 08:57:00 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	Justin Green <greenjustin@chromium.org>
Subject: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
Date: Wed, 21 Feb 2024 11:56:43 -0500
Message-ID: <20240221165643.1679073-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_085707_563676_5E3A07E5 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

Add MT8188 overlay driver configuration data. This change consequently
enables 10-bit overlay support on MT8188 devices.

Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
BA30 overlays are confirmed to work from modetest.

Signed-off-by: Justin Green <greenjustin@chromium.org>
Tested-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe4245466..696aabe124c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -635,6 +635,17 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.supports_clrfmt_ext = true,
 };
 
+static const struct mtk_disp_ovl_data mt8188_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
+};
+
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
@@ -650,6 +661,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8192_ovl_2l_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-ovl",
 	  .data = &mt8195_ovl_driver_data},
+	{ .compatible = "mediatek,mt8188-disp-ovl",
+	  .data = &mt8188_ovl_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
-- 
2.44.0.rc0.258.g7320e95886-goog


