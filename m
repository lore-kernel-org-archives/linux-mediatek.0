Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547CC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTijVW/c0PheiETrLzEjcgWKlXvandGPfKwnTsYZzSY=; b=3/P2sk2CEvbtWuJZKOYtMJYuSK
	hpxYJ4J1sifeH+q2Oia56kLIJFlmWRt/EOr+IsPCPIrR0nAkpsG8Q8SdwfdV4bxKG9TNY65cV8cGH
	MQoQw+wMPPu7l1PLRjw/C6lake/JDED1wzsNcNZAD8rb6cKIed4KkzuNv6jYrAugeSwBZ52f3cDoI
	MNJKhCi6V2v0hUx+1fewMR7wFrSbzNpy1cgPxHcpn0wiEGTQrBXnwk4k0Gi5TVY/SfJs+LBcprOFe
	N85ErUam0gbXAC80HIU7o+hKXYh+vM+SOR8AhLedG4wGm3TlgN/Ien/mS7+8hniflVLEWb89GPoU5
	2RSorbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKDX-0000000Bxik-1KCO;
	Wed, 12 Jun 2024 09:24:31 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKDU-0000000Bxgn-1pfB
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 09:24:30 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52bc274f438so2785618e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718184266; x=1718789066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTijVW/c0PheiETrLzEjcgWKlXvandGPfKwnTsYZzSY=;
        b=zMtkyyguvnvr7W/p1hooR9a0qKfHIzKdAT26E7vu8etdFafvRut0ZQVa0mJyEqG3gs
         psWc0jwxJgVWq5m/fDVeofVRwO0hOLQtMbkRje/8FPCZlrlLnmip8/pB5gqIY9IaWJsp
         FdLfCguorgx72dOms6OosZylcVSell0wdofOX+nXLVkUptuTAgwvXgzj3syaJQgC/PqG
         uUdOgQ/mnoC//C3cyI5yytSNjaFrT3ZqtL6qjtLDl3TUCRff6hPlslOTVmKLUNJRU3HI
         ocR2fWxC0cpUwHxwsyd7OEYdoZnEd/kNKLWH6YzrgBno6nmymGoG+kNFy1inZERvNPX0
         qQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184266; x=1718789066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTijVW/c0PheiETrLzEjcgWKlXvandGPfKwnTsYZzSY=;
        b=fL/SwcN2wABP0eJtZ99u8cCnI2j3WeE4eWlIT8PnZ619Okrf1k2qrcZ3UR5sOCT0+C
         +WWP9XlbqNLo4ZYq0JPvIbuyqdQn1gu1GQnD1BvUpaaQREgrW0X8JnC31D5QPLsI5TUu
         XtM36AKEIsr7fmNIvtgTFu9Hz6PnkjVMmBg5aTX+Ms+jKgTX9uxFwtgNrB0womd1BYva
         ecd8+YuZkPC+XCRPQrYoOPGhEAZ5aVE4OBZ7W1BHgA7lCjO+3163eVEwu0jyr6ytTVHZ
         HCY14Tf+L1Emfogrc+e2G/n+YPYx4wCAt2U3lgDXSHIBrjzFPvKSeFtVuBb7lRSmklBh
         0IIg==
X-Forwarded-Encrypted: i=1; AJvYcCVCnX3uoYAvUCLt7rI4qGluzU8eIxAt6eWQKRcRxoRKai934K5hYbsKeuhKUypvWQvQ7MsOOGJqOabSI+F+O/oQMbVwZc0Sw2Dz5vPOvvZDTaDe
X-Gm-Message-State: AOJu0YxzGFMjKAVWrwbzN9xhW6DFtQhFM03i/theECr9/R14Ca0WlljB
	/5jj2SUypQswVZCwCsTnU9i+DHfzSfrX65AVdGB9Taiov0i/0docmbcwuplg01s=
X-Google-Smtp-Source: AGHT+IFqaCEnIiWKhTWBfjOSEjjiN9fP7XZI9ln5o7b24/sAj4EADCaVdyrAYctm8l1H4IcbPLFHgg==
X-Received: by 2002:a05:6512:1245:b0:52c:95d1:87ae with SMTP id 2adb3069b0e04-52c9a3b7bffmr1099334e87.12.1718184265932;
        Wed, 12 Jun 2024 02:24:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c82faf1b7sm1623806e87.130.2024.06.12.02.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:24:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: mediatek: mt8365: drop incorrect power-domain-cells
Date: Wed, 12 Jun 2024 11:24:19 +0200
Message-ID: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_022428_507171_5C22547D 
X-CRM114-Status: UNSURE (   9.18  )
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

The top SCPSYS node is not a power domain provider.  It's child
"power-controller" is instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Reverse patches.
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..455c2ae3b30a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -302,7 +302,6 @@ syscfg_pctl: syscfg-pctl@10005000 {
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8365-syscfg", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
-			#power-domain-cells = <1>;
 
 			/* System Power Manager */
 			spm: power-controller {
-- 
2.43.0


