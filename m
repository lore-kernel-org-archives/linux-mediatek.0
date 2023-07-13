Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C953C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwNGulIA2ho0EBWPPONOOw90suBzDLAU+ZErTuI+Vzc=; b=f3q4Vr0Q9ku7tSbtInzM3f1fhP
	SWcjHWSVm3WjQ6mo0SNSL6udZn1Ky9KFNiVjK7hiFa8mkSmZ2ztcn0EnQa0AxDMi0tyzXyw72Eu2X
	TtEiaQuVK2Ha7UBp/KEObqg6Fp2Wx1Q2xNmx7troWQmwlvVgU76EjALWpg6u+kpA8rJsy5ckLoepD
	iLPzNql1xiHZVpYOqEi5aGmpeS8QniDd68+tl80KXNkeiWe1wvcPdgf0wtnoVKSF08XQxV2jUa93P
	1KBZvY/MVq89sTNl5yBepj8XO884AK4bXXXA4fgUcGr7oq0DHPvtiZtGpXaAwxft9XiUMjLesn2T9
	NOxf0VXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrt-003euD-2H;
	Thu, 13 Jul 2023 15:04:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxrp-003eqZ-0a
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 15:04:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98de21518fbso119765066b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689260666; x=1691852666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TwNGulIA2ho0EBWPPONOOw90suBzDLAU+ZErTuI+Vzc=;
        b=hRZggRhob6aVHF8C/YtZ1wNcx/+AtkQw4WxbNzb/Y0jrRutfiQDp6DsjI+SCBxq7AA
         6lRPJWVDWYzgXHmOLgZ3ASS9HoDyxaToeUAcKivABM8Bfo0G+zxLFbT+hwu05zZy2jJp
         7kFfqBAiKA8whjWz4HoafKKQiK6IGSIxxoZNxCYrhLp9MeNcbLacGj3kIm+V+0uzct0V
         kQvIOX/AH1+kaypzuHob1K0/+1roW0Op8OlPwHC0FrcQdlitNtK072ap5mKo+KeHto2u
         H8S9rG/Xd5Qqny/FDkLCSi5in5nA4c6nO8mglpoVkE7SoGkaEnhu9yQLwnf1hJ63GRU1
         GbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260666; x=1691852666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwNGulIA2ho0EBWPPONOOw90suBzDLAU+ZErTuI+Vzc=;
        b=IYUKR09f6St9J7eGJCw0bdck8EAC/rkPuaJ3DRpAEJxUi9JMxXq+KieUVlq/GczScf
         tT1X8g0BmUBYUYhseJUCkvMEM/+xHaot21S+iql2MmxVVdEu0F2UGD/zhP9ucewe2Cty
         rZ0VF4q46WZM+jPmAVIflFJ95K4nPHymTo+gg1ih6YO86RNDv0MUHwjpS8Vk30YVzchk
         RBz8MBZ5opLEu+syFFVjPU0ui3e0syXJ9B+8OMzbTaNwG6YfAYdxVgmgztSDIPyc2d/j
         YtaFiVyl33n3vdLzzp3J/zBYNPf9LN2Q5FUeXO/E8JYZwr2elhkwKqFICem13B70MJ5e
         TxMQ==
X-Gm-Message-State: ABy/qLZ94WBteN1WM071uPcmI8+dvv+fohcLEC7AiXH8xjt+h2apOnn/
	UcTPDFN2ACouA/FfoMMTkKVeTQ==
X-Google-Smtp-Source: APBJJlG70SgkGGn23vEi3FSKwCEUIJMon8LV4qYHTuV1LyiLcqxeGAwf1wxRGXZOoEsp5bCsKbtmeA==
X-Received: by 2002:a17:906:7786:b0:993:d8be:53f5 with SMTP id s6-20020a170906778600b00993d8be53f5mr1818669ejm.14.1689260666585;
        Thu, 13 Jul 2023 08:04:26 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a247:82fa:1d6d:d215:e7c4:dd5e])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm4102939ejb.36.2023.07.13.08.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:04:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v7 0/8] soc: mediatek: MT8365 power support
Date: Thu, 13 Jul 2023 17:04:06 +0200
Message-Id: <20230713150414.891893-1-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080429_400743_D242B0D5 
X-CRM114-Status: GOOD (  14.91  )
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

Hi,

this version just fixes some small style issues and rebases to v6.5-rc1.

Thanks for any feedback!

Best,
Markus

Based on v6.5-rc1

Changes in v7:
- Rebased to v6.5-rc1
- Fixed a couple of small style issues pointed out by Angelo

Changes in v6:
- Change flags field to be u8 instead of u32
- Use macro concatenation to simplify BUS_PROT macros:
  BUS_PROT_WR(_hwip, ...) etc.
- Use the final bit values for scpsys_bus_prot_flags from the beginning
  of the series.
- Changed scpsys_domain_data->caps to be u16 to accommodate the new flag
  MTK_SCPD_STRICT_BUS_PROTECTION.

Changes in v5:
- Create defines for all registers and bits in mt8365 power domain patch
- Redesign scpsys_bus_prot_data to use flags to store reg_update,
  clr_ack as well as the difference between SMI and INFRACFG. The code
  uses the appropriate regmap depending on the flags.
- The WAY_EN patch now uses two flags, one for inverted operations
  'BUS_PROT_INVERTED' and one to use infracfg-nao for the status flags
  'BUS_PROT_STA_COMPONENT_INFRA_NAO'.

Changes in v4:
- Redesigned WAY_EN patch and split it up in smaller patches.
- Added two documentation patches.
- Added mediatek,infracfg-nao field to the binding.

Changes in v3:
- Mainly redesigned WAY_EN patch to be easier to understand
- Rebased onto v6.0-rc1
- Several other stuff that is described in the individual patches

Changes in v2:
- Updated error handling path for scpsys_power_on()
- Minor updates described in each patch

Previous versions:
v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/
v3 - https://lore.kernel.org/linux-mediatek/20220822144303.3438467-1-msp@baylibre.com/
v4 - https://lore.kernel.org/linux-arm-kernel/20230105170735.1637416-1-msp@baylibre.com/
v5 - https://lore.kernel.org/linux-arm-kernel/20230619085344.2885311-1-msp@baylibre.com/
v6 - https://lore.kernel.org/linux-arm-kernel/20230627131040.3418538-1-msp@baylibre.com/

Alexandre Bailon (2):
  soc: mediatek: Add support for WAY_EN operations
  soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap

Fabien Parent (2):
  dt-bindings: power: Add MT8365 power domains
  soc: mediatek: pm-domains: Add support for MT8365

Markus Schneider-Pargmann (4):
  soc: mediatek: pm-domains: Move bools to a flags field
  soc: mediatek: pm-domains: Split bus_prot_mask
  soc: mediatek: pm-domains: Create bus protection operation functions
  soc: mediatek: pm-domains: Unify configuration for infracfg and smi

 .../power/mediatek,power-controller.yaml      |   6 +
 drivers/soc/mediatek/mt6795-pm-domains.h      |  16 +-
 drivers/soc/mediatek/mt8167-pm-domains.h      |  20 +-
 drivers/soc/mediatek/mt8173-pm-domains.h      |  16 +-
 drivers/soc/mediatek/mt8183-pm-domains.h      | 125 ++++++----
 drivers/soc/mediatek/mt8186-pm-domains.h      | 236 ++++++++++--------
 drivers/soc/mediatek/mt8188-pm-domains.h      | 223 +++++++++++------
 drivers/soc/mediatek/mt8192-pm-domains.h      | 112 ++++++---
 drivers/soc/mediatek/mt8195-pm-domains.h      | 199 +++++++++------
 drivers/soc/mediatek/mt8365-pm-domains.h      | 197 +++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         | 157 ++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h         |  51 ++--
 .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
 include/linux/soc/mediatek/infracfg.h         |  41 +++
 14 files changed, 972 insertions(+), 446 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h


base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.40.1


