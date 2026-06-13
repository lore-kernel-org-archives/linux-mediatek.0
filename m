Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ACFCD8CA8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=; b=wJE8DUDawkQhnbhH3QrHq2MGmB
	UdNQah2vlxxwQ99dTfZpzEXZ6dlWQR5txaaJMWx1mQC3P+6y49tGhccweKGbbzdb6CfSK45jdMKWy
	1ilG5b9n3cZnBlVNHO1bXkyrF5hJhg5ZiOMPStgBf+ahxpvhxcxSNdPRHtOysyEVwbVlvSZo43ItP
	aBBBXNpxeDeWZPwHzQ16oxNoqGaFYRvfXtlGEsCQHIMmwRlxB6ZUEkAMBfTmgSFKAf8dKEypZ4tpJ
	jdGZ5qrPLgoEphOoJblGwXXSLACsdiqMJAAZUV1zs6Cn+i7/FiEjVaYH8o8keNRBnk6FuJm1FvMbr
	uji9bL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYI8R-0000000C0JN-2LCg;
	Sat, 13 Jun 2026 06:46:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYI8N-0000000C0IM-39CC
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 06:46:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so2533394a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 23:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781333179; cv=none;
        d=google.com; s=arc-20240605;
        b=J+Q3V71uQZhR2v8UbbUZsahfS143RfiN3EYjz//u6GI7vyF0Bb0jDbGLz7EH36pUXr
         h81cy/fQrIhY4TDHXb+wNYzZXuP/9/ApLZEETUucIbqpgfWcSig36mLDjhRySOk+2pLe
         ChdXrZ+C1V5zDu0GwrFjehgMsF/yDDReqFZoxpHpO7Gcvk8IMhao6ePWgAX/4Nh6Dj1z
         djnjxP2m7nEUKo7MvE7Pq2J+qIaHhw/g7loAZwvddZyafo5FPv06OurGPwHT82nDp0aL
         IsX5rDlNHUPob5STh6GmFddKCq8c/ogy1cYJNuq5rgjTarDNAgRK0FAQbk0YV3CSBgCJ
         tNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        fh=eeZZ2s+ha37hTNrJGISjjoyJlZpZu67ZRXeJPoQwDcY=;
        b=ip8DGG8a2pnD+Vy35QUnM1n2P/Jn8PbLCWKZZMpkEOpGZ9EHcEEkwMaOfUF0asLS0x
         X7L8b17cqsECAiqIemYN85bCW5pf+5sVB3OxPUupPmRFsrtJLJDAQ2ajePgiU1W6qio7
         8+CGnw+g8XaTBq2jAunXO1g3IQ9F3+HsvR3FP4UW/fS57OKRYUEE7NkOD3UbV2nxyJP/
         HlLSjkIHj0a2lTYJddCXZK+tH2YXW6xRiMYOHQ/aPZ/Zkfz93Vu7yxPCnZg3f5G1/Grt
         lscatbzibIh+5gOZ26Muj2Euyungw13QhLA2h4uLVl6JnCUJeqcUk6FnR/TYeAhlU+wt
         59dA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333179; x=1781937979; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        b=YdrpfTnwN7GeI2ViUkIy2LccCzx7/lWKRfo3hIRsBpdLlaO9RBOKPXc2DIBzkYCiMO
         05h8PZ5HzGKc8x4O87OmipymBwaoG1+A+CkpQmoofiQJ0TU7pjmkyfS7BMLvis+BZ7cb
         IFNDpJAsNmtp5yzuOoAsq5pTD02Mc04T43B9VFM7s0mrJKW2Gunh2xcGPMx5x6+0I2N7
         DRzDiAhS6Q4kzcCD+s2S8nBwLyhZ94V9+mMnb4AYhDwhZkXW4RE5tPKiy+yRvsHlL60e
         0gG6nFqcbhh0wCOBKVOKcwOlUMIyqhdldmktgMlZ2GrDkJrw7shgkkICCzkOop5uhWAg
         vn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333179; x=1781937979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        b=UHyq6iIIvQfJjsxEYuhEhRjPneX2K4bwFybXeFYuzgUmcGhQrl7u8I4+mv9wlnUdgD
         mg8ept7Od/t9cCLOs/mqTGPl3gO6G/9Z1NasJywAexVhzzIjRXf2rFqxNcu0aXtuzVeS
         VT2k255AEYB4l1+2d4J7rvG1bfej2pCkT3krMdCQpNWt9vk7HNNEnOl+/ynhimoCxHh7
         3QAhvkrpIZt7eYS+rJPTud4JRqK5svygQddLG/i0HEeVnCDItOBCi8U1dxvFQjxNcdRs
         H/nA6Pz8dNdVjG+n7JbbkYjGcAd2VwbaiG3bxgI3jy3/nexOvCRdduC2wfpRIia3P4tx
         xQnw==
X-Gm-Message-State: AOJu0YySx/zy0GLN41+LtvHvQ6Li7OVbKW4wfI5xklDQoGkoCyTvBCPw
	+H0D4D84S7hQ1tSHV47poYd6e8WKBXEgDfIMUSuoQQUwBxhI8pqjXchsXcC5Cba41frIA3ZMRj6
	TtUiPP3WuWSVa9iAsO2ZL/+cdm7LlKCNfh6se
X-Gm-Gg: Acq92OFzEi4KfOTiPxbBSAZCmU3PYPGNX/m/UgLrF92lj4BLZaGnAoIdTyZU9N6MsCV
	vXaWfkxVTRGaB4bElio8yxc6MIjGPdTTQBIcd6v+KGHi5zyNW0cgO4PYo+h6FopmlUhyDUYfhmV
	3rCfT8mTWlqWFc6+QjmqPu8Dne9l6Bq//RiupptvuqTkx6pg1eccNu53Zf4h2VZ0FIP8SiBc8h8
	51hJrXJcfxik38BuFdBJdjdcwaKgFfpXpW8pBKUVFla2hEOi6O6FlgRHCauc26ArgOHbBhM6NDu
	VbknQviEvXXd6EtSD1uuaqMVh8UeC1U6uDD5TiA=
X-Received: by 2002:a05:6402:11d2:b0:691:956a:cf64 with SMTP id
 4fb4d7f45d1cf-693785f9535mr2788429a12.12.1781333178678; Fri, 12 Jun 2026
 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260612200717.361018-1-l.scorcia@gmail.com>
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sat, 13 Jun 2026 08:46:07 +0200
X-Gm-Features: AVVi8CeFuX_UIHrrQxcpZMFblszx1DO_NPnUuKDdU-CWG2K7N00GECZfmMGjMUg
Message-ID: <CAORyz2Jv70NuKNJbaG6o9Evm+3LcCpq+6qmOp_3Q=vf2CFCQ8Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Add support for MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_234623_847878_207F333C 
X-CRM114-Status: GOOD (  35.42  )
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

Please ignore this patch set. As correctly described by sashiko-bot,
the binding with no regulator node would not be usable, even if it
passed dtbs_check. I need to complete work on that and then resubmit.
Sorry about the confusion.

Il giorno ven 12 giu 2026 alle ore 22:26 Luca Leonardo Scorcia
<l.scorcia@gmail.com> ha scritto:
>
> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.
>
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.
>
> These patches only enable three functions: keys, pinctrl and RTC.
> Regulators and speaker amp will follow later as I still need to further
> improve those two, but getting the main PMIC in will make the series
> easier to review.
>
> I added a handful of device tree improvements to fix some dtbs_check
> errors, added support for the pinctrl device and addressed the comments
> from last year's reviews.
>
> Please note that patch 0005 depends on patch 0004 as they both need the
> registers.h file, but they belong to different driver areas. I'm not sure
> if I'm supposed to squash them even if they belong to different driver
> areas of if it's fine like this. Any advice is welcome.
>
> The series has been tested on Xiaomi Mi Smart Clock X04G and on the
> Lenovo Smart Clock 2.
>
> Changes in v6:
> - Dropped the regulators driver for the moment
> - Explained the FCHR key name origin in the commit message
> - Introduced the MFD_CELL_* macro in the sub-devices definitions.
>   A separate, independent commit introduced MFD_CELL_* to all the
>   subdevices in the mt6397-core.c file for consistency
> - Replaced of_device_get_match_data with device_get_match_data
> - Removed the mfd_match_data enum in favor of the preexisting
>   chip_id enum
> - Adjusted the error message if the device is unsupported
>
> Changes in v5 [5]:
> - Double checked regulator driver with data sheet and Android sources.
>   The data sheet I have misses a lot of register descriptions, but
>   Android sources have been helpful to fill the gaps
> - Reintroduced the required attribute for the regulator compatible
>   in the bindings
> - Fixed the missing reference to the MT6392 schema
> - Fixed casts/unused vars reported by kernel test robot
> - Removed Reviewed-by tags from the regulator patches as they have been
>   modified in this version
>
> Changes in v4 [4]:
> - Dropped usage of the regulator compatible
> - Fixed commit messages text to properly reference the target subsystem
> - Added supply rails to the regulator
> - Reworked the regulator schema and PMIC dtsi. Now all supplies are
>   documented and the schema no longer includes voltage information
> - Removed redundant ldo- / buck- prefixes
> - Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
> - Modified the MFD driver to use a simple identifier in the of_match
>   data properties
>
> Changes in v3 [3]:
> - Added pinctrl device
> - Changed mt6397-rtc fallback to mt6323-rtc
> - Added schema for regulators
> - Fixed checkpatch issues
>
> Changes in v2 [2]:
> - Replaced explicit compatibles with fallbacks
>
> Initial version: [1]
>
> [1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
> [2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
> [3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
> [4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/
> [5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
>
> Fabien Parent (3):
>   dt-bindings: mfd: mt6397: Add MT6392 PMIC
>   dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
>   mfd: mt6397: Add support for MT6392 PMIC
>
> Luca Leonardo Scorcia (2):
>   mfd: mt6397: Use MFD_CELL_* to describe sub-devices
>   pinctrl: mediatek: mt6397: Add MediaTek MT6392
>
> Val Packett (2):
>   input: keyboard: mtk-pmic-keys: Add MT6392 support
>   arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
>
>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6397.yaml         |   8 +
>  arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  41 ++
>  drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
>  drivers/mfd/mt6397-core.c                     | 294 +++++------
>  drivers/mfd/mt6397-irq.c                      |   8 +
>  drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
>  include/linux/mfd/mt6392/core.h               |  43 ++
>  include/linux/mfd/mt6392/registers.h          | 488 ++++++++++++++++++
>  include/linux/mfd/mt6397/core.h               |   1 +
>  11 files changed, 840 insertions(+), 162 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
>
> --
> 2.43.0
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

