Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0651C43602
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=; b=F9qNvA9LTJ03+9FU8wCIv/LSzw
	TtRzVgcYvDjG/osuEoDOi6aHEON+eW3tqlf+gyiGXpTC+WdIyQM8RJvU+RYRbTY+YiFCe5Hh9iur8
	qF62U8xWzc8rW8T1qvovOdEgvXZTPeLX4/5/SFSgV/ZkPV0gu89fRzzylsWPxaygUVyTDdNpfMlTE
	R5CPzLBQ8QnCsq66boZnsP1GRlMolIeKv0u749qBRaUK645E9BWAbje8fJCJVbgIANVLUSmWxXXhu
	ZLWwoXQd33+yQmFbxYhkmfc4VtGKtzfG9oW+kvNK+GrKn2E3TNWAbrALnLXZoqN39pceq27FbVOPp
	/YDo6ygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQI0-0000000GzSS-3Ulu;
	Wed, 08 Jul 2026 11:18:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHy-0000000GzPW-0P7K
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:18:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47dedd17e12so34721f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509480; x=1784114280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=;
        b=EdpVtSWQ189f+wcx5yocmX6u7iD7Q+wu5LYE5hADEXh4Krx+EtlbH9M18oC31EYaZg
         +fFDXEsfvOHG5Rje5B2UKMkYJcofpc9X7KrDZF1CdKfbpzaUUEsw22vKAB4nIGrGnXcI
         Ox0DJtBaOJL1GwZl5s+DRcjkK6LmIhcYKrMgbm0CvDh+dGtF6NnCM8GGqbAGvv8dVuDS
         yk9G8EnEASTyTvi/P86fkbZvyZAM8xXKCobRLMXUiOtSUVWo5NFlq5eit7HICNusA0Jm
         SkWsC26wWSxVi4nfQ0HgNVSx6QkOZbeUxrei9iI3/olc9tcUNxz6RQ8lsVufopgqMymF
         jsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509480; x=1784114280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=;
        b=clEjLzqlnc7whjcljEfgWfslbb5/ov1aKP4mpmgSP2O0EbLoy0R+iGJWAoCn4BLB6K
         6akHVhbLBXf1lxFIo70mf56RDqwBSlHpen0Ic8jungLwEZdhabBjaJpDY342ZUhiXeWL
         lQs1LlROY56Hbd8W/+mrnxNpGW9eRAWWtJMQdOq2IE7EcnwxlbTjq/bT+ezMcjzewNeY
         JN6d/3wuYBxVPdW72NXltOjpVftTZm1n23KesKkODzbnuUcslGRttjanIp4ymF4WUAer
         0dugiO8DXvcN0rpzqu1YA8S4zUuV1Ce7iDhIl6sNnSn9w7T/K1I2H39PGfUv1RCSfu3P
         Zyeg==
X-Forwarded-Encrypted: i=1; AHgh+Rr47SXTQN/WgbC4IO2F/ntbRAvDanqM9MB7LBQ29+W/o5mF8BykZbQBqnqfBNIx7llrJf04veR2nw61BymHjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVqKGSOoRXNMU0DOhsCHkVkHqIDf401c7SQPw8szZcRncpcPHm
	WY7evgRYKhcfCzT+oJ42SsSQKUPAOp1GMNidzluXZdL6BuJLhqCDED9lGVEHft72G8QxL3dKadZ
	sGaqalyhkHW50
X-Gm-Gg: AfdE7clegLWwjFGhd+f5J48DHkid7jbOjriqpNDjiU490sdZ+umGNCMH+ERqvJ3ZBAD
	/14KuP8jvHieZC3A948xopgo7Ojx9q9FmBqzMal6Ojcc5NTgRI2JaxXMZIvruUVPI8kdL6s13sz
	P78pQwV/B9nywZ6OK/3rdlN3kkIN/YNW9BgK5W22TaeOePj3FC4MN1kAAN8Q/PfrvaS+x5x7qNh
	BZAX6zjbgcmbmQB/Ba4aS4OSVR0VE4q3MGQ1XJJ88BYubMEIiAEgK3QN86AsbHyxO5FN6M5ybph
	51FFeVw7C6ZgZo2mLN+IHspOK2wcVeXnj48E5Lznf0ua8yW+G9jtBIsFv0rxXV2kzR3VOpwgVUV
	wmT6JbAw3Ya/EOfJBhrH2Was16VZQ8mdkaeaPnPSY6Mupc+CZpIOpaVWidYzcj4VOHsh9WemNRX
	2LZ1VG2h2SxDfSJX6xFUXzhf/03FroS3pWvPlxpi1YMO4tgIoZqHZ4BDkZr28lE3cmzv/MoncjI
	LyLeBr5GHh/0h5h9w==
X-Received: by 2002:a05:6000:290f:b0:473:c18:f2cb with SMTP id ffacd0b85a97d-47df075637dmr2204598f8f.18.1783509480468;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 08 Jul 2026 13:17:40 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: alias all enabled serial ports
 on Genio boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-1-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041802_153424_B2F2BA9E 
X-CRM114-Status: GOOD (  11.66  )
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

Only serial0 is aliased, so the remaining enabled uarts get first-free
line numbers. When the console uart defers on its clocks, another uart
can win line 0: console=ttyS0 then ends up on the wrong connector and
the boot looks like a hang on the serial console, depending on probe
order. Alias every enabled uart so line numbers are stable.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi    | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi    | 1 +
 4 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a30ee523b0b5..c535de34dfac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -24,6 +24,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..26e24431d467 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -33,6 +33,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcm1: backlight-lcm1 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..51f12328a1d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -17,6 +17,8 @@ aliases {
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..86e487fb1832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -22,6 +22,7 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {

-- 
2.55.0


