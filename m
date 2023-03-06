Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y6TlObx8TNyu4QXIni+BBvzU+TNoBWWh1Z9MDExTMc=; b=3ili6Bqpk8rSFb9lDnT8b0iaR4
	me1dAMXxZpL7vEga1Y/9awSHqh9Av1RuO7MFQu6QqAhiNuajUsAhEvUs6gqm/il9xUETCD0k+2Zx0
	wKbKcbDLXRT0evm+YK4S0omnyvIUsrVx9SjDcdyWNcgm5qoiOH1CHuejbmjz7RUCFteXWnQe/D9pD
	HZmOR3hLg9Hl7bPP7dmI7lkPQ2c3w/r4ldJwiieN5VZ2oS1aE332ZgImjMTYZ7Y3m+tFnp76Wonfn
	8tKOn5e5V/CK5k9kMrIdHe7xn3Io9Gl0S/gmkPwg4N0ol275yEdDKj/2Oh25grcwYeXORTOA9TE7y
	2e0+2vAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCKR-00DV1b-2D; Mon, 06 Mar 2023 15:00:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBC0-00CyWy-Ox
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 13:47:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id da10so38846049edb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 05:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678110473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0y6TlObx8TNyu4QXIni+BBvzU+TNoBWWh1Z9MDExTMc=;
        b=sj2UnyaIejnAXKuFsz8EaFtz4WLsRBgFxdUxB5Topo13/bxnscyMHaITs7rj/1RiPZ
         SD5sHl6JRM7f4IXkB6xv1J4b68riHe12BKhaEKPlbLrrGj1mdRZ27OXdE+gpdaXkChTR
         B9AhnjV5mQnvDs4yyw17cTJfAW5jtQXx+Nw4x/L6KnpdC+PjT1MYwtBnVlhp1s9ADgSk
         d1L+bW0kVlGbTeeJ3/32NRppHnNsV2nAp6yCwOQG6LnOJ0dOGXGfXBLO0L3Xn+bzN958
         7K5Ypvfd5K4G81BA8q7NgWkwhFrHYvGtm6nm2+VQQqgCy59MTXbIl+uo53a3S3uCo5Nq
         QAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y6TlObx8TNyu4QXIni+BBvzU+TNoBWWh1Z9MDExTMc=;
        b=dSe2BVOY7GLw/eljR02od/fitwAVcn0bnoUffDMZApTZiZ/T2ucmOo8E7ZJdnLe3hT
         Mz4WDif6HxfAsiUleKPPAcocx3qKAYq6396RTvv82+XcG+ajbDZ8/scw8jo+NMCcol7S
         zgpNkFL5ogLIipArqK00ZXmzwIp7rN9wTUaGo+/6vp9K1Aj+qQtmXvRyZmftH2Wx5DIy
         HcVvCIFsjFRAWjp4iynLg5jcKcNdWMMK3BWTa+i3a2+do50VjZk87ZdIKhiICoHOgAgV
         cY4e4JS0gINMUUV3B6zji+0KvthgQ5a8kGRYqDPq9G7F76ZKrJfHjaY1wy6rP/VFYc6S
         UjoQ==
X-Gm-Message-State: AO0yUKUvgR4IrmwhIR+Mfb2PhENk4rnrE44kLdRmOm7I6Ka0J1gUeCsa
	0KA7/R2lrxyQiuL6Mpbuug88Eg==
X-Google-Smtp-Source: AK7set+pwajWmb43xttdc2wwPFuyjvx337opyoZpPHjSV3d+57Zghl6DvaaCsWpWY+xGL/neh2h1Kw==
X-Received: by 2002:a17:907:8a22:b0:88d:697d:a3d2 with SMTP id sc34-20020a1709078a2200b0088d697da3d2mr12874655ejc.54.1678110473085;
        Mon, 06 Mar 2023 05:47:53 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id y64-20020a50bb46000000b004bc2d1c0fadsm5193293ede.32.2023.03.06.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:47:52 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 06 Mar 2023 14:47:44 +0100
Subject: [PATCH v3 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v3-2-ad9bb1076d7f@baylibre.com>
References: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=57rouWYbJDpjGSrX0WaD+yWCM7skXPMNCc2QzK6z+hc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBe8FGEDJjw8jCDD+pzfbtHy3Gqyg/CVb1SO5vcEX
 gmsfOh+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAXvBQAKCRArRkmdfjHURWcyD/
 4z4RX0Lxrn8tRX8IbLQW/N48Svs7bVH70g6E+YXnC6C9ssz3luDY0z71xfUToW3uHSPr9kDnHstie7
 j0DZaYi1Bi55JgEnWgDVUTgwXuxHNgUaAuv6qYdy4QpzvcjlPJIDQyjvnkidoltKXn5cS8oFIfNJjq
 16TfmVrgsWWLNR9qVRCSS0QeLF1JmZ/x551NTgRHo8d1T/JNbat7vLAlnQLcM1SMYb9AKVLiaO7KVG
 8w+k3P9OegKSROlnvQP7qfay+WgFZ1XIgVCXudIa3KoRF5oBv+ib6SqJ7AK/wg573Os6zkv/CITh5u
 dUZA6UJ6LlH1iXdVESJqR0y2RpVeuzyqUK78ObnAAuIEkggVy1+soI+cgk2uHoVsjXjMS/qYyCfIZr
 INzJT/rZkWSRaa+6L3DccSnxL5Zgwvs/niCpSAAGrEa/KCxhA3hLh0XTQQ/fZK1VOpQdje/L92OcsH
 zOsL6NezU4gs3EOhNG4eMEQgSxJEq7qDa6NiKWv6roZBzjVgkmqPnFzl1InWFwL8qBoVVJq20w+maW
 DgSr+Y+e74nEk85GpJb8Ds10A+IxW0PvZzJ30HrY1Tl72/DHWDAwZaKX/yQREBY+22KT9ctbLhS4vC
 3UGqMnSkRQ54Sw1WEMCszYcWoH6PV6m0tpctS6laxJ2+oNXIcLFGjIeS4htw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_054756_861352_33469B21 
X-CRM114-Status: UNSURE (   8.26  )
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

Enable the I2C0 bus provides communication with:
- The integrated RT9466 Switching Battery Charger.
- The integrated MT6691 LP4X buck for VDDQ.
- The integrated MT6691 LP4X buck for VDD2.
- The pin header, to plug external I2C devices.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4683704ea235..b68aee8f229f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -87,6 +87,15 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -96,6 +105,16 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0-pins {
+		pins {
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+			mediatek,pull-up-adv = <3>;
+			mediatek,drive-strength-adv = <00>;
+			bias-pull-up;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
b4 0.10.1

