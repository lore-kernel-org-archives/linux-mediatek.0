Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE95CFD2F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Nov 2025 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=; b=IZtut0m81XRlQmuOIMwq6NkqeC
	TA6cBF3g9gSwEhLc1ftlJ7jm/40qwtb1IQ01Yo1BxsoEjctjRGWcRaOVNnZqEHLEn0N7LnMl6Cr10
	yZ6Btf+OK8SX1vVJ3rqW1vL/Z92ZUJQUi2i2Ody8RMARYkIB7CXPoIzKUxOj7/kGYrhhA3em3LQ7/
	8bWFRNXruYr7puNG/4bkMS/FuWQjfFPNVQKYXsHwwBUJwOAXfxrL073xy7KwNYl0aGgGBjIno1kLZ
	Az/vWaUrrHelLAIKuHL3+YZteeHMAPVG8Q9qJZ4BEpTdml6A1iO4STAUytSgOLqxUk6wBS/Xu1zMc
	C4s8p4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYoB-0000000GKsf-3c3f;
	Thu, 27 Nov 2025 10:01:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYo5-0000000GKr2-040C
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Nov 2025 10:00:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297f35be2ffso11017355ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Nov 2025 02:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764237656; x=1764842456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=;
        b=Rh/dn0OOSQvYi4y/qPFkmwglW56hDbzYSDbAg8FclSf+golyWthLXkI/JSfzBwmCic
         ME7+V810Is9tKg3YXQijcz8FxnhYMlsxDn2w97mvBTGu1V5SZR432gpHJ/E0RDhC/o1g
         6ptes7DVNb1FzUAMLvzIWOPNEr1qKQRD8jcpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237656; x=1764842456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=;
        b=Hg4Bz1moUym7XjTx8lEnXubPhB+tSMwdf55ghqPLxvHSR9uLKpZX4PDLehttkgVidk
         3US0u596BaS8/6Q/zAcwNujToP/I5uy68BYkZpwemVRGwxGCKfAkFi6qVmlPb++igHIy
         9PbTsXnX+Y9x6gnt+XAtarPXpTykPAQNUaxN3BMadMR2Kx2MmOHrWLy2ijUUj3R+yzJf
         V7r4XWmgnjH+KeDmVQAVO6LRcL3eYJtliboyXA5Vup0eQ1S6Yd187mg0aSOz4rlhbAEK
         ymSWOwV/O69frB8UZeFBWXYUAgT2EJy5lvVaFBdPkyacCHQAo6MDe1tT0pHhBo3dF1vX
         hi0A==
X-Forwarded-Encrypted: i=1; AJvYcCVjufTBbEG+vLxIKit2rxWhdMusE3ugA15WKNy3Sw0Lebk3iAcAcgpxAQmqz6ASyh5X/X+lfXhhRwPrPAn5yw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr89KxEme7VJ83OUTTVkaUI7AJOSyQWUyUXS95U42wqMCcOseK
	B1SDnluFSvjcQXlfV4JhDtTetUpOpELJOuouoORF5ZETil+FZkysvRLV5WGA23P+7A==
X-Gm-Gg: ASbGncsXDa5RZGAaOstIGlZ0Mke2VRGdCHFZ6HDq16GyxxY3E9qkDoAV1VH5pSwgyUX
	701lv0oB/A3Ppcy05uIWDRaMYAZQCr22J0f+wGdSxgKmmB5DDfOVZQwiI+paMwM1JBOXeQWnb2k
	FKMda1AnN+VmPno6CTtN80AnLi8bwWAxCXzHDV6nbI6aNwfIrp4u4+3eQbWAqGzK0QPizHHLbyO
	UO08RxNDWEb15iMxwoUU5Fhjpa+kMVrqvauETItmwvKHtBHhdhlUptG+1Xn/R1m6T3sEL/PysoG
	IWQ2LYh3VKFcqz/rOW5ERdPEKBJAu9FK9i3Eb1FgkCyu8dyEU6eKMCzAiHTClVy0OoCOOs9sbgV
	VN91mIkUIJXOThQiqYlxwDlGkn1TN+9doOcjQv6vqkjPDF+0IriLL9PdIutwXOYQhTrqzan5Np4
	oizv/+mCgA6NIVoBKgHseZDoVmjmecWlIaVcchTnp4qnZYUW1tNII8BTWZpw8ZNNrVTCCd
X-Google-Smtp-Source: AGHT+IHivfNnrfK3dtvJit5EMEyVA6t8fLK67j9PbneBRp9gDarid+L6oRuRF/o2DijnRZbB5oV9KA==
X-Received: by 2002:a17:902:e551:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-29b6c684abbmr298506555ad.34.1764237655717;
        Thu, 27 Nov 2025 02:00:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:4917:2ae3:8ebd:4ff1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb29fbbsm12490515ad.49.2025.11.27.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:00:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder core 1
Date: Thu, 27 Nov 2025 18:00:42 +0800
Message-ID: <20251127100044.612825-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_020057_113740_D59EF44F 
X-CRM114-Status: GOOD (  13.05  )
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

The base address of JPEG decoder core 1 should start at 0x10000, and
have a size of 0x10000, i.e. it is right after core 0.

Instead the core has  the same base address as core 0, and with a crazy
large size. This looks like a mixup of address and size cells when the
ranges were converted.

This causes the kernel to fail to register the second core due to sysfs
name conflicts:

    sysfs: cannot create duplicate filename '/devices/platform/soc/soc:jpeg-decoder@1a040000/1a040000.jpgdec'

Fix up the address range.

Fixes: a9eac43d039f ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was introduced in v6.18-rc1.

Maybe have the soc maintainers take this directly instead of waiting?

Also, I'm not sure if this error could mess up the JPEG decoder driver's
internal tracking.

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ec452d657031..c7adafaa8328 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3067,7 +3067,7 @@ jpgdec@0,0 {
 
 			jpgdec@0,10000 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
+				reg = <0 0x10000 0 0x10000>;/* JPGDEC_C1 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
-- 
2.52.0.487.g5c8c507ade-goog


