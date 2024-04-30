Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3063C10F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 11:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJ5RydUkkwZXKOtsqxNgzU2f/vZYNrNlgDDywN2ZRKw=; b=1VOHk5tjyw/R6+lunsfUxshIMz
	iFx/s4RCJprA3YbtW2QQzB7iy5PftFWcW0PL2IdqUeukpDdsoB3dBnvuBeAXMBQ0aDDTtk+6HtfzR
	Clf7GoM36z2fDbyGm6qE7gVeDIs/az93dx9XnyEn0LfXKNJXzPqBO+IUdxDMDxbpX65xCtUgulDn/
	wa+yUKhBq9/cHLPgi1Q0ans+Gq8KG72PNYlW8BLI52OpF3iJo+J1mu01wULHOuD4YU/+e3mIdSgMR
	px4Xd6Q9WuItsPuxgOTa+dKWQ5hoNHSIlWwltsk18KnqDpmKnE07ej2DR+889i4ygjg54c/kvelZK
	0a38b/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lg6-00000006AyR-2Eao;
	Tue, 30 Apr 2024 11:29:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lg2-00000006Axa-1huQ;
	Tue, 30 Apr 2024 11:29:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a55bf737cecso657951066b.0;
        Tue, 30 Apr 2024 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714476576; x=1715081376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ5RydUkkwZXKOtsqxNgzU2f/vZYNrNlgDDywN2ZRKw=;
        b=Eyyt3Mws0eihDTT+32PXajImqUtpSvY6LHTcp47rfpD8KA+BYZkd7MORwgqWNRADTS
         ApIIujpryt/Mn33GKnc3mUplvHSMYH0rnEcoz0J+ju23f25/XjzVvuAIfBCQ0lf3VtGv
         mjSwqM+TPOhfjipAeDW6R2wswKXS80A/NuwElf5ZY2jShJ4hSjU25knu52skXfmSsX7W
         47silIsYOpYxlpfKIA+yhM9cR7ur01TEgPP+S2A+APVsqEWtfj5eUqX9TBNsS48YyVFy
         MEMdul0VRXbJjIoFqrCbOshghse/dOOkoFBQUvmkPXlCFBKMWkw6LmdSMKYkPvmJtEdL
         e2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714476576; x=1715081376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ5RydUkkwZXKOtsqxNgzU2f/vZYNrNlgDDywN2ZRKw=;
        b=BTbNi6KYzRg9VqK7wHWeVyrOwu7WIdEyP0sZaMWDqMUj7NQ7Vts1tYJ5hhSBvTLvps
         /owiCopYrToqXB3khV3rAK5vaO+TzmfOH78DAuNT/s/YDiUV06UEM+gIHQ8Yq9ugH8tc
         gFrW/+CLdUa67PaYrbSjrgG1ceVApeRGDgdINAgk93/uDDOX0V5IeA1MYt1Urvy+eddt
         DnMGFdZukeIwadDsxD7JQ3putG7U78NnWAZIeZUa2Kp7Ud/YKMKfXZWnKEa3QR32569e
         TL13JJ2TDiltLe3DJPDgoj47CgSY/+xNVBdjzirzXuzI+6M5m51K5rCGM9A2AkcBZJeD
         urvA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJwPZEXyVFlvRXhTjYk3M4LZPPQfrBOzy8n+Bi4VS8ipx8xx63kWNywr9q6TA/XRFP/AEPVg3XPzcSUdrpKwvW666gj7uux0DOgo4lST9e0Zstdz1Bnk/eDt74Z8aYEgQ2Da5Y3kSvQBn4mRmxm7q/kKAg65H+Mg=
X-Gm-Message-State: AOJu0Yy6HkprVu8Rt9W4ZkT/4//KNdFOdSFc/LiQz/vHyz+zsxjYyG/Z
	5PWDAtdWsmTT2o7zy845Ip9gxMT/D9GVpk7KpXgIhf778EDeb37u
X-Google-Smtp-Source: AGHT+IFo5ZGnjQCPS688j4f9wiUKZH2MbwH3zWAC6ifm6oWwKmTEpIQmQBul1GifHAHKjlDOTLvr2A==
X-Received: by 2002:a17:906:a411:b0:a52:23b6:19c1 with SMTP id l17-20020a170906a41100b00a5223b619c1mr8203519ejz.76.1714476575812;
        Tue, 30 Apr 2024 04:29:35 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm14954596ejb.169.2024.04.30.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 04:29:35 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt7981: add efuse block
Date: Tue, 30 Apr 2024 13:29:32 +0200
Message-Id: <20240430112932.20475-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_042938_505032_28F84A00 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) and
has efuse compatible with the later one.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 2d7f91196e64..a5ea168c8fa7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -133,6 +133,13 @@ pio: pinctrl@11d00000 {
 			#interrupt-cells = <2>;
 		};
 
+		efuse@11f20000 {
+			compatible = "mediatek,mt7986-efuse", "mediatek,efuse";
+			reg = <0 0x11f20000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		clock-controller@15000000 {
 			compatible = "mediatek,mt7981-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.35.3


