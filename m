Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19BFE936EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGtL9ni/bmY+k+XLO0zZ//MJWYpwr9WdA7Lq88K11GI=; b=V6m8edQXtuTut6k5t30imJQ9O4
	uWWRv1KZsVFLnNkw1sERUa8Fv2waJoXqhCn43eahn2OtPy5i76Oz3UfVRliREP/JYQGXPETTN3Tr+
	xle9aQa7EsmJiOPWUijCu7H8orEYMRlp1b96g2Acy/RIoC0TKkUv/QMzMqZXoO3Lqt79IDphkFLtL
	yWAVBIG2vXIM1ez/WSQJoM8/+OHFVn053jAjnn7Uc9v5So6CaoFSt2cv0rrI7sh1FfRGT6ETRnyCb
	aMv60CBzdMPtdpXWbEemexYcsV4lQeIU3w9kIwxX8sEyHpHWPvILi5tOjXf6E+H6KfgWjm1Sw/p5+
	QUGKCvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoA3y-000yR1-0Y;
	Wed, 04 Oct 2023 22:09:50 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoA3v-000yPe-0e
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 22:09:48 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59e77e4f707so3472317b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 15:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696457382; x=1697062182; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cGtL9ni/bmY+k+XLO0zZ//MJWYpwr9WdA7Lq88K11GI=;
        b=T578stVHE2DM6klf1Sf2fSSIKECS7MHKaa0xRhcs2El8lwJypiLbLaiyARxlsZPO8K
         FL+eAkFnVnfQlkolzfEatZAqFMiaNW+BABRtqNLdf2ES83ejPY0Phlf259/lQ6UvASO9
         kiCvK/wTj7fN1lbED2Ij2iDQTX/kqcB4aWuDuhzRPEtdC/9vpgx1wMBkBgC49H4BjhQZ
         jiVVkhgv2bjWoO6RPy8nXOA1IrIPqxMIV7YhHNoYF9nEmCr+FADjAXtuVbJYClj+6wkp
         Pj/rNRfd/WleB8GQIdC33nHaCuDskRmHZ6qANN2DOQNiXCKA6QzhOmV9cJkBQM6Mp/Nv
         +7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696457382; x=1697062182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGtL9ni/bmY+k+XLO0zZ//MJWYpwr9WdA7Lq88K11GI=;
        b=wzQu69k5y986TV6V8XZbf1Ga61aEUmGILKOMyyl1vtZSsFUoWQ1JpGD9kw8o5NU+dt
         2E5BpGmoO+wB1HCQDo4TR73isDhFObKB6VdjAL/QVd8MUlL8FVpY4IMFFk3hK/EikZbs
         ePzkH1bm9Ql2CLxBaAYBNJIAluH1faPpA01k4HjWHMFYXaHSUHMKJq94B0CdEzTgvBAS
         Hvny6b+6lCGpIK02T7A14UdS8VGE0T1NvIlVw33AE2RAc8yMLJkfcBjodv/ZAFawP01i
         iEZvCH7Mq9VfWvi4JUlGvdK7beSqSau+LcnYLG2aKWoZw1KYXoMM/XlF0UZq3EYxLDrY
         JCag==
X-Gm-Message-State: AOJu0Ywh8voI7E/342laAhxT+faoSfS5KSnfWecvK8N1cdXq/fLDv//+
	8auERIBJgVwSzMAIQEJ+CoKfwoe2+NEPiMikA3NOzQ==
X-Google-Smtp-Source: AGHT+IG2vlQncNwaL0mmf9ziNDQ+6c9ln+am4OcVzZ69yv7TcOY3i+q6gckxUGP152XYVi1xj1I6LdPgzXEO0LROnnE=
X-Received: by 2002:a25:d707:0:b0:d8d:5dc1:b463 with SMTP id
 o7-20020a25d707000000b00d8d5dc1b463mr3381310ybg.64.1696457382451; Wed, 04 Oct
 2023 15:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230918093751.1188668-1-msp@baylibre.com>
In-Reply-To: <20230918093751.1188668-1-msp@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Oct 2023 00:09:06 +0200
Message-ID: <CAPDyKFrUbWBQgMm6wYwFfybiRQKhBpwH7wwcXaT+KrQJLevq3w@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] soc: mediatek: MT8365 power support
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent <parent.f@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_150947_237910_0BA80F25 
X-CRM114-Status: GOOD (  25.18  )
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

On Mon, 18 Sept 2023 at 11:38, Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi,
>
> no real changes in this update. Rebase to v6.6-rc2 and according change
> of directory.
>
> Thanks for any feedback!
>
> Best,
> Markus
>
> Based on v6.6-rc2
>
> Changes in v8:
> - Rebased to v6.6-rc2
> - Moved changes from drivers/soc to drivers/pmdomain
>
> Changes in v7:
> - Rebased to v6.5-rc1
> - Fixed a couple of small style issues pointed out by Angelo
>
> Changes in v6:
> - Change flags field to be u8 instead of u32
> - Use macro concatenation to simplify BUS_PROT macros:
>   BUS_PROT_WR(_hwip, ...) etc.
> - Use the final bit values for scpsys_bus_prot_flags from the beginning
>   of the series.
> - Changed scpsys_domain_data->caps to be u16 to accommodate the new flag
>   MTK_SCPD_STRICT_BUS_PROTECTION.
>
> Changes in v5:
> - Create defines for all registers and bits in mt8365 power domain patch
> - Redesign scpsys_bus_prot_data to use flags to store reg_update,
>   clr_ack as well as the difference between SMI and INFRACFG. The code
>   uses the appropriate regmap depending on the flags.
> - The WAY_EN patch now uses two flags, one for inverted operations
>   'BUS_PROT_INVERTED' and one to use infracfg-nao for the status flags
>   'BUS_PROT_STA_COMPONENT_INFRA_NAO'.
>
> Changes in v4:
> - Redesigned WAY_EN patch and split it up in smaller patches.
> - Added two documentation patches.
> - Added mediatek,infracfg-nao field to the binding.
>
> Changes in v3:
> - Mainly redesigned WAY_EN patch to be easier to understand
> - Rebased onto v6.0-rc1
> - Several other stuff that is described in the individual patches
>
> Changes in v2:
> - Updated error handling path for scpsys_power_on()
> - Minor updates described in each patch
>
> Previous versions:
> v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
> v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/
> v3 - https://lore.kernel.org/linux-mediatek/20220822144303.3438467-1-msp@baylibre.com/
> v4 - https://lore.kernel.org/linux-arm-kernel/20230105170735.1637416-1-msp@baylibre.com/
> v5 - https://lore.kernel.org/linux-arm-kernel/20230619085344.2885311-1-msp@baylibre.com/
> v6 - https://lore.kernel.org/linux-arm-kernel/20230627131040.3418538-1-msp@baylibre.com/
> v7 - https://lore.kernel.org/linux-arm-kernel/20230713150414.891893-1-msp@baylibre.com
>
> Alexandre Bailon (2):
>   soc: mediatek: Add support for WAY_EN operations
>   soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
>
> Fabien Parent (2):
>   dt-bindings: power: Add MT8365 power domains
>   soc: mediatek: pm-domains: Add support for MT8365
>
> Markus Schneider-Pargmann (4):
>   soc: mediatek: pm-domains: Move bools to a flags field
>   soc: mediatek: pm-domains: Split bus_prot_mask
>   soc: mediatek: pm-domains: Create bus protection operation functions
>   soc: mediatek: pm-domains: Unify configuration for infracfg and smi
>
>  .../power/mediatek,power-controller.yaml      |   6 +
>  drivers/pmdomain/mediatek/mt6795-pm-domains.h |  16 +-
>  drivers/pmdomain/mediatek/mt8167-pm-domains.h |  20 +-
>  drivers/pmdomain/mediatek/mt8173-pm-domains.h |  16 +-
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 125 ++++++----
>  drivers/pmdomain/mediatek/mt8186-pm-domains.h | 236 ++++++++++--------
>  drivers/pmdomain/mediatek/mt8188-pm-domains.h | 223 +++++++++++------
>  drivers/pmdomain/mediatek/mt8192-pm-domains.h | 112 ++++++---
>  drivers/pmdomain/mediatek/mt8195-pm-domains.h | 199 +++++++++------
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h | 197 +++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 157 ++++++++----
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  51 ++--
>  .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
>  include/linux/soc/mediatek/infracfg.h         |  41 +++
>  14 files changed, 972 insertions(+), 446 deletions(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt8365-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
>

Applied for next, thanks!

Note that while applying I amended the patch-prefix for patch 2->8 to
"pmdomain: mediatek:", please try to conform to this when going
forward, as it help me to better filter emails.

Kind regards
Uffe

