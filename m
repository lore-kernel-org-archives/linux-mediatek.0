Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88747CCF9E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au0IxjjfAh+IrGj2ay54oiQohRBhlUlTthFZL3EgcLw=; b=0EuXm321rpR4DTnmKkQZDAhtyE
	lbnFKTWSkuqaf+V4M6zN0J9yUtmZEkA/4S2j9pKmU3z3f6WeXCALv2kNhzIF7qvnNHYC5U7DBGvgi
	iLa/nHi6u1Z53OPP9hnZIgJpyIpbqFpA++FkjTjBy9pb4OrxPCm7DRZe+/buihpYrzXyhxqktR+WG
	Jysl9jyozOvl4B4+EBgMbo0GFCyUimUpqtaRW8cEjLt3+/qEE32n3evIDM01IKxV4QoYC9VbNeuMg
	JizKvs7P3vay0xIwlQOBjBKSOc3Nbr/8Sqv17kXwMT1NiZXWt8dpbAen5lPNmt5j9uS5YQzGAw74K
	5aesURLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUHM-00000005x0J-15Z9;
	Wed, 25 Sep 2024 15:50:12 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAg-00000005v34-0NCT;
	Wed, 25 Sep 2024 15:43:20 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso70223461fa.1;
        Wed, 25 Sep 2024 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278996; x=1727883796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au0IxjjfAh+IrGj2ay54oiQohRBhlUlTthFZL3EgcLw=;
        b=jbkAR8d+ee/QuibbBWSnAUhEgwA5l7C1iaWugOAWryG03N5loMTvKvp5wHz8V07RJH
         d52W052a5KDS+Hp7rRE//Zun9Hcf9sAAFqfDrqlb7y4K7Y8MqgpG/jycHGcz/x6udkJj
         FlIfKIV/qFKyCeGu2/46zzMRBrdyG6WzMsqoQLTPyuaufyvkLGJqyjI2fNfcxm7tarsA
         c8aznyBgWduUDuBsmg0tA/tneMHhUSL1zxPpduWMdB4p1fylPqoCy3lFdqSHuXajk7Ax
         y8xeqs3Zsy6rOr6kYwgclZSVuS9ezOgO8vH1C+Fhm8NQsZuOL718wn+JNf6mzN9rFsRJ
         J6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278996; x=1727883796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au0IxjjfAh+IrGj2ay54oiQohRBhlUlTthFZL3EgcLw=;
        b=Su+MIxvMTpo3XYySJ4OjtNwEF81/AADNC3b1mZIISRapR84ipC2Mm5Kuj8MxYZxfdU
         YjffUbzK1tkec2GEU+UPBG0zCVWQanOAD6qu/Nodaf2/pabkFA643GRU2PVFIPGEE+pw
         TN6frDZgrZLvbSMTb/kRZvpaNXWonnoPyGi4iT+2OY59fweBoddtP1FwnV4gsnSdVwo+
         OwF4PTtMFTPFDjlXwffEWsCYHD4XJyX0h0Z+vPIPd55/ttw7Oeuhfp6MhEjQZICueDtv
         kEnUXJ0LqLQarmRqkNJ+2pH/0y9+Sh1AwRexak/TEH1yx+fV7bcBreDxkrNa5ivkEqKD
         QMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbEkTJBwacEAh0MBMcd0khAOwcIlihaDI1pEcoxHAgZtpEan6RD0jaVPhbaoIPXSfa82gOYza8KPE9H6Yi@lists.infradead.org, AJvYcCW3xk7zhXmgnAvlT0jch+5Fay7tLYzx8gonTCtIkSk0tbOMPpZwknjip88GJRSxBpWOZkNSkpuKRypKXQTEQ98=@lists.infradead.org, AJvYcCWPAHP1HIrP6oTGKoT0G7isfLq8sMK0mbeMTbgqx5f7JDlAp9bjYxRqM1I0egjOnFVBZydBoY8Z/19yCOIxV75JEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyylohOnG/FtuXOJMbeOi3HQjjQpF6R4kjcKS/F4Iyc4oJWnjcn
	F3ob2YduWXiAt8M51o6NwICRDvpvMOIeFcIGVe75l2osptvsR5bZnzXLfy1o
X-Google-Smtp-Source: AGHT+IFCWYzAdpSpjVAnQ4BizrMtQKpfIddRrw3ocd29W6scUx1jmeEcp42KXRhfT3R4QSqzAie8lw==
X-Received: by 2002:a05:6512:3b92:b0:535:6a83:86f9 with SMTP id 2adb3069b0e04-538804c7028mr1863446e87.60.1727278995522;
        Wed, 25 Sep 2024 08:43:15 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:43:15 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:45 +0200
Subject: [PATCH 6/6] drm/sprd: Constify struct regmap_bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-6-e609d502401b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=759;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=/dTvDzTxw0elKvCO5X9KGGNdTLXj/tisL/crl9vaUr8=;
 b=373HrRNVvIqo811qw5A1e2uUKIh5z7ThMB7W+u2ouyWfcNGoTkirPUv/a3k0By1E45+/+k9nu
 s2jBMDDp7dTCURqw9nlmEGjS03N0BqfD1AngIvdPXCsiLl6HtBQDhfN
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084318_298329_EFA523CF 
X-CRM114-Status: GOOD (  12.46  )
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

`regmap_txt_io` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/sprd/sprd_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 0b69c140eab3..44a7a579660f 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -209,7 +209,7 @@ static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
 	return 0;
 }
 
-static struct regmap_bus regmap_tst_io = {
+static const struct regmap_bus regmap_tst_io = {
 	.reg_write = regmap_tst_io_write,
 	.reg_read = regmap_tst_io_read,
 };

-- 
2.43.0


