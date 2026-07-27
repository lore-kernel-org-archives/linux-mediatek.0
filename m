Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3ADC53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wN/kx/SBk8bE5KK0ql4+gLcojF8uiq2QeEJ40jwABjk=; b=k+AU2NTr5aecJUY8k5yFduQt6V
	KLn4abrV1G2i+tsw6fVfAeRGDLx+3JLE/e+Cltbi7O/Cl1kgGXWh3XDIpl6/bUJk6s0LVJTKoB9Af
	LrFbUOrlY0bcWpOgUU6RqQXvSbbRwgS0RIFJiCnMZxViBndxGP04rAy/fMDzd9haZFPfGBMB1BVBV
	6oHtxQkaDykSVi2d3Vz0+QVI9tyje7nO02nusfT8beCASaKFENMmOjVuC6+wOimpwJsnctvJH5/d3
	GqvS0kLxeJtGe9DI61RgHHyeZNgJ1D8qt2xX7p/86SzOupYkdndCSXygDM6G3XiJBXnUNY9I/hoh9
	Cklxh3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRm-00000002IoP-0jzn;
	Mon, 27 Jul 2026 09:16:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRj-00000002InR-0bZT
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1667455a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143786; x=1785748586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wN/kx/SBk8bE5KK0ql4+gLcojF8uiq2QeEJ40jwABjk=;
        b=Xau2sxNcavRGGbpLrb1wvWvLRdZK/Q64M7zxVD2Vam9BLmvm0oTjny9C3j2mxeooyQ
         eBvz1WdhZlmDjAulk9nv0xZfKHrX1pSrF5UkxEmRFa04Joqob+MmXrMucZZGZQ3+ZFP8
         hS97oTB9zyJ/p5osZDc/5wt/Soaxc8w0NboMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143786; x=1785748586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wN/kx/SBk8bE5KK0ql4+gLcojF8uiq2QeEJ40jwABjk=;
        b=oSCMuJ+rEWq0xf2u73FZgi/jJ1qFRuCH8EEWS5njB6TsYrPM66KZWTrGLwo7GnlEj/
         wwRUVhpyWHOv6oDdXjM82zNPr1PqgQpYxPa1N3cndlAC7HnZQhLDwuJsCCKsWD+jxUBm
         yZwrHFTLprpcYBshIcjkYjLKAEIfBLaj9xaGu7gWzFee6Q0OqJqqgf+alPnFkeHEEJ1H
         xyzpOxThInX8bG0o9fwL8zDys44PbDlWxWn/1fFM+91y9wDVV3oxAde+hUPH/JE+PnDV
         roCEc+NOjzJM60ivfTojuyLxEgjwAo2jGtgV2D2yotAUTEbIT6Y0eFymYRbY9IUO2kAm
         o5sw==
X-Forwarded-Encrypted: i=1; AHgh+RpqKhg9vgU6cjNRtO5aKx549meVto3UnQJCBdkm32roSbxZm7+eT8QFFGKFDcY4R9gTW1tKPUsl7/0eXQxKGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzubdIEuOmBGYITeutrd4ZZ0AriMM4yxyAdtTqtSiDDU4+jYxt
	OibpunJyCvDMh/QzSymO88r14MHWsw7k7g2wYa3eXeJu8CLG1Vv6SsM84qTZ89m8cA==
X-Gm-Gg: AR+sD135DVR1hNcWJjyDimJdk6rnLRh8nRguG5vGpSvh6TTik4iHNNSE1qopBdLEKbY
	XXuZhc1gTq+WFmPtj0XY2kvb9wtpUrvEr6mwNy4NB5YbzzwaYOCYtN5M+DIJoBMV6FfSIZkOfzt
	vHMFoJO36sbijusDwop+Efy2jfm2SIK9QNkScMKUIFgvXMYVjjU/zzePKtaf/QqYi4od4dlAuNn
	q1Jukz7pt/DcH/77016mjl/In4JY9tWxUMOqj6RDFd0n3Y0G/NjhIHpT0dd/9IMF2Ygu9BohLCC
	Yp3vJwewFML2RfNBPAlAmiIJpLl8O8WMYhnM1YonoyFCYvbDPjBNGZbYFQ2Shzx+E8fse96P1M0
	bDKmsNWXPn/mq+ue7Z2BXXRDgbzuKSI8QN0FguGBcdjtbfxeoB7H3UNiDCEu7XH3C04gYD+Mo3i
	Fs3si9Vy10I9VAUEa83NNPmo+F97aYqtbcXtyitSc7gsARpswpm7YPHW1McA==
X-Received: by 2002:a05:6a20:6a09:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3c67d9b3da3mr7135247637.13.1785143785620;
        Mon, 27 Jul 2026 02:16:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v3 0/5] powervr: MT8173 GPU support
Date: Mon, 27 Jul 2026 17:15:49 +0800
Message-ID: <20260727091555.1023910-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021627_185028_270A0BD9 
X-CRM114-Status: GOOD (  22.60  )
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

Hi everyone,

This is v3 of my MT8173 PowerVR GPU support series.

I got another inquiry on the status of this patch series, so I thought
I'd dig it out, fix all the issues and send another version.

This time around Mesa was ready for basic testing, using both vulkanmark
and glmark2-es2-drm (with Zink). Details below.

Changes since v2 (all in the clk driver patch):
- Made COMMON_CLK_MT8173_MFGTOP depend on PM
  - Needed since the driver implements PM domains using the generic PM
    domain library, which also depends on PM
  - Fixes build breakage (kernel test robot)
- Fixed "RST_DELAY_CNT" name (Brian)
- Dropped unused mfg_desc (Brian)
- Added check of clk_prepare_enable()'s return value in
  clk_mt8173_mfgtop_power_on() (Brian)
- Saved error value for return in IS_ERR(data->clk_26m) branch
  (Dan Carpenter / kernel test robot w/ smatch)

Changes since v1:
- Adapted to changed DT bindings
- Dropped driver change
- Use same power domain for "a" and "b" GPU power domains


This series enables the PowerVR GPU found in the MT8173 SoC, found in
some Chromebooks.

This version is different from the initial powervr driver submission [1]
in that it splits out the GPU glue layer support out of the powervr
driver and into a separate clock and power domain driver. The glue code
is otherwise the same, and also the same as found in the ChromeOS
kernels, with some extra comments and macro names added where possible.

Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
contains clock and power controls for the GPU.

Patch 2 adds a driver for the glue layer, implemented as a clock driver
that also provides power domains.

Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
binding.

Patch 4 corrects the clock for the GPU (called MFG) power domain.

Patch 5 adds device nodes for the GPU and glue layer to the MT8173 dtsi
file.

The kernel driver successfully probes the hardware and loads the
"rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2].
The "exp_hw_support" module parameter needs to be set for the driver to
probe successfully.

This was tested with Mesa 26.1.5 from Debian Forky. With this version
vkmark and glmark2-es2 (over Zink) both run fine. Mesa spits out a bunch
of warnings since the GX6250 core is not officially supported.

    # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 vkmark
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73: FINISHME: Missing reset support for brn51764
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76: FINISHME: Missing reset support for brn58839
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523: FINISHME: Missing support for brn62269
    MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    =======================================================
	vkmark 2025.01
    =======================================================
	Vendor ID:      0x1010
	Device ID:      0x6250
	Device Name:    PowerVR Rogue GX6250
	Driver Version: 109056005
	Device UUID:    d04cd6f3a25fd4900f89c151bccfdfcf
    =======================================================
    [vertex] device-local=true: FPS: 251 FrameTime: 3.984 ms
    [vertex] device-local=false: FPS: 220 FrameTime: 4.545 ms
    [texture] anisotropy=0:^C FPS: 223 FrameTime: 4.484 ms
    =======================================================
				       vkmark Score: 231
    =======================================================

    # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 glmark2-es2-drm
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73: FINISHME: Missing reset support for brn51764
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76: FINISHME: Missing reset support for brn58839
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523: FINISHME: Missing support for brn62269
    MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
    Warning: DRM_CAP_ASYNC_PAGE_FLIP not supported, falling back to 'mailbox' mode for SwapInterval(0).
    =======================================================
	glmark2 2023.01
    =======================================================
	OpenGL Information
	GL_VENDOR:      Mesa
	GL_RENDERER:    zink Vulkan 1.2(PowerVR Rogue GX6250 (IMAGINATION_OPEN_SOURCE_MESA))
	GL_VERSION:     OpenGL ES 2.0 Mesa 26.1.5-1
	Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
	Surface Size:   1366x768 fullscreen
    =======================================================
    [build] use-vbo=false: FPS: 49 FrameTime: 20.473 ms
    [build] use-vbo=true: FPS: 45 FrameTime: 22.660 ms
    [texture] texture-filter=nearest: FPS: 45 FrameTime: 22.642 ms
    [texture] texture-filter=linear:^C FPS: 50 FrameTime: 20.172 ms
    =======================================================
				      glmark2 Score: 46
    =======================================================


Please have a look.

Thanks
ChenYu

[1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@imgtec.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr

Chen-Yu Tsai (5):
  dt-bindings: clock: mediatek: Add mt8173 mfgtop
  clk: mediatek: Add mt8173-mfgtop driver
  dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
  arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
  arm64: dts: mediatek: mt8173: Add GPU device nodes

 .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
 .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
 drivers/clk/mediatek/Kconfig                  |  10 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 241 ++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 7 files changed, 362 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

-- 
2.55.0.229.g6434b31f56-goog


