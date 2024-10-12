Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37930CF2586
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xiIcDOOQr22HSkxAP4N/KTgjWig7BbuFeDGhhKa1ZR0=; b=nUQFVYf6IA2c1+
	4Ok33udL8Y3OLqPZWETJg1LNx9C12uDUKzXPJiUGbwdQK886wPVXwbkXxrs994Ji+rusCp6fGl1e7
	lCD5wZW+YkkTzoKr3L+PeuDyTTLbAHWE33Hm72P9wTxm7/R2XhM24IJ2hVYNrt1SvaOGHFxEac6my
	SnPGqHB9IBozFiDSjvhrP+LNYcBE81SyQJpLbSdF3svWnINqABFcuYybnI0Md2pGVkf50TQJbxEqP
	YWP6JT88LYUlEWyNccKIdjlZnqQoNCBUfMgkhnMAjWHXmNR5aDceuHMd9/x5Ex6xgxnHwakfvuT0T
	dQVr7G32Xnoo+xG5nfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szkIs-00000001urR-3PcV;
	Sat, 12 Oct 2024 22:09:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szkHV-00000001ugg-0Z6y;
	Sat, 12 Oct 2024 22:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25727A40AEF;
	Sat, 12 Oct 2024 22:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB6CC4CEC6;
	Sat, 12 Oct 2024 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728770891;
	bh=f+7vITVEHaNhTvKE7ocBgKdVP/Z6MWCKCQK1q3xEgSk=;
	h=From:Subject:Date:To:Cc:From;
	b=jEh70U1SEadYqRQc5+COFd+d/7oFUE4uFN2FgeS7DaoVxloiLGr7LLXmcZQyaBd0O
	 1IcoELt+KqStQ+CLswxP2TUA4oB6T6uqiP/Tjeuo2DqS7tOhTQ3RAHaRxXp3a75qSB
	 10p5e85049LIkzD/n8BLV4IrB3zjToVOQyoslAs4Ba8+LQ8u5S0E5TnTWmc2bkyT+h
	 YHIRnDP8xlKhp8749A55RTrODPmNfzgHC0SQ4tvABlt+6AgnFZg9JdQDQuJDqZAw8T
	 +bQuSBOxUMdnG0BIBARVohXx8zpCVw0d1dc5TsrpjCQ/B+dFLLtSRpjK4Zt4wgSIoX
	 o7ZpVv3q8eGzA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v6 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
Date: Sun, 13 Oct 2024 00:07:06 +0200
Message-Id: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArzCmcC/2XQy07DMBAF0F+pvMaRH+NXV/wHYmE749aixMUJE
 VD133FTRAtZjqVz545PZMSacSTbzYlUnPOYy9AG/bAhce+HHdLct5kIJoBZbikORllOj3mIUz1
 QHhIXjCsIyEhDx4opfyyBT89tTrW80mlf0S8xrFfSoLVBgwUTIiA4o3QQ4ILA1McE1gUnOm6El
 E4AQLfLU3coFYev8viCdcBDV+ruZ1nFt/dWerpuvHXebpbGhimaSqWack7DMVEvwWGKzPbJbmd
 BLh33eZxK/Vz+oD1dcq7nCvH/3FlQRoPnSjlupDfpvtEla5Z3XvKVl807ixhSgN5rvfJw846vP
 TSvmY9O9kazEFZe/XrO2Nqr5vvIIyoQQce/+8/n8zfD7AvMEQIAAA==
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
X-CRM114-CacheID: sfid-20241012_150813_355655_5AA6C4C7 
X-CRM114-Status: GOOD (  19.10  )
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
 .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml |   34 +
 MAINTAINERS                                        |    7 +
 drivers/pinctrl/mediatek/Kconfig                   |   17 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2974 ++++++++++++++++++++
 drivers/pwm/Kconfig                                |   11 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-airoha.c                           |  408 +++
 11 files changed, 3984 insertions(+), 1 deletion(-)
---
base-commit: 6dbd1577b7dc10263d515045ef6460e80d6c9afa
change-id: 20240818-en7581-pinctrl-1bf120154be0
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


