Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A25BC5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=; b=GMEQOt5D0b9suO9nhWfIZTqY4K
	8+rscdwWyAZ1ah6KiJfK5j+8hkcscIgTvB8hSRjkGW2vQAj/YoeKDw/T1ooAmqW3G7jrbS5+xBby6
	AXDXy1zJtqnouGCVpMVSgKtAF8JD4baANErUFMmPHDbQ2zYvNo+aNCgF/ZSqiGyWHXR7zOwa0Vgv1
	rkl6FLXoJUXNfEWSx6anzBOrYcWFsFKPfzKmVnoDZdj5anRDOE+5HcAOqBkg8O74CRBMm+ewH0Ykj
	iAjUtpYuxL2YcjH7VyuGnLVaOwj+SgWlIjudPDx9w4RltqSBfcBac7NVwC2eTDpLSCAES2z3BvkXJ
	hfTUH21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJwT-00000004Kjv-0IGf;
	Tue, 20 Aug 2024 08:10:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJto-00000004K1D-1SKm
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 08:07:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7106cf5771bso4239665b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724141247; x=1724746047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
        b=Nq7WgY8XTWOfZ0B1PqYBcyTxzt4zQt6F7S54FJ02MVdJVnBU+MJnov5ZWOEfbaGBMU
         ahvW1cDdgDfqDDMF9kxgMBKH5fuX72NRpKFCYPlX/6OUKp2U9L/DpuxZhvFoRi882UHo
         ngZJ5azaOTTxIYapGue7pdXas2ophoJ3Z1ozY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141247; x=1724746047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
        b=sEb/L1E3tp4ObRDeaIkcOiAgUFSr+TKNJE+oSdGzFLQ49gdDpyQx81fpn0dK/fT/BS
         TaRN+BsfYlnQmfZOZlbGncPKN1S3NOjJndXnmxmhYdyBi07IftZIS9uJ6p5CNMiVvNG4
         KcMH7VblMsnuFBSlo03VwRAsmGeTPgTwraMkCfoQAbrVmHeceoMIBM66IjroO0+9SrI9
         JfHPMCQyS7FRiQrxpugfkWmuKpeHSG9xt6pYkO2WeF3vTVfl3kYqZU6rQ30mOoYqFG3G
         fS/C75jhbXUMNheEP9IITnoMDExxYgwyDDsJHJEvuAC2zYaAm+vrqXPxvkkxX00PyQMW
         PcTw==
X-Forwarded-Encrypted: i=1; AJvYcCXcOQnscJcqrC3rfj3ICOZNZqmqdnSFTJH4hGg5EsCxbzHzzrtUwOI7vxtdkR5jOlAOJkXTjQAON7Kr4EEjWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMBl9edFpuZDd6u7XkwVRXSUzj1MeTsy3+m7tX7pGdoOUcrSIc
	+6xWsczDACYx/tDCVQwXdudelHlbLTg34AGZBQv89KH8qy4eoo2W50ZqiE3nyA==
X-Google-Smtp-Source: AGHT+IEPf1X/OGkNUtPINTfo4AoKkECt270oSCWZe/9fyUNP+Ezk7UPgYKjiJPWONz6oyBub6ygygA==
X-Received: by 2002:a05:6a00:1a8f:b0:714:1310:15dc with SMTP id d2e1a72fcca58-71413101623mr287077b3a.17.1724141246957;
        Tue, 20 Aug 2024 01:07:26 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7141556ad97sm250991b3a.167.2024.08.20.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:07:26 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Tue, 20 Aug 2024 08:06:59 +0000
Message-ID: <20240820080659.2136906-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240820080659.2136906-1-rohiagar@chromium.org>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_010728_455338_559DBFE2 
X-CRM114-Status: UNSURE (   8.99  )
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e27c69ec8bdd..a51f3d8ce745 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		svs: svs@1100b000 {
+			compatible = "mediatek,mt8186-svs";
+			reg = <0 0x1100b000 0 0x400>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_e_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg_ao MT8186_INFRA_PTP_CTRL_RST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1676,6 +1688,14 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			lvts_e_data1: data@1cc {
+				reg = <0x1cc 0x14>;
+			};
+
+			svs_calibration: calib@550 {
+				reg = <0x550 0x50>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
-- 
2.46.0.295.g3b9ea8a38a-goog


