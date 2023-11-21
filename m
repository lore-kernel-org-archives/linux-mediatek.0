Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FABC61D97
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/wsfGTD4qIPzV9aYVLPlzsDTVh1NFbKfRsNkAhi+fc=; b=PYuEJUOSWFvArOjemCkIEqO9Nd
	Dsr4EYb8t3TgeR7RwluqSbhVsDZkfKxJ9XkYJ8qyWQOy0c0uC4j/ovMJTiMYHiypeHQCNYnUIUpbL
	Doq5pG/hIzupQdt+9qiZvbFpvQ/jsEoKSQfl70AooDA751c1VRBAKOTlYxCbJHMELT53bcJYCyo1I
	kZ4l2yzUchL83idxB2KH+tLhAdr6JjFoagJI+nKz98xAmPkPX4z4AE4y5mQhzfVywLNpI1fLzu2r8
	mCiA+OQ5GZ+eqArauFqfJrm8INOBIwa9/B1KRmgBFjBexCKsQhxsHFE6tow8Qv71V5ZHrrejDfWQl
	NMq4b6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNf-00Gdn9-18;
	Tue, 21 Nov 2023 11:57:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNA-00GdGe-1i;
	Tue, 21 Nov 2023 11:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=g/wsfGTD4qIPzV9aYVLPlzsDTVh1NFbKfRsNkAhi+fc=; b=ejhPtUUTakxIa4YPSjcEW/k0au
	05pgQXpt6HhAQ/4TpqEwbwP3o5YTOyxJkwxS9fhDfq7HeNLMhbbf/PjoJvSq0aAI5rHiIvgmhq7tC
	huziNO7XNC5o0EtnHOD+QC3D+DYEDqodnDk8rypFdsNurxWLnBRfxYJQZLDoMyCByYbbcYKZ7zSGZ
	XtPcMeDJL63KICcuoe9+LfdCHMIFQc4I67+mLlokErIf2RG280FW7sRExbNMAUYEH43alZYhn2gYy
	Ty7pmLbTW8I2VeTmra3VIZ1nOt99skn0Xi6oCNOqSaMp+pCHcKJ6ByKHSKsIwf0NHaoZqCFOJs4M7
	lZawFrhQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PN6-00BQQX-1X;
	Tue, 21 Nov 2023 11:56:54 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1D1A6607314;
	Tue, 21 Nov 2023 11:56:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567811;
	bh=7Is9gmN9hkuGxy+sJrNkxtzwuNgilsJCxJ9IKhqUks4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aPvhaS6wJe5G/gRUKtyQrhc2GTcWtRZlIA8mgqEXXZAPvvjDoIc3ZNlC0hBzCAfyY
	 EMu18y6aUc5PkXxV4VICK/5rK2tZ7PadPSbOKoVNSHNseLAqFSSA8zPAAPiEbakDMt
	 oJDkksK8RBdTQkcbCgEwElmtV2Xi50QCTTrW8Tu4K9en4SREPxctigi8YdaqrxDXNL
	 o4pbEVdlGobEK+6OvAsgNeDpu68ut7OWoesinj1OWUZIgo28sNLwoKTWQZuIBTi389
	 kZtsUM4qesLgaoaucYPiW7WoHXOgy9IfgT1/52r4PCIRkCIKyFJukPo///OzSRdEVk
	 0KuI5pfpVSSYQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 19/20] arm64: dts: mediatek: mt8192: Add Smart Voltage Scaling node
Date: Tue, 21 Nov 2023 12:56:23 +0100
Message-ID: <20231121115624.56855-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_115653_091562_8F2D94D7 
X-CRM114-Status: UNSURE (   8.29  )
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

Add the MediaTek SVS node: this will lower the voltage of various
components of the SoC based on chip quality (read from fuses) in
order to save power and generate less heat.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 238f6eb25832..6dd32dbfb832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -809,6 +809,18 @@ lvts_ap: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		svs: svs@1100bc00 {
+			compatible = "mediatek,mt8192-svs";
+			reg = <0 0x1100bc00 0 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_e_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg MT8192_INFRA_RST3_THERM_CTRL_PTP_SWRST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
-- 
2.42.0


