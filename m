Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0271C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAFmBKE8MRjmMBDbLuBVUNc8Ts/SzeTOhwN0vFnmrGw=; b=wmg+s8epDQQ1RZ
	IHrmkTMOdxiYeaVw2lD90sy6WnB2lwkIfq23n1e+MJDw5h8yu9lBSa8cjPuGxRJTw0Q7+wrSNOe4f
	2kyMqj0HA0YL21r/45R9UZwYiqbKWlE8AgW4LX94V0i0uZLA9vxbrSPEAN/9QrcBpSj9FqoO7W+r6
	nE+bHStshJQzEbanTWEBUWQhevj1iKHOug+KHkZ8vRdQvqgsI6kH8uq/+y2rOphmsyi0HaE9ch7Bk
	xROZkKTLDLS+23g4Dt5mYSrIKxNpr9EfCsiE/ocsHnBGBdWzRgzGcrKn84nZuceJkvONWCB2Dr548
	N7+TC6SFtobYnM1xxFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNV-004NBC-2G;
	Mon, 08 Jan 2024 08:53:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNR-004N5v-39;
	Mon, 08 Jan 2024 08:52:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a29da3d61f6so153262466b.3;
        Mon, 08 Jan 2024 00:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704703974; x=1705308774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAFmBKE8MRjmMBDbLuBVUNc8Ts/SzeTOhwN0vFnmrGw=;
        b=d4CS9MMsxDU9ML26LvVJlX7YM7LKZ/GNaonDZ1rd/sPbu6RSgcGvHy41Wu6dQzsOQa
         j725x2ODsQ8ThdRdvol4DqUH1Ro6ba7/R4SpMk/8TUisEPeALXPXQb31wCk4P0tQxdb0
         Nh1PoZKqwAsuSEI86f2BLbPbwywQxjP0uLf9NcqtrNeZt9x/jLlw3yKXfF9G0Zzx3+ja
         t5Tcj+I9hINPHJWgJ3ntx8aTdKl6o6FcfI3XQPXhQh5BeHG16VtTp505lvrSXdwu8eqQ
         zsUg6wkh6RA+t74eA4IYewaDVVYja17zcWwSHzpGY6KcEefoxWq41Ra3q4Ig2LXeJVdC
         gJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703974; x=1705308774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAFmBKE8MRjmMBDbLuBVUNc8Ts/SzeTOhwN0vFnmrGw=;
        b=h6Q1DxQ6F++pNlJlw8uwBBOLJocH+We46QOKzmYBJuKVaW9Dky1cobY/mt/n/GC5cD
         xB+5SzuNCaGIxKGtM3cFr/5nJoMA6ZmKY4HM/1XaiMWOBpPDoxUS7t4XH10VwzKKHoZW
         f6Xxyr1wiL5kAdeX5fwR/Qo/vCquYci8MabqZUCMFEwMBshFlSVBXb4tp+vnKpfA4UDJ
         bcn8+Ng8PC3z9SUq62yTjvbEatuskhUlA837C5J2GQ2lk0x0ktc86lqm12htHA8I4dfs
         Rxtp60N3jneeIqWCvUmxe1l3VZj3+KubGbRvF0v00WOMaHMtRquPJ9Fnpa8iGD4EUCTI
         qU2w==
X-Gm-Message-State: AOJu0YzPYzP3hmfNL3l6XNzNwLeh0saacQbCDzt7GR2bq3kUfG4lYriM
	QFS9B+7sFA2nW+CfbdEOMWo=
X-Google-Smtp-Source: AGHT+IEEr1hR5n0BZpIAwYcpn9HJF+jFZ6KtsDNL4MS0u3E/k+bU/Mv+Eyh48nxjcAYXkBt0sWBufw==
X-Received: by 2002:a17:906:1cc5:b0:a28:c9d3:19e9 with SMTP id i5-20020a1709061cc500b00a28c9d319e9mr1467382ejh.35.1704703974054;
        Mon, 08 Jan 2024 00:52:54 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id uz29-20020a170907119d00b00a2aae23b414sm666046ejb.26.2024.01.08.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:52:53 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH V2 3/3] arm64: dts: mediatek: mt7988: add clock controllers
Date: Mon,  8 Jan 2024 09:52:28 +0100
Message-Id: <20240108085228.4727-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240108085228.4727-1-zajec5@gmail.com>
References: <20240108085228.4727-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_005258_036912_2B109E2C 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

Add bindings of on-SoC clocks.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: New PATCH in the series thanks to Daniel's bindings work

 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 41 ++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 5a778188ac21..bba97de4fb44 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -78,12 +78,51 @@ gic: interrupt-controller@c000000 {
 			#interrupt-cells = <3>;
 		};
 
-		watchdog@1001c000 {
+		clock-controller@10001000 {
+			compatible = "mediatek,mt7988-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@1001b000 {
+			compatible = "mediatek,mt7988-topckgen", "syscon";
+			reg = <0 0x1001b000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		watchdog: watchdog@1001c000 {
 			compatible = "mediatek,mt7988-wdt";
 			reg = <0 0x1001c000 0 0x1000>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			#reset-cells = <1>;
 		};
+
+		clock-controller@1001e000 {
+			compatible = "mediatek,mt7988-apmixedsys";
+			reg = <0 0x1001e000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@11f40000 {
+			compatible = "mediatek,mt7988-xfi-pll";
+			reg = <0 0x11f40000 0 0x1000>;
+			resets = <&watchdog 16>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@15000000 {
+			compatible = "mediatek,mt7988-ethsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		clock-controller@15031000 {
+			compatible = "mediatek,mt7988-ethwarp";
+			reg = <0 0x15031000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.35.3


