Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B35E7107E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=; b=AFG3i28gDuSp5ELAF3ieWVnKn9
	TLo+HiAPDvjr+LrsZivkV540gECqUgFRbrrmjbO++mzcdE4SLb0RHDeUH1NJwHY7HynBJcBQC3DSk
	uktderWkPd8g5SIw+5u7x0ZqfgZxEZoywRORqxeSY16pUghyd5juLAKuC3x3io2626GW4/PSKP7F1
	QvTqjhCHoPRGovkNmVAczj8Ev/qDIEiho0pvBqD6S7QbnYRLsTvMsHCKQhvxzo/Mi7SEL+QW0MSeg
	9RIKln3Gm1tggXZ2cO/FI5OWFcafXsuzUJ3Wu/PZVyiW6vo2wL/F9GHRzA3clJu7UOWL7+LBVmB5q
	e/gOo59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjo-006HyQ-15;
	Thu, 21 Sep 2023 14:33:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjh-006Hth-2c
	for linux-mediatek@bombadil.infradead.org;
	Thu, 21 Sep 2023 14:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=; b=cVm3I0apxMLjZIM2rhj+JmdDFq
	Tr8arGQN5sQvJt5dTiT0LGCYLHddKbsMgDVsTrEGUNqMUmt/JaecF4JcXUk+7JLYSH6ptxSu5RMxC
	VwJKErTCEFkFC4rIeFTIrCC8aqW/y/i9TGr+xz9+sTTxVmLv2dZkN7f/Zr1f1tcVEL80PSygLXLYm
	9BLUoOgu+iwxVQkBx9laC3vb4VVQ/crykyrtfb08m4qotOP1BMONRq4JWiZ8e/mvcEfUFZnlyPaIe
	2S9UE3Og78hq8By6OUIISjmRPTcHofUSIFKYWEv4x/RCe2XebAmzVOu0GgzAjsZ89jlfHEP+dcEYJ
	hFVukh9A==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjc-00FRnn-17
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:32:56 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4669063a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306770; x=1695911570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=;
        b=kRHcaWAsVfqh6PuqmSRhW2O8/pTe2MH7vS/sFdW+I5DccrheiD6ff5crSeizEcR1Gu
         124oJzWguVr6+L5bziTvxNIqv7pNtHgLp21bzURGC68keHGk14l7DlQK1cffD6p+lsrX
         uf4kY9dDkBOktfljZnZqDmzhIwNNZwU8TT3anOtLG1Vdm3fALiKylpi6I9nFl2un4G7r
         G6aqqWxiVIYHJzwX4i70N2lJM0K1Bpd5Em6TyugR9wgI7VmoFWOewHBXFZJK4zEGWkBF
         RuTvRbKSIntoBzrwTJY0mrV/B46OHnai5lcbBWGWaMxwuyzMq0Vph+0yV8q6lc1DgpKA
         jslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306770; x=1695911570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wErjPQt6qENv87TZs9KiIyjig4b2yslS27coAwsNZVw=;
        b=lkfPmbt5f4ALfUckjzHdaIN6QlW31ubayGAeVxiEiU4IK9JL8lN8iUyXW+D5i8AXvz
         WQ0Oi0z5shI5W+ChyhSXSc9vbS/WADCcSW2metebIOfOtDtycZafEB4atSRN6e5G+tOL
         gldPs2ew2VMCYr4f6Xj3VgD0HGhABf1j3Pha+y0HLvur61wW0l2frezwKjXkGePIL82M
         6kZhupU6a36EbqzpzMhRce5FKOqUAaOcTUD7QHMmjWc6+k1XDZE+fU8HZN2yZmhAB4Cd
         uHzMTrcIqv1FAV6cZ383YakADUv87jdc+sGT/r0S6Ug760jfhZ2QS4syBymLOBZEtCj/
         p9cQ==
X-Gm-Message-State: AOJu0Yyzfhw3yXYQ0qlH651OAS548+eLTtSKfkeI98FgsSsVQbBZ6rws
	39FsLCyWBDcO2mV6Q16ufRzOe4PSdOgst61IHFw=
X-Google-Smtp-Source: AGHT+IFOB3eMDwI2t0a2q9Bc3NUa0OvjwJSrkAn5FCb5ugaSbmUWlrXrinmvhlY5/5p++bwV6SZ9yA==
X-Received: by 2002:a17:906:847c:b0:9ae:6196:5094 with SMTP id hx28-20020a170906847c00b009ae61965094mr2756229ejc.30.1695306770505;
        Thu, 21 Sep 2023 07:32:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:40 +0200
Subject: [PATCH v5 1/7] arm64: dts: mediatek: add mmsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-1-fa6f03680832@baylibre.com>
References: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
In-Reply-To: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=5Tm918SwyWroVCRT9x2Od4dOEXsJxNFB5Eps83AeIaY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQPu6ZqiZkD/quO4t8h+hA6Isg4BN08h2+76mls
 Gl5YOuqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURVtUD/
 4/BNRJAHNO6Wlh1V/NiAriWpP17skcQQDHSsFYzz3Y/aaeyXPE91Bu4TdQVJLuNj+3Z5o86DvWG1SV
 U8KUyuQ1MmO1q61clIxSfn214ayuu6300dUg8HSU76C6jEdzWjQeYdaL06+g1XEKvnzNISOcsvsZ8B
 DlZZGHYUsfeAEFzNlL1o/2q3ZlPCqgkRLvu5rNFSB7ULIhzpjfrr7kh5SplD0SgfOCN8ydJp57fLCk
 xMUoKhP1brq3zfUonx4Kho4m719ZYPPbgODu1QGkztz5TRqheJWRWJG6DS9LCcsQ+Y3dTyurJLDNFc
 gOv9o7jCikev4QfhT07WIFFoNgEylBji9qVZf5ATyLaqJSSoK1rMwm7YitpXz6S38TLnWQVcFeb5TT
 sUeIYfOxMoGVK87fh3CJv/C61f4tCSEUYUSlWVBab/fqm4vcpyQX0TFJXz0dNBMc7z3Qqp6aFWPU8m
 cLA2NmyoAU9wiD7g26quS/1VsD6HoUpGbMssqlD1BAwP2Sn/ZNO/lr2pLHhGifeSbY72D2SHAZzgXD
 pkV5+nsdMHHd3lWLHVSR14J+DZdnuedWdiZRC75p6ftLrXyabvyesfi37UTn/dwOrFyqewKxN10x5l
 LvjEw3zQsCAan4BaA7VfIfbsVJoKuzd9KhBgOu7RI/ZLD+JNv3xa06Qehdug==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_153254_144947_C9FEDEF0 
X-CRM114-Status: UNSURE (   8.77  )
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

Multimedia subsystem (MMsys) contains multimedia controller, Multimedia
Data Path v2.0 (MDP 2.0) and Display (DISP). The multimedia controller
includes bus fabric control, Smart Memory Interface (SMI) control,
memory access second-level arbiter, and multimedia configuration. It
plays the key role in handling different handshakings between infra
subsystem, video subsystem, image subsystem and G3D subsystem.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 413496c92069..bcabc2b89a94 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -603,6 +603,12 @@ u2port1: usb-phy@1000 {
 				#phy-cells = <1>;
 			};
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


