Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD15C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=; b=sj9hDNM27Zm7Kb70+ygca1mUES
	O5B1kNCqnMO07jZaxi4qyBbtqebLlrZXdBXYHbrRLaoA91S1sHBN6MM2d2Z29PyoWX0OX8gpkqpCQ
	DIdVJO1YNkR2mvTOLpdiJBw4RLjCqDN+7p8X8HdEMgPT2fD1peqAkfO6ApneHyBTdt0DUQcO+ACPY
	VoNfXwswvBLDHiewsH7NZZSLB0YTwCUqs5U6wDLT4W/Fbi3a/bgI6zYo2oig/e3oYa6yvpgjEMekM
	f2jkl3XGXErb7Bg61mKXTYSm4/nyVKVrZ58RPctZaIfXEJJqWFUFsNVxnv2U4dx/e6JfyCtOE9v1D
	EHUrsdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66CY-004HTx-2P;
	Thu, 23 Nov 2023 09:40:50 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66CV-004HS9-0g;
	Thu, 23 Nov 2023 09:40:48 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a00b01955acso88921066b.1;
        Thu, 23 Nov 2023 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732445; x=1701337245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=;
        b=UOkNBGia1uVuetKm6QX5fYcHDrPAJ+Wii5++0JJc+x9pCkYQEP3Iq9BsOUeR9A0nN2
         RMudfrmq/SHZBXwtN9AHoNkzSCHyHjF7ZWFqa37aiZKBRlV+1fgTt4wYz+gHPBThyBlt
         UYMVJx3zPD6IUHCGjlx1kFkCVsybzeY9O9/hZ9HfQTh+Sro7TG1iDJ58vbqA7OF+Ja0V
         NnID1qhGQIevs3vOqa4cHq2X8xDydDC18188uncJ/FRUgLnClZ5VQC5RlAa9xzCH7Cqc
         4WFqzZrunw4/5LDWALi3DK/MBAYLQ0ZJTymiiautwqBGYYnQabFRYWchbXH0XmK9tAEA
         Um8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732445; x=1701337245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=;
        b=lezuiPU9CoWuwPTJq13y29HsU+wmn9EHiJ5XCwxXoX1Dsk46zW1H+gxc+IIiGSyBza
         7kDJwmt7D80OpLUq4aeORdL02Zpn0C9iQ6acCk22nLQIUModPkf012Tk62f9FEi+Ecrt
         FY7SSMcD+EfZyijN9+4D9Fvheva8l3gTobj2ErhDUZERrGHKMj2V32EAscgTO9k2zGef
         MozOQzG4PDvnTiqyhP0OXIpmpisFup6yiEAyCoyy1jYgcXAGYg1DKHfsLDrbdpdWvni9
         GuaKDPjN+8kKlhTG5PHvZeY/of3ttn4tS3jHvIxGIaw39nNKZgqgK/ig6FPUBdArL2s7
         b8PQ==
X-Gm-Message-State: AOJu0YzTYSvvQqCBmZB2XRpysdrBydoPz8Kt7Hb8TsQJLI51tH0MeisA
	Tmrc9wRuphVtqZv09ouKfyQ=
X-Google-Smtp-Source: AGHT+IH3UA4nrdAqScERrRmQjf0/m1eRztQQIu3xcCY1PXQ8GvVHymqtee93zJ05NL2jqGs5ig2nmA==
X-Received: by 2002:a17:906:290:b0:a01:b9bd:878 with SMTP id 16-20020a170906029000b00a01b9bd0878mr3573689ejf.14.1700732444513;
        Thu, 23 Nov 2023 01:40:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:44 -0800 (PST)
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
Subject: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:20 +0100
Message-ID: <20231123094040.592-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_014047_248983_6795FA5B 
X-CRM114-Status: UNSURE (   9.80  )
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

v2:
- change tag in commit subject of patch 03
- add ack tags
v3:
- fix a compile error in patch 5
v4:
- more ack and review tags
v5:
- more acks

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

