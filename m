Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED06D2AB23
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0505nJjQERl8lxM/9PvfVg4f+qO1mzi84QJZy2KWoxQ=; b=H0DBki5l52QWG+uwIJqsVOgiPZ
	dK9m+KwqUZ0RAp1Pb+ZzRbgcVsOZYEr4Qv6gUMik223m0HSKOs5ASL1zwH0Ut9Ptq9UmQ0Nq7hJg8
	qGYGKlXhyvND4mgOL3lwVY/xltd8yDhrB5JBjTh6/mv3gvY2K5O0WkUobG3Sy1ZebtuNYNpbRKDqH
	UoCaiM/OJLdjPc3fwehRdmyCe45Py84EyxndGYZttsJBlYdHklzL7qrM1p61v09GOVSydvF+E1JJ8
	VDEb88bkImRcI/Cxg5AoXs595/dhtzCMBPXDF93HtOPXhvLZGZ/rME6B6/TlYz9j0CGKGIdlY2e4A
	NB2tpZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5khG-0000000EHaW-0Ezv;
	Tue, 29 Oct 2024 11:47:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kA0-0000000ECjC-0kkM
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Oct 2024 11:13:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so3795927a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Oct 2024 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730200395; x=1730805195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0505nJjQERl8lxM/9PvfVg4f+qO1mzi84QJZy2KWoxQ=;
        b=B0fXJfXbZQNZ/QSTZEYthrTBUqPSvrzh50ttYHOGRL4BkuJoDucxtjJhNzkVL8I4Ko
         lYpOzI7truezeA6ovVzRBm6CP/pm28PQ+dC5Nf/TLijQPidPFS85wlxd9K/7NsECSA3O
         f9oaSms4jKKZvr7KV8rA7fQ6lJOu5XQ1rkvAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730200395; x=1730805195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0505nJjQERl8lxM/9PvfVg4f+qO1mzi84QJZy2KWoxQ=;
        b=bOldR8y5eJmrctJQLUjaaxyr6rbNjxRYUoGtaIlY2EUhZ3AAwEjv1oonS3LWeC/2yU
         At0fB2Qhf26t8i81Yaqi2uR0GBxPLs1UugyQfiu7AtczpRLGWniW3Wt0xjFV5WZfbABW
         gmumaZgeS5PNaNj5h1jCT4Jw8pR4GJIEURSNJSCU9sliWc+Y/jtkVxR2xCpIq1Wh2Akl
         BUUnF7fSX5yiJuuSpCeMHd/pWTrbinZ6nSyDWDr1w3a0urLfmP5zC2ZCtL6MeEmYDZew
         jwLBZZH9oo7OxxgTLUVp2ko/feL+bkriOVOjTTzJqeJmGO5CjyVAfS5X7b+/TCEWwGql
         kHag==
X-Forwarded-Encrypted: i=1; AJvYcCUV2wtljahqPanx3j0Wvg5WDHzZPp97iObQaO95B8atRjZLd0luExT2NxG1ceVgFeDygFN4m5ti2yEmDEwKIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwq34F7yQvR3onF1/t8rjcR5T9WAH/zVlD3ySvHt6gTI9ifE/o
	H6ldzX0elyhYXuMRFleOdBLJacJY+56KLq/F63w953+PKpTQhzbjpYJmXVw7mw==
X-Google-Smtp-Source: AGHT+IGrd9l1GlM2L8PMQ11t9vsR3WqEyNxK+9h4vC9b0I7xJAWHJVP8EBwRriK40RxJRSAsNNrEQQ==
X-Received: by 2002:a17:90a:68ce:b0:2e2:a8dd:9bb5 with SMTP id 98e67ed59e1d1-2e8f105e834mr12056484a91.12.1730200395327;
        Tue, 29 Oct 2024 04:13:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1fef:f494:7cba:476])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572e69sm9280776a91.16.2024.10.29.04.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 04:13:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/mediatek: Drop dependency on ARM
Date: Tue, 29 Oct 2024 19:13:07 +0800
Message-ID: <20241029111309.737263-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_041316_269997_2F0035DC 
X-CRM114-Status: GOOD (  14.06  )
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

The recent attempt to make the MediaTek DRM driver build for non-ARM
compile tests made the driver unbuildable for arm64 platforms. Since
this is used on both ARM and arm64 platforms, just drop the dependency
on ARM.

Fixes: d2db0b8fd70b ("drm/mediatek: Allow build with COMPILE_TEST=y")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
It looks like the culprit commit was merged through the drm-misc tree.
So please merge this on top ASAP.

 drivers/gpu/drm/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2e0e7c4079b6..f496e6cfdfe0 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -2,7 +2,7 @@
 config DRM_MEDIATEK
 	tristate "DRM Support for Mediatek SoCs"
 	depends on DRM
-	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on HAVE_ARM_SMCCC || COMPILE_TEST
 	depends on OF
-- 
2.47.0.163.g1226f6d8fa-goog


