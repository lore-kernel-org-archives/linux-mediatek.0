Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B336CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IDyabU/ctSGF4K3dTAmchO6EjvdapGJuzpqjXfhEki0=; b=13j6hThhv7UMGhYVCiMPNCTPR+
	KpWdaibvo0/rCN2Gw8NHzfXxJxiUJCKy4eUJEkRfZK4+NTThoiyISBeUytK/4RjLKHdD+Uw5Uuja6
	EkAGHOvmB2Luf2tc2wVZoEinbwNMyxu460LwQVFu9qujEX2DrNjX80zsyjxcSNnP7HooXaJIt2TaX
	A5rNNKNhRlVY2pjc2Kk7GiELf9bufWgVuz3eRlpI1O5o0d/SXKbPko0moTqAdXT06+gBNIbWlN6pg
	vpbrRvGLa6XwE5/C3qsgbLA2RuwpQKLUvUofjIJ+Sd/rtnpTixJFkp96A7lmUqlPBS84DoQWL7+Rw
	ahUeqBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhoB-00DqIt-1i;
	Mon, 25 Sep 2023 09:23:15 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkho8-00DqHN-24
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 09:23:13 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso9439032e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695633790; x=1696238590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDyabU/ctSGF4K3dTAmchO6EjvdapGJuzpqjXfhEki0=;
        b=gu4lPvXvtJ/j9EvbaUjSD9JEseNH0Eniq9rQf7tRORD+E1y0J/nfnP9tZfxl3PZPGX
         Xd7oHSe2Lk/PlCRCtrSgDFJPrFCvU01Mr7/BT33hDxMRw8PahekF079UhVZR2qk4B3R9
         /3g6ZH2KefUdjY7URVNHIvKu6aNewOucvRaYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695633790; x=1696238590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDyabU/ctSGF4K3dTAmchO6EjvdapGJuzpqjXfhEki0=;
        b=fD1iEHjT78FamvS7P4YSTq9EL8N2TxTMGgiH/73m/BROsWqxWDUBeWZT+JXmKCYt+2
         yFiJsNaGqprln4JuYVUDfmCIxFPTYw2TQXCVEPi4/4dsNUlYnzqe7Xkkp9s7+oeDFTnI
         cS0qJxULpuzgbaAqPzSSJi6VZAgfYEiNHvXeA6NVhXbSpCtvCYWuj0Le2vWuSccHaAgW
         7v7iwQsr0/5+zC14GFcZWS/7O0TX21Z/dP47buJqJzpNWfQP8hATXVbsb7R+WHwAroH1
         XmVdnQm9E7yhxY+K/kz0Et9EdF3hDr+e6AAaKtz4FwKervhorhCA2vOHBqTDXEJ4qTvB
         0Blg==
X-Gm-Message-State: AOJu0Yy3tdIqOwko3CpOH7dA44PkNoAHMxQl23rdrM3uAbSP/bVON5Um
	6wqlw+x9bcKA7846ZMUXSSz42A==
X-Google-Smtp-Source: AGHT+IFdJhgh0QBpQXEzpkLS8WILLnuoY/8uaH456FPwyO42nXmJ7Ufixv3ar0REWsyD1mqtS+FBRg==
X-Received: by 2002:a05:6512:b0a:b0:4fb:9fa7:dcda with SMTP id w10-20020a0565120b0a00b004fb9fa7dcdamr6155313lfu.26.1695633789773;
        Mon, 25 Sep 2023 02:23:09 -0700 (PDT)
Received: from elfwind.c.googlers.com.com (49.240.189.35.bc.googleusercontent.com. [35.189.240.49])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c320500b003fc0505be19sm6494837wmp.37.2023.09.25.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 02:23:09 -0700 (PDT)
From: Hubert Mazur <hmazur@chromium.org>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Bibby Hsieh <bibby.hsieh@mediatek.com>,
	YT Shen <yt.shen@mediatek.com>,
	Daniel Kurtz <djkurtz@chromium.org>,
	Michal Krawczyk <mikrawczyk@google.com>,
	upstream@semihalf.com,
	Hubert Mazur <hmazur@chromium.org>
Subject: [PATCH] drm/mediatek: Check GEM buffer size
Date: Mon, 25 Sep 2023 09:22:49 +0000
Message-ID: <20230925092249.2228743-1-hmazur@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_022312_678010_E9D9FA2A 
X-CRM114-Status: UNSURE (   9.79  )
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

The buffer size is derived from parameters supplied by the userspace.
Having the size equal 0 causes allocation failure leading to kernel
panic.

Fix this by checking if size equals 0.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")

Signed-off-by: Hubert Mazur <hmazur@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..3b985b99d5c6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -62,6 +62,11 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret;
 
+	if (size == 0) {
+		DRM_ERROR("Invalid allocation size: %zu", size);
+		return ERR_PTR(-EINVAL);
+	}
+
 	mtk_gem = mtk_drm_gem_init(dev, size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
-- 
2.42.0.515.g380fc7ccd1-goog


