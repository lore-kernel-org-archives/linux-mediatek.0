Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58537C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Aug 2024 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S7Br9pmxpWGWBK1ASt7BgnymbG5sO0VEPtoGkQEDSjI=; b=d2XTFEehaMnTmDyKyHMElfPZ6W
	vKamE/PhxWeIlbH3kWCDtIOL184NFp0taeP2appMxF6zpeMre3jOo/PxFm4A4Eb2K21P0DkB3D7Au
	uG0R9qn9wTRDaF/9b2E/Gf61Vg0SMvP9yOYJfIUxMd6cBn7pFVLI2oFMYFgh3HMj657bCXmD7KohN
	mMNAPTqKpC2Cgi9sTayKeEYr7kbYpYy+WrQhMilzP4NvDdbzIaLu295cAwjSLviPNU7jQzqBIl7tX
	5nhnxwH0dP+WNGDisQTIIYhUJqtfvE3XX3KkjVoAamHyfKgOBoCeMNSQoTLWNTYu7t8ph9KZSBVPD
	4MbjiHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmQR-00000007tLm-12SD;
	Fri, 02 Aug 2024 07:10:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmQN-00000007tJa-2s0J
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Aug 2024 07:10:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fd6ed7688cso65611685ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Aug 2024 00:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722582596; x=1723187396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Br9pmxpWGWBK1ASt7BgnymbG5sO0VEPtoGkQEDSjI=;
        b=d3K5lc8ePofR3GEs0DV29uwrPHCGfIr/zEpo8HGBRsvha1ms5kdbcIhJioiXbWD08a
         6Dn8KItY4kWiSavQwLE2qjS8/Lkp/l7FADPKu+L8mscjNvAx9NSe8Id1pCSivmD0D6On
         btostPILayxz9Vp7EW8mOritHXu0KSl31dXg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722582596; x=1723187396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7Br9pmxpWGWBK1ASt7BgnymbG5sO0VEPtoGkQEDSjI=;
        b=e+CLc0cs+/FZbFjWbcIAKmKD8yK74Hyr3CcX2goWk7GlnDKFjXe0+m6QVlSaxCBXQS
         8BmtuTc/Y36rV7GJgoI7zcOCt6vjcuHyU+PReyg65b0PM2buQRaMkhD8s/jxnIFeBc1F
         F04abpzHeKF8VNa1tnos1/nYJwQHjNiYjMXsd9Q8jXws4RJqtulniMAstZZKuAPJZI1y
         0Z6Sp3Y+fW0z31lS7Np2sHrwqxexWK8/fA2bcRWoQKBAeTpmO/mjgk/4+i9kymnBHva3
         7HRpF+Gx30yoqH9/rxvfemBHzhjcc1RCtVu8hzmvDV5pWqcqN704PZ+YaGgOrmaHcv8T
         FH0A==
X-Forwarded-Encrypted: i=1; AJvYcCX+uXYWJYAgN78o0PQ2tfMufRS++Kr+5WYwBeqVis0nrgtL1zKals65zVsSvsiy8ApTBljaRFcgAWA55oPMq/E+jkQVwG5FCs+iNlMVBZcA9Vem
X-Gm-Message-State: AOJu0YyAmaBHM8VosEzR8w0Rp4mqVjSfNsgVyPsx+0U1z7m0jPSiDiVu
	oJ001Pe6ZNvrqja50HKeo+RlJoNwyjJj9AbMnmP4K3tCIS4jvdv7vjQ8NwBA3Q==
X-Google-Smtp-Source: AGHT+IGLq0mErGqzzVN2fu1NHv5FwQg+WZUq33b12gl6nvqOLVq6lohDfRmMscu6BBut3VG69qGzww==
X-Received: by 2002:a17:903:182:b0:1ff:5135:130d with SMTP id d9443c01a7336-1ff57261cc7mr32752225ad.16.1722582595790;
        Fri, 02 Aug 2024 00:09:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f2e4:75b7:52fc:71cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19e15sm10228345ad.40.2024.08.02.00.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 00:09:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Correct clock order for dp_intf*
Date: Fri,  2 Aug 2024 15:09:50 +0800
Message-ID: <20240802070951.1086616-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_001004_155315_0A053886 
X-CRM114-Status: UNSURE (   9.80  )
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

The clocks for dp_intf* device nodes are given in the wrong order,
causing the binding validation to fail.

Fixes: 6c2503b5856a ("arm64: dts: mt8195: Add dp-intf nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 989e8ac545ac..e89ba384c4aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3252,10 +3252,10 @@ dp_intf0: dp-intf@1c015000 {
 			compatible = "mediatek,mt8195-dp-intf";
 			reg = <0 0x1c015000 0 0x1000>;
 			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
-				 <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&vdosys0  CLK_VDO0_DP_INTF0>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
-			clock-names = "engine", "pixel", "pll";
+			clock-names = "pixel", "engine", "pll";
 			status = "disabled";
 		};
 
@@ -3522,10 +3522,10 @@ dp_intf1: dp-intf@1c113000 {
 			reg = <0 0x1c113000 0 0x1000>;
 			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-			clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
-				 <&vdosys1 CLK_VDO1_DPINTF>,
+			clocks = <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
-			clock-names = "engine", "pixel", "pll";
+			clock-names = "pixel", "engine", "pll";
 			status = "disabled";
 		};
 
-- 
2.46.0.rc2.264.g509ed76dc8-goog


