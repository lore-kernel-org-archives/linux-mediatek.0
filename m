Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E51D109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFMxMapU3hwQJCSTDwEi8To2/kdfkAjdlH0XIXA5iyA=; b=0nzgKNYmME3cxQJ3xBnmKNJ/Wu
	RmCwWvh9pYaeKd4Dsuk1MwpTAmpuGaKk/iN9+ftXL+1AUOvDH9VR/tvx1rcCNatMvG8gKx8Q3rJ9H
	M1TPUC4mtVbBaYKSSIbbA1uOmKBqbog1qYQrCvgqSx7LaoR7Wv4F72PdhOJeKTiKuorM3rECA8MDp
	wsneMas0pRs4JhOagHTryzh9iLafNZbwUS+LUUhJf1Ggj+KkcYYLM3Gpjy9qs3m8olQP5yns3PhkF
	uS6qlFeWIXLAVI7sW3EIvO/2X8E1QI8kNYH2THbch4IIV9tTMVg+W1Oq3CfND+nzCHIHbajP7QPMf
	3jfh4tNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSi-0000000CNez-2CWU;
	Fri, 20 Mar 2026 08:44:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSc-0000000CNa2-2oSy
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b0586d5bb8so11467445ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996242; x=1774601042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFMxMapU3hwQJCSTDwEi8To2/kdfkAjdlH0XIXA5iyA=;
        b=FHNYKa2aLQnXTVt9Ho1N8Ppe2TNET2Rim9mVoojYlI1hE1aFjJm4wDh4dziuXyeyHl
         zr+/SMLQyHFh/aOBLhHbAjfNipRCl+NE5FKxDI+qOmBvGAsBxk7qDsD5uWe8o4i/fsxF
         67lDvoMdnfFE1BVGna99Us8Us1b1F+8n1Q5ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996242; x=1774601042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFMxMapU3hwQJCSTDwEi8To2/kdfkAjdlH0XIXA5iyA=;
        b=sqW/kZzr9e3DWENJ7k1+gP8kl4oXfvp+QeLi0TB52z8haWgubKMxL1Z7LLEnB6e3r9
         yr5EWDcTGUVGoOxsXea8fb7CmG8BALXbXhwOjqyz86ECJyY/x/U6LET8ooI//bMIc9Cm
         YJ3wi9hduWt5u9SjUY5f4ffBtyI3HmtN4cdXJ/f+5E+5CesTxoWDEpO+BL44lud71qup
         yAx+aKNxlPNsdokiWMVxC1jNs7P4zH8gs97ML9tVsm6Q9fPCJ/mmCbcEgR1UiXv7jF7q
         W8CvPJ1kCIFOt6NnSIf0v2rS/j1u6jFePuOqkplNACgIRh933GyN48UrASFOs4wWrGxY
         chUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjEzWZHLjdpqIEhwhJesRHMo9ezBdOoqr6Cos5jmj9nqt3Zfn8OtMtvdnmVKab8HqT1rFPIanG8NjrPC+QOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXtHhVSzZ0lcViQWUsvkFGrZnIofscydQotad1/xfLxDFtsqg
	KukzVmdrBSq6HNDnLJqSmzjG6FPtsM9Jp0a5sgk9hnYGsT9/g1kcHvMv9xDcgnUxoQ==
X-Gm-Gg: ATEYQzyL+dOaFYWtAXUG1LXXEV3Ap4Sp1Yk5Y/GnibKdAX4/zuz1ahmytOr5K3+HXkl
	T9jb/WVmagY01ShBQ2RYPFi4UBNZoQjetK/7/LMQr8r4pQECnGbJ4s9TtQh0vnsHEhkyenp/xo7
	6j6hDLResZBLLjFimKR3JS89EF5Coxk4whV7DEGdG11UDSaWWkZije/wzQ9Ure0IB5kzfv2uan4
	CK3f/fYmH77dSfX40j+G2uP/J41SlkJRa216qKZUIF3y4R/GwBl/14ZyeUJT6xpNJQpKka4nej7
	kXWgiGNTgiWvs3Bcrq7kFIEsPbagjToXuLAW9UFw/BBukjgS6QiYulQMmm0PDdu7zcXWnXeYj8u
	1gQzSTUZaMqOPh0Rotp8tAzN4xJii2Rh1P2KFaDYlp/ZMftqPgFRHC2xwl7IF7XAxVinUT+UYwW
	XLTd5hzc939FcHW3bkr2bTFLQH7XVmNONBQJ14wpxw8rQcUPWes2GpWEFev8lOVIOzkKH7BZXrx
	pG6DCfP
X-Received: by 2002:a17:903:1aa4:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b08277cbedmr23130015ad.30.1773996241843;
        Fri, 20 Mar 2026 01:44:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] arm64: dts: mediatek: mt6359: Drop ldo_vcn33_[12]_wifi regulators
Date: Fri, 20 Mar 2026 16:43:33 +0800
Message-ID: <20260320084351.2461060-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014402_714701_D556CDD2 
X-CRM114-Status: GOOD (  10.33  )
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

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them.

Drop the ldo_vcn33_[12]_wifi regulators. ldo_vcn33_[12]_bt are kept with
the "_bt" suffix due to DT binding backward compatibility.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 45ad69ee49ed..1c41c4701319 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -169,11 +169,6 @@ mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <3500000>;
 			};
-			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-				regulator-name = "vcn33_1_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
 			mt6359_vaux18_ldo_reg: ldo_vaux18 {
 				regulator-name = "vaux18";
 				regulator-min-microvolt = <1800000>;
@@ -236,11 +231,6 @@ mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <3500000>;
 			};
-			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-				regulator-name = "vcn33_2_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
 			mt6359_va12_ldo_reg: ldo_va12 {
 				regulator-name = "va12";
 				regulator-min-microvolt = <1200000>;
-- 
2.53.0.959.g497ff81fa9-goog


