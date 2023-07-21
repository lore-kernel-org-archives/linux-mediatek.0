Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A991EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRGfxOjw0IcbmsCMV0/zHA7oWZTkNo2dmmtwCT8Vhjs=; b=13wTbHUWyohzwsZxZJtpH9FIJe
	+ytZEUGtNFkubJUI0fYPGWJY5Fgjnt+38d4Jn24oHlxz69EL44Ti3dX691nNOGD6Z2cEVGciSRVTd
	Jb6hfncvohf8XxV9pozrjw4HPd1tEyM8YcwrpoUE4M95ggtXkDnATlctkIm7M43ytsOs8JCf33JlO
	QjvplCnGwL/vbZhn1G2WssSplt7WZniNyCvtMU1U+XqFEvWBxFABdfcbtbTRBzl/x2rg37ecpSLnB
	xRMhMigk5SGOlIRzqJmi0p1qsZJXfQ5VdX5ZaSEwCWbtsmKvWd6SUdXLPy2Sac3l6M42IhX/4qZHj
	XUTn2F7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlWe-00DNkA-1N;
	Fri, 21 Jul 2023 08:30:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlWE-00DNT6-2R
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:29:48 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6686c74183cso1490246b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689928185; x=1690532985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRGfxOjw0IcbmsCMV0/zHA7oWZTkNo2dmmtwCT8Vhjs=;
        b=WJ4fIxCIWwC/w03SXcaamhybV8KieQrq3hsGKL/F/+7w4K8NCozTrbzUfpfp0RODO6
         GUQbX5KhU1Hb6n2eh9LjMA6geGDTaATIpyKkAJ72G9tgrb+CmefEgSN/SzZKK6Q4oV2s
         q1W2mQk46S42zFNJkJIMM0CJHiV+9UEsIWNVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928185; x=1690532985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRGfxOjw0IcbmsCMV0/zHA7oWZTkNo2dmmtwCT8Vhjs=;
        b=ZsIAXxn+yJ2FBTaBjBB9uXADzY6708NcJVyWtg8owTwhpteiuo77H1uFwMMqpDxexI
         esrr73O7eoksN/wkZq0mu0u3Sd044kSU61iU7fTiQzj4V3QRy983xhjCLk86Gpf6UzxT
         3xbXb+De6In3qN+8G3qSmlQyR02Uc0lSv9QmYmfaZZY9ALTxIhsneV/03FZT/YfDJaML
         o7Pcg24/FAeUOTVZzBpBzYJfJW5biYZU1Hj4URazTLkXuuQw+7yvSCHAS5k8I3Rmam3h
         9hmfKd6ewy10Izt+L5BPx5uhQCMl6YVS4ZnqqdSmfpro60JW2TyNjBenknCQLJ3BDOIc
         15tw==
X-Gm-Message-State: ABy/qLbEGzAdW70kBrkQbDuFJQYNd8KB7nALwWQ0jcuIJcm/lKYTZKxr
	H068QBeXkFVBCW+hPYliaT00uw==
X-Google-Smtp-Source: APBJJlEiBPi4j0WNe6cfbaLSyqDT+I6QoNb2wwHokr09zqnos1uSYq2GIuMgmtG+1rdaBUooxk2BfA==
X-Received: by 2002:a05:6a20:2446:b0:12f:a373:ba8d with SMTP id t6-20020a056a20244600b0012fa373ba8dmr1552049pzc.24.1689928185246;
        Fri, 21 Jul 2023 01:29:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id d26-20020a63991a000000b0055fe64fd3f4sm2594382pge.9.2023.07.21.01.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:29:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 7/7] arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators
Date: Fri, 21 Jul 2023 16:28:59 +0800
Message-ID: <20230721082903.2038975-8-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012947_394291_1EC4DBD9 
X-CRM114-Status: GOOD (  12.30  )
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

The ldo_vcn33_bt and ldo_vcn33_wifi regulators are actually the same
regulator, having the same voltage setting and output pin. There are
simply two enable bits that are ORed together to enable the regulator.

Having two regulators representing the same output pin is misleading
from a design matching standpoint, and also error-prone in driver
implementations.

Now that the bindings have these two merged, merge them in the device
tree as well. Neither vcn33 regulators are referenced in upstream
device trees. As far as hardware designs go, none of the Chromebooks
using MT8183 w/ MT6358 use this output.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index b605313bed99..186898f9384b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -304,15 +304,8 @@ mt6358_vrf18_reg: ldo_vrf18 {
 				regulator-enable-ramp-delay = <120>;
 			};
 
-			mt6358_vcn33_bt_reg: ldo_vcn33_bt {
-				regulator-name = "vcn33_bt";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3500000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vcn33_wifi_reg: ldo_vcn33_wifi {
-				regulator-name = "vcn33_wifi";
+			mt6358_vcn33_reg: ldo_vcn33 {
+				regulator-name = "vcn33";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3500000>;
 				regulator-enable-ramp-delay = <270>;
-- 
2.41.0.487.g6d72f3e995-goog


