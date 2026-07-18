Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08539C44523
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=; b=mqn5oJbIRSdTOT/Jdw/iSrdoLv
	7ixKdQcY3vA0clnoyS4YRJBjAu22X6x/I7cp2BUxqGzuklQz+b+/zA//+PWNbmU/DCeA/gsV9RAlp
	RrN7kAQMMChjrArXjoRQxikg8W+8dzZ7epLbY62voO6dcw+61hfY6rHtNHLiM13dYer/pQshB5BXW
	NE60Qdq7rX4eiOC/zj/4fLy4sljxgp1Bmas9rcMJhp8hXJB8lBy4pGotEy9KS55+gXG+lzdimeqXa
	FAhq9a0WT7N3hWFh2UmptNG+3QBB0gX5ie4OzfY/FdcJAY3oGVe59DL6GzHWaTKvO8LBPs9E+dHU/
	aReJpz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaW-00000004cZb-0mSs;
	Sat, 18 Jul 2026 23:36:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaR-00000004cTR-1wfh
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so9390975e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417810; x=1785022610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=kBfwcd0xj4BOAQ8WHqSdypREsdJW2elx3EIym28PPkIK5tMekVhkxtPFho9EY0fcho
         rJ2M1JC2JVYqmsx+kRnemyJAYx1wUjfOSQRbpYUuawcjtpnKVkngCXnm5uZzjOcnWnIZ
         3/rxHWfOOnTVo9kTDLll3B3zssmbbX9Cidtw9bdSmoguQFaxB/AyReFwP7kXGunbroYE
         hJa+X1jKjLdX5FX5Mo9dvaWiMJuEbA1aTyHwvMsSK8QPgrqV0s+yDMsOKFskN+vjpWvh
         gWtMs1WMT952lOLUZ/Vp3oIiCwYqUmSVq4V+8I3ySRuyOohvT31eq6mEEFqg4y9bJWf0
         xvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417810; x=1785022610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=APU7xJYAtevWv5ym0Jx2oneieM9Fp5AQkE+YKRiD/zCdQ/5tydsSlollSvxMJ3FrWy
         btpqYXCNxAyYafgc0BA3Ru94nIa4yeYbVUg77jAyV5gtVEUcWH+48l2xfkM0fGefnI/J
         2lyomescSK4zGiI6k4eynAHe2ZZAvrt/fSTQ56q/fdvnD075PecXcFMQldXEqBxUScAc
         83wz2Dophj+fkmL9EigvXoj9own/oQaD1yXClV1v/0K+TTrjd9t4k1kmDdNTyNhsCfzf
         79vSUBSVFTAa2y/ZBBGYzPZvWGxjEH9uP0YNDmvAFMDVYbnwLPFrWwnIhNJP3IG/d51f
         bKHw==
X-Forwarded-Encrypted: i=1; AHgh+Rqirzg7JDaTZuqw7q42WCyL3BFSZXsVsvZU+XQHPg6wPCpX58/g9yKNSXjdnlixwdl39pz/rUC67v5SVT0Msw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ORtJbievvZmvyz2yyPKzBfXyzsWphWbIrJRNbBXmDReZdwbf
	kvDDqvCKJMd8ikjwR4OosTWjAC4B4cQzpjDhrpUsSjuhrJHhFKEfVzry
X-Gm-Gg: AfdE7cmcmvSqeL9SEu7YkoRI5FDaabk9sinlkZ3u6d2Weq6C4LR2OVQFuxUbZ8UUdLP
	xKaF2SxoE/pCB5hAQk/A0waFb4g4JUyauSRIWN/rDDisRILnpensTQ3L0M1ljti1PLyVTAPB+6I
	KPdikw3AE6lX26+agNxcRizPA90DEyyFTREfcBMs2+wargzSNNj5bCm2nOPZPjC5b6VapPkcz/B
	rMPTuDk9+q2V/ZniGbddmE7CXwur9MuyRiuwX+I/5iJCZqux3z8+R/m7g82/gVwZYNSmiZKSbNr
	n1riZTo21jzAv6H0MimFFoTppB35ain3re9Pgv2uHd6eV+N5XACEfAxmVd0VhQ9m8BZctRNwh90
	bwPCNyUQAruAwCXNWMBJOVneoR4IbtoSQ1KxjD2DS8HrLisJsbcutmb89/3PPLHvAR0vrSFQLVj
	6Jop23ygvaxg==
X-Received: by 2002:a05:600c:3b28:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4954a3f36b6mr89247115e9.10.1784417809642;
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:46 +0200
Subject: [PATCH 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-15-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163651_576841_246D79C7 
X-CRM114-Status: GOOD (  10.38  )
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


