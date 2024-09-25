Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A160CCF9E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dpOZ/ioTVT/5il6ou2oxhriDCIeCxURBP+dRZuK6nM=; b=SpBYFWnSVSC+LX8nycxbaLMJG/
	mFaN/WbWpm+RZmdKj4tiujOjS3qVBTpnXjHvWkHvPNBVOCgDgp1sMcLL0NWHPP9LimiIvn/KC4m3P
	bVhpe1CF4UViEeeagi6ekeAxmqFQOJW/LoEMVaj/Wd6ebxXzjMd1PVTf9eZvB+5CayVZD6fC9/uUK
	RPspOYV+MViQT6K32w8HSP0y329tlZW8/wOUWTsiCpKpxx9V+5ZZAzElvPt6qZ/vqbYgIxh1htoR8
	/rbIRKWdOi2gXS5BnTzbRS63035vG5SbBnG6X66mt92yfZWvrxT6/vA1ZBm/5pl15YoFCexj+BieE
	VJCTsLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUCo-00000005vl7-0qr6;
	Wed, 25 Sep 2024 15:45:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAS-00000005usf-33aD;
	Wed, 25 Sep 2024 15:43:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c5bca59416so4908122a12.1;
        Wed, 25 Sep 2024 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278983; x=1727883783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dpOZ/ioTVT/5il6ou2oxhriDCIeCxURBP+dRZuK6nM=;
        b=nMA/0NfMgnMDOIxDPassBHl1lE/tepLNeMfBxZk7s00t+xlVNXnfV5Agj667wvSFt3
         5zo6lscsA6bbQ8MLE6W7MpS7rovDXeEyQlQta9fH8iAJJoEGSGpMk6kR2RBkbEbfM01E
         miUxqkCIQPy0PnRk2l/anQyER1B4pIPa6Bl7IwTo8zfgmz7Jrbk0aTt0pG/ZQJTQKR35
         1g9j2p5sN5RFCfPFgF3g5SieR+0li9IlTdLG+WD8e7xLR0CqwBgdTluQ5YCzhUwFvt3c
         9EscX2RVZybgF9uozfJrFd0QVfK9qWVdFYnpueUC2CMXVo8EAtbJzYpQR0gnmKiFFRlg
         Z+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278983; x=1727883783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dpOZ/ioTVT/5il6ou2oxhriDCIeCxURBP+dRZuK6nM=;
        b=s9BcwcFTuxYgjh3+d2n4TlU1GGKNyeu3a45jQG9C24TNvI+Ch/6BSe+h79WqwCfUh+
         23IFufQ2csNAc1IYVu6rqXi2jLdSQdln9Y4h28QB+b+z1tudYtDQaRMtq1JKlNNzqnms
         B1/sjYL9FCHnIZil2brM9XPp/Fmqodda9BvFp5Ulz3hswa1djUikU+vjJAXLEv7lFN+g
         dyEhPoTI3NGj4VJPQHSbwJnWXe58L2kcMZe4OcVbX2JJXNojgg96qHHeHlhMZ0o5JbwZ
         IKBki5va+YpMHS1V9HYFQicj4QEmnz5VPQPGyIt6/zhqJ8FuJTU93Do0qARYyJe+ylNb
         2z5g==
X-Forwarded-Encrypted: i=1; AJvYcCVwCiTNUnrFHsg+S/uHIXaewTGOMMluZXTZi0VfP14rfLRIeOBBsjOM+GKtFx2a8w/JN9MN7oj2Cml2Y+zZfs4=@lists.infradead.org, AJvYcCVzVfswpWYG4IF2aZO+kFrNZm7Sd3wxmqggguWWOr5W2b/oq06W+9DhRdISZ9BM+Iv6N/dYkel8kCQsza31@lists.infradead.org, AJvYcCWFoGGUxVHAfND6knkC2fnvNW7RBlZ+XG0dnlA69UcwyNxpijMf5yDW+dZCInXDFyGVQuJlRD+8VL6HNLD7QM46EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvPgHDy1MLI1gVfNwmI6UtIlB0eXSXmgDEcLI2ys04UWCqhcdz
	UX/RafNgzQdk1kwXng0wC2Q0shW2fIUn3Ae/b7qdxJ0NsY3jjgl4
X-Google-Smtp-Source: AGHT+IGKuNv7lE0u67hJ2OAhIVHl0bYdcTWRyaXR7IlGUKMo0Hm1JsihuqtBmJ8apswZAkFgkwRFnw==
X-Received: by 2002:a17:907:1ca1:b0:a8c:78a5:8fc4 with SMTP id a640c23a62f3a-a93a036a36bmr248782566b.19.1727278982930;
        Wed, 25 Sep 2024 08:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:43:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:41 +0200
Subject: [PATCH 2/6] drm/fsl-dcu: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-2-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=797;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=j5IVdz0beAjnl/rD8q67jV1CX8MClFwEzj++cGsQuD0=;
 b=4dMgS2dx5TyC8IP1MnInm+QJtBRuPpVnV4hoTf094WArm4pWhlF0Mhj9oO7SjZ12DXIAB3adY
 5WH2uozmSnrD87oiirTQsU5nwiuxGKcfiISjPQfFww1GYXuUT2164v3
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084304_807869_A56FFF55 
X-CRM114-Status: GOOD (  11.85  )
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

`fsl_tcon_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
index 9eb5abaf7d66..49bbd00c77ae 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
@@ -29,7 +29,7 @@ void fsl_tcon_bypass_enable(struct fsl_tcon *tcon)
 			   FSL_TCON_CTRL1_TCON_BYPASS);
 }
 
-static struct regmap_config fsl_tcon_regmap_config = {
+static const struct regmap_config fsl_tcon_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.43.0


