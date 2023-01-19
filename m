Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7B4C46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 23:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2RYDaQakvnKQMHYWcGZyFzWZGbJWcAlfnMO9tuHV3GY=; b=lIM47IDDt2khPO
	OBMBQUzjB+LxGPFl06WSIEP+yYwhUXS5yXgFS3iQXfvdSDY8+6MWO19T6KqwRmwDtylMJMJhHA0so
	lvZBEdaV+uKtSMRrfV2mEY/d84xmRqBcrcHOFK0/OblwiB0R2yFA867cT1CPiZHnbr6Fhc5ycs/UL
	8Rl9fCto/QobG+I9HWCx7oHUN8zoLA3yUoN67fQ+Ggy6FnYqq+Z9Y0RI4Z+t17rMdflqnSZ+5Abq+
	SOg74I+t0dIYGe8pQfmy5e69qQikAEZ7dpuJXtZ+C5FgDx2D3814vtgIWOHOHV8Y4HZCQfqe2g03d
	3R0CuILQgX3DrNIPITjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIe5u-007Z6o-R0; Thu, 19 Jan 2023 23:13:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIe5r-007Z3M-SY; Thu, 19 Jan 2023 23:13:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id z3so2723323pfb.2;
        Thu, 19 Jan 2023 15:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RYDaQakvnKQMHYWcGZyFzWZGbJWcAlfnMO9tuHV3GY=;
        b=epTqo8/GH4R2BQ1E41zW0K2lvL4E85jVpNh1kazLjYlZomZHpWFKvEFc4KP/4voUKd
         oDhHR+qTm44ZJMscqbp0SfNGv8dpLTjJrGf6zc9u+k8MfUxoYkzAysCdAXkEfhNF6cvx
         Yusdvp/Sk+TielCZ2tVy0bscV2eA4K9apqu6MUQS/L9VxcZM8E/baAL3equmOEof5AQ4
         saznbLELNR8lgHkg19njvaR0GnJTyBSF7VdEizP2eN9BDYX6R/hrdTgzNMstSSK+Lf4d
         V/yV6c4o9Bi6TZf5W4nbd+Ypxyd1T+J47XylPXDPYDy4kBBagHLd6Vc5ULBejQ4lDZQw
         rPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RYDaQakvnKQMHYWcGZyFzWZGbJWcAlfnMO9tuHV3GY=;
        b=frzhZsWhsEynP+smLNBw5S32j3lZB4Bj0IQNXbBp8l/SH2r3nJM/BvrbAyvVdpT5gT
         bp9C9atkuNOmRN4JaEHsQuI1san06SxqzGagCrCNUQN97AA/dfQ7XAsaqx/F58Pi9RH7
         UUIxY89TXplTY2kcJ8tSFllPhKBAxe/nrjXO18EYqp+YK138pXJxACYF+QAYzFq9p9/W
         /Z616ftNW8HH/oBC99LgYUO+uZJlBGrX7+tg/aA+gaDOXyklfYbw/Fu3GC0H9XkZZmuW
         lVeTvTAAUKbQ427Ni1lw0rAjKVq+z5/GMtjhsNeKVmdJ+yjDxOqq0tq5H/9iN6sPUssr
         Wqaw==
X-Gm-Message-State: AFqh2kq/ZjH5TZuz7kEHrWaePdbt1MUpqvDdLt9g+hklBsmljtb9cbA1
	w/GDBfEt9zSEP+JhHOXHk5U=
X-Google-Smtp-Source: AMrXdXtKgRFPXBVj7R54nnGbw4vB8/Vr/7TKyDxmjIzRogqEFN1wo2iKN7Ikw9yCjJDzqEPqZPq7ZA==
X-Received: by 2002:a05:6a00:1d23:b0:58d:a91d:e9f8 with SMTP id a35-20020a056a001d2300b0058da91de9f8mr11154285pfx.18.1674169970704;
        Thu, 19 Jan 2023 15:12:50 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id z189-20020a6233c6000000b0058de3516c3esm4241259pfz.142.2023.01.19.15.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:12:50 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Drop unbalanced obj unref
Date: Thu, 19 Jan 2023 15:12:55 -0800
Message-Id: <20230119231255.2883365-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_151315_948840_3C801AEC 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, CK Hu <ck.hu@mediatek.com>, "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rob Clark <robdclark@chromium.org>

In the error path, mtk_drm_gem_object_mmap() is dropping an obj
reference that it doesn't own.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9b3d15d3a983..f961c7c7456b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -169,8 +169,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 
 	ret = dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
 			     mtk_gem->dma_addr, obj->size, mtk_gem->dma_attrs);
-	if (ret)
-		drm_gem_vm_close(vma);
 
 	return ret;
 }
-- 
2.38.1


