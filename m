Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4A6C5AE5C
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=; b=Kf/tXrm/7k9VpjSAPRm/BUcf6X
	Cd11TyVsB+sTcURicXbaC6un9JChLVNW8OrXmoPPskNKtS07JCtVh6NNLO2cs/OQMN4jkxTQZUBcy
	Z8YEBMu7yTr+Ij4rK182YeP1cavJmZInbTXwJ00+VAzk6WegUlNKKxod6RKlOMIjzluLVy3mxVgu9
	itZAE/T45FPvkqHMeeNPGdRpEPs/pC6kfrwERcjAxgGKk+58NDJXHbzv8Z/8UiCOoy1mXYZeccXMp
	TdtsnWLQ/8ThblOWlhvEADV2SD5RqyLVQ1si+he+4xgxKr3uCm7y9f71nU+75ujuBDykp7i3NsWQv
	9pS7eutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4epY-009pOj-0g;
	Sun, 19 Nov 2023 10:15:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4epK-009pHZ-2p;
	Sun, 19 Nov 2023 10:14:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso4834878a12.2;
        Sun, 19 Nov 2023 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388890; x=1700993690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
        b=Cp6wOKaGOtnQfFGpnYWh1boo5USASX2P8WgpMHcqiw0qrunOR/fOTMozCvXvtYQTPr
         wUHn+21kt0zIgG3r7tIHFlABH/06TqjzCjkXZdC7NXJJ27AwFHIUNjivGpst1isgFC0p
         wFbSSYC8A7/bJUKMn+R9ue3DvSUPYhONOjVUKHBG/JALGvL9gcsTJgs0MTEPBAv06fAm
         SNW3JVqqgvX7sr3pMss8ILcVk2vFcgJbqkdA/zElM7pF9De4zhMhw30B1rbKGQ9OngCd
         XegsSNFQC7KAu3b/y5K/FWMq3HyFYeGs6zoJ0i1eKmdsv5Dlpas/wwOigK8/g31qglFn
         yY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388890; x=1700993690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
        b=qjMhJyaAEij0K2sYC/QvfVS0fYq51Rm1gRVOmhu3QCK7HnrBhDPdllqg5gYta+iiye
         txAeErjzHpbQD6U8CZIvIjBWtjhsU5e2tZ3iebp1XQgXj7ElqqfYTKdAgUskCYm4my9D
         h3zKnprSKdALEGiMSl2V6r+fwXW1ilYkdnjAAeQ6VBDgYzHhZwrc0DfX+NXrO9ljjYvn
         DnUUbj4rupZZ7MbahUzYxvopPhzryPhSAOJTAnm+ZGSBI75HBZbueC/8EOPB1v0B3h41
         B4gFoicJRu4ewMR04ubf5TaOFbIu4LCgmXwXKMFvTwuMOfUZzLOe5u2Myt5B8vKPThN3
         m6hA==
X-Gm-Message-State: AOJu0YwDEJvMNuOVEs4iZXeED9uaG2iIK/loBRjmwXID67Jf6NMQwE8K
	yQlP06eXnhCQl6Kh6SQ8Go8=
X-Google-Smtp-Source: AGHT+IHOF+5hNhpCmZw786pHF3YEeb1uoXP2y9dXXmqI2pn0mNpGlk9gn3AwL3Ck7UOdLXgeibJ+dg==
X-Received: by 2002:a17:906:ae51:b0:9bf:63b2:b6e2 with SMTP id lf17-20020a170906ae5100b009bf63b2b6e2mr3041311ejb.26.1700388889532;
        Sun, 19 Nov 2023 02:14:49 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:49 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: [PATCH 00/20] remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:25 +0100
Message-ID: <20231119101445.4737-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_021454_975875_3EB710D7 
X-CRM114-Status: UNSURE (   9.05  )
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

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
 drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
 drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
 drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
 drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
 drivers/video/fbdev/core/fb_ddc.c                 |    1 -
 drivers/video/fbdev/cyber2000fb.c                 |    1 -
 drivers/video/fbdev/i740fb.c                      |    1 -
 drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
 drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
 drivers/video/fbdev/s3fb.c                        |    1 -
 drivers/video/fbdev/tdfxfb.c                      |    1 -
 drivers/video/fbdev/tridentfb.c                   |    1 -
 drivers/video/fbdev/via/via_i2c.c                 |    1 -
 include/linux/i2c.h                               |    1 -
 31 files changed, 9 insertions(+), 47 deletions(-)

