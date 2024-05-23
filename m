Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370EBC25B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oV7UBZ9+FOaGpy1Hnl2xMvcmGJrrQkTOfJMy4GT33U0=; b=Y94Ow33JNLm8K27EOS46grLzgd
	oJJqGN0r2wrCuoSpiicchC2nm2B0nXUmzsGlC7cEzJCPNdp/3PR5NEi3siEqOwYzw+i2oXUU4ITb4
	MlPOhuDw4By72yVeQbQO4TRR9wWGb+HJrv4/tNjJsTXZqFwQjAD6XEgF7hOKSwrtj9XQIVObeF5VZ
	Dcp5jB6ac2bK8ZDrExexdPXMvNAQBb7QURlBkAV/1AvZ40wGXl9tjZGF+1LeJ/jcV7SkyU9MdVEZM
	/jgZGCxbyU2ZR1CEBit8gTROnateC2CAOHh+bIVWv1kGJ8GLtRrUvb3pJql0b7GdrOu1/pqRlBaFn
	3SsDC+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7vG-00000006GWD-209y;
	Thu, 23 May 2024 12:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tF-00000006FAZ-3RFK
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 May 2024 12:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oV7UBZ9+FOaGpy1Hnl2xMvcmGJrrQkTOfJMy4GT33U0=; b=JAqPo6eRfwu4LGTE810A3UE4CW
	ABzJkHKsMQMfNeTv624JwJtFaHAo6UEoRfliFHk9UUl5cIbmdTQgXv0qS3lLIoVQSEcgJrt18sIao
	oMBcoCnEh+BfgdB67MUa1ulHc2q5LyebeEyeM70cJTWdbeIBL3d9EWKwbC+D8+EC91+qHKeWpxgUb
	VxSWOrwRBCUuVxyNASdLBgeYddAqvPOmhBJnADNMRMxPLioDxTPi1xWidI9IiCW/6Iu+cEPHY+BBw
	8ckDb3K53az1x4x7gB2Zyk450Qia+YlmUxCdplGy3xfD8VKjBzZeLb6Ur4VW+As6/sDIbcB09xcBM
	qxHNQ4/Q==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tB-00000009JHk-2ooL
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-34f0e55787aso5018142f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468582; x=1717073382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV7UBZ9+FOaGpy1Hnl2xMvcmGJrrQkTOfJMy4GT33U0=;
        b=rFyl2gzUq+mqz0cw7QzC90VJohQ9D+mo536ueoJGms8tEOo8E2dQD866wlY3rsmwyt
         oiYYUNgppv+1ONLejzO81/7pBp4KskZcPgIoa+3K0taCPp7E0hGo0ppBIUt84Cq4lDMo
         Is9su/6yTNfGk/VFi2zS9bovHHZzHfJGTbwmL1tzoRu5skdqzxcARUFT95wFsND/u75T
         pvfJrVqDUVCT1hzXUGMhREx5hzQKtbTKRleYSVc3kiKBF1WOggh6i5tmdPSjs1gzx7q1
         xNqqa/zDfT9HU+Qj6eaCS77+t2WNDZ0cH3/VVLaYnhP8N/jvMmQkdGrWC8le7RUsjd/i
         hQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468582; x=1717073382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oV7UBZ9+FOaGpy1Hnl2xMvcmGJrrQkTOfJMy4GT33U0=;
        b=vCWydbyFGQ19Tt/LuxZLjbbRTgc9buvPodiwLgAuCYG71fDyL63UJTr3uREPR6k1DD
         viY9zHtEe3rH6Uo/kxOnHM2gtXBxMeuJXN838ADIdt4b42ugVFvaFTSyBs10/oFYbYZ7
         xYBfueMqf0JTdUJV1Iszmu5WHUciylqFGAb8AEi7NDx90FJiriEGiBw/RrEXwnfw1W+7
         DLv6I7WpvdqrDSsJsTfcjE7sxIpC5m7j9seENHmOE0830uyaSeHgM50yXXZXXXgyJQaX
         497hBUD6YErHhS9C43yDQywPZ8XXj89jVG/JylxrlD1c6uGY2tciiv8UxxaPMaavaKPM
         KaYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLHni58wyz1FtgGVkfnoBnm3DHZdgHUHw/j9VsBt2yBypTr8tjrT9GLqn/TCrfi4bLNBxIft82HtaKI/pFj1O5mEeAszs1FZ+ls0DOoHUW60+D
X-Gm-Message-State: AOJu0YwvApQhDa22ZCAkcRk31sFWCLiAEu5RTlv8FcATtmnXFP3iqdN2
	idvWdTYj7mn4AsoUEI4XpbWn7fQkjIlyMBf0bjj/CKpYdpWAX8GlznKFW8bGJ3g=
X-Google-Smtp-Source: AGHT+IHznoqV8aiJ8ieyvNlccfqDAnlHarASle5JQ78h8I9hJnV/p+wU3L9SVwzX72hcSRNDfLxJhA==
X-Received: by 2002:adf:cd11:0:b0:354:f44d:a01b with SMTP id ffacd0b85a97d-354f44da262mr2654995f8f.15.1716468582558;
        Thu, 23 May 2024 05:49:42 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:42 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 23 May 2024 14:49:25 +0200
Subject: [PATCH v4 12/15] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=T02ZuZj0ijmxlVVq8ULLWlzrN07sh07XViJUCnaN+hM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTmiIN+hH5sjsyB9OiMxaQ+PFDyvdz2GQAG3OY
 CSOzjz6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURUisEA
 Cc6FfVzLDHM6GIBiFrX5C8yWAmpB0sfQBWzm2/LiHReGOMzvEj84wrDpQJRaAHErRiZBkTOVNdb8HE
 z+CGacZIQhgv9SbUW3xZipNp/2egvC03hrEzaOmQPN9btFE0hSyy2vnM+C6oNN/NpYgAQdFXk1CNyM
 Kf0xyyH5QH7L8WRbapNjD8A83yMh2cZvoGb7Q2vsCfXWQpK1FwMhi2m4busv8/QNxNn95jSnZKFPHC
 Iqrfq5kV+wkCmSGBhD3/VyrESQlissctczNW0FbMrhk4mMuWYOMUdr+jSpQuw9LsuquvbbYYpBvbdQ
 8Itrnr9R0jaFg2o2LCZ70PuferPP7bBi3BcJjbevQ+H0+wWU8B2MmB0Qm4nvhW6JijGLSS3RRjelak
 gjB8D9PsgqllVBW7ZKiEqwggDK/LCSUmduby2ppRsrCkeSEqmN1N9Dd9zSDbAhscXNZkxKoiJxaAc+
 qn5/l2e1pYlPhmpm8z3+STuZE0OVZrQYSK8RsGHCGDmogWOLpQXKV8mOeThvPc8fiT4eH+QQN+HFL5
 iSVPE+L/1Zr3TpF20aZB9aUESBilPV+qbtUEY+6f2GGjWMhKBpEWRVFL3nUGjOlIlmlFfdflvEP0Ey
 49OgjwmNz5P82LcR+net2PCW5fGe+fHv+3Fe12bq8/wx5L/XuDF8Wvm50Mpw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_134945_799084_B5DBA951 
X-CRM114-Status: GOOD (  10.61  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index ce8f3cc6e853..e1c3281651ae 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -318,6 +318,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_dev_num = 2,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -345,6 +349,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -732,6 +738,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",

-- 
2.25.1


