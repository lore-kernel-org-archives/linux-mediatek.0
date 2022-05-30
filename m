Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8502C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 21:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fGhkVY1mkC/J2W6d9m9B6oLYCim/jCOsZuh//optkM0=; b=bOZuadYdPghz8g
	Ogn9LZtASncGaIzmiiojC02ZUsEIXGFwGr+33vZGhP+dWuKX7/Ykklg8gSRDAMgNP2Jx9x9Jcm8JS
	sKTzBUysOQXl5pKFxkc4UiXVvnkgLFs5Tv7wM2DKhWN7gOLgmhG47BXhAxuP34iGAvAqNA7gOx0bm
	x0JkxApJO5AGcWFzff7tqe6gs4/SaSnjzPM7iQc7UCwiUOpdXeuLn1SHEyMswriGSkQIW2/8hI28a
	+RPxMljrhtBYgQiBLibZ8bVemglrt1mV/RsxC0ZpMlv+oiONsaUtITbP62HrezsF4Y6KBW7kUVvGb
	0GQdQidsFgJOpfgGAWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmbM-008LBw-Oa; Mon, 30 May 2022 21:07:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmbI-008L96-Qf
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 21:06:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso207936wma.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 14:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4Dsh1MIN0xZI+gwJI4fdmqtKhkwKXeMWuLlT5BOjsQ=;
        b=OKrgQc11yJX8fKEPVNtBzhY21ZbZQAZal/ja/UUIIzsCs6+sNcHH2WixhvN2nxo2l3
         FNT+jV2PNa+JjuBlEkvQOJytcZmfw+V5wg/nrajT/5tDbxVRXfF/XiYY6LmQ1NEJybuK
         l4FrxW9a19JJbTz7ub6N+Uxg/u84OKsuTwASP1bzN69lv8B/llo9epRhEGR1KhRXsk8B
         6dDteDZmF81br7BHZiEN3eacOetqMHcsylMVBmN0YZVFB2CJLBCovPQsva02CUkpivti
         yUUBcB5c0XwUJf448eT+h5yoeDC3lWUS5HuprhstL8BKTMSYwvez+GWsPPyPRLb7gzPf
         dURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4Dsh1MIN0xZI+gwJI4fdmqtKhkwKXeMWuLlT5BOjsQ=;
        b=TzYQf80nfYEmmVWVvb+FMvCf6Jf3QTmLE8VgKuUWedTuF/TscMQkGa7X/VlErfInr1
         AudURI1UV4b0cvLG/0PChcHUDIkDMR62n9ZbTTCt9ry6SdWiUKStqUawxOGX9AGPmRIq
         VXQPtm7MhVQkmDi0b26kFZWC/6MFH60tqyH9Qp6JTcfRGU5Wyn9GRtTcPlB+jO2y4+s1
         B90xuf3IVawphhfTAr7zPy8D/ekgWWQXtgngDxywDYiTNpLCK3XQyF5AOHgPZJ3k+x5+
         QcxZkeTfojWyKtCmy4xJ8RUiPdySzOg0VtjQ6y00sYTKJCkTfDS+q6i/lR3oQL0sCWPQ
         s6QQ==
X-Gm-Message-State: AOAM5328R4t0882Lqh3HNYFxLBPgRgPlvQ8d9GD3VX2ChmHYHWIeZpN/
	+rGcks7IV3Tr8J+5To7tjHeTRQ==
X-Google-Smtp-Source: ABdhPJwG2tl1jXBhmNLSWLGoslj9EIocsj/Pg6OTboJM3vdwYny+rODj3GwjZ/Vcux1LDjwOK3eaaw==
X-Received: by 2002:a05:600c:3b02:b0:397:5cfb:b849 with SMTP id m2-20020a05600c3b0200b003975cfbb849mr20738067wms.183.1653944813393;
        Mon, 30 May 2022 14:06:53 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c15c700b003958af7d0c8sm270910wmf.45.2022.05.30.14.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 14:06:52 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pi-Hsun Shih <pihsun@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 1/2] arm64: dts: mt8183: add dpi node to mt8183
Date: Mon, 30 May 2022 23:06:39 +0200
Message-Id: <20220530210640.927733-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_140656_919148_ADC88321 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Pi-Hsun Shih <pihsun@chromium.org>

Add dpi node to mt8183.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 4b08691ed39e..49e662e34b36 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1507,6 +1507,17 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 		};
 
+		dpi0: dpi@14015000 {
+			compatible = "mediatek,mt8183-dpi";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DPI_IF>,
+				 <&mmsys CLK_MM_DPI_MM>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+		};
+
 		mutex: mutex@14016000 {
 			compatible = "mediatek,mt8183-disp-mutex";
 			reg = <0 0x14016000 0 0x1000>;
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
