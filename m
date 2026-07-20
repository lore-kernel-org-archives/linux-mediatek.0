Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34835C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=; b=wucPtFF+hRSCmSLffvD6CuXO5l
	0ecpwEc4HQoz0qfxE6/2ZAcPGJKEhPUCcY5eKDs0H4tUzolg0IF9w51YRazfzeFO9dd2tAvlegQ0V
	Bob+pFXstkrAuTGYGBeBTC1pFG9b5wiRt2tnrymeDVkw2AemxsF01J5yiHyJAxaHhjqkYwmlc3ycw
	oxAkdddK2Ud8PzNYUBrI9+ULncHMqWnhBiRhtMKuZTiTjkA697RLOVeGX8WjCNSSxVdmYCl//OItv
	MaAuHw1nJU3NwJFM8FSQ7ZIEeu+xPQM4TZrR8FnC7ipCgoNP95TCVKKXoNoiWxcvE9hoav5uBLcUL
	2/JF5bbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7o-00000007Eyq-152a;
	Mon, 20 Jul 2026 15:41:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7l-00000007EtX-2HBa
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f633e6058so2900810f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562104; x=1785166904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=aCk6ZUh2mJXXOxDLaPTOgB0Y9SFkYM1dtrRXUBMwuLc+W+1rAHeKNx6AOblpsmx7M6
         4NyuIBSaCEf/Wu0kB2Ae/by//DIA+AMkJ8tE0r94FLfbX6jR6j7wzDgXb8WKKOFfl5F0
         t/WCxifJzQj3I58Hd/0fYw7bDL1/bMeWNd1Nb6olJJ0Z8NTXBviuQlOtJV9FCH//8a+z
         IksSh75ofMVdc0Q5gCUQV3JVp7mZcjCziQCEA3fqKQmH+9emNkhjycIUpUDY2Us3/V5Q
         +sQnzapjMmAoNnYnUCN9nU55T8tprn5xnMyYdWtU/9tj8Vl5IdCv1tvtKYF5R7+FAdRi
         Rs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562104; x=1785166904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=YnUK3pbSG0stq41gqtaZ/b2HpyKVpbjGfI+bS75herCV2O2PT6LhmCiuVqlCdNU6ov
         fBYmsGQua+gIfnaexb0nR0h0dn5xFz8Yh/2VEgpcbpRpt9/Kgi32iW05cubD7juicx5p
         /mGecDe6guZVuisxaJNf2At70GiIXpUNhkKhSNErn0rIGxALl4chIn3WRvBRYqaJY8sI
         ngdQ2rvR4OwhBqdgMsT9Bb2XnCvH+/gH6wcnGoxbQw3IWZsrfv1Z7WiwKrmRPnbQFCEu
         TbbrQFVOaC541DSIzuHNLlTuyuIsJR2WC0x2NQ0T886RgNk6Ni29SDIQZuGB2CVeDgf2
         J3LA==
X-Forwarded-Encrypted: i=1; AHgh+RqZrBGCV68lM36KlToLyMUfyy+Lv0TrM9h66kp37xkR6unTQEAmCKNDydW59E3TFI5BVckOwgkM34cH4v03fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLKzECOn0VBjGdiio3/fVOoYoRkRjrTb3wVyqESZa1qGvTIT+j
	v2bDC+I3MYTp6tCQQH/tz5Um7ZqXFOtQASIC9Anz6YLFJWUWDQ/5VGmc
X-Gm-Gg: AR+sD13zP/S2poUaDYHj05OfjBnXvPXBKhbOr76Xl9oKcKugTYBTM0AjjJxxdPlM47B
	Ij656zIJ1GibdOKfBFNVjWzT/+7chNN8n4hiF6kfEzmEVn5dOSFx/Sb2C7JinDSsFmXgMivmMB5
	rtacPc0i69+7LIRVhZPhd0RXZzXO5I2IdPGm8z8LUELCLyGUbhOSaUPHFRL6nLF5op2UyqCJuec
	r6p3PMSXvw0iluj2Qkn7UvNYowAo7cA0l7+bDvtju80TW5/vKjqIm+0ODeeivjw5kvBc5EJWuY1
	nrR3gRDKGwTwXkyxj2CowHCwkO/eLT5c4nfIC/mO7ZD6KQT+XclKGysOj1DMXyTBMLuZ+vgMO2G
	IQITpLyDL1UEDW1ZEGbtpaRomO2emHhWYrR3z0gihzKrrtKLZVE5/NpywD6RDW1Nxzt21ZfQCgJ
	vId+QMyB6IbA==
X-Received: by 2002:a5d:584f:0:b0:47f:6d57:5a93 with SMTP id ffacd0b85a97d-47f6d575ccbmr10955450f8f.38.1784562103442;
        Mon, 20 Jul 2026 08:41:43 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:42 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:47 +0200
Subject: [PATCH v2 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084145_601817_519BDFD1 
X-CRM114-Status: GOOD (  10.51  )
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

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 Documentation/gpu/todo.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..b7351467dc74 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,21 +29,6 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
-Open-code drm_simple_encoder_init()
------------------------------------
-
-The helper drm_simple_encoder_init() was supposed to simplify encoder
-initialization. Instead it only added an intermediate layer between atomic
-modesetting and the DRM driver.
-
-The task here is to remove drm_simple_encoder_init(). Search for a driver
-that calls drm_simple_encoder_init() and inline the helper. The driver will
-also need its own instance of drm_encoder_funcs.
-
-Contact: Thomas Zimmermann, respective driver maintainer
-
-Level: Easy
-
 Replace struct drm_simple_display_pipe with regular atomic helpers
 ------------------------------------------------------------------
 

-- 
2.54.0


