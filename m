Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88460C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=; b=FhoumLyzEVJvyuBU38YimjTw/k
	OF5pJXblMvZIYMz1o4E1rRAaiz8B6Vn3m91CJPhZgGiI+TkBvFa23BwPopThUVqrBD8ad4O+k8S9R
	w1Hyv3xrLiWf1qunrbt/OMcRRMyjvh8Pb9tAhMABIt8v1lGmks0IiUfZ8ka6NV12Hjx7kkBBm7tfN
	wOmd33eXe8UCcdqBNM0LTC+CyeeeH/5NkQQEQES0pR43Sz57fEGkFHVMKz+M7rUZKSPiZ5xIIcDl6
	F2uri7iKP74CnkqkpNfl2kIxDjc7SXwfDjWfNvwfgtt4b49X8KQJSLiNN67fAbYxZzDnpgc9iwV0X
	Nat1X/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHSM-00000002JEH-1wwz;
	Mon, 27 Jul 2026 09:17:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHS5-00000002J3R-3tux
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1471933a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143809; x=1785748609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=iXCSafgDjf+qTqBuE9c4tan/wMpVhe96Kqb/MRIneIvNuFrxlkHWwGZST060+SIf05
         Ov6iq/BSKyUPM+h1HMpSbRCB3WBIg8gM7od8WbJPnJL3efGg3Ea2F7NVHx2mYZiLh32Z
         HR1eyjwhpd+031kLLiuNcGP3kkxKckUf4U4R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143809; x=1785748609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=U1TeIvrMwIIVIpGTikpk9ew3nBaAtSqfEXrVIqpR286ibbp0AoZIJYsxbm6pPtIlqS
         zee/EWmodm8i0f+3AoVOWAJFG9qZhhgaIpzDXpzQyfyYxFD42yO/zMGlJSK+RLemOYax
         WH1P9BCdEg7vaPW1vU6QncHHN14NhslrO0W0q4+Nl6EOkDqtaxnJ4Y6/OkE5trOe94xu
         2/aeWcfcNoNw6k+Xd3JD2smvDUXi8hRncan1chsLNXPxMVHUIA5bgCjnpAQnCa2rMgeh
         tpPPbNfcuaZ2nsezkdyTOpB+DPUOOQNRvHq3OJ9qopxkrGNspXVJsTzsNAhoqbYp5pIg
         IW2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrscxT5WbstgbghQGg8C0nDumL43qvdjgCNx3coWa2cAFzcD3Y4Wa5mwCqnjySUbtLQrk9kJ2Ez42UlHwP77A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv/aL9gjxh/d512Y7nIWTvVFsbmoJb3O2/Eu96avo39Uy6OIFf
	fXZys5IR7EB7wE4WMPJfNBfITOtxhLGGeG82Li7JhctNPDIt1XCirEGszQtb2s9n6Q==
X-Gm-Gg: AR+sD12fZz+xkBtw1KTR+/5JPjqtk6gtXsovRplXwsW39WrcS6gYwur2iyakodYLGtU
	M5zztSBF77ctXktsoU7/MPFL5doZB1zV1XzP9Z2mbZ/TSjGj3SvtujFMD9npNFS3P8FsHQBKD+L
	fcokKOuoOmoI0hj4UwW4eVLdtqhpCK67ssbYooaxIGdRBIv2B4WoRWgrmif3V61kYtn6CbJkPde
	IpVxpXUhm3gaFWThvYhGQyLfqYSMIAwIuG6i0xFjy9iSIE2412//GAbUXPbjYMCPukzQmJ8ZpIA
	SLzTE6fqAnLdUEp9qYSlbMzmysfA13Ed3mgWvamwE17DS4RfZIarmZZiZsnrtxcGHcW4NPSiL/2
	rbRFH4yxqY76wCdof4o9sZlhNazJZqzpNA2I09wQxUj4weIfTJlv5QYSO/V5HV0NjhpmwOSlH+D
	jKdrzOCN20GG5OpVv32IvrCazbXdTysdEm5vOYPwflq2SLT2iJko8wyo3Hs9iHqn82x+0V
X-Received: by 2002:a05:6a21:6f8b:b0:3c3:7cfe:b32a with SMTP id adf61e73a8af0-3c67dd65e16mr7098317637.27.1785143808982;
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Mon, 27 Jul 2026 17:15:54 +0800
Message-ID: <20260727091555.1023910-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021649_977974_182E147E 
X-CRM114-Status: GOOD (  13.13  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 556e806b7787..169ba4fd183e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.229.g6434b31f56-goog


