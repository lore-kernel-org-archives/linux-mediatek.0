Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E8CEE4991
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRJU0t6yYHxtxWleBKO67lBHd41mlkKGaUj6trBU+Ss=; b=FTautrLFVMowIY
	o6nQYMg9WGAVBl+5CdDp7d3O8jtjAH1T7ZB8tdt9mqTdgbE1g0uAxZFMIVS6JYTI8zmiTy5NtC8Gt
	TLV8OIfyoWwfiRxDUv+LmIcIn5MOKYu2x+3rB7yKe3Y7H9QDzN+jATMBvUtM0jfW1VYZsOkDYpfS2
	iETdi/KbWLASWkB6okAZ3IQ+qBCL+6bQQ8tHI2I0C+1CO0cPkNK5wtdnNARi6bQe+KyKZLzRJ9yrk
	y2yrZrjA5CDGTLrL6SPp8zVj+6FEIrULXTDfwx4HVq9ognJyoDk11EYXS24AxTi6zspjoSNhFjJuN
	n7BFQ4lDfZreBNLjWWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLCJ-00000009EEl-3uLO;
	Wed, 11 Sep 2024 11:07:43 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxS-00000009Ayy-1sXe
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso4615548a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051941; x=1726656741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRJU0t6yYHxtxWleBKO67lBHd41mlkKGaUj6trBU+Ss=;
        b=cR/UPylYmVdvwWpSzzHPy8TrXCSFdqjuqhUv/TY7aDx9aAvhb+8atyiS+JtcwhjVjf
         gdy4kUPzD6aEpubEChCIe04N0ierHSEmqWnaoB8EzL4oK5p9QhCEATTDbTIDijF8bgPu
         uXncJnuIVg+MiLpCGfClVSPilf/H3mEAUA7ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051941; x=1726656741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRJU0t6yYHxtxWleBKO67lBHd41mlkKGaUj6trBU+Ss=;
        b=JcQloWl7QD4FbxJzJtfl7PoWXGfbmHt3zMDFLbNBSGmGl3jdD/lo3i/62dWYE8Wt1Q
         Vo0ySGluQJi0wPsO+tW8oWsHNl/FMOV4TOImhK/IcGwiBO55DZS9mRDtgsOWVY2PC5jd
         ZshhIM2ZFkQHyayxZLM41ju56Oo34Flz9ogAusVRjO81ESCZQ2+APFZN/fJFB7pbAEuE
         DVhMaaU0tzhjiC1k/Hnh9GsZCDX7xI4eSs2WHcK5pb80aCOUm0mq4HOmSWpVSKVbZV52
         yCTncPE5OWLx+oUrUueBiK2JEKUL/W+oFKA9aWz13k43766HWWUdC57IfOugpohQrTmi
         3NBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSxnzaVdGU+4ECTATuNXNKwscbu3B6JFXCmQnYEOflvnc5aDYUKYVrDlGFAdi44Qi7epSqN4zndCpV+FbX3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDR0iYBWw3A+F4zrL6QfsHI02oIv05W7fay3msGdvXBG2YZcXA
	V4BNQiF9VQOZnpZXA3vYXqgjR9Db+DBc+UOJx8M50TJiW1k3mnHTVDF5IHJ+Ig==
X-Google-Smtp-Source: AGHT+IECm7bSQDC8ZsxIXjMTAElbncL0v7wsrCPb3dyLQVmVYtqmVb6fO9ZMVHxPt6utNaXN13eKCw==
X-Received: by 2002:a05:6a20:cd0e:b0:1cf:50e6:fee4 with SMTP id adf61e73a8af0-1cf5e19f82fmr5867984637.49.1726051941085;
        Wed, 11 Sep 2024 03:52:21 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:20 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 7/8] arm64: dts: mediatek: mt8188: Add audio support
Date: Wed, 11 Sep 2024 18:51:12 +0800
Message-ID: <20240911105131.4094027-8-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035222_498528_A239C820 
X-CRM114-Status: GOOD (  10.58  )
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

Add following nodes to support audio enablement on MT8188 SoC:
- sound card
- audio controller (AFE)
- audio DSP and its associated mailboxes

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Replace hardcoded AFE reset ID with correct definition

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 96 ++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 32e5b7108f6a..f459e86d4024 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -429,6 +429,11 @@ psci {
 		method = "smc";
 	};
 
+	sound: sound {
+		mediatek,platform = <&afe>;
+		status = "disabled";
+	};
+
 	thermal_zones: thermal-zones {
 		cpu-little0-thermal {
 			polling-delay = <1000>;
@@ -1349,6 +1354,97 @@ scp: scp@10500000 {
 			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		afe: audio-controller@10b10000 {
+			compatible = "mediatek,mt8188-afe";
+			reg = <0 0x10b10000 0 0x10000>;
+			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
+			assigned-clock-parents =  <&clk26m>;
+			clocks = <&clk26m>,
+				 <&apmixedsys CLK_APMIXED_APLL1>,
+				 <&apmixedsys CLK_APMIXED_APLL2>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV3>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV9>,
+				 <&topckgen CLK_TOP_A1SYS_HP>,
+				 <&topckgen CLK_TOP_AUD_INTBUS>,
+				 <&topckgen CLK_TOP_AUDIO_H>,
+				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
+				 <&topckgen CLK_TOP_DPTX>,
+				 <&topckgen CLK_TOP_I2SO1>,
+				 <&topckgen CLK_TOP_I2SO2>,
+				 <&topckgen CLK_TOP_I2SI1>,
+				 <&topckgen CLK_TOP_I2SI2>,
+				 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>,
+				 <&topckgen CLK_TOP_APLL1_D4>,
+				 <&topckgen CLK_TOP_APLL2_D4>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
+				 <&topckgen CLK_TOP_A2SYS>,
+				 <&topckgen CLK_TOP_AUD_IEC>;
+			clock-names = "clk26m",
+				      "apll1",
+				      "apll2",
+				      "apll12_div0",
+				      "apll12_div1",
+				      "apll12_div2",
+				      "apll12_div3",
+				      "apll12_div9",
+				      "top_a1sys_hp",
+				      "top_aud_intbus",
+				      "top_audio_h",
+				      "top_audio_local_bus",
+				      "top_dptx",
+				      "top_i2so1",
+				      "top_i2so2",
+				      "top_i2si1",
+				      "top_i2si2",
+				      "adsp_audio_26m",
+				      "apll1_d4",
+				      "apll2_d4",
+				      "apll12_div4",
+				      "top_a2sys",
+				      "top_aud_iec";
+			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_AUDIO>;
+			resets = <&watchdog MT8188_TOPRGU_AUDIO_SW_RST>;
+			reset-names = "audiosys";
+			mediatek,infracfg = <&infracfg_ao>;
+			mediatek,topckgen = <&topckgen>;
+			status = "disabled";
+		};
+
+		adsp: adsp@10b80000 {
+			compatible = "mediatek,mt8188-dsp";
+			reg = <0 0x10b80000 0 0x2000>,
+			      <0 0x10d00000 0 0x80000>,
+			      <0 0x10b8b000 0 0x100>,
+			      <0 0x10b8f000 0 0x1000>;
+			reg-names = "cfg", "sram", "sec", "bus";
+			assigned-clocks = <&topckgen CLK_TOP_ADSP>;
+			clocks = <&topckgen CLK_TOP_ADSP>,
+				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
+			clock-names = "audiodsp", "adsp_bus";
+			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+			mbox-names = "rx", "tx";
+			power-domains = <&spm MT8188_POWER_DOMAIN_ADSP>;
+			status = "disabled";
+		};
+
+		adsp_mailbox0: mailbox@10b86000 {
+			compatible = "mediatek,mt8188-adsp-mbox", "mediatek,mt8186-adsp-mbox";
+			reg = <0 0x10b86100 0 0x1000>;
+			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <0>;
+		};
+
+		adsp_mailbox1: mailbox@10b87000 {
+			compatible = "mediatek,mt8188-adsp-mbox", "mediatek,mt8186-adsp-mbox";
+			reg = <0 0x10b87100 0 0x1000>;
+			interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <0>;
+		};
+
 		adsp_audio26m: clock-controller@10b91100 {
 			compatible = "mediatek,mt8188-adsp-audio26m";
 			reg = <0 0x10b91100 0 0x100>;
-- 
2.46.0.598.g6f2099f65c-goog


