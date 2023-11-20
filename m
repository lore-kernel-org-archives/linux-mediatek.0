Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40627C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 21:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=; b=WaPnNEz5S6c7RJzsIOJp2n3llc
	sT3SfW53ijUVDajKyj1RCrFASpyrWd9dB59F0GpAc9Hb8UtmWwSc00B4EP2+v/45DQ8roGBEbjaAj
	I17Bj1DFqNiFyHmOpnJmBHDVgCeIuMukE8YnBZhDS0ArpjWvAXAZMrVmFiPW0hZ9TlgTm2gA5C3Xx
	KUkReKRuIR70Nq3WkEmDDjC8kp0LaZ+Ewo3Pg9y/QH8ia2XVCstEphibkUr7ZfQE01i9banwJkSQr
	HNXBE++4woRjXrWLHBFqb24tRd5W8rm7UXSvhRieCgebNm9DZBBTbv6E9jp1BJXUighOvM/pziQk5
	wDIKS/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5C6D-00EuFp-38;
	Mon, 20 Nov 2023 21:46:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5C6A-00EuEX-03;
	Mon, 20 Nov 2023 21:46:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so3793525f8f.0;
        Mon, 20 Nov 2023 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516788; x=1701121588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
        b=JXPTdGZNXNOovbq8GuLYjq3nHYVIOyluA3WfwHPrCGOpwACBtkoNAY+SpPhVgRgLjD
         eidXvdZathYackb/IcFLaQX5+Q4Xgq4rljqmXUCzhMqh/5eXNxnY26SkdVnfYZLHh6P0
         LYvSDJNtEPz3JJOzr6+bkrVEA3ETF3C+BPyDPQjHGDDpFT+3b7LZNFdeQTYlaSMLtk0N
         sW2WW8mXoMgK0506rn/FOomY12fT8e2Jpn49V6PRfdPdhPq+zIlzShQNGDERJcyBGQEr
         fo4Gt5gWyfGonK9nID36hgzk4xyDa7CT5AKilZsIHvW5AXkVdBzGuuK3Qw3jLxAoDpbU
         XGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516788; x=1701121588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
        b=ZVS2oAG7QdKthp+zYslUVUkzrOjQL509n16OIxl4NtyR7mRzboOzBSlj5HIQwuzBaH
         mT+lIJf58sm3DgjDKjTYFuLtAU0SAWTo0LjU+X8aTNPsVzTafQQKXnQ2qXrDqc16a75s
         Pvngwh3RdQNVJ0uxY0Y1uwh5W0wSGc9Vfrh4bWA39GozzOp3Zp1XHq6nnL6pnq8OZqAF
         rITkbgYYeXDp0TfPpBf3BGMIbEudA242iwB5Vz6MBuz08kIRrC010Zhg2cD0HqxoLRRn
         x7Ck5EiGz8srz/thyahdmqZGDuSA4Fb6p1Z42G3UUbKrhwIVZs1mJeVcEnceNSiQXK2K
         lkZQ==
X-Gm-Message-State: AOJu0YxVgN43vQr9KLoCnuUwXwpjIbncH2zK6WaB5T7vYwE8DPAT0I2l
	/P63uuugU6C8bVWTv2JUyNk=
X-Google-Smtp-Source: AGHT+IHp3LoF2DOrCwbBP5ZAP28MyKKAznq0CT/uy4NViD6EoST7Z+71CXBfeYQKBX9yVV00pAiniQ==
X-Received: by 2002:adf:e9cb:0:b0:32d:9d3a:d8c0 with SMTP id l11-20020adfe9cb000000b0032d9d3ad8c0mr5215561wrn.60.1700516787764;
        Mon, 20 Nov 2023 13:46:27 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:27 -0800 (PST)
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
Subject: [PATCH v4 00/20] remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:03 +0100
Message-ID: <20231120214624.9378-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_134630_079839_079F3BE2 
X-CRM114-Status: GOOD (  10.00  )
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
v4:
- more ack and review tags

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

