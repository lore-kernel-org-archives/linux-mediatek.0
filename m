Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED221CA550F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fmv+Vq9O4hXwTu7w7+aDs70zSlTsq1mhjzn706AuHTQ=; b=Ww8ofZsWnZpZFe4JJ8tphT75AC
	czE3/4WtnoVhF3pUVr0zbs8JvJ5VPVv4RAeEGQgdkYfxgqYgO6DoAGzZ0QGoVRqyuaUrhdfcligq3
	Vfnf7Gc8jsm08TMK+gWXyYLAvpgx+gHg4YPamxxDbTg9WG56NuxoHN6bsMjP2SWFblyTpcOc2UV/O
	QDrLRK1b6CXYYpaiFBkPVJokK0+q4X5zcamjZrb2wHE2gX3Nsui6zniFIuxFqu3qEwLD1UEpJnZUH
	cHkBQ4hdYRCDUHq/RVuTUhsZUq20b4/KXfsYvyNrfnRuKrUSdZLh9m46sRsUsQq5Ey4w/HdnNwJCF
	i+RkxBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLUm-005AcT-3D;
	Wed, 13 Sep 2023 08:45:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLUj-005Aa4-1r
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:45:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-26934bc3059so528772a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694594706; x=1695199506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fmv+Vq9O4hXwTu7w7+aDs70zSlTsq1mhjzn706AuHTQ=;
        b=LPn5lEgUN8aShEcWMayqY2Nj7n71G/CoWAGMkWsKomz/brVVnI/O8FJZGR96cQDHHX
         LVep0BnwJkW12+xzJY5KO2inHhACQ34s5R1thJRIh1UUyHLZlzitWLDUt73hgRgXHTTl
         cVfBROj3udAjH/SlJjTBD9RY3ig4vDItlk6D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594706; x=1695199506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fmv+Vq9O4hXwTu7w7+aDs70zSlTsq1mhjzn706AuHTQ=;
        b=H0s7N3y/2+4hhWs95LEJPK+YVnVWEyoE0TI0e7nCM99WZSa85Rx9OqcOrskGa1r2Ii
         RxJyrSd4BfSxE++1GOkIO8UF8QlK6oGd1Pi5rZGIjpDQI+uPlC+/EndImpxtuHGewMEU
         hPCCFHwVZw2/idcx1VYtR+0i3TTVWLcm3Ta3oIoDLcI0nMLnJjZqQ4uS6cz/628rM+b8
         2WqquZi+FOnvbO73tkuXSzn4a/I91sgE4rH5degxX5RbvjCng1Pgcup6F6kZQwctnBXJ
         /GlLKuujjxfnNhrlqfiP8taQFzQQtdWJHt6aPPHvzYERJftn6YmbysLcmQoJdHqKOwLl
         PF3Q==
X-Gm-Message-State: AOJu0Yyw6KymsmXEf7SVi8Ol+QtwEZ5ReSyvtxC2MJhzvhutURt0OY3B
	Oe0FHiKHL1NqF6gdi3RD4Aij9g==
X-Google-Smtp-Source: AGHT+IHtNFXdsXeRgSBZ865ZiAFdvUqy3I7+Xn/nQQMz7UYCXtRlSZT4eYOTpH2V4RjuYLt2yqB71A==
X-Received: by 2002:a17:90b:1e10:b0:26f:6f2a:a11 with SMTP id pg16-20020a17090b1e1000b0026f6f2a0a11mr3049931pjb.12.1694594705782;
        Wed, 13 Sep 2023 01:45:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b24c:3be4:d952:d3b1])
        by smtp.gmail.com with ESMTPSA id p8-20020a17090a74c800b0027360359b70sm937099pjl.48.2023.09.13.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:45:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3] arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators
Date: Wed, 13 Sep 2023 16:44:56 +0800
Message-ID: <20230913084457.1638690-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_014509_618938_173110BE 
X-CRM114-Status: GOOD (  11.71  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This was part of the series "regulator: mt6358: Remove bogus regulators
and improvements". Since the driver parts related to this patch have all
been picked up, so I'm sending this separately.

 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 96ba8490b629..ad5e4022e06d 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -292,15 +292,8 @@ mt6358_vrf18_reg: ldo_vrf18 {
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
2.42.0.283.g2d96d420d3-goog


