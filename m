Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AACC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3q5bAzQikGEaFLCjfRt4Z8nKD+aA0c3SnrfHNcWXEY=; b=wZY4oKJsO7k90twol0vS5+n6Gj
	KeirNT79QLtujgLzU73xkC3JCcEHNWEkl7RVxKX44+A1XhGPvRKO586RkyolspsASHraRTCrgrVLE
	5Ws5Vs6dGx1EwagFMtAJ8OC1npuibgbVkIx2hK5LRXi/u4hTrtLc3gsO4neZF9FbB69FL6wpkbz98
	JCsAqQkvNSRdZLbnbSKf6iiz5WW0/en4shNti0EQx16CZyBRPUQjqwvD0/eZrxKWmwy25Tn3dXGpR
	HcAzu/EqY4uVsLqNVEGYyh+kYtPQp387qSON/Gtifw+IO/hjEfclSuFAwNvRDI0y9V7dXQcsE69a4
	ZNrAnc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0U-008zoG-2c;
	Tue, 02 Jan 2024 21:09:02 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0M-008zhS-2f
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 21:08:57 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so466021639f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 13:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229734; x=1704834534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3q5bAzQikGEaFLCjfRt4Z8nKD+aA0c3SnrfHNcWXEY=;
        b=gW1Pj5Qyzjw05Apwbd6NrTWyCxnlRsXCYac7XbeUJieXRpn3j3sWEvQvvcup41ors0
         s3TrrQtoqhUGrv7HW27/WfSPN4Pq320Wr2mD3Ur/TMtJ2wEwI4L9WYmAp/DK1SwQ0fI8
         v/rLuFRvf3L8D13ZaqPzTT8Tuq0FR4YkenciI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229734; x=1704834534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3q5bAzQikGEaFLCjfRt4Z8nKD+aA0c3SnrfHNcWXEY=;
        b=T5cOKCtl+kdOulyWqnGBMBpnFQk6g/xEVZD/VBZVlPOFpp3mTyCE5HUiBTpHPnWGwn
         cSWrJemtaIqfnsRZfsojwo5tpe0vS5LeQc0p5gr/ZKvyifHDSZ8IHJpbXXVeQernA1Gz
         oZB3epgMHZXxui5/nTWMzIx4ir1tOBswPcHbzxkF1DDobEGpIsFLzUuKJy1ozPSCFfgg
         1TPJ+lZXnbbMBiddEfTC2kegZapym+ipfjIqu52WQVzh2F676vjANid0BuOG9qeoCzf2
         jTYXEAWibl6LHAkUpn2LMO6h+iA/PEaiq17gQeZmFPuWaeh9dpmr79ldh+UjJ5pOw1xH
         o7PA==
X-Gm-Message-State: AOJu0Yw/XRyvJHH8jWJqrgDWr/kROlqRbFY+vRRc88gubFlDxAMCPIJ8
	l55kZifpgE+qfDFqIwHOTWVXCgOY8Eb6
X-Google-Smtp-Source: AGHT+IFyaB/cl9XINtwxzc8FyOfrkFwShCGVt+Q6OLCTlAP9Elw0gWl88LBFhGGJGmWTzbBD05MnBA==
X-Received: by 2002:a6b:5905:0:b0:7bb:bca0:7670 with SMTP id n5-20020a6b5905000000b007bbbca07670mr1472284iob.23.1704229734077;
        Tue, 02 Jan 2024 13:08:54 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:53 -0800 (PST)
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
Subject: [PATCH v4 12/24] arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:36 -0700
Message-ID: <20240102140734.v4.12.Iee33a7f1f991408cef372744199026f936bf54e2@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_130854_951245_65C46C56 
X-CRM114-Status: GOOD (  13.02  )
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

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index bbdcd441c049d..2edb270d0bc2f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1149,6 +1149,7 @@ cros_ec: ec@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cros_ec_int>;
 		spi-max-frequency = <3000000>;
+		wakeup-source;
 
 		keyboard-backlight {
 			compatible = "google,cros-kbd-led-backlight";
-- 
2.43.0.472.g3155946c3a-goog


