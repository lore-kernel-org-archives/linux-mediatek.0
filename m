Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B71D30007
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=; b=nZKU4Allq/KTvB
	LGU5/2vt1gz9VKyWP4s/1HI+r1+Vewx0lYZYf2Uff/HEckE9Cv0WhfIkxoXqbxlt19yTOWz5C1Jw2
	EgwPs6be/U5jo6GgK7OC7Y7nCwZaHtfln/bHOvyViMnWR5VIzUqMAKGKoH9LYMkjlLpIRc+vbiEUc
	zByuz9mBy6kd/Fm/c6RLr+pJlf5CAW2LnUUKEKSAP2fxHwQg4R2fMOst9+02it/dkPtokDMAPwT5c
	DG134hFlrkt9nbAQyCx6xRr/c7sUe4x/mc75HUcywtzZIhrSgFAEV6ul9aEGTjdYNXELj/Or54vH0
	meVS7CQkRAEqxyLz2MjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mpp-00000000qoT-2UzO;
	Fri, 18 Oct 2024 13:16:05 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mnd-00000000qIU-1eDC
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 13:13:51 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a3b450320aso7750825ab.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729257228; x=1729862028; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=;
        b=AKtnIn0zL8eK4fQVNppnV/L2ekAMlbrgN913+0S7xuDytTKvUjEXpvNhYzrNTWR50u
         9UGJcGPtI/Qp4MtX6mqZxdkZoAqfJExNLdEfgqUWtiAhhn5SxoHOBJ75MWLVj2FwlQ/I
         Bf5Mv9g+cNNQFT6oT2GJ+YMIQnqlNnrv4if6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257228; x=1729862028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=;
        b=Ve0sGyRfH7hG1rn7UIPD6eeCQgCUipeQaykU5CIQl3SBau+dasBijI/seXgcIWPL4m
         Dj4tLQx4mx9s/IkpUl07jfZbxwzSZr0yeI4UimQRYhjRxTIhP2w0DvcYyROOFlM2LkzF
         yJWbLcU2wxg2L4YUQOt6y11oF9cx5wH4wKe4pCAgSnEd5eLlH9zar5Ed2d941I18D2Fr
         MpeYJ/2TDlDPUsC+emT9FkTWXFl2mdPrv77rbEn2LwAetmAusE2NcOt3TW/aMZWe0MIP
         2uLpEPvAZXEeqnIApeJcl51Zpe0Q+YjcmRfReyBeneUgr49ClvBEz7ukPyJz+0Mdaaw7
         /awg==
X-Forwarded-Encrypted: i=1; AJvYcCUwXmG3o5ceJ6RE/ufGdD4IiYeUwoZNu1ZYSuMwCKwWDOdZ6tO/HWASVNIATkrPCQJ6tSskO+wmOWNyatnz1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJghgLbi/E37ZDrilw+t8Xrj99SQXxt8M7Te/uUAOIuLpdqz2S
	+oEgSVlo1sNSM3p1GA7db09bpQUDxCJI7YMZ+dKuuIreG3II4aXCd9eIYP+A8g==
X-Google-Smtp-Source: AGHT+IFBfEFVY3g0oM2/BGGdZ3Q6Mpfn3MSyJk6cOSoXomUIoUgVnQhq517tPvH61wPvt73sh3wORw==
X-Received: by 2002:a05:6e02:1389:b0:3a0:ac0d:22b9 with SMTP id e9e14a558f8ab-3a3f4058abamr22270665ab.6.1729257227812;
        Fri, 18 Oct 2024 06:13:47 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc256cc8sm1120222a12.56.2024.10.18.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:13:47 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v2 0/4] Using i2c-hid-of-elan driver instead of i2c-hid-of
 driver
Date: Fri, 18 Oct 2024 13:13:40 +0000
Message-Id: <20241018-post-reset-v2-0-28d539d79e18@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARfEmcC/23MQQ6CMBCF4auQWVvTobYYV97DsChlhFlAyRSJh
 vTuVtYu/5e8b4dEwpTgVu0gtHHiOJeoTxWE0c8DKe5LQ63rC2q8qiWmVQklWpUPznXaWHRooBw
 WoSe/D+zRlh45rVE+h73hb/3LbKi0st73XWOt1qa5h1HixK/pHGWANuf8Bb7o+m2nAAAA
X-Change-ID: 20241018-post-reset-ac66b0351613
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_061349_515724_7EF246C5 
X-CRM114-Status: GOOD (  11.12  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.

Also workaround the race condition of pinctrl used by touchscreen and
trackpad in this series to avoid merge conflict.

Adding other second source touchscreen used by some mt8183 devices in
this series since this should be based on the workaround of pinctrl
issue.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org

---
Hsin-Te Yuan (4):
      arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
      arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      arm64: dts: mediatek: mt8183: willow: Support second source touchscreen

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++---------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-------
 12 files changed, 12 insertions(+), 63 deletions(-)
---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


