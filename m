Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E156AC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 17:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=; b=cbnVxkqV49AkbFPjSDGyFDgJsY
	sJQHoa9Qz5TiqrrPdeSXOdoQvfsTeqQ1oShbXj/D8/UBU4babxMWOMjOcJ02QFeDKa5NviP3f9etd
	iWGQFZ+i2Qe7+TZEWGW56M3yiU7HYB6mgiSOqbL6swHWVfmVs9OxlMgfQH0yaHMw70WIfuVz6t99J
	GPWq+0kE5S4Z+rUOuHElsgCRYVdlfKqFAPDIf7UkpQ0UjxcosIOZmxQ6SOoNtFJapnqEjrK4RqvUD
	73RyCeGkqOgiRNX9d72Wscz4Ghs3OjQ+w81IrVmgWEHzacUxYF9+lELV0CD11JCTHfMWHZNLI5lqJ
	4LDaGBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4PL8-008v0Q-37;
	Sat, 18 Nov 2023 17:42:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4PL2-008uuk-1u;
	Sat, 18 Nov 2023 17:42:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-408425c7c10so4783105e9.0;
        Sat, 18 Nov 2023 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329346; x=1700934146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
        b=DN5UmldqaMuG5Ee3rcNMtzxKZ3mpL7Lsl03CUThzlL83bETwixKWosR8Ez7GCCJy9j
         uAJqxOqXwvcqHBeOk+3Qllt9h/ypUlkff3tQ8co7d31FH0Hdb+jdLFyWOPs73SivkkCq
         6s8N1ww8CKqNZHC7PtI5aQiY6EH9Z+OEtr25wzZJOZrwv1jsxNd1ROQPietglTwXRcZd
         3uXHCzJ69bZif0BhoQecF3ccphbFE3OpRDqSpn1c8dNsVoEJEAOXAIbYUQA/D5vb7DNI
         gpDGFw2CwVTilBAiON68UnHfWsnJKhN9PzK38lLttnxEk3GkdjaLHbAGS1ZV7gYYeFQI
         Y1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329346; x=1700934146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
        b=xM73FkR7p4Wnpm25c8ZNvAcLzU9LTGhdXeCtQylkXVDagNykkHPhhzfpKjBuWurGPp
         kRMjhvnXwZPQXo5kwH4v6fOUZkJ3ZmU9ecAt0aAu7GJm9QtKJrHPrY5bcQ4KXyPwV5jJ
         35ic5afiMdgoMNrB/OWFCUmcdJZK2wQ6QeYhjgpxy3bnI1CU400RWcte2HVejxewMWrz
         VCSp+8UtvfexIA63z9CbfA6Vi7wHXcD0STY+jcmlESoezQxM/KDWGtcDVh0CnAphVmnD
         QIvN+KW5rOXfLxWOmX5vV2OeLcbsPSftFR+F8GSGg08tQlbDsVVuITZyGEURsM2I+2bK
         l2pQ==
X-Gm-Message-State: AOJu0Yx5LPJebLwpQrvw82+FUzCz/XiejVhVvcDbxglefftMbNJsR4wV
	wjNnd5Rg/yrG2HLLY+IfBEQ=
X-Google-Smtp-Source: AGHT+IGJBMJGBtOSgxjPC+wTqBOjKUX0OkeFIG96ALnW2TXBuODjpDTjYiE8IirfVuZmHsPbu37kWw==
X-Received: by 2002:a05:600c:46cd:b0:407:7ea1:e9a4 with SMTP id q13-20020a05600c46cd00b004077ea1e9a4mr2170232wmo.5.1700329345971;
        Sat, 18 Nov 2023 09:42:25 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:25 -0800 (PST)
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
Date: Sat, 18 Nov 2023 18:42:00 +0100
Message-ID: <20231118174221.851-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_094236_628726_BDB0D01B 
X-CRM114-Status: UNSURE (   8.81  )
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

