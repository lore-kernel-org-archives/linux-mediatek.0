Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BAFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmQUNMTD3VyXIkB2tB3mybGJhyK2AUpo8ImIwOmjIT0=; b=PccKscwmFqPUva
	saMTxiWB0Scozdo479nWb8anVBOZOwo/CeLkUpJCpCXlp02JbYNmz7dFdlrp4ducdNLDqjV9qhHW5
	X/hOJADrUHrSO+NXzQY4WMdVNnD3GYLWPNR8JTOkIO9fJ5tjROwVGzdXYnr94LN+KFci/Y7mtK4Cv
	cM5/GWMJW3Z5tIMjO/eyL9Ip5WBxZI+YA8rDgKtLzYUXbksTyO2SHkUx0Ddv1wiawotQK/xZxbTHs
	Dh+zn17dKe4Jl2CLaKs5Mq5foqUo9SMXf6gOWIhX9Prc9TCZmI++K+1J/PPTN1lBvEosrHrMdUYUf
	7tap7UWO7EBAp+r4kt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuXA-00FIKb-W3; Fri, 21 Jan 2022 14:04:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuVo-00FHhd-ME
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 14:03:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id c66so18152205wma.5
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loBYM0CvRSmbYDvfbUBNz4qYHn2wRGpqqQjyZhyXZLU=;
 b=IBdLRh3GfWtpz9wVQJ4xWuWdyqUBqcu2/DG846I5k5YYLKBKHhiL418mxXKdYBztaN
 qdXWkHF5UDFbawXQlr0ZzIea4m+fHilr3D6gUNN99tKSc2+5e3WwdD3XWcTzh8vUjorD
 Rtbfrg+NQsdJTOItj7h2sOOlMKjRuBmgHqyinlsUW6WS+GE1aOn/ABvcsMwnywrJJYde
 qUvL7VRhP0abO0aBWYyv3rW+k9qlOvdU+MKYW1FIcrUpooRTpevYryNFRz0rb6Xd51WG
 kOHOX4CuojJ5vHG07Tkl1V2MG9biEcOLWD6anj3eWiQEt+5DhoZs1PY2hjZ6HmeKd8i1
 HfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loBYM0CvRSmbYDvfbUBNz4qYHn2wRGpqqQjyZhyXZLU=;
 b=vXNT5nPOS32TApKWotypPe8HKNl0/mzGn+r2BDZLzG2kjlBEgS8GFFvh4pZdhyoJbz
 nmJ+stchHagIF7fbv7XROyJPhcX3p7/YfFqHcrrc7m9uRFrQm5dRi+wn96neqbKSdDWS
 43XHFhbLr3bWpkcY3Ryp29M27h6Y1L2IPsB5VaqAOZ44jeOXgttwHCxmSLy6kEsbxFGL
 S5Y2ZL0s61ROB8HfraTRIMx/v78kHvow0l+Ilc2wrh0V7YdLklXMOsUFRfxwVe6izW9C
 z+tXZcMmQYxpmWk2TaV6WSx3qf1bRuEy0XDk5cYa0uDVl+h1Bajp4Muy0x6VMlSTk7gx
 mfHQ==
X-Gm-Message-State: AOAM5331qouiWqV4LLdq6hJShqiGxXjBnwTn9W51JgCBq360A/ahwCZS
 ycIQ4H03xhhojZoG41wu8211Fw==
X-Google-Smtp-Source: ABdhPJydtfNsdqeZZA9fWZU8clNybEl4YDGRvOfTL+ORNNu48acgumv2Axn2vVIs5i6oDvNkpO+iHw==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr3858530wrt.327.1642773810915; 
 Fri, 21 Jan 2022 06:03:30 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr.
 [86.201.52.205])
 by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 06:03:30 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v4 4/4] arm64: dts: mt6358: add mt6358-keys node
Date: Fri, 21 Jan 2022 15:03:23 +0100
Message-Id: <20220121140323.4080640-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060332_759989_818DE410 
X-CRM114-Status: UNSURE (   9.68  )
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

This enables the power,home keys on MediaTek boards with a mt6358 pmic.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 95145076b7e6..98f3b0e0c9f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 MediaTek Inc.
  */
+#include <dt-bindings/input/input.h>
 
 &pwrap {
 	pmic: mt6358 {
@@ -357,5 +358,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
 		mt6358rtc: mt6358rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6358keys: mt6358keys {
+			compatible = "mediatek,mt6358-keys";
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+			home {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
 	};
 };
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
