Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4A2C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=; b=AMcG+VctozzXouKEiz1WfEw7x1
	z9pvYHbbsrUEsGXPsPD9LGysI2uqYS5G3l4fo6pD6TTgaXmC8BWb1bkj9X3kW0HLfGH+2N80zKv6m
	+ZSZCe4aguW7b/fGy+sIyEXzC6vMu4XsXBY53XTUdyq3xX9KsH1P/cn6yU+JEgsF5oQi45F4CxuWx
	yCif069fV/ObizyrJtCZNkfn3jwuhalSnNtZvYKB7qxWcYQrcB7K+ND/6+Bd0FBcjFj1ODzVXj5Fm
	wUJbTQP+eCg87//Y1by+KSshqfl3C+0mw9LwBJtGuwnUx6xAeTE5B/7YD9kdmGUSGtl1gF0bJTH64
	ydzucx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzpm-0058Oh-1C;
	Mon, 24 Jul 2023 17:59:02 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzpi-0058NA-2r
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 17:59:00 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-63cffc0f95eso5641206d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690221536; x=1690826336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=;
        b=ZtiCkMRToTcWl3ln5tiZtERmjzvDya7wHzLnSkoFDVyOs8Iu2FfhXqtkpLVlDQsG1c
         7VF1k+kAe65ce5JgsfIlRYOjQUQjlapvbByklyqAWqjWcjqzHXaBt5rNYyqK539QsGEF
         21SUSrd7bM63A0VF8FeOLncawE+xjXhcrXn10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690221536; x=1690826336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=;
        b=WytXU15xaYZdSyq2hjwkhJWPALfY3awK4J/tCfP5EO+jquJr9oS1reE8cm8Ioon71B
         ywON8Rd50haWk11cFdyfYxwViIOXQb/MtwOxoTU0mVYpzuHxOAJaOZzoeLWhC5emLcc+
         cMWyKZ7TBgFd6R+k4OlsgiL3ahyz6PHu1fGtASmeSXfxxXfq/xPaIRkD+x2WcPo0+/WG
         lYlR/Yg87b9qh1xtEBuUEEiTi4t0woldZ3wZ5hW8JHlwvUlMwFob3HeHK2cJWFv79uBF
         C2jBS3khflyUKy2rBxALdj9+fdJE3NWZ2MEfcZCnK6fBIr6yZ1sTEncCB9/T3++8zqy4
         q7iA==
X-Gm-Message-State: ABy/qLY0LuoQSZvEHE2BUnMM+1i+EsPU6R/i8iiB0p78f/Xg/4wxcgIR
	Ysh/bUdHp/slmFrUvCgIhrwH7FKd0n1nSrGrvWE=
X-Google-Smtp-Source: APBJJlHFz3fuAHrBbwCgtd5velI3s9gljIPxkDNwXxnGrhqzW2SHoTFUWWWQsodZ2VKRbVzpojYVQw==
X-Received: by 2002:ad4:5cc8:0:b0:625:aa49:19f1 with SMTP id iu8-20020ad45cc8000000b00625aa4919f1mr637809qvb.62.1690221536262;
        Mon, 24 Jul 2023 10:58:56 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:610a:ddc2:a6ec:9fe7])
        by smtp.gmail.com with ESMTPSA id h14-20020a0cf40e000000b0063cf8ae182esm1470939qvl.60.2023.07.24.10.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:58:56 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org,
	wenst@chromium.org,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	Justin Green <greenjustin@chromium.org>
Subject: [PATCH RESEND] drm/mediatek: Add valid modifier check
Date: Mon, 24 Jul 2023 13:58:39 -0400
Message-ID: <20230724175839.675911-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_105858_952712_364A94C2 
X-CRM114-Status: UNSURE (   9.69  )
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

Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
is not the AFBC mode supported by MT8195's display overlays.

Tested by booting ChromeOS and verifying the UI works, and by running
the ChromeOS kms_addfb_basic binary, which has a test called
"addfb25-bad-modifier" that attempts to create a framebuffer with the
modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
EINVAL.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..2096e8a794ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
 	if (info->num_planes != 1)
 		return ERR_PTR(-EINVAL);
 
+	if (cmd->modifier[0] &&
+	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
+					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+					AFBC_FORMAT_MOD_SPLIT |
+					AFBC_FORMAT_MOD_SPARSE))
+		return ERR_PTR(-EINVAL);
+
 	return drm_gem_fb_create(dev, file, cmd);
 }
 
-- 
2.41.0.162.gfafddb0af9-goog


