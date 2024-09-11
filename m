Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D072EE57D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 19:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nhr3LHhyveFg+QmA4w2ZPDs/R26vneUnCO0E1nr2quk=; b=2By6kNDohoLAbc
	nRlRLWLTv9AgHBPuxbdOS5CBDe/I9vDdQkw0wOxZtp6/cGY2Xb/Qn9ZgKQIlt6Vw/C/KqWf5yDsJb
	d/gn0HaA7heqg3lUPwRLrMLIf8ssliW0CJPF2v0wx5nbblk8dZudUJn3VP/8OeaROUNlj+AdS20CX
	Fbqf4Um6mfg5JlDjKLM2dAuMM8bx2rLWU/wzhYR9oXA9N4u3ayNIwibUTPkRIy7f1kJEBpJX/qs0s
	GdgRf8MTv5h9lEXfEdN5eX9jZnEDPG7O6SXm7yUWuscflWxvty9wdnXL+Lt+HoMGbRF1hqjzGQ/Pt
	fIIqGgyCSsGIaIcGWQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soTNt-0000000Anpz-2DBp;
	Wed, 11 Sep 2024 19:52:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soTMo-0000000Anju-0t1W;
	Wed, 11 Sep 2024 19:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 415E15C063A;
	Wed, 11 Sep 2024 19:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F73C4CEC0;
	Wed, 11 Sep 2024 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726084264;
	bh=QhWaP44oRYku9YV/Wa4TI+39wtfmff/fY2V++eyMi7w=;
	h=From:Subject:Date:To:Cc:From;
	b=shTd8sDPzYeJhuThXqJp7gx5+eANIuDFsl7WkAoFW10J4MMEVmTxiGDmF7Jl3tARm
	 0yX7N2Jkcd2HypIaSpczjhvNh2oXZfY3QX/LuVs4dO7m9gJu8BQCdy9KxK/BpODeeH
	 7v1jlVmoSQLqJ/8eRl+zihpqtgGbID8KKlkHL4Aex3pxKEMqEOOhf5s8DpymkZvZTK
	 x3GL6VLK4smmKQUi/mFyotjNT0AF5uerSC2FQJdrlfIBwQ3Ci8ul+5nWqxiuPWIQ/0
	 iUUKu4DSaIDD26McE6/9Y4x3i9/zLL03LCHV8IqqH1e4rcg8u1NIegPZMyOusfs+Il
	 ukNcu+iZ0CRlg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v4 0/5] Add mfd, pinctrl and pwm support to EN7581 SoC
Date: Wed, 11 Sep 2024 21:50:00 +0200
Message-Id: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGj04WYC/2WQzU6FMBBGX4V0bUl/prRl5XsYFxSm0IiUW5CoN
 7y7hWviVZffJOebM3MlC6aAC6mLK0m4hSXEKQd4KEg7NFOPNHQ5E8EEMMMNxUkrw+kcpnZNI+X
 Oc8G4AoeMZGhO6MP7Wfj0nLNP8ZWuQ8LmrGGdkhqNcRUY0K4FBKtV5QRYJ9B3rQdjnRUl10JKK
 wCg7MNajjHh9BkfXzBNOJYx9d/LEl7esvR62/jjXBensWaK+phoRTmnbva0kWDRt8x03tSbIIf
 jEJY1po/zB3l09NzOFeLvuZugjLqGK2W5lo3290ZH1ybveMn/8TLz1iA676BrquoXv+/7F/rFF
 s2RAQAA
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
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_125106_419580_0163BEF3 
X-CRM114-Status: GOOD (  18.76  )
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

Christian Marangi (2):
      dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
      mfd: airoha: Add support for Airoha EN7581 MFD

Lorenzo Bianconi (2):
      dt-bindings: arm: airoha: Add the chip-scu node for EN7581 SoC
      pinctrl: airoha: Add support for EN7581 SoC

 .../bindings/arm/airoha,en7581-chip-scu.yaml       |   42 +
 .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    |  433 +++
 MAINTAINERS                                        |    7 +
 drivers/mfd/Kconfig                                |    8 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/airoha-en7581-gpio-mfd.c               |   72 +
 drivers/pinctrl/mediatek/Kconfig                   |   16 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2964 ++++++++++++++++++++
 drivers/pwm/Kconfig                                |   10 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-airoha.c                           |  414 +++
 include/linux/mfd/airoha-en7581-mfd.h              |    9 +
 13 files changed, 3978 insertions(+), 1 deletion(-)
---
base-commit: 264c13114bd71ddfd7b25c7b94f6cda4587eca25
change-id: 20240818-en7581-pinctrl-1bf120154be0
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


