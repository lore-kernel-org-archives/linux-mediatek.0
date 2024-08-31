Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916EDCD13D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xngRFXFUeLs3P7Nyh09kZQDttFWbyPf3fonwWmYGiu0=; b=seFuelGmOyCg3N
	IDNHrJPGFrggiBGn/jajOge9BFz1KfwGGmNUSm5uQLAcFiu7mfqLaMFG/x0TvmI+JCcr8CmW9cQiC
	+nTSUHMpo7xQ650PsGESzz9QwUKTd6BFRdA9xO3+wAd6Gb4eIrwzOZv1tIMakGd2RvxbpRe9inKhT
	OivyCN8FCuydJlnq0R+kVKSwbzvuLYVB793yikHoMy//nQbL4wtrvxz/mjtYhOxXRAwIHTpbte/k4
	imSqIAzcoynJIiWGBND03k5ByqbFleZ9uG8bKrkx7rORQN2KEnylsVPCJF3lzCy8A1LuW8PAztsVc
	WyPajLpXrTWgpIsjJmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skP6a-00000009VSA-1unz;
	Sat, 31 Aug 2024 14:29:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skP5g-00000009VLZ-3k4v;
	Sat, 31 Aug 2024 14:28:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46A79A405B7;
	Sat, 31 Aug 2024 14:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E2EC4CEC0;
	Sat, 31 Aug 2024 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725114515;
	bh=NxucNnCnJizcmF2lSWVyU0LQyReQyHJFnoqf4gfasbo=;
	h=From:Subject:Date:To:Cc:From;
	b=YcItafkawK8PxwdOVLQMnIrzH1PflF1oCp9JdxpZDo2FfB3IRP49XUmtVnCEOlgb1
	 AOarRiLWWihmj60eV5JywhMpA+i1cuoe9p82mFRLTSjo/cfDnDyDZdOAOlj3oPypb0
	 BgT569s3ojB9+Min4cuIOUTFJHJOJhWaMk2IeZsTU/OjiYroHnh9rqDWzZz7hiaTBT
	 KIkcnO7KZ8BJPg38xqrIFQfMpth/weBxKx66cDVURpV/sJZTI/rSpo7d/Zx9/S6YeJ
	 n1gneOpwA/paBII0f6Vv0F2wAtHl5zaN3hOR+5A9et1hVKUTREH5vjvFcBBNGYkuJE
	 zieyaQ+2pho7w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v3 0/5] Add mfd, pinctrl and pwm support to EN7581 SoC
Date: Sat, 31 Aug 2024 16:27:45 +0200
Message-Id: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEo02YC/12Q3U6EMBSEX4X02kP6S1uufA+zFxROoRFbtiBRN
 7y7XdZE4+Wc5Mx8MzeyYg64kra6kYx7WEOKRYinivRTF0eEMBRNOOWSGmYAo1aGwRJiv+UZmPO
 MU6akQ0rK05LRh4/T8OVStM/pDbYpY3fa0EEJjca4RhqpXS9RWq0ax6V1HP3Qe2mss7xmmgthu
 ZSyHsNWzylj/ErPr5gjznXK409Yxut7gd4eib/MbXUSa6rApwwNMAZu8dAJadH31AzetDsnd8Y
 prFvKn+cG5XT3edTl/H/dnQMF1zGlLNOi0/4v0eU4jm9bMUPhUQEAAA==
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
X-CRM114-CacheID: sfid-20240831_072837_097523_450E52C5 
X-CRM114-Status: GOOD (  14.63  )
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
 drivers/pwm/pwm-airoha.c                           |  435 +++
 include/linux/mfd/airoha-en7581-mfd.h              |    9 +
 13 files changed, 3999 insertions(+), 1 deletion(-)
---
base-commit: defaf1a2113a22b00dfa1abc0fd2014820eaf065
change-id: 20240818-en7581-pinctrl-1bf120154be0
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


