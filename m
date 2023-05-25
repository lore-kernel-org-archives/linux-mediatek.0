Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAABC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h98NoPbHKXaOosD25djs0HPbXqP33JG0leL3y+BahfI=; b=h68kppV/OgzPkpfEXGzQaGzh1t
	PqI1QsFWooGVknTzPOh+tpnVHsb/tjNckwuwGDvUkraQFn0fw7R2WVurAkaOpQHkydkF2nOLUjjQE
	puXHLFLggy8Lcig9+60PtkYe7tT2OmiM903mSlZRScIwBtSm3kRmZWHwnKNxYXgSpHBwydzB1wwZH
	dubrm3081vS4z8TMdjKzHcj2oy6ZRAJIAM8k7stWj3rpH++4oJU0AjFYIS0QibwM+9zyoCfaIWEoA
	XdiiQieK9/eGwtG97IQ62/6+vFcViq2zNdhvUcLLXQmDK+tknZkn2zvaGi0/aQciOzLVtWKCYZWDJ
	SZv671OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NW-00G9ia-1g;
	Thu, 25 May 2023 09:35:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q4-00G0NX-2y
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so1766727f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003640; x=1687595640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h98NoPbHKXaOosD25djs0HPbXqP33JG0leL3y+BahfI=;
        b=UxyMCeppxxJnmucZz1FLlACvQTgpLzOCUWc8f5AtoEyfvRg7qppqR6yJkcTdnpDseK
         z4yKAgiILNgcJ4HhHuZci2cdKii9hlGxNvo76EwmF6mkiV9wXFlj2GG8sOjDuy/CBjNQ
         mHCjQWZZ5BPUlgXn+t/c+jXQ9rlJUkpwpL9gb6Cl6zWaoRsX5/ex9EzlDakvslQikSXq
         JoFhd9ZoobJCG8ebvDqSf+1sWbPB7KRp37JN5tQYxVihClFsVsV+L/hwRtgElA6lNsOS
         C/bk6+A4H97/WPCqkAK0Q81ml9wc7D6sNce6/bUcFaFEyPoPycKIUTChnZ5xymCS6qu6
         o3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003640; x=1687595640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h98NoPbHKXaOosD25djs0HPbXqP33JG0leL3y+BahfI=;
        b=NHCnaSeTEJ5IazOHvEfzXYFnMh6Phi/un4tsaWfePXKZmpXJN4EkEHJbfF0FTw2cJi
         U1UNGCTRA7tW5EJ3MIEHmN2IxGJ9CPW178oWhlsxm63zugcY8+7yRhwH5cOnRbPyQZj8
         cJ9oxAFRRJG76LjJrEWtsv9KoPlHJliLgzlbfU+kHgvucS0+aK3z0eZISe5W9HvPMIcv
         G4x3Akdmx9rWqBj3hzAPUN9Bc4pZhkH0miyh6JKV8Os1tUUNrJLkAqCgTixbiirpN7MK
         Kj+naANf5d+qFIog2UjNBGNLswM+ZjARMGj9bqBIxXum1mVosfDXkC/hbDTxZNzg+E6l
         wPOw==
X-Gm-Message-State: AC+VfDxS256wnaODhpHzU34JmjuTGfVNqDJLXPl+rIoGvpmOpLvfJ6n+
	kgCHR2CS55dMNT5rFraiJ48K0A==
X-Google-Smtp-Source: ACHHUZ6SbT5rTAhB7t4b3SD2/m++30U2EjYwaKwVJSwGG0uxvdl1Q5lo6ovWbP4+lwnSwI49o56QmA==
X-Received: by 2002:a5d:6a90:0:b0:2f9:61b5:7796 with SMTP id s16-20020a5d6a90000000b002f961b57796mr1968034wru.29.1685003640489;
        Thu, 25 May 2023 01:34:00 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:34:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:15 +0200
Subject: [PATCH v8 06/10] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-6-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=aZ2qXzF7sVxQmHaiJcejpyAZGX7fMTSz7XCiEr1NHZQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1v3iOZdwJ03az9WD84/dPhphD2BzdRB0pfrUgc
 8ZcfMhKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURSOxEA
 Ce12JAxQtwD8/aTHib8tARj0fpDn2KX4fdW+DbYxesXJC0AXt8cbcAVDQp4vcLQfJeTo02JcEdw2x4
 o+NeJj87tKIB0dLhMl6z6M47/izlblgZNi5uK7lZl+Rj+SvlWxcsNGEbNLUaQrfUE4S69Z57VQKA/u
 9B4ArZQF9pzI4vp9B6Iy7MsHxT5PoHbFXqrTWgHnXIACCg7OryHHR6pEcpFhAEN4grPbZKWF/TfLpo
 77FGwe1GKwEhfLUEd+lznvF1MOULzWm9oCJCGQOcicjUO6xSWSp9m8ZYfvIgjCEXMZbOMxIcROXoAE
 CqA+JFY5giDb8rmpyxBhY8vxCyLWNAEA8ILXPWBDV3XsKXVlgRHtW7LJ/v064V1vOqhnttACp1UWZy
 Skj3CXpAUYIe7TRqjtS6i1sJ9iUMF0m7AI8yL21T0AhJENT2kevBuPQ/N4xLtiNEO0DrfwweAtPSfZ
 cWIDsJhvI9B4jjsLktGpYu2c+fxErGvpbAUUbGsvbk60XSkjvy/hhjM9ovgLsQ4QWNZBkqde7g03Ss
 MCN5sAHji3tYyBhEd8HoQBgBbZ/w4zbQ1YDWaV0Z9EOkH0AZUgDdICwR3Qqr6J1gxPavi6vuJYL0xe
 xgal7bfgfbU7e5QYV/ImzgauMpiWJiwp6HVzRUrF42a4fewEVKYeJ5Q2whfQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013400_994518_4834A9BA 
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

This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
It also add support for the Extensible Host Controller Interface USB.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 6e2f3601509e..1a5769c397c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -309,6 +309,28 @@ &pwm {
 	status = "okay";
 };
 
+&ssusb {
+	dr_mode = "otg";
+	maximum-speed = "high-speed";
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+	usb-role-switch;
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		id-gpios = <&pio 17 GPIO_ACTIVE_HIGH>;
+		type = "micro";
+		vbus-supply = <&usb_otg_vbus>;
+	};
+};
+
+&usb_host {
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
2.25.1


