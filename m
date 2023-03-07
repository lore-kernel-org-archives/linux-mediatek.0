Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167E8C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMvXXRfdWRwvy4f2szxglSoVaLY3WxRK8VtTC+oWKE8=; b=dldoIx32bGs+NnHB1DZPhY5X+X
	pVnBnoJMyUnzU79SRxmZbywjsRZdToM0RMN5OwCSgzX8UzvgvIHSQRSU3dHrwZfiUX2Wz7SWSBj46
	3i5ReU5KqwGs5gI5rUXRreszPlnkLHQuk3BhYTGlp3/JH/8zSWDMXnhDpnWBlze2+BQhPNYAkEzb2
	7U6Xb0RXKFbAlqANx8/okYkUM5I4LyxxVdIBFGdlpVo9dHhDChgyN7dP1uHOOkQe9BzTPx6bCZSY5
	J9IOiSuAsYrW3xgzWESOTGNhroj5rbfONPI6VsalIR+SATAnjxLSqzQtxKDSs6S+HOJXmtiYcxoE0
	nE6kXgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ1T-0019In-3u; Tue, 07 Mar 2023 15:14:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYZH-000vH7-QW
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Mar 2023 14:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tMvXXRfdWRwvy4f2szxglSoVaLY3WxRK8VtTC+oWKE8=; b=LIP+6s6QZ7d5VOTpJYPyH/VNvC
	GjmLKhHedNsrxvWyh00KV+doPYzMGXXZN8BCmQkSQb8FPqqQ//wQ+M3LhKO5sUze2H2sjR7rxv0r5
	V/vGAKm5ENfXM3D9D2vDOtzmlCs4RU21i1lDrjNIOwnhdsAqGiYfz9Hkrxs2/8KFmGqUKrRY3LamJ
	e6vwymXwso+3qJawv72EeTQrQDWChhBqnsYS+kTOP9gKmDpotHM1zJmsHTTohHxRHpF9R8fY5TGCd
	/I864m2nzuok5H9K5eLVnWJZ6j9ypTt8sHdQFkDXEjnkSbcmo/3i8mtN88nck/QpdAfkcWFGZR8cw
	I1uiZ/oQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZXCk-00H3Ag-0t
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Mar 2023 13:18:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso7163373wms.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMvXXRfdWRwvy4f2szxglSoVaLY3WxRK8VtTC+oWKE8=;
        b=yagAdCNpup4heSuwfKasxj0Epoki7nzh0U+0xs4UQRE+P8u9YFGbWmqGjOA7TPrdtG
         JLNEdREx0OY0KzK83Iw3zZzpliNBKaBsm22e8nzfk8Lfi0pPfIIz9+xdPVoTl8ePgn+8
         pOtM4aYxEPcBUVY41i973pCcba25cnrAV91CG+hcgfVDjZjwyfTe60ziAXYdT3UItlqK
         L3fRvIWOFWVi+VuvWKczwsm9xi3HQY/EueAr1fFxficqzrN/j6QCUvYiL7VXowEDwSvv
         vU+kudY5pcFjaQSAIOGUz6k1OKjFRcqRHy4s8/9hwsEjuXjS8zl4LapA82nTcOMpdP8e
         VvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMvXXRfdWRwvy4f2szxglSoVaLY3WxRK8VtTC+oWKE8=;
        b=pCNSgg9HqkoHc3P6jRSpziNmjFoBL3ccgmKH52kJxUAvmyv/U4CfwC/hD8AFTupDRV
         sHLh9RZl9I92eGRV6+Ps2T7Pb81veCBSoMcW95egNybo6EyESRC7Xp16Xmkcasazu46o
         /UaN6hE2U/IA0vMmz7+VFboVepVqRIdwOsRNVYIKaQbyrHyIew1I2ireMNkMJxlx4HUY
         PgY+yrVkTFBRMdCR1ThgeKE0nr4Y3BwaKvF9yseh1/nIzTPf4BOKOe1rBbFVYt0/gAql
         nNh4wUlDnbE28zZU5qEx61mgsLxm31SSZu8YlFEXCqx4FZwQX+KnhPTHDFOfMbkO0UA/
         RlUw==
X-Gm-Message-State: AO0yUKWCijtMxZ2KCE0ETan0v9jUPbgnZon2PueBTpX/1ntSgVHv1lh4
	glWsb5M/EDqnVPAbAfyJ5ZUQOA==
X-Google-Smtp-Source: AK7set8eUW/r3erEcrRvM0cIs1n7J2O7romWaHfs+HZswDY6MvaE9+uUi4HH78qDMKC9ufbmYKuddA==
X-Received: by 2002:a05:600c:5492:b0:3eb:25ff:3446 with SMTP id iv18-20020a05600c549200b003eb25ff3446mr12787013wmb.4.1678195088033;
        Tue, 07 Mar 2023 05:18:08 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:37 +0100
Subject: [PATCH v2 08/18] arm64: dts: mediatek: add mt6357 PMIC support for  mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-8-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=FPhX0yoQh3im80vWPS01XYLfyse5M8tj6Tuzb4ULZNE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmEa9lzs4BtOFBFWSpzYa6jzRdhjauHPpgIr9E+
 LV9xLHuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURcc2D/
 0f7dOlHW23au2uJsZ1Cpq1/33VxmdGsCv3qwIbPuufUaUiBDUVso+sx/ZuMen7To8zZ+M0m+tCvTUI
 N3rd7O1EscEe5IlWlAA31f4XMVuQQWTXutCm7I4FXk9nRxCQgHgoxxAE24vBdknmky4VCQ918RmTMr
 QQvJJjTz8Z0+Mc1vca/pYSksfa+UvujzOlI2Nf5FyADv7wB/kR9VRHrLSnf/5DwWa5ChWFIG+IfZ+R
 MQTwU1Sbqd3k+i61gWiB+L3YQPxxHZt6GYXopYNH+RaW7LZgYa2LyIbubabIcRkomxzlE/98Xamoq8
 wgAITZHgJIkGDjlGZeCRMzEzAFaZbSKO/0Q41ZbIuVUEp8sRhAQaXkTfQBKKPS1RdcxtsGcTJ0QP2j
 wwDJAHYlskHQTUWHmyDjFe3LT0Lizex17S6kXEApgAA90SQc/FspNpBpi/4mjq8VXz1j5KO72lWwIk
 LALOnigx88FQatnwvQwUGGF6wwS0uXiGD+YTZwZIYb5tqGyII2lzIplD3hfOPWgEQ2lVRE7HG8JgHE
 UAzlI6rE+OsWJcxI0FuBpq+ZJuNDK7PdH2W9l7eYBSNMFB5aDIR72itEzWCu3OQiTwFgsfMYgXOL8I
 fHHggDAQMnsDefPj/o9FnrjVWyDwKS2rt1LRfCbEpu4wCpMoit1MRpeT5Z6A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131810_667196_18A7FE2A 
X-CRM114-Status: GOOD (  10.04  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index fc7f6d8ae173..2f88562c638a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -96,6 +97,13 @@ &i2c0 {
 	#size-cells = <0>;
 };
 
+&mt6357_pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
b4 0.10.1

