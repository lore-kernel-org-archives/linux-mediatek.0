Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE4C3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eKlUNbymqJaT0kOcCn3vFHLPBM9nCKu+xgIgCZM/a5U=; b=roOCyj7ATZS8BBaIRwMa705ftA
	cJMHECXQaekf+c/sPcVNRicalMlCNNUdShQkH2euYZRyxcvZusDkGOIdDjgReSFZIJkJWFiXD6jiw
	MdlAmf14HjpNQv9UFJjUa6qTmHYVH0iVrsv6tP7sbb3J8qQdmfwelYrBolY24ZHEeLAuBSHNyQmqz
	uj22TQpsNACvYmfrwcVeC3kYIi/k/yoXU3sTc9JxBNQshtwoP1I9rYIyxgG5qh6i3XfUTLDV6kJlL
	hdt8OH5ph5zHoXYCKekVH6fz1pcNoGeiVkFXvGebnE79pn8Bk9792BlgXPGMQIeF51jl4fwpZyYYA
	jQeSjkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeql-000000075V0-1jdA;
	Tue, 02 Jul 2024 14:51:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeqZ-000000075RB-2HJU
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 14:51:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-36743a79dceso3106086f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jul 2024 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719931865; x=1720536665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKlUNbymqJaT0kOcCn3vFHLPBM9nCKu+xgIgCZM/a5U=;
        b=oP5hYx3KVvLwe+7FqN0bYteW2tnacJM36qv42A0zt6aM4t5CkYbVIVxCBTvoeoTiQt
         e0WcQ6KHTIlRPteJNoslRkpIwuprzWrJTbnHsz3/tnt4UEqahu/BlpOj9jKwp/fgL8M+
         3Sqwy8ExdVW50m0/3XGqnuFz/YpfAnVWFm6frxktEbmy6fYLiQ65H3N9WWYx24kFzCXx
         0ZVYNZOQvdo/6ydOrGU2AwTF/M4/kNGAWRVrxpBIm913obZqgZWpWPN85UZpL1+rcw2F
         608gL1zOYOWl9x8rEhcS3jub4NtUHi3EmDYc9HRpB8bJsQDcCLqVgW9TtAwU//hCWBe/
         8+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719931865; x=1720536665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKlUNbymqJaT0kOcCn3vFHLPBM9nCKu+xgIgCZM/a5U=;
        b=YnQ2sfY/FnghDjdxPy2dICRpWvHNMLepusHJIPqNX1/Ln8VT6NcEog1xgoMFWoJul4
         d0LkZj73g23XDX20jgyN8Wm6G1IsFAaVFX5FAuzJDql0lqZe/+bZRqKdn5It5n36635q
         spWDlN1j47yAFvIQgrUt/C5qB3Rr+FGJiWHQ9eI6q2Ed1oYm4MaoZsD1khJ1qEyAqwzI
         8UaSF1KDnG1AeFldvnVuBUbypvFU9scXEDS4X2igbEryjkz+EmeiHFFmlsJ385wj6lGB
         Mmkp1uWk3bsugIePOcx3jGB23jizZXsriNlE0IE622gWU6GMBtlqTd2z5waLwC2KMW6K
         dmmg==
X-Forwarded-Encrypted: i=1; AJvYcCXRp1EdQtWEpWSfoUXG+Xy1ZEn8ZgEC1rBxQuXlIk3UK1oQ2emUMlfdkJHeGk4tntjXwt6nxg7lhD1xXASWTKIoGafr545e1ZtIsrNTh9y0NPDL
X-Gm-Message-State: AOJu0YwRuwqGgfpbdABfM8k6JRRTx9bB08YGEJJ+ysvKc6awRT/oua4C
	j4kOeqH8kygUGlr2Y8oci0arBoloIyDZSGOpvDBavYgC+eTyXzgVXhVLSYfZ6Es=
X-Google-Smtp-Source: AGHT+IE92eVX4dmFvFo8dRtaK3wOWUlw/jSZDiMOkwzi1Kl0xeslgoHpkVbmw79Rots/plOCZ/47Rg==
X-Received: by 2002:a5d:6d8c:0:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-36760a62ecemr12678404f8f.1.1719931865524;
        Tue, 02 Jul 2024 07:51:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3cf90sm199618855e9.5.2024.07.02.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 07:51:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: align thermal node names with bindings
Date: Tue,  2 Jul 2024 16:51:02 +0200
Message-ID: <20240702145102.46953-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_075107_610167_126B31B1 
X-CRM114-Status: GOOD (  12.17  )
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

Bindings expect thermal zones node name to follow certain pattern.
This fixes dtbs_check warning:

  mt8183-kukui-jacuzzi-burnet.dtb: thermal-zones: 'tboard1', 'tboard2'
    do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 6345e969efae..3aea2643f21c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -974,13 +974,13 @@ &ssusb {
 };
 
 &thermal_zones {
-	tboard1 {
+	tboard1-thermal {
 		polling-delay = <1000>; /* milliseconds */
 		polling-delay-passive = <0>; /* milliseconds */
 		thermal-sensors = <&tboard_thermistor1>;
 	};
 
-	tboard2 {
+	tboard2-thermal {
 		polling-delay = <1000>; /* milliseconds */
 		polling-delay-passive = <0>; /* milliseconds */
 		thermal-sensors = <&tboard_thermistor2>;
-- 
2.43.0


