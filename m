Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C84CD3436
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=; b=nVcMB4/+T64cR9nrQLut2RYdyc
	NCpQUdGc1H2a+BMvdguFzI9Rqbs+jblnxtfvpDbn1koO3znaPF84o9oSsz9ZsUSSisqpg+lfKg8cW
	9MW1VqJ0Oz1jtZVCabkn3wOrO2FKJ2wLVnNeFHdDfP9v+rKvdIeJdV420HmZ+JYjEocXPx0jF2SDS
	aEnYNMYr98joOQOpG0t/2qv6Je8Amgfnw50UnxVfLjk2x+nHXks4UmZKkCunJ/6mk+OtyFVq5oJ2e
	q/WwmloABetJjEwtHhIsZs8e6SHpsP/76F86dtRudoWxtgTkOqgE4zICRFkCsqPackE6RRYkCKMNq
	6pBlpVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnT-0000000Fqr8-0Hhr;
	Tue, 05 May 2026 10:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnS-0000000FqpW-04m5
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=; b=a+R7Fd8fi6qIYVkdnG4VZHwi01
	932hQTk6NOepvxIeayTozlmfCD/reHGaRVWZF8RYa/4AEtdYmRgbj+xQEXL67kYL8oEkFiGLY6Ryd
	RXwTM973F6l+tH+/R4vGuBRPRlZho+6/r9UJVvdVimieDLc1gNbI0lSq5ZYlMssk8ABLpKffAyatt
	XtEGtBonvzDw62D7WYXizZMRMXS9QqWCVI9A2t7CVWKgSunv9+M6MOngC+v7DpvIpUphj3LTmyaRw
	U47gia6AcaDgDzBVnmDV/P2fxodXxhh84wUA4qHMwYXw01BeSv7X5XZsjoA0NDtEv0xw8zrt6arak
	baa1N42g==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnP-0000000D9Vn-1L0z
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82418b0178cso2411756b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976069; x=1778580869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=;
        b=oQXULrN4vYJyKvjGLGGkeWgvvcjinEX8doK6Ada1RA02ynZfZ5NrwobUthHk2yLS26
         Sa7fvRd33KZEt1T4BYtJhNNzniGzsQtLMNrdKugRdWeC+mhAgRapIvHvKaQj2dip+qum
         97VWr9XvVXFarbEP63mvv1B5meVpJLxpKINoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976069; x=1778580869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7vxAk1TH3X8VxMHCXDqcaxDDLSkTFFCGTuW7z7dSFM=;
        b=eH4dKrDM354CYYKH4WIYOv9ipjyJVv9yfSFl2dstrDhM/lrm6NxbtkKDrZWdisTbqs
         L4/dClZI4Dz8KRO8pApchRWSsaqINEfDgQc85u+coyH1c54o8jk6Fw7krk2KFiK6v5s/
         dAowN9Zm2+KL/oWX5EfPE2wOq7HOYvQFomHpDoYzP+gaRWUsTfmNeta+s0kzQyEv8GS7
         +sTiJHQp36aPszlqnYwa6jXGJAp3D849tx05AT4qKd5EhSsm7OJ50tiDg+/gpFzNdtIP
         s/VxUG/ui7nIdBThavqKTH208SMEp9vzCqqwxtMbUostEVX9dEh19KOMZg2VE/xj1two
         aMLA==
X-Forwarded-Encrypted: i=1; AFNElJ8SgaBllrSZ6TtKICcRl/BmzHAagNhxkIHFIxN1TEkoco+BNjopa64moTTzEV95EIubbp3IE8bzPa98Kk71Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd5hMK/MDVSdT7d7++fMIrimV027+fmMW5qLm6IQjKN4uwPF0e
	0m0k6m5nqTbE8OG9S5TBbIW4Jo8qCIqwDq5gSW9RKWzcz/U12WVrodRADFOd8j3SLA==
X-Gm-Gg: AeBDievSqtDbjnFcIzHxCkZye4uCoSedIAOq0+Z/RSxBz2D0Xn4YVmmT//c9+MICuJX
	ov/HtBk3O6hTBzGAlcRC+YA0DmI8Whd5YBCioY4L7rCXEU1k0ddPVHqe/SAn5oAYyFPFooX8zLg
	sRqU+1txwRgwnlcb4ejAV2WzVTPPiCIf53p3pF9Ieajo/WA8dtHpUAXjduOpsQa8HX6KZ/1RJSf
	30/tc2GciDM1mTdB3cuz2LV4elOlhAAT6ZAS2QvU6I5Sma51vhd979M/cueZsyXMS9y2xFKJJCk
	AhAkuckaIe8SPYssDRVYFgOAeFCr9X2LZ3phFX9NcaNEMz7rIy8vKM3XFB8JyG2h8yzZRNBzG4d
	xR+sWlWFcJW7Ynr1cIzAZ5NzmWobfeOjf0jfiZ7nURjHgycqM+uwvblTU19l4nLTWfCk//2kQrc
	7blhWu2wgEnf5qlpC55RQ3DKC3vVMZ1e1resG5N1neugtYyUJnXKH6HQp6Y1IBm67KZbOiFaoLp
	7AWOmegJd7Xv76S4e0=
X-Received: by 2002:a05:6a00:1783:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-8352d2024f6mr12963934b3a.30.1777976069323;
        Tue, 05 May 2026 03:14:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:13:54 +0800
Message-ID: <20260505101408.1796563-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111431_455710_1B319B59 
X-CRM114-Status: GOOD (  10.67  )
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

There are two MT6315 PMICs in the MT8192 Asurada design. One has two
outputs ganged together and two outputs unused. The other has three
outputs ganged together, and one left independent.

Add supplies for all the used regulators. In the case of ganged outputs,
add the supply for just the first output.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Fixed pp_4200_g regulator name
- Moved supplies to PMIC top level node
- Added all supplies

All supplies are connected, but since the regulators are ganged
together, only one regulator node is present.
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 8054e2d20bf1..13960d1c8a02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
 	};
 
+	/* system wide switching 4.2V power rail */
+	pp4200_g: regulator-4v2-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp4200_g";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
 	/* system wide switching 5.0V power rail */
 	pp5000_a: regulator-5v0-a {
 		compatible = "regulator-fixed";
@@ -1604,6 +1615,10 @@ &spmi {
 	mt6315_6: pmic@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_g>;
+		pvdd2-supply = <&pp4200_g>;
+		pvdd3-supply = <&pp4200_g>;
+		pvdd4-supply = <&pp4200_g>;
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
@@ -1629,6 +1644,10 @@ mt6315_6_vbuck3: vbuck3 {
 	mt6315_7: pmic@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
+		pvdd1-supply = <&pp4200_g>;
+		pvdd2-supply = <&pp4200_g>;
+		pvdd3-supply = <&pp4200_g>;
+		pvdd4-supply = <&pp4200_g>;
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


