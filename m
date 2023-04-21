Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE8DC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 23:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nTS3BJHQfpV/cAmIYwndGJ4XuY5RhYMBsw8wnrdpZE0=; b=3tO7VkEh5T5SxcttzmTRoxhhcI
	X3BxYmqhzELSBHByScL85KansHjkXM7UV/4bt/aQsGvbw4Fwsx988tMU6duYwPscGeCzMZRZ/URNY
	JrAMR2xM1HOWPzG2C/hOOMXw23hxqO57iamOSEyBdqXWusGGaqWdA9Ka0taWLHZ5WNaZzCiOztYLI
	OiHXTjjOFkxdQ2yi0YhSBYEGOfZX4ChCB1fSMMrUH+avTEKif5DlF5WqsMgvFOlyrnCvy+xk4sK9e
	oFECMNRZw8U3jvkLN2aMeDtJxo9mZAvr+0PTrXPmmLujS4I4R53uMvoN42O+mpXsAMHGNxX0kNXwb
	9i7OiTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pq0S7-00C57u-2U;
	Fri, 21 Apr 2023 23:46:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppzIO-00BxNj-1F
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 22:32:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94a34d3812cso374823866b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 15:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682116319; x=1684708319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTS3BJHQfpV/cAmIYwndGJ4XuY5RhYMBsw8wnrdpZE0=;
        b=hUf60pt9SYsbHNOBCqTdtDAJYGPxwWgJjjpYvXAyCp9Gs/Nh79FGr5ya2k8mA2ZOX/
         wRd5FiNNVnZRtXcrwzS0qNruVrNJF2ksSbj4ZE0rlHlDd1PFjpodCuQ4J38m1kM7E0w3
         Iyu98fQ95p78Oym7Y1BCNO43sA3kAmgRziuGGe8ZL6wqM+sOAyXsU9fBnCtghG6iazke
         3zWJH0s/D1RM9/yPDyHJXs3Y1z/shUn4u4X62loFj4VFfLwBWD3dCRikb2gCtVBREaqI
         pa44cYZwH9RM0DoTvMCaIVvfG4lSEYeeeqHdr36l0SDCg1tZY7RW9IZgDJjIENrerf3h
         kxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682116319; x=1684708319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTS3BJHQfpV/cAmIYwndGJ4XuY5RhYMBsw8wnrdpZE0=;
        b=Xw+HLePhJ1qNkiNKo6DrQ3baAK9UJkLGWhMxnHbUbA444xVHI3UqsiozRQNLNhZrdN
         4WxNqPAciMzgb/mV9iW8G4/GHqQydGjhE1xf5nccMwpmFgGz9/1tTXh2UigU4/Ljy1QX
         0iubL71j+JlgTBbMR75zArAMCuLNsqvttFXXr1qGzzAu+Do8+ntho8On8lgxgokVoZIS
         U6960Ged/4BxiobjenG688yL3ae2co3PUGg6AjbmweISv/D7f+r1AWR3xKeyM6PtdrMH
         bjbcrQj7CYIW4LilVW3Z9NbLkMzeGTGKYnREUnjFVUMNvKCMkOktgz4pD0Eouvz/qoY5
         pKXQ==
X-Gm-Message-State: AAQBX9dO+YCZ7NuPK5yT+hmKw7VGnYtUajfZ1hfA5bt9NSbeqIEpITDX
	B/NBFEjeh3OojARUcIHx/zfiXA==
X-Google-Smtp-Source: AKy350ahA/i9BjvklpN80iEkUEuB3+ynJvh5flYH+2DE5tgTm7Xoz0w7YWIJ7AKdq0IKk4YEd9Ba6w==
X-Received: by 2002:a17:907:a688:b0:953:4d9e:4dc5 with SMTP id vv8-20020a170907a68800b009534d9e4dc5mr3267106ejc.22.1682116319070;
        Fri, 21 Apr 2023 15:31:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906394b00b0094f4f2db7e0sm2623765eje.143.2023.04.21.15.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 15:31:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: add missing cache properties
Date: Sat, 22 Apr 2023 00:31:57 +0200
Message-Id: <20230421223157.115367-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_153200_428555_61122718 
X-CRM114-Status: UNSURE (   9.45  )
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

As all level 2 and level 3 caches are unified, add required
cache-unified properties to fix warnings like:

  mt7622-rfb1.dtb: l2-cache: 'cache-unified' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please take the patch via sub-arch SoC tree.
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 006cd639059f..36ef2dbe8add 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -101,6 +101,7 @@ cpu1: cpu@1 {
 		L2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 5e83d4e9efa4..d4f9a9b6bca8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -250,6 +250,7 @@ l2_0: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
+			cache-unified;
 		};
 
 		l2_1: l2-cache1 {
@@ -259,6 +260,7 @@ l2_1: l2-cache1 {
 			cache-line-size = <64>;
 			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
+			cache-unified;
 		};
 
 		l3_0: l3-cache {
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 5c30caf74026..faaff39155dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -228,6 +228,7 @@ l2_0: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
+			cache-unified;
 		};
 
 		l2_1: l2-cache1 {
@@ -237,6 +238,7 @@ l2_1: l2-cache1 {
 			cache-line-size = <64>;
 			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
+			cache-unified;
 		};
 
 		l3_0: l3-cache {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a44aae4ab953..eee3160e7901 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -283,6 +283,7 @@ l2_0: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
+			cache-unified;
 		};
 
 		l2_1: l2-cache1 {
@@ -292,6 +293,7 @@ l2_1: l2-cache1 {
 			cache-line-size = <64>;
 			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
+			cache-unified;
 		};
 
 		l3_0: l3-cache {
-- 
2.34.1


