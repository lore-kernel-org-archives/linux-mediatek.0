Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9A5CFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GN85sCKrVOA3tu4HmVxI2QI8ZoLBkf3gydcFUAN5vhA=; b=zpTvKIDCUCfTDK
	KV+8jVeDjnvfzvd0vYiU4mcy0h42Wxwyw+9XCbM4VzIZs9c0lh0Qofpn8tFh1BexSLgjcNbxDXFON
	O7sHZrWeAVTus0RFNjksRrEu6ATjk8a9MpPGlUTgs2FuYUpxZTC7EOHtyVZ3qDOMEQsiyo4WtUW3U
	EpVJhnruDC0tTql1X9SvrNxgopIKO5pJ4liJgYxAZliyT5o0aczXjhEl2/FaAiQdEvewbzzlj9pws
	8Izv9hbuLCtZPq6pB364bcDJxV+unq+1t4G/sJJ4tHVfGKDUBtkalf6+evjUiVOcv0rzL0c+NZqlH
	Ms3eLSEgkHQ+VmCbLScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdca-0000000BOmI-1a8U;
	Fri, 04 Oct 2024 08:25:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdR1-0000000BM8Z-2CU8
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:13:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20b0b2528d8so20935105ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029591; x=1728634391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN85sCKrVOA3tu4HmVxI2QI8ZoLBkf3gydcFUAN5vhA=;
        b=A8xTWO1nbObLHBqzoFKD+Da9d4Z4PoRCHrUOXl/ZVYQ0GU/BVTryXjvLj45OQtLyOK
         luzujJ0pZHxpN9S+IMabzFTqs1j3q2+qJhDUq1feHaNzLizl2wNf/QBvXZT71kffO0kp
         Rg4NaHDZkvGvcM3TKrnYcHKix+igz3FmIxPYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029591; x=1728634391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN85sCKrVOA3tu4HmVxI2QI8ZoLBkf3gydcFUAN5vhA=;
        b=FZ2oSD9fBNSxY7vEt9TjE15YiDwvdbfJi3ugwOYRZzp1jTm1lcQUEMJ1CmMTJuTNTP
         Ca04RhSo1snCsy6RCqGfjXXElg4kNuCYue5hIAXKE/LC2h9Lu8aqbFmq71UMdy9gs2up
         lEIQ4T2yLe5stPF+umeHVYJ/Kut27ee6gPNbXA1Ubjl6D0k/rWJwvYS7XlJc/Pbs/myl
         2Bten0NkN+aBztcRUPJ5JtqJ+2gOnReCemi63gQcG4hrwRt6z8Lg3iOT6n9NOkccaxmf
         o17Prxkv2tSNa4OR255ekas8VKK6vRUGy+yH9RIqwacCosv+FzzEwNgfrkmwcCC1f7wL
         ApmA==
X-Forwarded-Encrypted: i=1; AJvYcCXeOBIghbHJXg8++2Pnumtb5n/zhj0Ami5X3Ayq04pD7fzW5i0MksYhUrTgYSw99wxHxsL4agb78NA1D6deEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YziEFBdOzRVq9EEwV/eu7VDo3tRHnRRgSZQDRNY2b06u5QoWAGC
	8oh60Zlr/g6Nxgt9rLJsl10gFlG3g5DUpmiWHziOVUxeXTp2bNTgVTbm1ZIDhg==
X-Google-Smtp-Source: AGHT+IE6hBhfSi7O3sSuEyG5gBp6fSKltdiW7DF90nxxWftNyyRn2q94R5o8RRcdXS8Hi7NBzU9KiQ==
X-Received: by 2002:a17:903:2349:b0:20b:c1e4:2d77 with SMTP id d9443c01a7336-20bfe494b6dmr27155845ad.38.1728029590960;
        Fri, 04 Oct 2024 01:13:10 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:13:10 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 9/9] arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
Date: Fri,  4 Oct 2024 16:12:01 +0800
Message-ID: <20241004081218.55962-10-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011311_648454_22AA7C1D 
X-CRM114-Status: UNSURE (   9.48  )
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

Add edp-tx and dp-tx nodes for the Embedded DisplayPort (eDP) and
DisplayPort ports to connect to DP-INTF ports and panels, and add the
efuse cell for the DP calibration data.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 8864f1ead663..3b71d01d41cf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2021,6 +2021,10 @@ efuse: efuse@11f20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			dp_calib_data: dp-calib@1a0 {
+				reg = <0x1a0 0xc>;
+			};
+
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
@@ -2882,5 +2886,27 @@ padding7: padding@1c124000 {
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x4000 0x1000>;
 		};
+
+		edp_tx: edp-tx@1c500000 {
+			compatible = "mediatek,mt8188-edp-tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_EDP_TX>;
+			max-linkrate-mhz = <8100>;
+			status = "disabled";
+		};
+
+		dp_tx: dp-tx@1c600000 {
+			compatible = "mediatek,mt8188-dp-tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_DP_TX>;
+			max-linkrate-mhz = <5400>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.47.0.rc0.187.ge670bccf7e-goog


