Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48A3C5B55F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zsSf4ZkDNs2IGAtcWQSvygdvnaeiSuxsGnh/E5aZTQ=; b=jUGtZNK/++vsEdoNonADyi0P8u
	wKHhVOsQIQp2xyrBGtQX+C5slJntJ4hKq30k0Sjp9E3Gsk9TPy2iQS7CsgSDyDXVizkVy3ovfYdoJ
	ReK+F+Tg1pWwG/vDQwn9ekHCFi23P6zs4yx8XsWm1kPgTmHXeYH6oYSHAaxLbyhqyvfcjU5+5avN1
	9Xjj+l0tn4tSlBVadmNzYdkjNQ819PqelLgSQc4XAESwNDpe3EjSpv6iWhEGyoUrONYH+Ns0As76/
	eIO+TJnj1+4Wa2vAATu8TJoj5nBh2/EhSLk8+WG8Y4wnq4eNJ6T60uuN271jOo+S7+NhGArbHMTkx
	B/l2McAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4fyd-00A3zo-27;
	Sun, 19 Nov 2023 11:28:35 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4fyZ-00A3w1-1g;
	Sun, 19 Nov 2023 11:28:33 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso477844366b.1;
        Sun, 19 Nov 2023 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393309; x=1700998109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zsSf4ZkDNs2IGAtcWQSvygdvnaeiSuxsGnh/E5aZTQ=;
        b=EmvWjeS8b3O8TliJz0m7wVEkCrSQVKu9pJfsg/EWFEGaaf3yrnKyuOVgEvdawM2Bqf
         3OwsHDaPQW4abZCCplXs1K5LfSH7tP5uO9ITmE/giGkPmPaanLhjPA8Ym6mx4m+E56KT
         Um56ZHRocM4LnG1vK/zD0YIcxwpaXBdEXrjBKcBgzIIrbyIsJta99mYNU4JUTldIIPVd
         AvvzI7k1PSAP7e1qQxAIli0haF4Qu3OTBbsVGO2K29BTk0f16QRO9C/ircBBVh2SnSUj
         8UhrYT15jpGdQwUmLkY+B1/Ut0holo0IyjNR+Knj+BchnFb3YxizXYg6fHOLHc5sRBRV
         R50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393309; x=1700998109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zsSf4ZkDNs2IGAtcWQSvygdvnaeiSuxsGnh/E5aZTQ=;
        b=RPk04a+BIve1Uio4E1Ajo0PWab5uj3u+T3juDOX8XamMFpecVseY7j0hvVUqx/Ign+
         6zGPzNaGUYqcRPbnq7eoqbJWsGRAwaspj/ZE/wG6tlkNwCQCaX1RKtLJlb72UCkyGVcP
         BopD8/pcZAGKye4kwhDqdgdY0tO2SuNKUBC37hmNum23beb4H2sYWC9LgJVFOCUZ39WW
         n03y241oXw17I/u1R8qkrLY9p6ZC3uxANISjL9T+qAWjmIVRRWtbB/4u5kyDm5g2Crb+
         N9jpALeZ3tlirlVlfur6nbbSZqieugzInesjRj5NN479hdkNXK+UTBISRGEceQNKIndK
         OwCQ==
X-Gm-Message-State: AOJu0YzKgVAVXRc3YrFbu00sFYunrcNbQ6tT6Vpq/SM03RCh9jioaJF5
	CM0EaECMCPj38uQqw9NSf3g=
X-Google-Smtp-Source: AGHT+IE5uGBUmol5ov0XxZ5Dqkm6UF3fXf9Nab5r2AlC03wH+Qnp4IS3AGLhaN/CFXgIHkYcW7HMmw==
X-Received: by 2002:a17:906:2b56:b0:9d3:8d1e:cf0 with SMTP id b22-20020a1709062b5600b009d38d1e0cf0mr2841220ejg.54.1700393309393;
        Sun, 19 Nov 2023 03:28:29 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:29 -0800 (PST)
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
Subject: [PATCH v3 RESEND 00/20] remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:05 +0100
Message-ID: <20231119112826.5115-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_032831_597684_D224F304 
X-CRM114-Status: GOOD (  10.12  )
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

v2:
- change tag in commit subject of patch 03
- add ack tags
v3:
- fix a compile error in patch 5

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

