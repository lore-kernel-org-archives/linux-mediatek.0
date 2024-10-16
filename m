Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B8DD2F7D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J0Sh3029V3MK51x11tytW0IURI4Fv8hVCwwtjTn58GU=; b=SwPBrRiZSP1IMEHx4jEs+2iGMm
	KMYA5t/wpdCYxZdxpBSR//NfAlo/te/2JmCYWArMqgEvEO6ZKg5QDrIfAgfiU2ImYZtuO4VHKXCwg
	+eBNL5GFCwY8vbstAAp1gI/p99BgVQMW2GbYd/ig89aPnE5Sb7iVrok4oHwYbQTE1SNRjzE7PW1VD
	6HNCULFWpN7QCPLCQmGAg+t3oEvSPOTIrwIX3yYr65mEo7TFiWa2PnFdlh2IHC1CnnFO60k7iGZ/k
	zE5bl3dpcIrmGyOqEc1A5kXevWJp2u0EqGXEWoU0DfrsjaQ16599xg2kyjETZFePZAPrzUFF2t/G1
	UC3cSCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ca2-0000000DA4P-31D4;
	Wed, 16 Oct 2024 22:33:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1CZz-0000000DA3i-3M2t
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 22:33:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c8c50fdd9so9935445ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729117998; x=1729722798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0Sh3029V3MK51x11tytW0IURI4Fv8hVCwwtjTn58GU=;
        b=OU7qCXQx2NKC+mGbTsrap5Ao2UlIM50d4N3yCfA9cUIjUHUxIhldVBKZX0fNVZO62g
         LLQ9Bt0FO2nSp6lyjDO02gTh1z5lUEAH3rOSWdkdlb5ZoRazgv3OXVBV+4XH1FudDv6g
         COPX4g/M6Hmv3dIvLb83QOIhaGIwDWdCc9IFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729117998; x=1729722798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0Sh3029V3MK51x11tytW0IURI4Fv8hVCwwtjTn58GU=;
        b=aT1wdrHUvQ/iMNPFWJ82PST0Rgn8w2YlLLpQCjQ71jXp/Y/OYdHCXkRMqZeFqvx34T
         7JB4rP0eF7ey0y2Ql/pjf2XHoFQHVL9aMkizacdVFUui+dbmj+slN+AXUllrc5h1vF5p
         zwLaoAXgzAZmBaAR5uG4uDc2XI778oTfLxLzI/rlSRU9nrmeDzQya8NF3ORBmS3mGahj
         mKvyiyHDDpdWmBI7Ikrg5i+kVwA7BcxWieQWOpE3Bpy8uoKFcA4pY17/H1jBdjjOxbAw
         2j62UbstqQh1eHDhq2N29XPF5IELKPPz6rurfWMjJ2kvovXSdc4/XeF7uVAgPv15DHni
         Espw==
X-Forwarded-Encrypted: i=1; AJvYcCXKyIfDiZG8YDvU/g5DML6p+FWV/atG5L+ttopq88Co2u504DVhQlfCcm/mtHHKU147OkPNOvnxYcs2GD+MOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7KS4WPDM8fvKd/8GegtUL+D3529zYYOvQDisjf0yao73VU2pm
	7gGQ9l4ee5QRIo5KGlYKuk1otC18wBptLU8Mks3NK+nAKp8CzZoKgjvYeEZlXpBWe7Nl5O4Ibhs
	=
X-Google-Smtp-Source: AGHT+IG0tsd413azSd2z2aQQ6JvNbIUWii6V7rLAFfiINNm/TURRGSMl6gwvfVgmDrvrJ5OSs6C+nw==
X-Received: by 2002:a17:903:181:b0:20c:ceaf:e65f with SMTP id d9443c01a7336-20d4797b143mr15638175ad.25.1729117998315;
        Wed, 16 Oct 2024 15:33:18 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:aab3:ae1c:d5a8:7fba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b040sm33441645ad.252.2024.10.16.15.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 15:33:18 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jitao Shi <jitao.shi@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mt8183: Add port node to mt8183.dtsi
Date: Thu, 17 Oct 2024 06:32:52 +0800
Message-ID: <20241016223312.3430051-1-treapking@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_153319_880537_831773CD 
X-CRM114-Status: GOOD (  10.96  )
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

Add the port node to fix the binding schema check. Also update
mt8183-kukui to reference the new port node.

Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
Fixes: 27eaf34df364 ("arm64: dts: mt8183: config dsi node")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 10 +++-------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  4 ++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 07ae3c8e897b..b7b3d8fbf1e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -280,14 +280,10 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port {
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
+&dsi_out {
+	remote-endpoint = <&panel_in>;
 };
 
 &dpi0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 1afeeb1155f5..e4899cd6fef1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1834,6 +1834,10 @@ dsi0: dsi@14014000 {
 			resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
+
+			port {
+				dsi_out: endpoint { };
+			};
 		};
 
 		dpi0: dpi@14015000 {
-- 
2.47.0.rc1.288.g06298d1525-goog


