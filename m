Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBE4C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeATnxPiO37XaEtB4eQZXrEcgW0prfgDBCAc6VotlMc=; b=Xk5dlMiBa8KALWVnh4nZUA146S
	uGjPXXDNXeL1DLiVZwkn2/0cJIi4nae/yh4pWsSO6iKQzKP67iN49is+xm8kpIVCpXJxEBJniUWlf
	pgpjCZkM1HT3PbKEqpYZN4ylaa8LEmknh0R9DVOLPx+tPH1MSk7KHPLA00xoYlLINfv9olsI6jRbX
	oYOX4FAZJxSXH443A9ws4HsV1m50N4wDKfEHBqEmHEyZAWg7ZlG6Cugx/zoUflLa3cnjPadMCkvnV
	yyOro9QWME7zUxa0j8e0A8Wumya964I/Rl6QFuoDOCrTe0PFr1vvRKrSOmjIyDHkxF23oLX0wpODq
	UcUYr4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0R-008zkw-1K;
	Tue, 02 Jan 2024 21:08:59 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0K-008zf3-0B
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 21:08:54 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7bb5fda069bso168108939f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 13:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229731; x=1704834531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeATnxPiO37XaEtB4eQZXrEcgW0prfgDBCAc6VotlMc=;
        b=FAJSm2kJBL3aGtUou292XP+4nKKDk0vQW1PTNcDRcTecF/7NOCKWdzs0VrMSw+unzP
         SheEXxwUDEPtc508J6IWYrR/m3ddCLxN6UwOpYMjLaMF+k0oYGkyw25XP7/Y7axo/d+P
         okVqQsFeB8mJt9xndV7a9QYsw4i1PZD9vnOAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229731; x=1704834531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeATnxPiO37XaEtB4eQZXrEcgW0prfgDBCAc6VotlMc=;
        b=AiR6+Jczf1LEppD6RsUObaTfhzl1DYe3i9hYSyhF9Js9dj/navUQbcnpVBvSDGktCe
         xB3i+62BRAKCxHSh5qL8FTxZ8cTWndmkWXq1l+sc0hkEXuV5FklTO0sU1OLY0m0xwzC2
         EPH4YX38cfuNlNzohki+28eOXz657Uq4pimQdqYxXFJhGJEradTRjy4gXtcDN6UF39k3
         o0kZNA8vOyi1r4kLrZodTvRPsHeFl6hiwDaI9++dnDp3gMxoZMKxpYnfMIDsFF+xPKVG
         KeTVpiaZN7gnc7dS8KOa6BtOEZpJadsuFxWxWg31D+jf34atnuSMwb4fXEvr2oSd5CSn
         Bv5g==
X-Gm-Message-State: AOJu0YxlU1Z5aI9osSJauQlspgm+a1JGYQVZOOW/VX9A4IofcmJ8m6BQ
	wftGEJ3vckm0PMRugd5L3cf5ZUwb289t
X-Google-Smtp-Source: AGHT+IEq/nXkNhcxVKQTcs7pZQy/wi+fDhhMJ7dsO0o+UvKjnInsDMjSKm1DUuQtSSG5kZZEdWWxwA==
X-Received: by 2002:a6b:f008:0:b0:7b7:4c36:f295 with SMTP id w8-20020a6bf008000000b007b74c36f295mr20729710ioc.40.1704229731497;
        Tue, 02 Jan 2024 13:08:51 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:51 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 09/24] arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:33 -0700
Message-ID: <20240102140734.v4.9.Ic09ebe116c18e83cc1161f4bb073fea8043f03f3@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_130852_119961_7B20476D 
X-CRM114-Status: GOOD (  12.98  )
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

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Some Chromebooks use a separate wake pin, while others overload the
interrupt for wake and IO. With the current assumption, spurious wakes
can occur on systems that use a separate wake pin. It is planned to
update the driver to no longer assume that the EC interrupt pin should
be enabled for wake.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to signify to the driver that they should still be a valid wakeup
source.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v3)

Changes in v3:
-Update commit message to provide details of the motivation behind the
change

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 8d614ac2c58ed..335aed42dc9e3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1155,6 +1155,7 @@ cros_ec: ec@0 {
 		spi-max-frequency = <12000000>;
 		interrupts-extended = <&pio 0 IRQ_TYPE_LEVEL_LOW>;
 		google,cros-ec-spi-msg-delay = <500>;
+		wakeup-source;
 
 		i2c_tunnel: i2c-tunnel0 {
 			compatible = "google,cros-ec-i2c-tunnel";
-- 
2.43.0.472.g3155946c3a-goog


