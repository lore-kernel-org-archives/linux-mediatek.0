Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ABBCD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58X8x1UNsNMmiiyq8gcFRSe6N+Bhf8n97M2Kk8Wg5hs=; b=zT46i+nRQNjBu+LOEGLRY50UOZ
	DWIzMeOvRS/jswMLRST4Qq1ucVH/3n3MMaOxBlK9U18nL8XM9WKEkQ88OU5yHK80BFTx0csu2RWLU
	FNKPEdUTBwCHWbJe6LhsiLcj8DJNvfw5pMHgEPEDSI193VnxAb5sFPRjS1uNZiY8YKaI38SQnwQm8
	1w2rCoLZ4wGblFinuA8dABikTo56dSC+6MG40dIo3rFyk64clypXRSmqcBU73YuKcx7kGzoW+6Ziv
	Y23ExgKqJG8yy3AASn7B/FUXoAj0PKswUGyDPC+R1zten4hmrAjg/zrUtIlTeKd8/olHT7q1/SqJz
	VX4CMVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsX9-0000000EigR-0eL4;
	Thu, 28 Mar 2024 16:23:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsX5-0000000Eif9-3WAn
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 16:23:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so1026798b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 09:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711642995; x=1712247795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58X8x1UNsNMmiiyq8gcFRSe6N+Bhf8n97M2Kk8Wg5hs=;
        b=YQrB5pes7XQlRBGDRmsyqvUnF2WQkViF+GYbJ+3wmNqkNysx5BVEi8WHyYjvF1Q+CU
         +AR76gXar3tBohN2s71BGcwaxkwH61ybi1+5TpUmxgKvzYcmuBD1UVZgacd5H20VcsWu
         4xpT3e4z3eUxms8BmNUq/cHc5m7/F9UEFZLBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642995; x=1712247795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58X8x1UNsNMmiiyq8gcFRSe6N+Bhf8n97M2Kk8Wg5hs=;
        b=nWIobzBnPKrhEAtxLlFaiAOHh8tDzygHaRfCDvmKakboRgXdH50NvsfAAIbHGwXwcm
         qeCjMAhvoy9IgmcXjiCAfQQlitaUkgSgf0iwoy8yo9GzcKMCsiwagJvXJoUeqXiAhG36
         TyGr4/5l66DLpmkzdhYYbuoaCed+1ByIYMnuQHIJrb3bmo9HTYuSaH3K6h/4HmJ4oT8N
         ONALq+0cW4JkmN9EIwcco7zV/6YAVbhpEcG8rcYwIT8Os/BTL4+HAHzyxRPq9af1FsI6
         /ds4DMOBg7YC2PM20TneolSXfqjxwxIQ2u4fANOkFjmla7xFIAho3/qJmoEZB/YP666H
         F7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLEjWlmNBvdqtpZaz8h5CYJ7Agsq7xXoBoLAAXSWGCGLqIGMGr72tbtarNrEUnzybnQGTvvMQ69jc20IDCdlGtGstFMQO+jU3qa0hF2udNPAj3
X-Gm-Message-State: AOJu0YzleqEHS1zzrZ9EXZP2v21G+KYba1BU9WU+IgiBUt44jwIAURyE
	MQuhOuoP3+7x+QQd87GP07UNG57xBKt24piZVjmQe6BrPVrbIpKE6pmnkDilwQ==
X-Google-Smtp-Source: AGHT+IH8m4FOpmulMPR4PXwB9kS9sRqEde1d3TfpdPojRq6SCIUP5y0CcdDEYJswVgJiQU/Ul74A2A==
X-Received: by 2002:aa7:8892:0:b0:6e6:f9b8:38eb with SMTP id z18-20020aa78892000000b006e6f9b838ebmr3422184pfe.21.1711642995035;
        Thu, 28 Mar 2024 09:23:15 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:8167:f222:93f:3779])
        by smtp.gmail.com with ESMTPSA id o1-20020a056a001b4100b006e6233563cesm1548793pfv.218.2024.03.28.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:23:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Init `ddp_comp` with devm_kcalloc()
Date: Thu, 28 Mar 2024 09:22:49 -0700
Message-ID: <20240328092248.1.I2e73c38c0f264ee2fa4a09cdd83994e37ba9f541@changeid>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_092315_917304_E862B500 
X-CRM114-Status: GOOD (  17.13  )
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

In the case where `conn_routes` is true we allocate an extra slot in
the `ddp_comp` array but mtk_drm_crtc_create() never seemed to
initialize it in the test case I ran. For me, this caused a later
crash when we looped through the array in mtk_drm_crtc_mode_valid().
This showed up for me when I booted with `slub_debug=FZPUA` which
poisons the memory initially. Without `slub_debug` I couldn't
reproduce, presumably because the later code handles the value being
NULL and in most cases (not guaranteed in all cases) the memory the
allocator returned started out as 0.

It really doesn't hurt to initialize the array with devm_kcalloc()
since the array is small and the overhead of initting a handful of
elements to 0 is small. In general initting memory to zero is a safer
practice and usually it's suggested to only use the non-initting alloc
functions if you really need to.

Let's switch the function to use an allocation function that zeros the
memory. For me, this avoids the crash.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't have a ton of experience with this driver to know if the fact
that the array item was still uninitialized when
mtk_drm_crtc_mode_valid() ran is the sign of a bug that should be
fixed. However, even if it is a bug and that bug is fixed then zeroing
memory when we allocate is still safer. If it's a bug that this memory
wasn't initialized then please consider this patch a bug report. ;-)

I'll also note that I reproduced this on a downstream 6.1-based
kernel. It appears that only mt8188 uses `conn_routes` and, as far as
I can tell, mt8188 isn't supported upstream yet.

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a04499c4f9ca..29207b2756c1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -1009,10 +1009,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
-						mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
-						sizeof(*mtk_crtc->ddp_comp),
-						GFP_KERNEL);
+	mtk_crtc->ddp_comp = devm_kcalloc(dev,
+					  mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
+					  sizeof(*mtk_crtc->ddp_comp),
+					  GFP_KERNEL);
 	if (!mtk_crtc->ddp_comp)
 		return -ENOMEM;
 
-- 
2.44.0.396.g6e790dbe36-goog


