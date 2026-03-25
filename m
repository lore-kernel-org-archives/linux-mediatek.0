Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD12FEA830
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=; b=X3DY9kNGkZPdWPiOPuEaH9EX8B
	VCvszaYLdX9OKW1yHYAs7kqA14wlRYw9FpOSQQdd4AD5IRArI9nFbdkxDnPd99LCwxmCFQRLEtCle
	oSXBHZ8ywKrqdnizY4jWX59NuJoPQXKS2LRLx+27NW4U7aWTUkvT20pMd45cMKCGJuALfGKX8OkLV
	XwM+F1HbHFq3pGRnrmisvNlWv7IIlXiyN5HKgSphul07o5BJ4fjE/8nYmJCqX4OuggzWLr7xgs2EB
	z7M3xv5iH0epk66lcF15dZhae1vm+Hik/iYTqHzFPM6MvuWWYFo8z2uX3+5PKMM/UACdLFGbM3D9a
	JZjgeY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8F-00000002syr-3Lmv;
	Wed, 25 Mar 2026 07:58:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8C-00000002sxc-34pP
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aaed195901so26385415ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425504; x=1775030304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=;
        b=OYKaTvpTbJbN8WOEzmTQ6ibvPMMJ2tg1Kh9FCfHsEh2Mp3CSn4f+rDX5gAPQkT+Sa5
         40AnKKdyZ5Vkl3eThg40mAs0am29mNZzdmHC225K0HeLTHAVyDSSkE8HlvP+5f++4flj
         +1mww75hA4OqshWXRIyGZ5qytFG5waBRTUbmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425504; x=1775030304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=;
        b=gdQjxxUVsFxw5nfuW272ym4ZFb7mDDxGj5EVZpByyNIzm8mSE74EF2u9VFQKK35X7k
         5Bm+u5kKtO1T6vioZYxtdtGQlJLElQ+zY6dlTF1mZ0T8fYH1pcAtyeH28OpIEA8sNCqR
         ol5FiHnxaWS/FbW34wRYd7V725dOTSUFwc3vIhH4aY64Zva7JF9qRZlS4UjuYhutJlaj
         W1hb97yly7pclCp5VVcbTWC8jpeQdhhOhgdmyiWcg+Q6uMm6iR4eHjKFrWxatNF6Mw7M
         HPdS9KBOGjHWEVVa6Wzx5VzzKr1o/3Kb/Xj+6WukVpmWLZNqFFpSPY45ItummAhN9sJA
         kN4w==
X-Forwarded-Encrypted: i=1; AJvYcCVQyNsZIovAi3969fqG9sgzYKPd9ybQXN97ON/EmLYVGq0IPrUHKpix1wukXy10sZlW7n3F7fJ0w7UdULVATw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypBD/aFPCkhOw6b49/HmarLqK6+DxHQbvMLz7YXsi3kph2KS4y
	c3+J6gQUvc+yMDYpBTwhQnLYL8uXVKASc1ookYuN1ImMFo3dMp25LqU9/Q0X4GDWdA==
X-Gm-Gg: ATEYQzxNBfkrUmtMsJikrEG/AX3Gfmh1KDuIYEk8dshBXYf7RaZjX7BmK/wtGGomN2o
	VgzSjc/YN8MFEvoV1vjkMMJAX5EgyvhwlX6R4xLoeL5fTDX2pnhWcogCWmVycZY8kFLy9tx30pA
	P1L9Y06tzT/JBhz6MV59YXwlsKNiR+GG+BKWs1q3Y3f2xvgJlF44qNTYv7gWhFJ27Rxbp+Gm8Q/
	RJUjfvsBMo7cZEwpXbPkxtz9H6Mww5G3M8ZXnE/KZKlN+6+fN9c50Xr9aiU7G6f9nhafviZDXIL
	m5NZVeaVt37x7capzLzZKczt1rJpkMoKnZu4Nyetwv7/J+Utn9k8yOLQyxwgvx0iFioVAq/eLIY
	rcWE69Ua2TVPP9nMV5jkwNc4fJmD2VGwDStvK72IYoQQrDWVbZjBvhRISyjHFIGSm2YKjv4CNBT
	7I9I3UlG2BVth5WKFcZEI86lky5OhP1NxqKuY2ThBP2FXI5mfTnu/mSwV/GwePEcRKSdd1VBiBg
	Bh1H5k=
X-Received: by 2002:a17:903:37c3:b0:2b0:5aab:c40a with SMTP id d9443c01a7336-2b0b0af4c01mr28590075ad.31.1774425503648;
        Wed, 25 Mar 2026 00:58:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] powervr: MT8173 GPU support
Date: Wed, 25 Mar 2026 15:19:44 +0800
Message-ID: <20260325071951.544031-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005824_833902_567016E6 
X-CRM114-Status: GOOD (  20.54  )
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

This is v2 of my MT8173 PowerVR GPU support series.

Changes since v1:
- Adapted to changed DT bindings
- Dropped driver change
- Use same power domain for "a" and "b" GPU power domains

This update was requested by Icenowy.


This series enables the PowerVR GPU found in the MT8173 SoC, found in
some Chromebooks.

This version is different from the initial powervr driver submission [1]
in that it splits out the GPU glue layer support out of the powervr
driver and into a separate clock and power domain driver. The glue code
is otherwise the same, and also the same as found in the ChromeOS
kernels, with some extra comments and macro names added where possible.

Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
contains clock and power controls for the GPU.

Patch 2 adds a driver for the glue layer.

Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
binding.

Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.

Patch 5 corrects the clock for the GPU (called MFG) power domain.

Patch 6 adds device nodes for the GPU and glue layer to the MT8173 dtsi
file.

Patch 2 and 6 depend on patch 1 to build. I suppose some common
immutable tree would be needed from the MediaTek maintainers.

The kernel driver successfully probes the hardware and loads the
"rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2].
Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
the powervr vulkan driver enabled. `vulkaninfo` gives some information
about the GPU (attached at the end), but running the `triangle` example
from the Sascha Willems demos [3] with -DUSE_D2D_WSI=ON as recommended [4]
failed with:

    Can't find a display and a display mode!

Same program worked correctly on a BeaglePlay and displayed a color
gradient triangle. Not sure what went wrong here.

Anyway, please have a look and test.


Thanks
ChenYu

[1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@imgtec.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[3] https://github.com/SaschaWillems/Vulkan
[4] https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com/

Chen-Yu Tsai (5):
  dt-bindings: clock: mediatek: Add mt8173 mfgtop
  clk: mediatek: Add mt8173-mfgtop driver
  dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
  arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
  arm64: dts: mediatek: mt8173: Add GPU device nodes

 .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
 .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243 ++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 7 files changed, 363 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

-- 
2.53.0.1018.g2bb0e51243-goog


