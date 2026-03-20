Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DBD109318F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8BTqnTP+MmFfu7yIevMNTcW0CwEuW3w6MEJfZCoELY=; b=Gf6QC84DowSMCw+oQ7WPliBqxS
	DgKfXVXBnbJeFQSZQpI6etwBR5TSwbvYocVhpk7MbGmUxxoPl+fCSwpO8wlMJkOTmyFyR8+/CPJiE
	fzlleiJ4+ZCLkpMFUTXRmtR+YQfy+HUDR9Eee8s58RyjsOgh8RroDEYwfbs9aiTQxwoR5tyDBxPSd
	cgOSXEbNL4rDxLuS0qTUjMoh6yRiJJjgA+MvoCzSbWmrjru9LjMKM1pxrAv2o5d8M1KRT9NiVYMzX
	r+JFO6L9spVkdmn2ItGrK+dQoRC87Y+CuA+xypHtGYBD/KcU07VDeJAY+nipRxvA+EJZiuDIKomcr
	pBccjo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSx-0000000CNth-2W9r;
	Fri, 20 Mar 2026 08:44:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSl-0000000CNhj-3JK2
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b0484a6de4so7610365ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996251; x=1774601051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8BTqnTP+MmFfu7yIevMNTcW0CwEuW3w6MEJfZCoELY=;
        b=XLgob3F76upCl1tjijDBqBzoY855dIDDLVoj44w/OYbQwssfj2xZXT1GI5/97KwJZr
         6IueFXkepu/SUP6xewm6LsGp9F8EndIEX7blDeOdY3QYfbdol+az0T0+LewPkhHAhBc4
         YvdUgQjJv47YVBpdMtvWSvmmKw8jnGBzFh5CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996251; x=1774601051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8BTqnTP+MmFfu7yIevMNTcW0CwEuW3w6MEJfZCoELY=;
        b=ICnawijakzJV11bGBGJEC0EHOZSuXmzwrBaERswrxOkOY2ag0sPgo3KI3biwGt89/y
         PK3Zco+xeLmB9Z1HZKN5pIry3KwddLkvIDb7ILD2Pb4505bnICr8LVGJ5E4MzwuC6cWj
         WLFX5QTn04KsKCBPO/QG6zYFBkh6iA9O/5uaSpgZinEa+x5uCqGeCTDWwreOAx+MAu52
         vwIDKGqVtBl9UcSsTUP3aznX8OONF82tNKpf/caHN1P43m4NUJmssiJHs89fld+BKNRG
         xeUqF5YUglVU7RQe/tyt3avmtamgOWLdWKVMkHtIIrxlj6+sYRt8GDirUrRy+XL3aECB
         SH2A==
X-Forwarded-Encrypted: i=1; AJvYcCVYJV7mjrmV8yIaGHV0vizLcLPGxO51pKr9SUPn2ovms6uZVKdsTUeOr9u8aHWPaXmzba8GSvKVz1AEMyvOKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh6QZWDprXojaF1BrUx6EzSvjjWJvDzMOonxGib6JSnzvWw9Ac
	F1DtVvvFo+rVRe+NqthLMLR9nbw7Ps/ZfboUGK84i27a00/W3f3blMOWSvFWi6yTaw==
X-Gm-Gg: ATEYQzxT59hY9Z/ZCFEcgKP5RPgzVtfqF6iL0zbc/LTX4fDx227P8Mj/TOSJjbhuyWC
	2G2xt+5iTIzHmJ54Bdd0Lzq09QZ/IY1SYvREN7fw8mqlA2WF8NccniPx7ig+X7NzxePlYRxFlqe
	Y8sAonIqSmhzF3Xd2Q/EqtjaYGKRFP941vSh6RKD5yIY5w90ChWT675CTKDplgwbE2zfj4PHD2b
	R8mJrDJ30wLOwcm60duKjH4IR6+CfR8FvXGyhCTCsYbxXs5di8JT+uGUixNEtxiRAal7aaQONYM
	8tJ+gD13js4t1a7z8LRBjjzgAVYSLJEpXOePRvdZ7qpGCGYXTE0E/bqLMtWUrimGWqaxBgWqJWQ
	DRftwXjqWoPnd+XZeAxycInILoAszN9ZZdArULQn8sgn05SdcrcTxqb8/8nKNkJh0ouWXNJ4nAu
	3eHaMIMEMOA6CGuPQoKxrXU2EB+mcHVzktSktXTDjGpY+v8znaz6pUPC3egbnVNMItg4iy6IOEr
	8BwKy/o
X-Received: by 2002:a17:903:244d:b0:2ae:ceb0:d5f0 with SMTP id d9443c01a7336-2b08280221bmr18950125ad.47.1773996250947;
        Fri, 20 Mar 2026 01:44:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC regulators
Date: Fri, 20 Mar 2026 16:43:37 +0800
Message-ID: <20260320084351.2461060-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014411_835238_8B162F74 
X-CRM114-Status: UNSURE (   9.78  )
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

The ChromeOS Embedded Controller exposes two regulators to the system in
the MT8192 Asurada design. Both these regulators also have power inputs.

Add supplies for these two regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 318903b112a3..f4c8c3aa7a57 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1535,6 +1535,7 @@ mt6360_ldo3_reg: regulator@0 {
 			reg = <0>;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		mt6360_ldo5_reg: regulator@1 {
@@ -1542,6 +1543,7 @@ mt6360_ldo5_reg: regulator@1 {
 			reg = <1>;
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		typec {
-- 
2.53.0.959.g497ff81fa9-goog


