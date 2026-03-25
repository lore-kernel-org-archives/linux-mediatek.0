Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3818CFEA831
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=; b=K8zEZ4cTwcGly+7rIwHZTgFvy6
	sgivMRThln1ZsLgWHu7KJMVYUUvE0Dsbg3CoThPle53YkKoK00L+y+f/vt4OaJATNe9E6ikduDWjb
	4HjFFJNFEiIjjIwhqvhxrKq2yZxmMYhlNWgMiJylEydNc5FplLs5O4ZV46LGVH+AhCkGcsQaEVmU0
	cNHOQQhDqk35EWPzMWm682VYUL2H5+BUhQnDI/E2UhVVfqZcfv9a0ZurIdf5i7V1yp9z4at+NLOkE
	M5LmHNyEFGd5eBhfeOcjBdyyA+07TZwtUfckJ/iW7i0lK9DKiAUyPtucLMPkH1qXpwlsjCJNIjj22
	OP3ynFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8c-00000002tFB-13bN;
	Wed, 25 Mar 2026 07:58:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8U-00000002t8t-36Da
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b04fc8851cso21774425ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425522; x=1775030322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=U8x1pCYBaCkerCmVJq0dWxj8eCPnnU4TbHDOzbtb2RVPjSdeFeFGX3v47bDuf2TEot
         G2MzXsX2wW5yztdylZ/O2w6ok+Sb601otlvipBjxJUuQWhUDpfQG7pKoh80f2BsgGjHi
         wlJRJOwKpyQeHSNlbCe6eXA90lqoIocMUwH8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425522; x=1775030322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=bDdFaCygFrKVUAukFzUhW86d41tIlmNGpqUk9xs9YIaODptUBhwndt8ppMPwNxCYWa
         PrMko2oHwpvZfZoZSBn+tNvIZd/Keant1MwzCU+r409TeZGQVxOlPW4te8Mx/3mA8y+J
         dYjik4xDFVNES9d/y2BqTmvTC8naGz2Aoh4MZ3eUEf6k1j0nuRkfBScfHOxct179n90R
         U9EfgVuQCi/qZC21jnwQ7Gak6jll8evSKAh97hm8tri6D91Ngk0mkofWUk3KWi8WvxNa
         5SABinJUmhJGSNv0FcvI6P6dj8XYg51sFX3pJ4/L8SNI+x7dVuPsoX/KDiipI2ni16qC
         p9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWMWXZ0Xnt81dewUhXWRUWHld9oU6QvxIWai2oWYwHPeGCN1U+LqvJHfuoQ9sCSQOvlpJuzW7kNXM3Pib2DYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwofK81lcPO4ZluqmwbVZp/l7ZxQxDklPQzSG5O2lLLS9Ny4Sup
	XvsY9W601TvaZHkM/uyG5kLsG4qnEJfAWScwYoh2RZ/m+RS5xsf79fxRpyhIIlzQUg==
X-Gm-Gg: ATEYQzz8jEtU1ubOfnDsmj7mRXIk4fv/dfdHjiXT9K/67DcTrxpPdpyOci60GT/6sFB
	KrbcAl3U2osvaMXYBU5DamOmM53PlqNNIQYEF1JyYgXcGhM0nh63/pgzQOsBEMCDzj87/T/Hmpf
	URlhfjRIyateJUaTPrNPKmITw1663p06HdfoC/3fVaP5WJkz1QqHhShi1Ql/9TogzZ/CCU+Ui82
	G5OZXDNrezjShkFTZux6NUCEr/x/NnMk1AdHsg47fW3M71lrekwLyk+H9SWN4lXumpgJeQhHweP
	NjMcjcgVbLXazxBVbkDdlJ5HOYtUhgVyF9NoWGsaUokYObyA5/6CpIOjoqe+TVPQgbXQYj/tNO8
	KfTNXNvDsLx+rZkGTaJuk/QvmdWXezxfzsIvj2jwIdVElHPAqqjaJq61SdsT/yZAhp+WU9PrrR8
	lxWn3Zf0P8wbovvIv27Gk2x4q2yPwH8p+HCvnpzgsCUuiSvhblVre/RQbg8ko2bAxjeh8gF11Ip
	PRMmhI=
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr28028415ad.31.1774425521733;
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 25 Mar 2026 15:19:49 +0800
Message-ID: <20260325071951.544031-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005842_793282_FE78A208 
X-CRM114-Status: GOOD (  13.52  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.53.0.1018.g2bb0e51243-goog


