Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E59C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=; b=ZIO9rpKc77feb96Ob1lSH3qBDs
	tysq+yHFRn00WwpbP6Ele0WmMuHJB8v+8F8jR0H5w/sys55iHaHvoYGhHuYNegNVEcsTC25cE140H
	mhgutJaYIlzz4i2juECMKklp5ktxPqFaRoK55VNkPe7JYgcx6+BefmZ+RW/P2lQ98bmB40GxLnQCq
	/AmGbF6ieE4R8EhwNdfXgrGPQ6JSnGPGJNZ3Yg2tWOXbTc1LX8MEkkKLIOhkNrsNzw8npcmaFPZnh
	j36NaQXqLJKfx6Tad9BtArEtHkyW8+roIMudOlHy9vm5w2RfK1dmP/P/bxSC3WVNmYH1sy2Hizs+v
	Pgk7xG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAHF-009aTk-2b;
	Thu, 11 May 2023 17:40:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAH9-009aMw-07
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 17:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=; b=XhKUTkmdp9IXXR/VwPbN3Hsv7l
	0v3GXCZUQw0FUsRJF24MrSnRSKLCJsQ9F4yd4SJLeIGO5iCzY8ti8kTJABej5pvIDkgDBF2X1nb14
	ngN1EpJGlkI40gUvfWl/yJYow6lKopKpNp6/qi/SNXcxsGjBgRHnp5TkpmTr/D1KKkHouXYliwPP1
	szhdIuSQ2+4aiC41nQPeAeD77yeIp5WHXBaFAxpx0244SnCPT9CRRDAYK49j1DVQtHYDHgTQfcxE/
	4ZpE+8ev/ckzuTdf5lMJrR1PvZOmgIxntEk2a7CnTJFK9k0qF+YfhWFveT8S0K1KR+QrsYn+QZVQP
	Y/p5bBqw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9B6-008ImP-33
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so5752720a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822603; x=1686414603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=;
        b=a0HRhJc447kPe4mamxtl0XDD5nMuRRJX+UQT2K2d+mhnat2X9/391H8+5JPRWwi1bs
         BRywDGNMmRgLazLuO6nCKu2/BG8QIFD61EOUECL4xo2a3JG9ENPwnlwEo+nWKypITgGq
         8Scr6kgnZqIx1/jffKO0C3PJ4ND1aVLUHMYzA98CPUuGpbYCA06x5A+WqY0TbyuBtEkh
         KAmjvyXeBKszncRnSWJFNT14SOWXkhuBJ4ab1r/jNTXmdZfdoVZTsXfwJLQz6DGqyMIF
         p5Hd+qD8AjLuDQHbQfhvr76i71Bm39V79+RdSQomiw0Qmd3OYydQfPPwd6eelk8zzR3M
         L3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822603; x=1686414603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=;
        b=U2vieYoixCVJuRgm9lOpHmC4IU/cx9EPf30SW/vzli2rmu2heW9KPjndAaaHBel+6o
         B5Fe964mME0aq3ewJR8UY81S19p4amV6a7LY9VtF6DH0jaCxcaKHKIB0KgjGESwyUjE9
         Kc4ltIUnJTVUrt0W8Kq42yHftkvjOOsbj84wjTaWBGryumkFOuIBFIjEgZU1tQ9X/kmr
         inpSHqzJX6+zDBuQCqyRQa3+ou151y6UlSSj/EPPCyC0H5nUv7vlSvnVuRDJCfRSk496
         1hHwk/Jlmtc6oQxSaZNrvrC5nXphf9KoVe51ZVEg8Ji0FXKYNN0/s+UN7GKTjpDNSynf
         h9cA==
X-Gm-Message-State: AC+VfDwPzYaGdbD4nSqBfugj2tO1bm/6qi9YnQx5973clRFOL/k5ORUM
	EF1Uj72rSvOvmOfmnnOKvkCyxw==
X-Google-Smtp-Source: ACHHUZ7dcjAqGp+Nphgec+LpwJsKU50aAP2CHGPq6Yfh5foCKjVbFWh/ZrIWc8QPj7Qy877cL2Asxw==
X-Received: by 2002:a17:907:3ea8:b0:94a:6f0d:38a4 with SMTP id hs40-20020a1709073ea800b0094a6f0d38a4mr20763978ejc.7.1683822602997;
        Thu, 11 May 2023 09:30:02 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:24 +0200
Subject: [PATCH v7 04/11] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-4-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=QwAiDhJXueyKUnGYKSko4cktLia5bmqONipL6za+jZs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgEaGB957lUUUCMm7XYXzcG3/aVnUd1Kk0tS/Jk
 n2XNLt2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURfwPD/
 4tT9AZke84r9nHkctafa3Fs1Xn7zsrt+2IlnnC4FlYC8bDF0k3tzXr+U9ZIDyTBS26N6aGtB/sM+78
 V+Je8In9nU6331apw4IyZVZtCnibSTtw288DtcpgIZHFZbqQOzJjbX9qEqfEINyU0yRyXBGbi1imU5
 rAmXDt+wdV1ScSXG0NOl7DxqTSzkTcgbIxOYfuJfkWaHyq6AtvJfHdjgMzwcpjhYkRz9E3mWky4yTp
 RxkIQhHNrlzqPhlMs66KPx500H6zv+iU2pkd7zAbdCPlRaTCiLKx8a4opxFuPSb5ZBLo5B4wYBvmTN
 hA7mSzWTuv6lgMNklOnKqVMGdWokjxh6SDyg9MV7aUi/nlkVVS72q6gCF448TEuWHVy0+qLEHYzzxN
 SouambJpEcnlV5vldVHr6ufNjDwDQ94PlZEb1GidhIEW4yhB67okMZXrRG1ZONpO5+Xaf1HowCuVwV
 6V9ZSiw//Ns3m9LYy3dAY127mT2ZwUpvt+BQ0LnF6s8aBRfDDLHJVvGmhSVROsmxfxRpDHtF6gVSPG
 s4iD6nVMB918dzcn/JV/0HeVlU9Kh7oPUT3w8BmKjavIn6kHcDWlntmwXPsoYhjRKPqBJgyOjiVD7O
 06oomNEtw7CX3dFz8wz/tT/MphLIt5rHsnEjW9GtTncowtS+UmpTrpUsRYYQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_173005_175874_09E71787 
X-CRM114-Status: UNSURE (   8.91  )
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

This power management system chip integration helps to manage regulators
and keys.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index ceb48eb1a6e6..6074aa9c1c3e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -94,6 +95,12 @@ &i2c0 {
 	status = "okay";
 };
 
+&mt6357_pmic {
+	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


