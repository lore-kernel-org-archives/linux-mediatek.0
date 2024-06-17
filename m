Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1087C2BA15
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bcuZ4Z7Ju5cfGFg1cV6UdejBbxf9VioHEUYBDgDrB0Q=; b=Y/go/8SenuQnLB
	A6h3IWDjxVEtUhbCufP8TVdXuDwJAC95LAoV9ZY5N4RVGx4FIeApNRdxV18M1X7QekmZj53iZG8/A
	8mRsB9UlEuqoU/G6SblSdBg60vyzw5pJ8BlCeruvYdKLqvVPdWWGx+ZDGobaD4XKkC3s8hhgB19Ol
	xssQCERaFcdQeEzROizbO0mG+WP5jPLI87ab8Gbj6Pbl9Yt1XySm757QnAcrWYchSUAE1U1o+Fecb
	ppoFPO9SLbVahIRDXkjE5vnzkLa4dImjkGIhf/6N1TxD0fSjQVDNb7WksidfuBRTTvLifJAmZ2kNp
	ovMFZ9L/JhEDYF0slDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTf-0000000Ae5Y-2gCY;
	Mon, 17 Jun 2024 12:28:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTb-0000000Ae4W-48SY;
	Mon, 17 Jun 2024 12:28:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f717ee193fso30793445ad.0;
        Mon, 17 Jun 2024 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718627325; x=1719232125; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcuZ4Z7Ju5cfGFg1cV6UdejBbxf9VioHEUYBDgDrB0Q=;
        b=FRKZ7JWJgqRmC1MSgHPpLAt85eLUAmwmeTLsHJ1RjawTe1PeYDd5/1FDpq6mZykpRr
         J0gEGpp7G776xbLLWJ6LDiqSnFjnTyT3Z+7GjB5OBExZNFWhj4RGoS1b97PM0xreuKu4
         AJhh9seB9sSHpXydV1CjF31Lqm+2J58xOtvnuYQ6T87gVPvoZt10MagsXhjZUCzdOKhN
         L7/TlR0i8kTxeAcWsd70EG5Du5RscwkgV2TGbftnFBm4CqAlfs69GimXE+Ckjzdx0piy
         dztXKfFdihYPgAyWgNtAHNBcGKsrOykoZKlPqBTwwFqzUNC7cGVouVx2Nbiyqoie+J1m
         Oq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627325; x=1719232125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcuZ4Z7Ju5cfGFg1cV6UdejBbxf9VioHEUYBDgDrB0Q=;
        b=Sm8DIrMxlW7c2xRpBVCZzFyfx7j92RmxwY8F/Tfirckl3ucCbdxG2B5DsQ08vGYMIf
         Z38ntf0FQd19VgMyxotwhgjn54uUeHYWtnwB2mpjqYtY3lfqEmlBiNz7o9wyJv4nat6t
         fmHAqaXxX1RsAtAgQ3xp2OrKtNmNtT5zOlNQixWK7Nt3DqiUzfQhJY5Yb+aEqRIK/7o4
         lqYCrh6g7AUn+wRc5zV9xZufuaQ0oJ5drs0VGyTAkMp4IMk9ziOFCJE8+fLQYe6YDF8v
         Mlt/5n5IQ4m5yA0iZI5bizzth/AtRm4V5VwCoQPZ7lP4VOOQ4CTpzmvhzOPySPWSqCZQ
         rg+A==
X-Forwarded-Encrypted: i=1; AJvYcCVpLMFUuNJf729fHvkuByJIF4WY7H1yy7UO4mA9svyV5TdkH2yIOOW+dOkeHLfnMtFTaAbXx2oMhWn5VdXRfoZSdItjZ5VX4IjQC8/Fiw5/xGpWA41lLJ9fQl75LEe3HwzbWob2KG5saSVRq5L2VKJoMN4uPKY1Hhk=
X-Gm-Message-State: AOJu0YyCy9ZchYDQnKDUIDyybo6am+o+GKoLXDX3vC65q9jvgHlIiinW
	xndz9abMhYqaRWiKp+En5mqqdZccdcYdZfNH+xHos2syrccm0UD8
X-Google-Smtp-Source: AGHT+IGyHRNgKJh45646E8uYDC+bSaH38nJT4cO9mjlRduQPYsbfvtwjmjWJ5wLl0K8+U8Yn5Y07nA==
X-Received: by 2002:a17:903:18e:b0:1f7:1a9:bf07 with SMTP id d9443c01a7336-1f862805ed4mr127085835ad.52.1718627325155;
        Mon, 17 Jun 2024 05:28:45 -0700 (PDT)
Received: from localhost ([103.139.191.219])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1f855e55e0esm78221295ad.26.2024.06.17.05.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:28:44 -0700 (PDT)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
Subject: [PATCH v2 0/3] Mediatek MT6358 dt-binding documentation conversion
 and fixes
Date: Mon, 17 Jun 2024 17:58:23 +0530
Message-Id: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcrcGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDMwMz3dwSM2NTC91Us7S0NPPUFFNzE3MloOKCotS0zAqwQdGxtbUAdnq
 XsVgAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Kartik Agarwala <agarwala.kartik@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=agarwala.kartik@gmail.com; h=from:subject:message-id;
 bh=acUhcgcE76YHRT7EWreWL5lmF3NgLUrREHXNwwfcifk=;
 b=owEBbQKS/ZANAwAKAXiEk+OPlULqAcsmYgBmcCvy7VPep82WO7nrdwh5FthU+b7H4HVzXvK5Z
 7Q3l8k7UUiJAjMEAAEKAB0WIQSJkbnrkCGnamD0k/R4hJPjj5VC6gUCZnAr8gAKCRB4hJPjj5VC
 6jBtD/94FNnjYYjItI/I7RseHUXUaSVxhFsCe3JKdMxEG1k6nTKfPSTrOwy25+BAjKQP/XEZOdr
 1Bnq2SbxdPmDnLvvNK5UvQ/uZI14uruWTHW1oNe84VffNFLpdXKI/olbCfvcBSLETkWYQilgpGr
 5HOIjJwhN1VKwX8HgbjNaPmqL5SCl4EK99+kULsSjkYrTcIEhFRN4xWjw3R7uhc2BjBwIqE4JR2
 38QvlEzvqV3Mwg0hI7qpmuTXyV3I0uQctf+UMniLr/vrziok9OTf7xz1WTsoHpZDFdAYfCSAC+Q
 2IGUsTfR4ob3UD5ImwDMzkT1KKPASu8lBiJDRcxZStDlJfYOV46dmUBLhGw4uVrfix70GKCvJcm
 lq/r0V6wNW9wtnsShd2RHrsJfIqDIH3tsYA26GsUKW8ch5zRY4mHy+f/OQ8OXJAoTVn51ewsPSs
 xKYwM3IUtUFRfKnjxE8RFmGuttECUmJYGac/FanVGoGockGiFOcmc26N0uxglaXts7fOJCizPNE
 jhc6Me06o3p6tmN0lk8cCJiVPwufl4WdAJoFdWt9lLvSi4svTVAon83kqleWVJa/MnvqP8rptcm
 3vvSQw8R1FzbUW2gtBjmyosfYYKFIaseI++xRsDM/EcLS58ixgR37AauObraOq1d+381XGu9rHQ
 SBQk2pYq4ti1EoQ==
X-Developer-Key: i=agarwala.kartik@gmail.com; a=openpgp;
 fpr=8991B9EB9021A76A60F493F4788493E38F9542EA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_052848_170670_EF3868EB 
X-CRM114-Status: GOOD (  12.86  )
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

The primary purpose behind this series is to convert the Mediatek
MT6358 Audio Codec dt-binding documentation from txt to dt-schema.
Additionally, it fixes the dts for some mediatek boards which were using
this dt-binding but were missing the required `Avdd-supply` property.

I have also updated the parent PMIC txt documentation to 
reference this binding. I have not added any new examples as the older
example already has a codec node.

I have tested my patches against `mt8186-corsola-steelix-sku131072.dts`,
`mt8186-corsola-steelix-sku131073.dts`, `mt8183-evb.dts`, and 
`mt8183-pumpkin.dts`.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>

Changes for v2:
Fix problems with the `compatible` field
Add missing required properties

Previous Versions:

v1: https://lore.kernel.org/all/20240518081621.63386-1-agarwala.kartik@gmail.com/
---
Kartik Agarwala (3):
      ASoC: dt-bindings: mt6358: Convert to dtschema
      arm64: dts: mediatek: Add missing Avdd-supply property for mt6358codec
      dt-bindings: mfd: mt6397: Add reference for mediatek,mt6358-sound

 Documentation/devicetree/bindings/mfd/mt6397.txt   |  1 +
 .../devicetree/bindings/sound/mediatek,mt6358.yaml | 51 ++++++++++++++++++++++
 Documentation/devicetree/bindings/sound/mt6358.txt | 26 -----------
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  4 ++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  4 ++
 5 files changed, 60 insertions(+), 26 deletions(-)
---
base-commit: 617f9a0a70e8bc27ef0343f3abac1faeba07cb71
change-id: 20240606-mt6358-e6fff7ed5747

Best regards,
-- 
Kartik Agarwala <agarwala.kartik@gmail.com>


