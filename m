Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F57109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skgYPmd/csbMfVTbMpbPZBTc77Iez0lUU9Z3iDW6dW0=; b=sQQv3YYTTEcu1vc8AqXk3M/LU1
	FWQ64mrMgMNSkT8Wq4xelLWRJV0LH0XTrxD9Ec7xCE/kdHuAVj4uvyIUxc8hKxikYlOfMMhE6Y7X4
	QwStivRgAeUjh9kD4n83aHc/tM4c4FfrzUmjsa2NvQT8c22nelXPvUZmwrDzcF7mX9bYMDyOhztou
	5enQTnNLSkhj4hMkUq/hQWouw/eTHu/RBBaQ/1hX673JBRD6FwtfpO2zPi8JwojnHXP+6RjYJ5J4A
	/1THb/WJIVPAt37BFA4DrFpiCBIb4o1n8bm7uxj3c25qr+Ix7GHriyTbVovAXrpmAVdBlT+N5O9WQ
	05b0vVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VT5-0000000CO2l-2JD9;
	Fri, 20 Mar 2026 08:44:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSu-0000000CNqJ-2fdZ
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:21 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso156224a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996260; x=1774601060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skgYPmd/csbMfVTbMpbPZBTc77Iez0lUU9Z3iDW6dW0=;
        b=bT16UvR9mimEFAPgL4XVbW2ff0XjHykM+czG0pEshCqeAEUYjAchJh491mPeGCadbp
         8VcXoTkSRAtHtSZQXPjIA9dW550TtZpg7RQGKInqthGJFwelkBaKeoVpp14w0e6kONEP
         95f+VRvOwZqzRJvEIeIDFTcOqas1O2frzR36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996260; x=1774601060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skgYPmd/csbMfVTbMpbPZBTc77Iez0lUU9Z3iDW6dW0=;
        b=tTivevkQX9eld2HobLle9dwkuB4wPMfLukU/ROr3EMTMoaC8jmkCrIoeSMmAb0eDVM
         3m/cistmbaK9X52laPUvbif0NqLg786++GNcRWGVWhqPJKJlqTXvMVvev7fOiqEE1M+V
         Wi4byGvJJK5MbceEMglP5djJoRco+zOHA5fFoTECP1lC3TFdJQQ82rrbWqCW4yRg5vuv
         7QaF8zwN2s0jtlusm/cBBvvpHvvzPS1821upuMgi2eQceZRNyvQ3HzyN0J3mIovF+vSp
         GBx7P+6eSxpidmoD/q5xnCFZUzVONX8p0m62s0TiwqltOY4W0FMsUL48dm7kZ5BYiWuU
         y6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWuPEOLPyiGrsc8TLTHgX5snqzusqy4I+qkmySs5Hk/61h9UFKnpmxk01xqSGSYUnamDr/XobT0+PZsCDhqXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJotf9UXqM1bwmmlIU54o9xeFpXLYK+yeXVPo5XqhmtBryZ2W9
	UZwwV+vG0xrUa7xdMHVjVd9iz0R6VrOCy6yLVtLGhMOrNIzl3m+6XKt0EJaz959bAQ==
X-Gm-Gg: ATEYQzwBMNGEWHvvzwii/b18mPzPbVJQ+9f2pIbrSck1rnMwmT7HAloWILwxyfBvZPb
	wPsvUQYG7tKGJlvm7o1YMoCz7MfaivKvx6/5f3aLR7NG9n7Sr7eswBGL5/yuHZxX1QTD/JngtJi
	lLXyXgEIrElCNsdmCzjO4Sip/15NRwIE+OKk8z67MHTZT/jzksr74w4JB72ILJdzInA05MFux9K
	LG5nbnnVtoaeHyoqF2RfIjTDCW87TN4P5t3uU952r4KBcv3eW1wGGdYETiTfkMEjQfD8AQ7pAkA
	XrD7gosymxipm8vHggJzOvnaG6BcRNw2ugIqWvnaCwXz3N0Wl8FR8haGEBHoC+YPKwrQXv9m+NG
	BA0mjPmGfpNal0wHXFvGfUtDefWCHwN8CgTWMNwdlgrrI7lVdQwkZ08Txt+whdk1K19+9IXAOCJ
	FAlIuxtxK/Fe7/FJMJPAZ8dh57whd8fs4yOJ8GDjsNrGUR0BEkPr/9n+3pLSntZaDnwo12KaXwt
	msXblip
X-Received: by 2002:a17:902:d4cc:b0:2ae:ab2b:bd75 with SMTP id d9443c01a7336-2b0826d8db3mr20448475ad.3.1773996260036;
        Fri, 20 Mar 2026 01:44:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:41 +0800
Message-ID: <20260320084351.2461060-10-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014420_681776_A5202F5A 
X-CRM114-Status: UNSURE (   9.62  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..b53e602659a7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -716,6 +716,27 @@ &mt6359codec {
 	mediatek,mic-type-0 = <2>; /* DMIC */
 };
 
+&mt6359regulators {
+	vsys-smps-supply = <&pp4200_z2>;
+	vsys-vcore-supply = <&pp4200_z2>;
+	vsys-vgpu11-supply = <&pp4200_z2>;
+	vsys-vgpu12-supply = <&pp4200_z2>;
+	vsys-vpa-supply = <&pp4200_z2>;
+	vsys-vproc1-supply = <&pp4200_z2>;
+	vsys-vproc2-supply = <&pp4200_z2>;
+	vsys-vpu-supply = <&pp4200_z2>;
+	vsys-vs1-supply = <&pp4200_z2>;
+	vsys-vs2-supply = <&pp4200_z2>;
+	vsys-vmodem-supply = <&pp4200_z2>;
+	vsys-ldo1-supply = <&pp4200_z2>;
+	vsys-ldo2-supply = <&pp4200_z2>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
+	vio18-supply = <&mt6359_vio18_ldo_reg>;
+};
+
 /* for CPU-L */
 &mt6359_vcore_buck_reg {
 	regulator-always-on;
-- 
2.53.0.959.g497ff81fa9-goog


