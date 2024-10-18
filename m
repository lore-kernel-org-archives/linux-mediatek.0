Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED112D3000A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+T36ZSYfetL/wJRYBJNmipu9dGy1MJcG9vbtJWPfSzY=; b=xjmg0QvJj23jSr
	dYXR8Dg3OlG2gi3+FKLCp4ZFpxTIOKyLQXBHC2r/OAUx/Rgdt3YXpb8TPZPoiK+TeQvcVH5NlibFz
	1SAviupcr54uInc8Q8QFCjaKkY1C6y03giOL8qLMBR2AIz7yn/aMoFxEyZENdVNuhuurGQpEy11y9
	LzLMeNocigfB8r4VX1BZJrU6rFPX35dfu89Srr6M0wKgaIstu7p60icV+wh4mNgb1xCv0f33HJQY2
	0nUC4bMFw0Adog7ju8Vz8GRVKheu/gnVyKBTtirlTBHc4IDtj838H8DYZpzxFOH5Ep2KdWCesgYnW
	FpL9FFp/9dOSoEKwdRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1n1C-00000000s71-3AGF;
	Fri, 18 Oct 2024 13:27:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mtB-00000000rHl-25j9;
	Fri, 18 Oct 2024 13:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74D48A43B57;
	Fri, 18 Oct 2024 13:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E214C4CEC3;
	Fri, 18 Oct 2024 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729257572;
	bh=dNESMw4yGXRuQCex6utRMbGLz39CnUHW11KM6eIz4dA=;
	h=From:Subject:Date:To:Cc:From;
	b=tXLqJwXetwyMcmYjpkE0Orho2ns7gz5n9BaOj5a///6clyC3sz5sNQpGIfdDZrTm8
	 4v1c6DTcdwOgnSGuHKAGnYLubM/u0cCoTQof6hcCZBrypQbM3bqdrPL/PJsymhezCs
	 +4cgOSw4ZHxi38FQQciS+HBvMsVXI0e6ynqqHL2YhFMVze6TrTPE87zQ87qMx8k46U
	 tYiPHhqHSZcY3bkk3+zrEG1nvLl+ULeNBPCx+AHq9IxPJyJ01y1hzczigMDsPir/1M
	 y5lLTxRPf6xuwZ8XSgea5/mfVJPZUKIOcE1INv/ufMZfm3LXZuUGvFcdibwrDq8tiK
	 S19Urfdwn/xJQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v8 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
Date: Fri, 18 Oct 2024 15:19:01 +0200
Message-Id: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVgEmcC/2XQTU7DMBAF4KtUWePIMx7/dcU9EIvYGbcRJSluq
 ICqd8dtEQ14OZa+N89zag6cBz4069WpyXwcDsM0lsE9rJq47cYNi6Evc4MSSTpwgkerHYj9MMY
 57wSEBChBU2DZFLTPnIaPa+DTc5lTnl7FvM3cXWNkr5Vl54IhRzZEYvJWm4DkA3LqYyLng8cWL
 CrlkYjazTC3uynz+DU9vnAeeddOefOzLPPbeyk93zbeO69X18ZWapGmLIwAEGGfRKfIc4rS9cm
 tj9hcOm6Hwzzlz+sNytMl5/ZdxP/fPaKQInSgtQerOpuWjS5ZR7XwCiqviveOOaRAfWdM5enuP
 dSeijeyi1711sgQKq9/PUhZe118HyGyJgwm1vvNwoOqvCkeJTnGXnofsfJ26U3lbfGUkgFIaMo
 B//jz+fwNz+6Hg5ECAAA=
X-Change-ID: 20240818-en7581-pinctrl-1bf120154be0
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_061933_708910_1DA729A1 
X-CRM114-Status: GOOD (  20.21  )
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

Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
needs to access the same memory block (gpio memory region) to configure
{gio,irq}_chip and pwm functionalities respectively, so model them as
childs of a parent mfd driver.
Current EN7581 pinctrl driver supports the following functionalities:
- pin multiplexing via chip_scu syscon
- pin pull-up, pull-down, open-drain, current strength,
  {input,output}_enable, output_{low,high} via chip_scu syscon
- gpio controller
- irq controller

---
Changes in v8:
- pwm: add missing properties documentation
- Link to v7: https://lore.kernel.org/r/20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org

Changes in v7:
- pinctrl: cosmetics
- pinctrl: fix compilation warning
- Link to v6: https://lore.kernel.org/r/20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org

Changes in v6:
- pwm: rely on regmap APIs
- pwm: introduce compatible string
- pinctrl: introduce compatible string
- remove airoha-mfd driver
- add airoha,en7581-pinctrl binding
- add airoha,en7581-pwm binding
- update airoha,en7581-gpio-sysctl binding
- Link to v5: https://lore.kernel.org/r/20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org

Changes in v5:
- use spin_lock in airoha_pinctrl_rmw instead of a mutex since it can run
  in interrupt context
- remove unused includes in pinctrl driver
- since the irq_chip is immutable, allocate the gpio_irq_chip struct
  statically in pinctrl driver
- rely on regmap APIs in pinctrl driver but keep the spin_lock local to the
  driver
- rely on guard/guard_scope APIs in pinctrl driver
- improve naming convention pinctrl driver
- introduce airoha_pinconf_set_pin_value utility routine
- Link to v4: https://lore.kernel.org/r/20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org

Changes in v4:
- add 'Limitation' description in pwm driver
- fix comments in pwm driver
- rely on mfd->base __iomem pointer in pwm driver, modify register
  offsets according to it and get rid of sgpio_cfg, flash_cfg and
  cycle_cfg pointers
- simplify register utility routines in pwm driver
- use 'generator' instead of 'waveform' suffix for pwm routines
- fix possible overflow calculating duty cycle in pwm driver
- do not modify pwm state in free callback in pwm driver
- cap the maximum period in pwm driver
- do not allow inverse polarity in pwm driver
- do not set of_xlate callback in the pwm driver and allow the stack to
  do it
- fix MAINTAINERS file for airoha pinctrl driver
- fix undefined reference to __ffsdi2 in pinctrl driver
- simplify airoha,en7581-gpio-sysctl.yam binding
- Link to v3: https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org

Changes in v3:
- introduce airoha-mfd driver
- add pwm driver to the same series
- model pinctrl and pwm drivers as childs of a parent mfd driver.
- access chip-scu memory region in pinctrl driver via syscon
- introduce a single airoha,en7581-gpio-sysctl.yaml binding and get rid
  of dedicated bindings for pinctrl and pwm
- add airoha,en7581-chip-scu.yaml binding do the series
- Link to v2: https://lore.kernel.org/r/20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org

Changes in v2:
- Fix compilation errors
- Collapse some register mappings for gpio and irq controllers
- update dt-bindings according to new register mapping
- fix some dt-bindings errors
- Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/

---
Benjamin Larsson (1):
      pwm: airoha: Add support for EN7581 SoC

Christian Marangi (1):
      dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller

Lorenzo Bianconi (4):
      dt-bindings: arm: airoha: Add the chip-scu node for EN7581 SoC
      dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
      dt-bindings: pwm: airoha: Add EN7581 pwm
      pinctrl: airoha: Add support for EN7581 SoC

 .../bindings/arm/airoha,en7581-chip-scu.yaml       |   42 +
 .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    |   90 +
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    |  400 +++
 .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml |   61 +
 MAINTAINERS                                        |    7 +
 drivers/pinctrl/mediatek/Kconfig                   |   17 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2970 ++++++++++++++++++++
 drivers/pwm/Kconfig                                |   11 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-airoha.c                           |  421 +++
 11 files changed, 4020 insertions(+), 1 deletion(-)
---
base-commit: e4188772459fec428bf85ce6711a0147387c1455
change-id: 20240818-en7581-pinctrl-1bf120154be0
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


