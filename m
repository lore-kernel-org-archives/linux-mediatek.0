Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629C4CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 08:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0MSD/vKECgZ6ipsqTjNJm7AvSs0y8L2jz9lADbJGXw=; b=gjHT5HXDYx2DwPDSc42sAeYRvA
	UjnR+5RQvW8fHq3uol5GIDItTbBECXN9sW6KuxuyOZbp5umAVKAMPhdjQ1iawnqv/Z7AllvnD+jtX
	H1RhOrUDbcDVACywC2h0LQ58MUVr5+bCdZXyGY/aH96nE4XTYyP+CEx+o7O7diyXKNVEkN+SXLaHS
	uxg+eU3fCZcO8S2nYe+v+SHafIzF0SB0u9XFnnneFcOd1KQyXewi+5ar+7Q7P1tg1Yw3A7woeDqBf
	TNuclgdDAE4wXYdcaJuKjRHyJe7XRXfiRqaVEfrT03bS4copkE9IE8HKpHWPu7Krees6mlBjjpGEw
	v7+OMRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxIF-00000005QJJ-332U;
	Fri, 30 Aug 2024 08:47:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGp-00000005PqB-2e70
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 08:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c0MSD/vKECgZ6ipsqTjNJm7AvSs0y8L2jz9lADbJGXw=; b=IVH6eygP0/LdnsdcTT+hpNuUwK
	6pj9gcmO61+cVXJxje965sPtA5mFWUCZrX/L2PxcJ5iqScmU6ZO2eWuIcS4GkpSV0fPcUk+Jsop9X
	XBvdWTpEFxuagRIl0ZsTvyB9owN1zFnKudECkzSYUXNWdqHT0IYjQk6HC87hy3B/IAvRgaclq9w/z
	2H7xDXDlGECa2nWJB0jvl1OsfG9CZ0HjOElItn8BGvy0akG+xPTJvLRK4AfZbjliY71OSECQ5Zjtz
	U7k/ke5KQXPf+eT49Hiz4lr1z8i9xe+6+pf/ay0FqjbHnofz5JwlRVaGGo0geDj7Nou2Ai8W2/Gzv
	pCYmLMqA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sjxGl-000000034MD-46BO
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 08:46:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-716609a0e2bso490835b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725007568; x=1725612368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0MSD/vKECgZ6ipsqTjNJm7AvSs0y8L2jz9lADbJGXw=;
        b=WwNjkB1CR5cZvATsOQiDFm5xzW15/4BNsIMw3ncg57iNer6cGtq52F3gFJ0gctaP5c
         35lvvwQLtS29I4sFEZuOZ+IGmsJtHQE9sX+PdXab8eFvVnO1t/LCR6Id9z0pbWWjmqoK
         HCVM9OzrbynfUIq9R9QCazVME7k9aLVbkHFo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007568; x=1725612368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0MSD/vKECgZ6ipsqTjNJm7AvSs0y8L2jz9lADbJGXw=;
        b=dZDC5dtvWoGrMqA2Ypv1OWdtb+bGHWV6RxaVvA8e+QEdjVOYqf/DsISxrB2hIZktve
         Kj4kxGNgzMIyVZumk6aiRv+RtyI/GlGMDGZXV5dq9oh+vYOY4CFL7RwgbT9iVKjuw6Az
         lvQT3W0TqqWC+p59GtfKx6tCBJjqdZHoyh69uJp7BldU+Rihr1yLcKxXLAIVE/21HlOS
         v0cHOovjZAOJkjv+lwm3gN8kftUxq9QOI5aY8QX7lrdL53a8gaFwqiclG751oiTP7Ims
         n0CstvR4yuUGPOt8IddekSjynTduLBhgBHWnOicTROETkPpJsGPjw+Rbo4/soqlVBSD9
         b8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1qr/tyhjONXwoVmP0d+WEUuyTGO3OtTldPxNPexp7ebaClqRDBHjPIezxbFd/Wy4e22Z2nKSkc1VNN4w+zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR4s2QkxSv3wRVQdisv4siAyT1jVQ3rOayKplhJ2RAiUwpSu83
	wjjE084oXcaT/XXdl+W5wAK9OnM5HSZH5Cff5CLVNs+d37wGp+gPqTuCYOSWJg==
X-Google-Smtp-Source: AGHT+IF/Ev+xp5G1M+ToeusxjN0ThDIfMD72jH6J5Y7yXu9dlnTUI7Td1DwM8MVKcLVb5RSdY4uPIQ==
X-Received: by 2002:a05:6a20:4386:b0:1c4:214c:cc0d with SMTP id adf61e73a8af0-1cce10ab1ccmr4853891637.36.1725007567866;
        Fri, 30 Aug 2024 01:46:07 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-715e55a3a7bsm2288304b3a.47.2024.08.30.01.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:46:07 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v4 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Fri, 30 Aug 2024 08:45:44 +0000
Message-ID: <20240830084544.2898512-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240830084544.2898512-1-rohiagar@chromium.org>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_094612_075175_5E473072 
X-CRM114-Status: UNSURE (   8.05  )
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

Add clock/irq/efuse setting in svs nodes for mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 85b77ec033c1..3bd023cdcac0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1372,6 +1372,18 @@ lvts: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		svs: svs@1100bc00 {
+			compatible = "mediatek,mt8186-svs";
+			reg = <0 0x1100bc00 0 0x400>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_efuse_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg_ao MT8186_INFRA_PTP_CTRL_RST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1695,6 +1707,10 @@ lvts_efuse_data2: lvts2-calib@2f8 {
 				reg = <0x2f8 0x14>;
 			};
 
+			svs_calibration: calib@550 {
+				reg = <0x550 0x50>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
-- 
2.46.0.469.g59c65b2a67-goog


