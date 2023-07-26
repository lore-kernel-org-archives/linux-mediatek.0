Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3779EC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKHidkh8ZdWvxzD0mo3s1bjGGnjJRCgOsDmvC2VyjkA=; b=aUz/zl/ZOHbEC5
	gI4VzhLB3JdGte/zqpndZ2GFiqktHdc5fdjdddKn4u0ltXDqNWr0Z9p3j6adIEPMXvfKbzSsy6Zrn
	BtunoGXzfMZYA6Lk0fp3DncORZEMY8otL5OwKk6EnL84zwBUQOinJ3OMSpFl23+lSTclatPwcUnWr
	M2dpfQFhgBCssP6wyN0qQOrbs84CYbQPBc2ZEfNBObg9R3lkDNsidfvG4HdIxmjK15G4P4QBg693F
	VFYnJwsGFyPtjPraAsUZ95NbY7T/9pHB8SF4Pd7BI22QCiV6/fciwpZq0Z0V/8KzCuuikJgGTuRaA
	Ak4FgYCBaT5aBlISw/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOkZj-00BQUf-0L;
	Wed, 26 Jul 2023 19:53:35 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOkZf-00BQTy-36
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 19:53:33 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7659c6cae2cso14725885a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 12:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690401209; x=1691006009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKHidkh8ZdWvxzD0mo3s1bjGGnjJRCgOsDmvC2VyjkA=;
        b=HKNcliHHaStZU7lXLGoUoI0NXRX5/kXgIfzxpyS8dJzfhn3Kczh5+aW9zG5dQQCqYU
         FkgueEj+2sSFQRTUFIIhitqa++n8ITJsFarRpSzaFqxKq6SdPP9dbnqVPjsw52HRitjh
         pfoj6z8VGNoRphf6x9zQ0ulQGI4vzndRT0j/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690401209; x=1691006009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKHidkh8ZdWvxzD0mo3s1bjGGnjJRCgOsDmvC2VyjkA=;
        b=KspdWEom8o0oX7XrHvPhH1bdHUHTIMWK8Ea3AlDSG79V872mZQqog0Bi6vTBniUuIu
         ZmPshNmLlbyRtqy/MS6SLiaJ/zyBlz/OTFtJWHlrg5VueFCfUFKr+7ahOz9Qnp40Fii4
         Ov5XRfu4OQtLjBZwObmMlsnxe8bCRcIvY0XwWpYpClVBUnKCQP1BdFJqcqYGoKAls12x
         fr0MgVH8B2r2CMti3cCmrXT3JLt/LLfUsoivBkm+WWnrCRZt95jhY+Pfu0LTOFL1I9oc
         2wzXa7orvP1VHweiTnoXJPDROfOF6Dy+pbqi/qNhQkQ/ejOhE1s2XPJVdERaMq/qHqeG
         0MJA==
X-Gm-Message-State: ABy/qLaThwBCOhSSzhRuDku6ctPpQj5kvR+tatKkkk0olNS9cqo/0YNg
	UyiqTCuhn2Jnvq6usrc/gvx8v6ketQz4PgqFFwE=
X-Google-Smtp-Source: APBJJlGoGy6HUnXCkuS5WXnhtOwWyhLYYQssZObAOiKcA3WK5jHtODnzGfK2alDLktwPF4vcQmrmRQ==
X-Received: by 2002:a05:620a:45a5:b0:766:68cd:d9dc with SMTP id bp37-20020a05620a45a500b0076668cdd9dcmr3069449qkb.19.1690401209375;
        Wed, 26 Jul 2023 12:53:29 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:f6f2:a0c:f40e:3570])
        by smtp.gmail.com with ESMTPSA id o9-20020ae9f509000000b00767db6f47bbsm4570689qkg.73.2023.07.26.12.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 12:53:28 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/mediatek: Add valid modifier check
Date: Wed, 26 Jul 2023 15:52:32 -0400
Message-ID: <20230726195232.1369289-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_125332_053384_5FB16E3D 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, daniel@fooishbar.org, wenst@chromium.org, angelogioacchino.delregno@collabora.com
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
Tested-by: Fei Shao <fshao@chromium.org>
---
v2:
 * Replace zero check with comparison to DRM_FORMAT_MOD_LINEAR.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..2719a1e3163a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
 	if (info->num_planes != 1)
 		return ERR_PTR(-EINVAL);
 
+	if (cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR &&
+	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
+					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+					AFBC_FORMAT_MOD_SPLIT |
+					AFBC_FORMAT_MOD_SPARSE))
+		return ERR_PTR(-EINVAL);
+
 	return drm_gem_fb_create(dev, file, cmd);
 }
 
-- 
2.41.0.487.g6d72f3e995-goog


