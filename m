Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB3C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/O3ksA4hTWY+K92YS4jtl+yo4GjNFqWPajb0hU9Fy0=; b=fz8zRtM38+76XYTBA20z/lGeCR
	x8TbaE+VRxKwOytGNaX+4ly+x1jTJKhQQStAyNFMulP+T5HRnexnc4eogzviwcDoPrUzeUaCk1Cay
	UmfslPCDuZehbBl5XEHp0Kn/iAsd/blZDTtiA9BZtSnWY+Ctl+vPp9RV33iQjreAe7PflC4H2hKgA
	Tz6WFo846zEGY9RDNgxGqKAXficP8xUgL6OFec8SQM+QUpODXuIwcLyPsbuFJV8H9JNufQEcJLKCJ
	cb2bsjpI4luM6zhNbnLPWA88CEXQ+XYILniSY4zZjGqucKOcTZWIqxpIbdkuZKHYg/aPD2HF3MrlM
	wwI4pW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSdH-00000008rx1-0kJI;
	Fri, 23 Feb 2024 10:18:19 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScO-00000008raJ-1yGO;
	Fri, 23 Feb 2024 10:17:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a3e5d82ad86so87685466b.2;
        Fri, 23 Feb 2024 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708683442; x=1709288242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/O3ksA4hTWY+K92YS4jtl+yo4GjNFqWPajb0hU9Fy0=;
        b=l8ovIqwQmMV1bflaowB54xU3SNvFZExIJxZg8xjqE+uvJfH8jYkhJe1X0MdC9y+ve7
         JFbVW85/LC8GwHiqgcUkPWHY4++PhIwmruxzmec6Rxdyc6S5S8ScXQ604tqlF7+BWMJ9
         mhTsNL1DXzO9MICwPjCTJSI+NIIlq4e3xlW0Cj4Jcjv5kDmroJvKXs4dy5meX3Nipum+
         PRW/7I7yDhkCcfel8cOQSeFsyyuno9OFbDpvhcfTDoBGtsZ9F3kIJnJpyfeCweZgK7Ew
         9foLNd4mdzIVPJbq6pXOjCkUqFDfPwU72PXXJX0wxU8iLmSj3XjVW+lcI7iPqpEgxABK
         /rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683442; x=1709288242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/O3ksA4hTWY+K92YS4jtl+yo4GjNFqWPajb0hU9Fy0=;
        b=t5HVhODxw98yeKGsyDKA+4Oq8NI0WF90z9pjtgccYiegLs4+pNEjbjDDSQPF62KtX1
         Mirk/u2dQ9kclhdhjRcug+9wXLlNar35UhdJT5rDvufeCW3fIIYq1OjVW3jvvdfyaRnb
         R6v9Kms3BU5+RzXZA5K6qyjVgUQHml59htqIhYR3FnFPouPObF1S6zPosix9F/j+Y4fb
         EpIS1W1RtLZT9SNx014x4PYG8SjJndjUHPzVmx+ABzZ3iteOIJZVV3PfUWZMNBhEXpES
         qMEAUk5KD5q3U01slGqFhDVcVLVlTfrTOrFUMtenfuSazBNfOOcxsDphh/RKxt9TDleA
         IdFg==
X-Forwarded-Encrypted: i=1; AJvYcCXk2aKe9iLuVwLDJGxcGXW9guREVues+Jnnct5hYS6h5/WNEwGAkingIKz5zlifsPZJYn0VIP049plg9Az8HFQ6Thxd1gcFrUzqyTK/UOolVtaEPmQZ6Qw93vzWw4MMGNJE2mpS2CuMAq4BU1xjx6lsq+PTb8oKQY4=
X-Gm-Message-State: AOJu0Ywf4aFeUTCVRnW6TadN/1h9982L/m/hm4rfSX+NsocuQAVN8/4g
	Sjhwkk6dU7rxIwotmpOuYxcKZxTWh8qajHke+D9CPmGRZToKP/TB
X-Google-Smtp-Source: AGHT+IG5VUmyyKRrQhInbKERyLXwLXU4+G+23MuclTDO4DirdFc5S4LWW/fcfGxF1T3ne/aCDoNwpg==
X-Received: by 2002:a17:906:2297:b0:a3f:8968:78dd with SMTP id p23-20020a170906229700b00a3f896878ddmr925100eja.55.1708683442666;
        Fri, 23 Feb 2024 02:17:22 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a3d99dc3f3asm6667250ejc.67.2024.02.23.02.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 02:17:22 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 3/4] arm64: dts: mediatek: mt7981: add pinctrl
Date: Fri, 23 Feb 2024 11:17:08 +0100
Message-Id: <20240223101709.30072-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223101709.30072-1-zajec5@gmail.com>
References: <20240223101709.30072-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021731_545187_34426843 
X-CRM114-Status: GOOD (  10.74  )
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

MT7981 contains on-SoC PIN controller that is also a GPIO provider.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Drop board specific code

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index a187a34d12ee..5674ac81d1f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,6 +94,28 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
+		pio: pinctrl@11d00000 {
+			compatible = "mediatek,mt7981-pinctrl";
+			reg = <0 0x11d00000 0 0x1000>,
+			      <0 0x11c00000 0 0x1000>,
+			      <0 0x11c10000 0 0x1000>,
+			      <0 0x11d20000 0 0x1000>,
+			      <0 0x11e00000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x11f10000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_rt", "iocfg_rm", "iocfg_rb", "iocfg_lb",
+				    "iocfg_bl", "iocfg_tm", "iocfg_tl", "eint";
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			gpio-ranges = <&pio 0 0 56>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
 		clock-controller@15000000 {
 			compatible = "mediatek,mt7981-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.35.3


