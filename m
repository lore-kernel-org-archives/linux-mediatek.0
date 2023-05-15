Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16B5C7EE26
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 20:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM/irCXkCORVs1tf0J/YTFzQeu/14yX91bXMA72ZW5U=; b=MW3gamuCYB+DluoJQg2Nn/BtTz
	4yPGi5e+P7PhxKugMJsQQKEfka/d6Q5LZ8KbseHxxaJe4elDk5pnxD2loCFtIOzLUr25a42ST09VK
	vgbawdeVC6J0ovDSEJAY6JeUnKfoYcZUsD87N7IAZdiLSM4uoJfYlp2iQd1wtqtc6gnQzqJi42Yuv
	+/Wlgm9qeVkqQMQg7jhrlvY5d+pvtBt+uZJLHbJ15BFgfOdePq4Hh7o2x8FaeIenndWb2xNbipOSf
	UD16mdVpdHuEmtR92seZuLAcxWYbkVrjRU4guVWr/RiOhsP5E+WXSzxDR3qVdjEsEn08/2Av3ms1n
	uMGCDmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecK-003P7T-2t;
	Mon, 15 May 2023 20:16:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecD-003P0v-1j
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 20:16:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643b60855c8so11379958b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 13:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684181777; x=1686773777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM/irCXkCORVs1tf0J/YTFzQeu/14yX91bXMA72ZW5U=;
        b=K0+Zkz4GdFPHRuwRz6zdEsbA+lXj9VAwwuAFNi/uqRKAzSyUQ3GEPrRLWI8PkADOkI
         lGqIQ901J1tMCxacLaXJZC6XFLvMELhtxu9QDf3Qq/XiptE0pMNQC9PZbXPqib6VGrM0
         DGcwlS8gGGj9LRADnOkCvYBwy1d//nqfUOBLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684181777; x=1686773777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM/irCXkCORVs1tf0J/YTFzQeu/14yX91bXMA72ZW5U=;
        b=gipHI8Mzaqmx1AsOOnynPkAlXQMHttPGIXvqTlY1D7utoTFkXMJ8WOtmoNqiUwdqmY
         hNSC17EGJUsl5z7clSCh74H6o8pK03LUpihaEDSi/Rs/0K1Ayo2BkBkP6w6Zrno+BWxh
         VTp+oVw7EydKLBQyryw8x9sKqggbuhogCzzQgk2dTSifAIMjdD5wH/UJtu1++C6O+h50
         OK3yNJM/HP0NQMYxTfVK96L6fms5YvigrH1QDOQdLKW4VbjcUJRwWZEmz/y98oP5JANV
         2yVu4whAq6cfPQvHgbYB8yrGibq5OaMReD4IDqhPds3VgMk/BiVhVqpRkxzQOxFIpqmD
         Ikpg==
X-Gm-Message-State: AC+VfDzJ+xVYcFBeHv4mDT2ow4th2jGE6x75aNDtrHImXzCwyVzkzBbG
	dQnsSqO3qGrBYNrbaqJhJ8BWhw==
X-Google-Smtp-Source: ACHHUZ5ivSNt4ORDYSAE06hFa+3QjYHpxRE1M4IEyYc28jIBV7ZY1zm248z55ssOvgBip8+BrELm7A==
X-Received: by 2002:a05:6a00:1828:b0:643:6f76:f9ba with SMTP id y40-20020a056a00182800b006436f76f9bamr49643580pfa.29.1684181776830;
        Mon, 15 May 2023 13:16:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9f33:9d98:277a:d4cd])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0063f0c9eadc7sm7981411pff.200.2023.05.15.13.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:16:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wenst@chromium.org,
	yidilin@chromium.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8195: Add mediatek,broken-save-restore-fw to cherry
Date: Mon, 15 May 2023 13:13:54 -0700
Message-ID: <20230515131353.v2.5.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230515131353.v2.cover@dianders>
References: <20230515131353.v2.cover@dianders>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_131617_578458_3F2F4BC2 
X-CRM114-Status: GOOD (  10.66  )
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

Firmware shipped on mt8195 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: 5eb2e303ec6b ("arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato")
Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Changed "Fixes" tag.
- Moved from mt8195.dtsi to mt8195-cherry.dtsi
- mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 8ac80a136c37..f2d0726546c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -255,6 +255,10 @@ dptx_out: endpoint {
 	};
 };
 
+&gic {
+	mediatek,broken-save-restore-fw;
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&mt6315_7_vbuck1>;
-- 
2.40.1.606.ga4b1b128d6-goog


