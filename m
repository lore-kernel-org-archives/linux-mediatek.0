Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9631BC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+9PHAPPCN5jb4x3hnhdMgy2to7itNwb0YpOnA8EnRk=; b=qq2sNFY9/TFf0IRf/FWvUYa98D
	W/b6C+p0lEHQUMKyLuN6Uffcnote439eOZ6YIas2EXDaLwPq66o6xzdvlqmF70rR36pT3GisKB8is
	xVHgiwdH0LGu2ONIWowVKzC0u6bRGKB4wqk1iQ02ThsWxV6G+CmD+oUFxi8yHTsQCulyvoGy6Ikjb
	qVA4jqZc4X94SmUZyLLKfhhODCRJmzmG/gW1e9FVbGrd9zgAUK8nNONMwUYSnTQa0rZk7sEU40up0
	2pH/rP3HCq52DLE5VgPKvEoOsbDstV0cVrWoOVPujbmmbXWBQ/Mwbwm0rGOry3Jt0WeHyjPhqGtcM
	vHvHKfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSND-00HLXu-1P;
	Wed, 29 Mar 2023 09:45:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSN1-00HLS6-1T
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Mar 2023 09:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D+9PHAPPCN5jb4x3hnhdMgy2to7itNwb0YpOnA8EnRk=; b=nM993FOggzzjD7VBgkAP29kG2x
	BJzgeZyHqTRdSRYOZNrxtNeyG0yZH4XkrRyZHMQpqaDwiGxkO8FndwL7oTFsSo6o2YGVY2hah/4Dk
	4f5SfHf0QuGm7R34R7940ZqUNrrUjLTYKv56JLE8sOkh3X+1Ng9IbghRAJ3gN7VHbryktdfRnuj/2
	QCAOxotuqteBl6xl0fY5vuaq6/Znjg09x0UwZKSIEVLsu2LM0zh9aXkk/XKNDRD0QOhplXJFkBRVB
	zjI8KKvSkQgCjIhqzSJQZJYUXMrqpV1nFiw4O3TSUb7Aix+Jpj7ZFdHSmv3pIb7Po/nMgYAWvoI4k
	NnqFir4w==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaN-006oFR-0A
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id m2so14846469wrh.6
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+9PHAPPCN5jb4x3hnhdMgy2to7itNwb0YpOnA8EnRk=;
        b=hsPp30ME6q6c0MvSAujzX4JfIL02UlDUE//BjcWBELhaoBKaVvXmUG+4jAmp8BIqNY
         BXMH4tJk9Uo5brNbTOqMhRAJcRGyMgEYsUbppYzb74G526Qis+K/KcPWpxK9t5cJu0Yw
         /z+SPaDezktz7SbV+6te4xRnRFVlMSXbVtumsmKeEridINs8BjR+uwFdNj1QJK+SOCxQ
         psRj0YOQlix3tF0TgalgHOTyHAskks/5fOG+AMptMno9EdOlrhtUXuNaPkkyPjiGDL5j
         6cqR2c9Kwz326S+XK5zejkV4bAaHR7x7tCvf54v2tiPMK2CbARdphzmdT2Co6vuiniYx
         GK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+9PHAPPCN5jb4x3hnhdMgy2to7itNwb0YpOnA8EnRk=;
        b=nUjHOuzfODpiw2FUKvU5W10fL5JK8U3+QdF/qEmNiE/RwQ/cO2qMrzXSjU8eJVPuxF
         jBQ53xGKwQtPrKeO/u6kCLQCRqFK2TqiOoduBaRClR7psCKzPa7igJfcccq85Ujcj2QX
         ulVtVO1Vm8aaH9oTIEfl21VfHcbJ+5nKDpSc9sxMIeUL9gOGaL6rxtqN0p39TlFj8q2L
         n+KygT4Jb5MMcHPnR+7fw/NwBF3OjvnKlMnrDHc8f1xO/n0evbjls/GO/aYUyITSsxb/
         tz8Ba/htATjDRNinT+ub8e3FkqifR59MfU7dNg23o9DvWkIV8LpPXK6Ac67DqU1AGwr+
         PmTw==
X-Gm-Message-State: AAQBX9c6vcsL7E0MkIBOnjfPgqzP3l20aJE+MozYYfgAFD29KunTeKwv
	HWe5nzliypbEyI19P8gLjFy81g==
X-Google-Smtp-Source: AKy350aVRAuk9UHGzbz3JrKgJsTi7Y2812R2vccKV/PxFG0+Tjj8/xtw3NOjO2V87CGaB7DohkLHSw==
X-Received: by 2002:adf:e90c:0:b0:2cf:eeae:88c3 with SMTP id f12-20020adfe90c000000b002cfeeae88c3mr15422099wrm.32.1680080110071;
        Wed, 29 Mar 2023 01:55:10 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:36 +0200
Subject: [PATCH v3 15/17] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-15-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Z2Oft9Ecb3H2vKhjmkmQxcbqKZ2Y712Mk7ceRLy9+1Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcHv+n9+SgMIsZtBX98ZGYamPG8zt91y3/5fJp
 Vd7lMw2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURc36D/
 wMDS2x7THMMHHgg3ChRl85Kk6ZKzh2Fut6DuJr3RECqAihMlzkEXYwVzQhyxmhmRvm1KFHs6vcXPNI
 MJTFEQmLNZfs0PkyqTfkGfLQACnQar4EiZl1ekgYyIrkYl1hDOtsHyKFkuhqH4CgDspoBHQko4lJX8
 2IVRkhb58uKtC6GlZ9K1DcfhakQLhIs/XOCJe+V4INWO1tgI0y0ITaWNfiNSQmegenKv9bUUF/AJWx
 vwKSC6MeDjJ3b0i+AXT0sB/SygL8WkZHs4Va3g7Xmm7+br1cO+foR+rVZEAf8OX1w2LuevuH/5QSXl
 YX/ffPVhSvGPe4rzhen4GmM+V15d4rHOFr834rUq9VXUWSxo8MhBjQ5JhiLxj7ZuGWROPjfYecNgBt
 cwpsjHklfHbrGlPm8qufiLeNqOHlym5jwT7ziHEYo4ozw9Tr8wbCQo8SwNH9gRMCEilo4BFm+RFkn+
 zAP8hwGBi4jmXfDbEcMtNS3imwpst/o77WrEeLyGSrE3QoNAuvtmmOzSfjCPuJeJpOwczhO75vOBnh
 kHIlGuR1XhRG0vBzSR1Y82Pn2MAX70iUI228wIBA7BPfe3cCfVUWATnvCcjPZUK3qYWjQmuckm+JnR
 AlkVwWXv3FrUp7Wm52QErOvycncL9OQ9SCcGJCA0lDiIb68v+Zmvy1cmLO8Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_095515_826012_1E6E353E 
X-CRM114-Status: GOOD (  10.15  )
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

In order to have cpufreq support, this patch adds proc-supply and sram-supply
for each CPU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 1820daad6da3..edf3a4b6a76e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
 &ethernet {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet_pins>;

-- 
2.25.1


