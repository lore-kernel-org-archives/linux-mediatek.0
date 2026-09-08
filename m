Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12153C79FAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=; b=yu1614lTDmMyLTV8JJfGWgJyQU
	Bz6vShYT0St9oDICaTuH4cbYPmCKoWNJ/3k+Z+CELUZ12FCE4jtivifrDGtVPBBvJJn6T9BLAVROz
	7BNlOq6/zeUBLGXydZ1JjhzDxZ09DIPdJ+u8IIUsxcigmFaCiBN0+VLNsyz25Kk8qkfl8qWaJu9Op
	U7ONsO6wo603s+Kf7W2WMnPgAQ/5ucvFnGXxFf3LNawflwsOym1/nfHdIFuG26pe+nFSoWXt+VomG
	Z041JXTdgqomKu/AKOFUs2dLKWLA/mU0w7HcJDucWRFuGAboZ6LddedgoUMaTx5RZBQUPO0JEQaBR
	McYL+02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsA-00000009s4f-13BA;
	Tue, 08 Sep 2026 17:44:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009rvV-0m2e
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so69906985e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889474; x=1789494274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=;
        b=Cic/pxOmkZ3ajLCRihrNFGJSr0Mvq374hHJjOO3i6IdyzWSL4+CEUb298Jd/uAcCSE
         N17FgllqKbIgRKmUlHcQinDJN17L+GYpzFdnuu/FYzIqkePy2pky8cd60PotZXZX0n3X
         k4ZRkCNpmK7kDeH8+Jq9uSVfQ5aiF6LSEvBGJaWMYITcYm513Eito8eLrfsM5rSgMnhD
         7u7bfLniwpGrSTqCHGr+BHa8Isd6okfRKd2U7rpkBCU3fa3DeJtaf7HhPnUHNVtclP8P
         +1iltF4NZbkw14l1WGGGs9UbqqzYnz6ACuEf/+MvFXWOtpgDRIIvWs0gP9GBwOW9ZRG5
         4WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889474; x=1789494274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=;
        b=cmPKLnY2kh0WvovrlUqA6CEsJcAuoVWVb1V+Is1GPmt2dC9YhjfqXTRm1TzNA4reCp
         xcEjnaVozZmfycZlQoWqPX3C47aV5YrAcSJxbXptfxGtwPiXI6Rw7ClrFI+C7r6lUn/S
         MP/VXUInyNuJpUvOJhoj796Y97YS0uO3H62NeaCUDgqDJo/2C9JK5TZ9Es91Vx0EskfS
         pFyvPRkt8L2bKnJ72wc2oAsz/n1oaRWWNjaaakmdh9eHvQOHD01hTxFoaUy4sieCO/bH
         /jMkj2vPjbdbl2SexgCREGOzD6omiCSZhhS6fISnfhZCFfFr4dnaySRO8tIfyrEPhXrl
         RvKA==
X-Gm-Message-State: AFuF++k2B6YduoVHMEW5iMewt5lqBooxjpoxAB1fMj159GutSHmoS6/u
	HCrujGDobAMQumojG5YyPmNyEf0tU1HMkce81qsS6tH5BXCf+Vj/jSZ2eWMjpaUr
X-Gm-Gg: AYBFou1gRkYsFcrZej2xNiF1BD8klbrNKNVWzcZweQNpjFsQfEw/RiP3+Dc7GjxwDPd
	CT+tiYnBHUURH7OEijuB7zm2MkC0b/egCI3nEs900g0izAEsWlu51VJ7rxDCEwJ8ZeJ/hihyuAG
	WPy0BlRDej6IangyVsFyZQb7+bG94NXAHN2a3Qp2psYWPEEn6sD+LfmjDG2ov6I6NlNhNgzfpPW
	httNGwpgEaxiCkVm+73y9MEpCXMLd6qm48Y7peWHSKDHazLuOCMIbwGkepUrIjKefTmA5KfI8OX
	ARbc5zQJF8v9mUMpOr6Rh6FDvdj1+uI18ypQIv5hov8eKMwiH5y9I7/dELQFGOM2vWs1G6erpFc
	xIiiiz4HtM+sRrKS24eMIv3lOcqJMm3kqVApCsSDIjUvbZH5M7FzcSKBdX5KmgnDRbtRlfyUntH
	pdRvqnOpuwH1JFkCn0+VKqEzAlYtb5KmiiLagvjspfJxHJAe9DcFe05zef
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr238844095e9.9.1788889474128;
        Tue, 08 Sep 2026 10:44:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/8] arm64: dts: mt8167: Properly describe the SoC watchdog resets
Date: Tue,  8 Sep 2026 19:38:32 +0200
Message-ID: <20260908174259.9009-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104436_247036_5E245149 
X-CRM114-Status: GOOD (  11.59  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not really compatible with mt6589 (it has 14 sw
resets instead of 12, and the reset IDs are different from mt6589).

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..be215390730b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +96,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


