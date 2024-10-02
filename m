Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C2CF31B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouP/AAURWlpM5gHEUts5ppp9KSn3cI1xAL6qgbhoUpI=; b=uagDC0EP7oiDi8
	umBb7Bw0GcoCl/3Qw9yCrVb184g7dCqbhJd2eu4UTCQM2VyrHLIrjECAA5ZtujwbqjDdI0Js2ku3F
	mQ5V10+c9M2ZeBtNKm2sUabZGGkbMNQUw+TuQMyC8ghwZl/6r61th86rY1E3f+7qqhFSa58gqCXTl
	10iVZk5UVoHA4oTlSxV6g5WJdKjgig7sPELqde8dLAcvedNYwsciTC4pzuf2KJUnfsFCbSIia7qDr
	fZaiaq0zdqYgxDaLGVndfEC98qDM0J+me5j3AMY/RCQZQckzee/5keTXmRBOOAmcoKyKOS61FDYI4
	q75FrnBFZEs1HRPECB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxxD-00000005k1w-0qSt;
	Wed, 02 Oct 2024 11:55:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxp0-00000005hxW-2eV2
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 11:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ouP/AAURWlpM5gHEUts5ppp9KSn3cI1xAL6qgbhoUpI=; b=fkc6K9wnBaBa9jyLnVceR/4ss4
	ACgmFRTrrprciLE+lNNv4NN75eWppUbN1z4YqEejPFl2LX68nHJFudZWZMvitN9wM0GeB5tP/orGZ
	Xg+Iv4/gJEGdGyRS3cV+9mtZrE1M406JoG5IwrOE9DQN6Mhe5K4urrE62QpB/6d8W2WV+/2p40Xjg
	Ij0qsrHfBKWuFc/SmTQB1nNvknqsBtdtI6sxMLjNoqY02xPLe0NiybmyYmFY6Io3dSyfXbxMAelFf
	5gNDCz/+9j7WxvTufVOiAqswI/Wl+8yWXk5c4gARnZzG2Ci0+Iwtn5xADWhbHApmLSD2PlXedZCE+
	DC6zQEzA==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxox-00000003TkQ-0e5S
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:47:09 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7db908c9c83so4038082a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869624; x=1728474424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouP/AAURWlpM5gHEUts5ppp9KSn3cI1xAL6qgbhoUpI=;
        b=gpo/X+7b6JCRWLy2m2IB3+wCbl96NqPomnbYOBex7l0dUhl6m+Sdv6y5jFI2GkbVAK
         HT0Y+tYMnMOMu4g/bb9EiBbSlZgGlh5KTImETy49X1gG/ggdS1jKlYkWD290AXau9gbt
         Cazpg4s5KDIKXdZjrmw9kucOOwyTnzX24iQzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869624; x=1728474424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouP/AAURWlpM5gHEUts5ppp9KSn3cI1xAL6qgbhoUpI=;
        b=hzsuVc2DbSTKl92zlhUgZRLJslykZiyVbo4Ns2s+KSwS83xCGTahnhZtD1xMVFR0pC
         qx0lqY9HzPC+IwVUysJMmP3xbHVOWgC44XP9TP4Apo4HNQuUIG6i74+CUyN3WGFr77Gy
         Rwn0fBebLzYZX3jtSXiWlKpAWEqjsGOtctEHgtrNq3E6kcgHDNY6iYMcpViCDeZSMGRB
         JTlleYJjJm2DoR7ouLnjo6IJ8sq0fgAYf/XEE/8mQJosKWHFCdAH6/oQzjSE38XHFz/D
         G8yyxaBXGhOc4VTzDKWU5APHihkOf1XavZj5NTiHub3/2hOb/BrdWyW1d0+EwE+Cgmgl
         gBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoTj3S2Lz42brYZMwpb0n6XfFEGUhXJH87Y+0szafgo/4aRkQMu3InqCx+TkGtifm+/8Ef9o+2GGYR+ANC1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb84f0wk4H3EVscdtevOBUz/wWMJfTI/fw/jnennbd+EmlSoE8
	IjGpMq6ayyKRU/2Kvm/OfWOcbHmqlbsN2w0dXoJMswwdyx135dbyOxvYz0kqsg==
X-Google-Smtp-Source: AGHT+IGJRGU9+3577zbkkm9KoRqvEP41NbLevBI2rEZhys3m695gS1GqUnXFCqQID0HvDZFWgO7dLg==
X-Received: by 2002:a05:6a21:1643:b0:1d5:14ff:a15f with SMTP id adf61e73a8af0-1d5db20a5c0mr4937098637.11.1727869624478;
        Wed, 02 Oct 2024 04:47:04 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:47:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
Date: Wed,  2 Oct 2024 19:41:46 +0800
Message-ID: <20241002114614.847553-7-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_124707_324220_209427F3 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the vdosys0 display nodes to support the internal display pipeline.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index c1b057166aa3..79e007b619b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -26,6 +26,7 @@ / {
 	aliases {
 		gce0 = &gce0;
 		gce1 = &gce1;
+		mutex0 = &mutex0;
 	};
 
 	cpus {
@@ -2344,6 +2345,71 @@ jpeg_decoder: jpeg-decoder@1a040000 {
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDEC0>;
 		};
 
+		ovl0: ovl@1c000000 {
+			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8183-disp-ovl";
+			reg = <0 0x1c000000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L0_DISP_OVL0_RDMA0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
+		};
+
+		rdma0: rdma@1c002000 {
+			compatible = "mediatek,mt8188-disp-rdma", "mediatek,mt8195-disp-rdma";
+			reg = <0 0x1c002000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
+			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L1_DISP_RDMA0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
+		};
+
+		color0: color@1c003000 {
+			compatible = "mediatek,mt8188-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x1c003000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
+		};
+
+		ccorr0: ccorr@1c004000 {
+			compatible = "mediatek,mt8188-disp-ccorr", "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1c004000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
+			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
+		};
+
+		aal0: aal@1c005000 {
+			compatible = "mediatek,mt8188-disp-aal", "mediatek,mt8183-disp-aal";
+			reg = <0 0x1c005000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
+		};
+
+		gamma0: gamma@1c006000 {
+			compatible = "mediatek,mt8188-disp-gamma", "mediatek,mt8195-disp-gamma";
+			reg = <0 0x1c006000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
+		};
+
+		dither0: dither@1c007000 {
+			compatible = "mediatek,mt8188-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x1c007000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
+		};
+
 		disp_dsi: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
@@ -2359,6 +2425,26 @@ disp_dsi: dsi@1c008000 {
 			status = "disabled";
 		};
 
+		mutex0: mutex@1c016000 {
+			compatible = "mediatek,mt8188-disp-mutex";
+			reg = <0 0x1c016000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
+			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
+		};
+
+		postmask0: postmask@1c01a000 {
+			compatible = "mediatek,mt8188-disp-postmask",
+				     "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1c01a000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_POSTMASK0>;
+			interrupts = <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xa000 0x1000>;
+		};
+
 		vdosys0: syscon@1c01d000 {
 			compatible = "mediatek,mt8188-vdosys0", "syscon";
 			reg = <0 0x1c01d000 0 0x1000>;
-- 
2.46.1.824.gd892dcdcdd-goog


