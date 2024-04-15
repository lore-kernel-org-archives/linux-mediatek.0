Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267FC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 20:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZLiSazBe5qq6aytzV8pgTe0eeceVkA2qBLGwhoGTF24=; b=zOMG6WtjWsLno3
	k8ofAy37VsHc14nuEPvf1dDBjbOEsx6ACaH/vmcLhJ8x3ptCqZhLsIoPQy23DkqZIMFP+CxaLp5OW
	MdncAcvya8FbLvjI60P+udzvLT/OHge/1lI9Xu/BXcFuVpVgP8YWMjux08LI4+FvXJ+5RSQ4mjxaU
	Xu9EdqIDePlIaxTicrPOSe/zccFbMMwBAqqosa2C3KdYhV52iaGzeCVztJjZwOeqnMKgwFzks+uag
	XQ9JGZe/rTHhhNsFkE1dUHK20igXOCqcEpBBsxqmwV0PBREY5xPMhmbAPsQJfCpO5ASV3CzDf7hF/
	ZtAVfUCgh0F53g4gGeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTCo-00000009rv2-2xZC;
	Mon, 15 Apr 2024 20:45:34 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS61-00000009bol-1txx
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:33 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-78d57b9f3caso226884085a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209667; x=1713814467; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiSazBe5qq6aytzV8pgTe0eeceVkA2qBLGwhoGTF24=;
        b=bmfWtZ+1BHVFYhSZCY+7ORnRS0xhbuvdSDxtJ1UjvDlolPhf//S6xBkARRNzsv6Dtx
         4Yr0x0H/0KR0+IOJamGePjCEo1PYfMInk7re6buWWm6sOC+/VExWw0bhPZi4rpwJlv21
         798EVfgjB8V6hkj2Gs/X/7oEOfKTldQhkZSw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209667; x=1713814467;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLiSazBe5qq6aytzV8pgTe0eeceVkA2qBLGwhoGTF24=;
        b=rAr4cPwGt1LjcScnb5zIfM7NXFBNKaHQfHBMdKycj6QRaiElrEcaa+V6wvpnwmsjBq
         vXzLdw8Q7wGl60Jdl2VTXV1HK44uiMa8xTUT8AIYLN4EKwC6RT17AO1bJ3e75xdoR61V
         pqLSXFmDUgGlMa8Zpb6pYfiCn4Yp/SNZO5i68Sskq8Ud2DGDuxq+FvPAow6QKUKzwO8v
         oN27AbJ0D6gJ7BJxTY1qaMD7q9sS58N/XH4X/QlROMWkw8SDELiS28NLFAJCJvgnwdWo
         2IOAbtngKo5K6pI0C2YaoLtgwJSKQQpYqdKMvS1ESqm3Dwj2naFysnlAuUutl3jZw7lD
         p2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVCaQedW6QRK/v2SnjLgOFvsHj8SrqN64h0A7IseNCFHEXqdJarkYKuHuhySls7sUjSRTOFjnKJcIJvpywTbjt0xWQsNVfPMbc0Ec3sOYL2gc1w
X-Gm-Message-State: AOJu0Yx6M5taRx9fy8HdGzKH4hGVtwsgBsugmqjrGtdvrjZdolxcCsjv
	NzAxxV9lHxEB9NuMDKNfwG3W0Opyc084Zd6EYveVQK11735UxtgZiOZYv3uMIg==
X-Google-Smtp-Source: AGHT+IGvWYgXqLe5y5GC/0+2akeF6DX70yb8YGk/07FW2C+kK/AaKQ5m7NmDH3z9fR+ddjVPeAolxA==
X-Received: by 2002:a05:620a:8211:b0:78d:549a:c098 with SMTP id ow17-20020a05620a821100b0078d549ac098mr12303538qkn.19.1713209666868;
        Mon, 15 Apr 2024 12:34:26 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/35] media: Fix coccinelle warning/errors
Date: Mon, 15 Apr 2024 19:34:17 +0000
Message-Id: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqBHWYC/x2MQQqAIBAAvyJ7bkE3K+gr0UF0rb1oKEQg/T3pO
 MwwDSoX4QqralD4lio5dTCDAn+6dDBK6AykyWprJozyoM/eC1KII0ciN8cFen8V7vJ/bfv7fpq
 I9bZbAAAA
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_123429_749857_23F64A7D 
X-CRM114-Status: UNSURE (   8.20  )
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

After this set is applied, these are the only warnings left:
drivers/media/pci/ivtv/ivtv-fileops.c:223:4-10: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:230:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:236:4-10: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:245:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:251:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:257:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:272:3-9: preceding lock on line 267
drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:598:4-10: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:606:3-9: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 627
drivers/media/pci/ivtv/ivtv-fileops.c:648:3-9: preceding lock on line 689
drivers/media/pci/ivtv/ivtv-fileops.c:692:4-10: preceding lock on line 689
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
drivers/media/dvb-frontends/stv090x.c:799:1-7: preceding lock on line 768
drivers/media/usb/go7007/go7007-i2c.c:125:1-7: preceding lock on line 61
drivers/media/rc/imon.c:1167:1-7: preceding lock on line 1153
drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:154:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:171:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:201:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:220:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:230:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1008:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1014:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1267:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/staging/media/atomisp/pci/atomisp_tpg.h:30:18-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

CI tested:
https://gitlab.freedesktop.org/linux-media/media-staging/-/commit/055b5211c68e721c3a7090be5373cf44859da1a7/pipelines?ref=ribalda%2Ftest-cocci

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (35):
      media: pci: mgb4: Refactor struct resources
      media: stb0899: Remove unreacheable code
      media: uvcvideo: Refactor iterators
      media: uvcvideo: Use max() macro
      media: go7007: Use min and max macros
      media: stm32-dcmipp: Remove redundant printk
      media: staging: sun6i-isp: Remove redundant printk
      media: dvb-frontends: tda18271c2dd: Remove casting during div
      media: v4l: async: refactor v4l2_async_create_ancillary_links
      staging: media: tegra-video: Use swap macro
      media: s2255: Use refcount_t instead of atomic_t for num_channels
      media: platform: mtk-mdp3: Use refcount_t for job_count
      media: common: saa7146: Use min macro
      media: dvb-frontends: drx39xyj: Use min macro
      media: netup_unidvb: Use min macro
      media: au0828: Use min macro
      media: flexcop-usb: Use min macro
      media: gspca: cpia1: Use min macro
      media: stk1160: Use min macro
      media: tegra-vde: Refactor timeout handling
      media: venus: Use div64_u64
      media: i2c: st-mipid02: Use the correct div function
      media: dvb-frontends: tda10048: Use the right div
      media: tc358746: Use the correct div_ function
      media: venus: Use the correct div_ function
      media: venus: Refator return path
      media: dib0700: Refator return path
      media: usb: cx231xx: Refator return path
      media: i2c: rdacm20: Refator return path
      media: i2c: et8ek8: Refator return path
      media: cx231xx: Refator return path
      media: si4713: Refator return path
      media: ttpci: Refator return path
      media: hdpvr: Refator return path
      media: venus: Refator return path

 drivers/media/common/saa7146/saa7146_hlp.c         |  8 +++----
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |  9 +++-----
 drivers/media/dvb-frontends/stb0899_drv.c          |  5 -----
 drivers/media/dvb-frontends/tda10048.c             |  3 +--
 drivers/media/dvb-frontends/tda18271c2dd.c         |  4 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |  4 +++-
 drivers/media/i2c/rdacm20.c                        |  5 ++++-
 drivers/media/i2c/st-mipid02.c                     |  2 +-
 drivers/media/i2c/tc358746.c                       |  3 +--
 drivers/media/pci/mgb4/mgb4_core.c                 |  4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c                 |  2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |  2 +-
 drivers/media/pci/ttpci/budget-core.c              |  5 ++++-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   | 10 ++++-----
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |  6 ++---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  6 ++---
 drivers/media/platform/nvidia/tegra-vde/h264.c     |  6 ++---
 drivers/media/platform/qcom/venus/vdec.c           | 15 +++++++------
 drivers/media/platform/qcom/venus/venc.c           | 19 +++++++++-------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  5 +----
 drivers/media/radio/si4713/radio-usb-si4713.c      |  8 +++++--
 drivers/media/usb/au0828/au0828-video.c            |  5 +----
 drivers/media/usb/b2c2/flexcop-usb.c               |  5 +----
 drivers/media/usb/cx231xx/cx231xx-i2c.c            | 16 +++++++++----
 drivers/media/usb/cx231xx/cx231xx-video.c          | 10 +++++++--
 drivers/media/usb/dvb-usb/dib0700_core.c           |  4 +++-
 drivers/media/usb/go7007/go7007-fw.c               |  4 ++--
 drivers/media/usb/gspca/cpia1.c                    |  6 ++---
 drivers/media/usb/hdpvr/hdpvr-control.c            |  4 +++-
 drivers/media/usb/s2255/s2255drv.c                 | 20 ++++++++---------
 drivers/media/usb/stk1160/stk1160-video.c          | 10 ++-------
 drivers/media/usb/uvc/uvc_ctrl.c                   | 26 ++++++++++++----------
 drivers/media/v4l2-core/v4l2-async.c               |  8 +++----
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  1 -
 drivers/staging/media/tegra-video/tegra20.c        |  9 ++------
 36 files changed, 132 insertions(+), 129 deletions(-)
---
base-commit: 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
change-id: 20240415-fix-cocci-2df3ef22a6f7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


