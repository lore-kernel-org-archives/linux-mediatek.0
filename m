Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EE4ECE57E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ItggMhPxBJY0gkMC49qQS6udiSlXnBocVGSqlKISNN0=; b=tu2+ZF9KxtWXFb
	PRES8Z4frm2cuKe+bZVI1TFqX4jZeT+lo35s5LFCoIDEqRHWUDrWRquvkO1stsWLInXxN0VooBRWU
	1wLEyEaguXNIhV9vRZvxJr7xR3XI2bJiT75Sk+Q5ZayKQ4trwsXVG6C+sfNTy2CvXxCE8BhfqDpvZ
	YTrhBTdDSs5q5LoZjZ8o0VOgEhibyTVJctEUGTXkKd4yiquBOZEWaSIEnsYsMFYiiAFErABMLSTZv
	cx72Tousne/TnQGquooDwES8DMs6d3NpIossVF0X68XMipfuzbEZblT1Ctdj4k4XQQE9TY1kJmo4l
	8jmxjsyq8GVT00rX3Ypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndmh-00000001tTi-1M6J;
	Mon, 09 Sep 2024 12:46:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncP0-00000001d8L-0doc
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:17:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-206bd1c6ccdso37431235ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880669; x=1726485469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItggMhPxBJY0gkMC49qQS6udiSlXnBocVGSqlKISNN0=;
        b=Uu7rgpVOK4mocBSjpUjv4Z96TiKIjWh4yiWUUTi2Zetx6xVOo0wmztoFapHWqRGmx5
         TQNUEZbq38Qf2FJpS1Rkuc/tuLsHqpPqQs/KdzsYvEbAU2K5nVgYRvfddO8od8DVCQxY
         dwSGLRzGG4h0wgAikBlpJ8hD/UyBtR5b3tgF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880669; x=1726485469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItggMhPxBJY0gkMC49qQS6udiSlXnBocVGSqlKISNN0=;
        b=wpDwu3NkYNbKczigI5yvxVyu04qliKfhMJ3hQXyw1tGFo5+HhyJSK2xHg6qBhV9HCw
         xzi3IAMUnAAQAy+jGV0OvXHlf2TZ3J1VxT2Au5dZ/ZG1+kT91/8Z2yiXwumeMyayw4BV
         Hbh440qBESwbaKm73VK5knU6wIvxndQM/jUhyIFjE5K+x1xMC0OZBxzTArbCZCgepkoX
         MDdHmwMkGDxPBvThhk+1B4E0AXwDa/OZW3m+uMIXSHatERdu4PRybSHoHkSvceM0Hb04
         iRZAMAelqabVK8tnp9czqtDFLO2Y9fGAuJ1CjxMUJigI6odlT5LY1Jy6dq41lkoGGBmC
         /FZw==
X-Forwarded-Encrypted: i=1; AJvYcCWIg+aFbATynOVnxaXqkVqHFPoW6CERiYLX9BoZ4tSh0qw94LOqE8AjYJcbFXBI7soUSq24KkJNp6CIqdGVSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/MjUvMecaeDqkkuXjoX8O7mi6jkwpPafqEM5haytQNJTgrgS
	wSY342M4tX8POaSvObxSsPTElT8sgTyUQW11jrpXLb65a7Bao2+wHOSRGeTh8Q==
X-Google-Smtp-Source: AGHT+IHLRIdt1H28qhwk89qwzoD4cvjGIQS4KVJ/THMcfTnhxGfANJw6cSATeXiB2t4rxipOAgrC6Q==
X-Received: by 2002:a17:902:d48a:b0:206:ba7c:9f2e with SMTP id d9443c01a7336-206f051490cmr95199095ad.25.1725880668502;
        Mon, 09 Sep 2024 04:17:48 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:17:48 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 00/13] Several fixes and supports for MediaTek MT8188 SoC
Date: Mon,  9 Sep 2024 19:14:13 +0800
Message-ID: <20240909111535.528624-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041750_239281_7B772438 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, MandyJH Liu <mandyjh.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This series contains several fixes and patches to the MediaTek MT8188
SoC.
It aims to add more fundamental supports and lay the groundwork for
introducing MT8188-based boards in the future:
- Supports for CPUFreq, SPMI, IOMMU, PWM and audio.
- Fixes for CPU big core clusters, missing dma-ranges in soc node and
  power-off sequence issue in vcodec pipeline.
- MT8188 CHECK_DTBS fixes for dt-bindings and device tree.

Note that there are more changes for MT8188 SoC on the way - PCIe, MIPI
DSI panel, DRM, multimedia encoders and decoders etc. I'll keep working
on organizing those changes, and I believe the feedback here will also
help me improve those before posting. Thanks!

Regards,
Fei


Fei Shao (13):
  arm64: dts: mediatek: mt8188: Add CPU performance controller for
    CPUFreq
  arm64: dts: mediatek: mt8188: Specify CPU big core cluster
  arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
  arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
  arm64: dts: mediatek: mt8188: Add missing GCE clock names
  arm64: dts: mediatek: mt8188: Update VPPSYS node name and compatible
  dt-bindings: power: mediatek: Add another nested power-domain layer
  arm64: dts: mediatek: mt8188: Add SMI/LARB/IOMMU support
  arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
  dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
  arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
  dt-bindings: mailbox: mtk,adsp-mbox: Add compatible for MT8188
  arm64: dts: mediatek: mt8188: Add audio support

 .../bindings/mailbox/mtk,adsp-mbox.yaml       |  12 +-
 .../power/mediatek,power-controller.yaml      |   4 +
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 352 +++++++++++++++++-
 4 files changed, 350 insertions(+), 19 deletions(-)

-- 
2.46.0.469.g59c65b2a67-goog


