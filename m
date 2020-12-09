Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7013C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 12:03:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CFD23B77
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 12:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59CFD23B77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ffLJ9FzXr/bXCn7Un7T6APrEv2FOkvUizm+rJiueks=; b=U8mNnnxQzjeR5WR3hDPnXNZUk
	HDVbq1AwNYqp/2zW/sI8q7lpGtHaAUCh+sysHp57TTX01OGRTkVsBIL7nVBcPWjf0uLHWaj4M1F9z
	v3+wx62+fWQStrIBofdmQOB9x3iZfN2O2e4iTQ7H71l9bU7vt6rxAv6R/pHS88fiFbz+Q15MSJc58
	RxCMO4KvLLf3ux/k7NQSNnywPh1lxCdqEulneVBo41nlyFIWrvXuT9R5ANKfI59e9shU3P5lZWtoi
	yncA6Gfh1nAawklubOvEnOZGp/dtAPm+xabJhd7Cn0e5D80mL03SNWFPJGbYJlFA864rUBjmmE/mO
	G0QI0NrYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmyBz-0003eG-Sp; Wed, 09 Dec 2020 12:03:35 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmyBs-0003b9-IA
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 12:03:30 +0000
Received: by mail-ed1-x544.google.com with SMTP id cm17so1266974edb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 04:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jhTebHHB1yKIF7cssKlkVjUKOAUnXogHo6Up4bbqoQg=;
 b=0hyznWuWZqKpynL5fX4S7bsgyztK44TwnE8qPYF8Memni4zOyv2rFO2SNKtLh7V15T
 PcUw5jQKJ1/acoYMnFM8pwd9K6M0M7DjeoRp9beNN953P2wKibwzg/jPuljhmk+zUY4P
 RiP0w78x9veBsdW1Ppfz1Zg7hu3EDKZ83OYZvXBjVANwOVdcWpF5Uqwy/44qSx32wr1+
 2cXhJ2LnjHoRwq52o2FLe2TzbAkuhha+3EVhi1x8zg9S9i90k5oDoyc3BH3zlRiv67Bp
 wYy/kZfSRKYpGNbssaWSY1ch6WVVRhf7AcP5GvmcqhXtjZB4XVd2RP42roXYatZPdCr6
 +9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhTebHHB1yKIF7cssKlkVjUKOAUnXogHo6Up4bbqoQg=;
 b=MrDBM3oDdEB7d5LKmCCPmFfWPmwH8X/aaTyzBfOJVM9FD0AARgTt8wFNlfSse1FFeZ
 bQC7A8ING7VBlRnWKIPnQCSE3/0jQdLIF50dioaqm8cPDeV4TU/KWEj1J+o8/Vsjf5tG
 tPMYI3oPfOqyskggH2VNSTNFR7AH/w20eFK69exAFJ4I9Gl0iv2RPlDLYKfJiAXbjJlA
 xz77Z2mCKuNj5mHk8kQcTau72dG2W5loJK1LtZurIX/iFjPpbod/9BE1+Axwsq0M2RV9
 vStMf89he/Ncom46f2BmKGiSHl3e6OXBQ2/9xpRWemwrYlk2CxWGOtZXz0LKyz9ZGGE/
 RStw==
X-Gm-Message-State: AOAM531IKXtXOGBdwDE62w1u4IXaRRo9QTwff6Z3maXtizQPf8pPI9+H
 RPBCOzNtdc1m2ssQEzMikTDqMg==
X-Google-Smtp-Source: ABdhPJwRn7OBn73W+KHDERa+We/tGcp650qVwbLdX3kts9uoyWDBr0xqdxk8aNcWE436bWZmB40b0Q==
X-Received: by 2002:a50:9ee6:: with SMTP id a93mr1692284edf.174.1607515407524; 
 Wed, 09 Dec 2020 04:03:27 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id c23sm1426548eds.88.2020.12.09.04.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:03:26 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-evb: add PWM support
Date: Wed,  9 Dec 2020 13:03:21 +0100
Message-Id: <20201209120322.137610-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209120322.137610-1-fparent@baylibre.com>
References: <20201209120322.137610-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_070328_630074_E1B70703 
X-CRM114-Status: GOOD (  12.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable the pwm driver and set the pinctrl for PWM A line.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V2:
	* rename pwm0 to pwm1 since disp-pwm has been merged in v5.11 as pwm0
	* rename the pio node and labels to match the coding standard of this dts

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index cba2d8933e79..3249c959f76f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -344,6 +344,12 @@ pins_spi{
 			bias-disable;
 		};
 	};
+
+	pwm_pins_1: pwm1 {
+		pins_pwm {
+			pinmux = <PINMUX_GPIO90__FUNC_PWM_A>;
+		};
+	};
 };
 
 &spi0 {
@@ -392,3 +398,9 @@ &spi5 {
 &uart0 {
 	status = "okay";
 };
+
+&pwm1 {
+	status = "okay";
+	pinctrl-0 = <&pwm_pins_1>;
+	pinctrl-names = "default";
+};
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
