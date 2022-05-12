Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPksM7OCPmsZ44jx2r8mFmTAlpLyEkkBzn/qs+2mO04=; b=G4LHBYfw9Bw2H1
	d0WZKR/6BbMySdUqGi/SFGE/n9TJF6kznsyvceABsPpeAf76XP62XXnBwozlK5OP9Mu+vKQpEI2Iw
	spQgPSuNxNqRIA/duZVJwKWNiSkShSn0TfKhIGIjAGVncaqIeTv/K4LWBEgr08n76IsM5GCB1vMp7
	0ws9SwF7vCDn2EzFzJRR3UHQHjDxGF3Wvb4fvcdvxtDRaOGeV7WO2ituiygKmjKZuffxgzMRiyIdg
	j3y6NbI/qDvg9GZg+N39W4LmhM3ZNigEdEXZMExpXhpDA2tJKqubtoflNkNcRy9XWjRrlsCr1Jkkk
	issUm3Q1fNErrjW4p/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np8uL-00C5lL-VL; Thu, 12 May 2022 13:31:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s4-00BmM1-U3
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id j25so6004920wrc.9
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=befZQ9FS23fWMFZgR26WPFKtinCTSI/vcnKTdqrsD2I=;
 b=3BHa3XT/PM1d1Fqi4xdlw28bRsyHbtLMKPZ3xkV1jdTvwnDc4q2bNcQ7kJkdQqg2PG
 ooi6aQOfiOzLrON7fQvWJQHbOEFE1bXmTqDtJfD2uhBwfqsTPcwh23AVpQ2qO0zH/O3/
 AV4mGC+ARmcDMVCotPPZkyyvkqbjDeVluw7uOg6vG95WukWDTm76nWqLWuiqvPFZCkSK
 a/+8/aQicU0gw32smoTPprxZLzqH5r8x5vGutquYVlUh38sRJ2K9G4S+UnfSijBUP0Ey
 8dlgbR/MCauaFiOLg5bBREaJz3FqgsXlqhf7Ew1Ghva9ZT6WTCSbrrZ1/N/dJBtXbpZL
 8+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=befZQ9FS23fWMFZgR26WPFKtinCTSI/vcnKTdqrsD2I=;
 b=AILpcECJaGL+7eRtGzerWvng/H7OntGjFt74Xe15541eAhV0Svw/ze5jBRWhD9/UnQ
 QNzmXdsA0Ghtnxme/obNJNzd1b6de/wFbkwjeEeMYktVc6w0k1ushL/z4rDsZYxEDw3m
 tbhSDuqGOd7Xr1xtrJU2R/yUWXF1sI0zMNbH/IVd0cp5TfrW4F0YehMggCnJ4XQ38Pfr
 Ij5S4q4KZcTRfLEWNbsb518n0JI+6i+6PAY2KAGOqeI51YvrBDdymzhNMTJ4zhecPOzl
 En7Z3NpefJ4GwVs4X0lIENo/uZPSow1tJLYlbqBv+4q64aP0JcCkvrk25F2NVcOQ8S0m
 tYDg==
X-Gm-Message-State: AOAM530TtJgtTdiQcKI8qX/Uw/sxlkAyG68SkfI5sbxAXb37odW1iBHA
 8/UVEzJlGXPCO1U65l/mp0dDYw==
X-Google-Smtp-Source: ABdhPJzl2RnwuKtjp0w2JW5qr0wn4jOfQ9nztXnOxQtRwboK1PADSs7vYj8oT4mnuqSVmq7o/fDkmA==
X-Received: by 2002:a5d:47ca:0:b0:20c:72c9:d3be with SMTP id
 o10-20020a5d47ca000000b0020c72c9d3bemr26671903wrc.114.1652358283467; 
 Thu, 12 May 2022 05:24:43 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:43 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 6/7] arm64: dts: mt8195: Add efuse node to mt8195
Date: Thu, 12 May 2022 14:24:32 +0200
Message-Id: <20220512122433.1399802-7-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052445_041384_183071C7 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, rui.zhang@intel.com,
 ben.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds the efuse node. This will be required by the thermal driver
to get the calibration data.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 416d37e07324..12887fb4d0d1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/ti-syscon.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -1248,6 +1249,23 @@ nor_flash: spi@1132c000 {
 			status = "disabled";
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			lvts_e_data1: data1 {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_e_data2: data1-1 {
+				reg = <0x1d0 0x38>;
+			};
+			svs_calibration: calib@580 {
+				reg = <0x580 0x64>;
+			};
+		};
+
 		u3phy2: t-phy@11c40000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
 			#address-cells = <1>;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
