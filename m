Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B96EE6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0L1ilx+hMa2xq7WP3Qq4RE5fisuDsq/efyV+pjB+nU=; b=DUnYQwiCol+p86VqnWgRMnFWhk
	esBmZDwh5TlrjBkfBoWeinKgotYNcDPL5i9BEjz9Lbzsc0nuIyM/b15Yqj8BnBGMVWuR7eavRt/0H
	WkMzpZzMQOqCz4uynwS4mYzzMxKwvqDYh04gnl+cQiZciQRJCziRNhm/YTA8BysIel7QgnFpi21F7
	7IMa+dPXpT5ymE/7ObdDQkGg7SDIXrE1d7pvMPHNfVUL3lY0O2QxkvRMTkpPR7kWTjllC3dVmXwQI
	ZiKPZyMiiVDuEAue1lhs0J2Jhp1z6I/4J/ZMEGlh354vOj4JeboZsnVhtfE1eA9kiU2Ce/W/qr7sh
	ivJOI3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIsR-0000000Gwt8-1FuR;
	Sun, 08 Sep 2024 14:26:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snInf-0000000Gvx9-3t44
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Sep 2024 14:22:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cb198f23fso1272855e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805318; x=1726410118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0L1ilx+hMa2xq7WP3Qq4RE5fisuDsq/efyV+pjB+nU=;
        b=pVGuXMtScz34g/ZhhOgqh+Msp+VccOS3GF/fofZTxq+o0/xo5XQ6ooqz5xi/KrvpeG
         s2U1RQrTlFZalYsDmUMg/WnyEQlf4lLu4dn4PL9GyiC4Z9p8A1tT8H2lVLnkLItXkF7k
         XOCTaaN8CcRNOQQCMtlRjsfNwDhN3ahwJzuTlfrU4gnAo5I8hkVRN7/gzLzRlfKwFCrY
         vLj+opc2kagOLHbO5oVlJT+Hg9cyI8Ts8CeegmH0NgVRuAnGlKks0TpoRPMz5+jjtt0W
         n77JKLS5Emj6kbJhMTJEt/zVF/faKM7Fs77zUPlwJhOB6oLjok4nTjTm/2I2+BJUv6m6
         6BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805318; x=1726410118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0L1ilx+hMa2xq7WP3Qq4RE5fisuDsq/efyV+pjB+nU=;
        b=LAbw+r+YUsevsfqcMjIAm3dzi3gH+xI6qwPbG4g/v5VSLb16mgLEvsIA18lWMEI9Nr
         Z6sjhdHmwDJgkQhBMMpjC2LvtDYc7Jmdx6kjmJKX7+4t2FDsz36zgZKbMuPdzsm4t1yG
         /KKhuPJvbDF64plZ6FjuHP0fKWqaGJQ2cn9ICg0GEHje+AIHHMmmo7FjPO/QM0MTEkIi
         Y5FPMVAMqg5B00cUJ5gPnOdqAvnVMNjDesmGF3PzSdxmZwlIcFxH6pL5HMa51CokaQpU
         y++M7OFgag0rdpSCjSlkfle9RvNGeYc6KuO+NAZHM+1dF8EXzBKMWko3Z2SGrcYqAMlK
         koIA==
X-Forwarded-Encrypted: i=1; AJvYcCVIF2cOvybTU2fi8GLQedAYgGVe4caVCmrbNtv9Q6dhcfyS6KUnOYl6zT60PEfOwEN26ROoknyZEMz45nl9EA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPRa8HymG5WdTNxtA286Bcz1Kw1vsCgtBgU5lQP27OSgodX0ng
	0bByEiY/rryHkZz1hD5MU6EIu79yBYBpt3JcNsmkYaBWEq/790f/d786RFdetk0=
X-Google-Smtp-Source: AGHT+IHTVEZ6ZfPKh1HQZv1kOYMnnFQNGX2KN1ojIsct/KCdkX/n63VIjNLycr0FImyCNmbejXsuHQ==
X-Received: by 2002:a05:6000:4029:b0:374:b6f5:89aa with SMTP id ffacd0b85a97d-378895ca6ffmr2551755f8f.3.1725805317414;
        Sun, 08 Sep 2024 07:21:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:35 +0200
Subject: [PATCH 5/5] drm/bridge: ti-dlpc3433: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-5-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=821;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oU64b9cUM1B+FhKojFLvauLBTDBEruXsTRhzx3DV120=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL2DUYDY7DvAGsL0obtzggBzQHcH1rHvgeEl
 aWZ6s/p+46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9gAKCRDBN2bmhouD
 1yqTEACYXmHXPSUUnUlz2ip/BtD/rSYishh4B1RnVHWgH7UaLOnusfLIQ/7uJcPa+iqZ9kDBTTb
 3+IIeUgwtZ0RPchNZRGIrVB3QZ5k5oUJtmZe7ayPmckWY6vgDQwhNsKYwet3LEu3RoDZmFRxc6O
 Ulcs0uVhwQYYnrgTBt2u3zDTuXDxjQ8atzPrSuKLYvWjEMQcXvOq0sX77uurGvskgk+g/fmUtOu
 HfmBJKP5xxh2YCKxI0rfz/j4bzSqT3hto0QLumegf7ICdV7B+h7BxXaQsPYKULpXbZWgwr14ZjA
 5f0vJThCx+grRi3BPdIfhcd3BsYrcEKm8T5VUQvT1s8KtwR/En719KsEnIawDIfCAC6fme+ji39
 +EFUJB+jcPU4fh3AcMPpgbwHiok7gJS0XU3w0bd3OeB42/N5tF+mdG+On+WF7GkMX7oXSxfOBY8
 xWXgGEjMmTjPdh1im8PhJMBrF55WMuJIpXXidxoEic0q90Js9mlJsbB/GQ0ezTeJR05r0/+h6fo
 dUW6lXJevucchL0arzAqukqPWHZBJgp2xx415MFZ8EtoUPeOksNPFYd/PF9dvKjNKIYS9KLQYKG
 zmpFhnn+Xb2no9UKnxbsbCqOFrOz+Hv6fDF2CvLMm//r9VtFF7F+JjiNJAXt0R8wm41egewrsBg
 eUBSJIsYNN3VS2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072200_007640_707A1693 
X-CRM114-Status: GOOD (  10.94  )
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

Mark local static 'struct regmap_config' as const for safer and more
obvious code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/bridge/ti-dlpc3433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 6b559e071301..a0a1b5dd794e 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -94,7 +94,7 @@ static const struct regmap_access_table dlpc_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(dlpc_volatile_ranges),
 };
 
-static struct regmap_config dlpc_regmap_config = {
+static const struct regmap_config dlpc_regmap_config = {
 	.reg_bits		= 8,
 	.val_bits		= 8,
 	.max_register		= WR_DSI_PORT_EN,

-- 
2.43.0


