Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58DFCF855A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SF5nwE8q+scLV0tbzUby7efs2QPmWoOdROYf5aDp40=; b=OHOXWTue/FH2o3
	UMoeKwOFwCzGjJawc+DSo8gdJzD9FBhvc0u4EhZlHq9qU2aY8kKfcEPBzaff/ecGctLZrNkDrFRwJ
	bkrKnpBvozBPp0Y3H8m3J+67pW0mWBbd+HjFNJLhYjCvqj2XuPF97DKhECDDTAjRCVlyHizwT0inq
	XX+FapDvogNvEUX+2oxUkxMWLutMF939Swddo5P+K65VeSVOGIclue7qV8FnWlbpdextMU0qC4Rx2
	kttLxxodJhefUULVPtALwBhJpeHk1on1WynQPa7DmVpecCsZ3aLuBb6cZkMk1ItGYLdZ6pIpKaJD9
	G2/FgxZUtMbJwwYl1LWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swG1N-00000008MjG-2bUS;
	Thu, 03 Oct 2024 07:13:09 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqi-00000008KZR-0j1X
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:02:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71b8d10e9b3so479911b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938927; x=1728543727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SF5nwE8q+scLV0tbzUby7efs2QPmWoOdROYf5aDp40=;
        b=UbY7GHEaAzZkbnYFuB0154BdVKTDG5YDuGGH/NPW/YOf8rEkjz7LOiXys8I2PvecEO
         smjiBr0b6IpFFu1oVv5uEh2e/VMxh4IvOsiTO58dz/9/yJRbIaqQlQPRDwRr+Cw8ytDX
         MXtsY+2+LDuTRGMJtJvDbgV+1dqr973dOpT38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938927; x=1728543727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SF5nwE8q+scLV0tbzUby7efs2QPmWoOdROYf5aDp40=;
        b=JRtntI6eOcx/HC2gaR497vLHqOT8DeTC2GzUWVUpgYVtfIvxBJe5FMxz3B5KMsit4Z
         a38sok4zHcJrK+y6zPsUrCzm7/qftzx+Ga233WjKSrwpquyHWHUWuy2uxEC8fXBhI7Dk
         zpsGXkdpEo9E+ei1Ztjwh/cbLa4W8rUtahAEOQ3GM0YKXWm+NIH9pncU//n4VQf9MHTR
         l3Xy0+LEFuvNME0bgetopMYW62ngM0MePqL/pMmkuNak1xqqBYUPypBwr9MI1baYnqik
         E93r4fkc63AMBt9EbJr97CG/rx9Thyt368QZkH7GPFzGLk+ZXxl09sv6yNvcTB2JsRGy
         BqMw==
X-Forwarded-Encrypted: i=1; AJvYcCVq/cteyn548lOiKfPH6YdDMJhXSRd7WXD+iKQi4Kac4OAKe/5zeAtWCcBuUnEKzoqoU/ykT4A9PUeTWNzTXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyqwHtkrZpC6DgySXKee4dcPCUHVtdkarDvM0U8pI2PgzvKJSZ
	MsoLh2S1f3dk2ru/VP6RCTnnQWTxH+fI72yphXLuIZY5QPA5WynS0oEPSw121Q==
X-Google-Smtp-Source: AGHT+IG4DLzVoYDK294Ku6Vjd08TVjHsUCzPROxKoUjkMR0faA4MYffuLo4qVtm78hvUVl9MUuy5bw==
X-Received: by 2002:a05:6a00:23c6:b0:714:1a74:9953 with SMTP id d2e1a72fcca58-71dc5c9bc6fmr9630693b3a.16.1727938927450;
        Thu, 03 Oct 2024 00:02:07 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:02:07 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 8/9] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
Date: Thu,  3 Oct 2024 15:00:02 +0800
Message-ID: <20241003070139.1461472-9-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000208_326754_2616BF4A 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the primary and secondary dp-intf nodes.
These DP-INTF hardware IPs are the sink of the vdosys0 and vdosys1
display pipelines for the internal and external displays, respectively.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 541eaed59e8b..e77bd2b76128 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -24,6 +24,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
@@ -2450,6 +2452,18 @@ disp_dsi: dsi@1c008000 {
 			status = "disabled";
 		};
 
+		dp_intf0: dp-intf@1c015000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c015000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&vdosys0 CLK_VDO0_DP_INTF0>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			status = "disabled";
+		};
+
 		mutex0: mutex@1c016000 {
 			compatible = "mediatek,mt8188-disp-mutex";
 			reg = <0 0x1c016000 0 0x1000>;
@@ -2715,6 +2729,18 @@ merge4: merge@1c110000 {
 			mediatek,merge-fifo-en;
 		};
 
+		dp_intf1: dp-intf@1c113000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c113000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&vdosys1 CLK_VDO1_DP_INTF0_MMCK>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			status = "disabled";
+		};
+
 		ethdr0: ethdr@1c114000 {
 			compatible = "mediatek,mt8188-disp-ethdr", "mediatek,mt8195-disp-ethdr";
 			reg = <0 0x1c114000 0 0x1000>,
-- 
2.46.1.824.gd892dcdcdd-goog


