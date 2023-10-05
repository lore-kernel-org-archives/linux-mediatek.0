Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2E1E8FDC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwKnCE50Or3wTNbb8nnaCjSfC0KHldEcWfUSQ5mNeMI=; b=ZyFnmVkRweTdyJu4C909oIbXWn
	KZV/tnzHW4SRvNtCCc4G+cAfn0hU2C+5/mDu8gvmhSF2cx5WNxSUwv2au2oDYSmjPecCT7BbyzGr0
	A26KTDricCZExEbUvgaTFTKkoJqzpACHuB6gC8Tn5oJ6LAAlhpE1v0tuGZws2p2CyqdgdXSzRvySV
	w2Oh2a8NtfXry/YMLeMuTX8pCfyXu3Holt+hwlfLbyDnQXih8p9CNvSmTWzG3zdMBVCRF7C6q0Uj5
	b+9udSgCfHvXM6dzUSD4Qq80ahmakQwTj0gxWqVeuNBZvhc8FcwsbHgn+AoU4wLZIDyGDFszVKMqr
	w7djaPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoKtC-001mrd-2w;
	Thu, 05 Oct 2023 09:43:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoKt7-001mqx-0q
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 09:43:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so773840f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Oct 2023 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696498998; x=1697103798; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwKnCE50Or3wTNbb8nnaCjSfC0KHldEcWfUSQ5mNeMI=;
        b=hL5nJLbnANHgcnP7ocuKuEpvjpbcb0EpkkM8y7A08+/9Jy/9kXlRhzHAmZGI1q6/wP
         /V2M8ts6veD2CxH/H9Cs5vC46eQaJobkSYIMCrnCv5HYTM9EubIpiXyj9xcom7WB84Dn
         9hKXBNy0jHaVfw5fG5IqyqEiv8GLDdrqEu6aJxL1iyrQy2E/wQoVWM53j39RJIoOSkbZ
         L4JP5JIeb7i0KitmhNQHrBLJS0SP0SaOdNHJyWObf0te47G9cr7GudO1jrU7V2SRlMh3
         71H0hbW5mvRxjVAZXlsSG6wCOVy8zB93NgxdoLHIWULOKM6NygqRSpdruD0fKUS9pWu/
         htsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696498998; x=1697103798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwKnCE50Or3wTNbb8nnaCjSfC0KHldEcWfUSQ5mNeMI=;
        b=uDSqZ90PkyrWhs6uUyc5TpZtAeD41WGZUxBvz+16iacbUmJ/mHDgTb1/v/Sd/QRj/N
         teZZB5sl3qJy3Y1oQDIJxkLs2tFevg0dJFXswSZIhHUtHPw9IVyN+qQUCoaRbvWv2SWq
         gj3HbGHO3cFIbZLAwN0qIdqMRj4p49rRFBLvnu+pFapdhx6F2aGKHK3DZ3RhkVNFxpMV
         gsFfkdx1OwTGP4rF0bn+mqbeFQcI/J7xQgaEaHQI/7dp/49QG5PMpExdbYtVJ6hTmfg4
         uVLm7DJo5mv3q8+kkQgSn0LPdJ3Oj9URTNK3XDsmQHOPowl/Oot7bNDQ/gwF9rzIVNQ7
         xacw==
X-Gm-Message-State: AOJu0Yxjp1HTfGL9H/CO+3pHRRTtEKMIMqwLwNhf8vtONh893o50QHz7
	VW7RsXc+wdfqSlwv1jHtgSBosw==
X-Google-Smtp-Source: AGHT+IEA8Pv/FN9E11LJAyjgn8EofUjuGcu3RKUVzw7ZzFbiuhbNcnB4JemmblVGztHfx0rlL56C5A==
X-Received: by 2002:a5d:630c:0:b0:31f:fa6a:936e with SMTP id i12-20020a5d630c000000b0031ffa6a936emr4440521wru.17.1696498998220;
        Thu, 05 Oct 2023 02:43:18 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:8222:dbda:9cd9:39cc:f174])
        by smtp.gmail.com with ESMTPSA id d16-20020adff850000000b003232d122dbfsm1355989wrq.66.2023.10.05.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 02:43:17 -0700 (PDT)
Date: Thu, 5 Oct 2023 11:43:16 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 0/8] soc: mediatek: MT8365 power support
Message-ID: <20231005094316.nj5w6cmefvc36tbl@blmsp>
References: <20230918093751.1188668-1-msp@baylibre.com>
 <06f8a769-1845-ea87-dcc4-37dd5ad255ed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <06f8a769-1845-ea87-dcc4-37dd5ad255ed@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_024321_487339_FCBDCE07 
X-CRM114-Status: GOOD (  31.34  )
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

Hi Angelo,

On Thu, Oct 05, 2023 at 10:54:16AM +0200, AngeloGioacchino Del Regno wrote:
> Il 18/09/23 11:37, Markus Schneider-Pargmann ha scritto:
> > Hi,
> > 
> > no real changes in this update. Rebase to v6.6-rc2 and according change
> > of directory.
> 
> Since the driver changed to pmdomain/mediatek, can you please change the commit
> titles for the driver commits?

As far as I understand Ulf applied the series today and changed the
title as well:
https://lore.kernel.org/lkml/CAPDyKFrUbWBQgMm6wYwFfybiRQKhBpwH7wwcXaT+KrQJLevq3w@mail.gmail.com/

Best,
Markus

> 
> soc: mediatek: pm-domains: ===> pmdomain: mediatek: pm-domains:
> 
> or alternatively, I honestly would like it more like
> 
> pmdomain: mediatek: pd:
> 
> and (not relevant to this series)
> 
> pmdomain: mediatek: scpsys:
> 
> ...but before that, does anyone have any strong opinions against the prefix
> "pmdomain: mediatek: pd:", instead of the full "pm-domains"?
> 
> Thanks!
> Angelo
> 
> > 
> > Thanks for any feedback!
> > 
> > Best,
> > Markus
> > 
> > Based on v6.6-rc2
> > 
> > Changes in v8:
> > - Rebased to v6.6-rc2
> > - Moved changes from drivers/soc to drivers/pmdomain
> > 
> > Changes in v7:
> > - Rebased to v6.5-rc1
> > - Fixed a couple of small style issues pointed out by Angelo
> > 
> > Changes in v6:
> > - Change flags field to be u8 instead of u32
> > - Use macro concatenation to simplify BUS_PROT macros:
> >    BUS_PROT_WR(_hwip, ...) etc.
> > - Use the final bit values for scpsys_bus_prot_flags from the beginning
> >    of the series.
> > - Changed scpsys_domain_data->caps to be u16 to accommodate the new flag
> >    MTK_SCPD_STRICT_BUS_PROTECTION.
> > 
> > Changes in v5:
> > - Create defines for all registers and bits in mt8365 power domain patch
> > - Redesign scpsys_bus_prot_data to use flags to store reg_update,
> >    clr_ack as well as the difference between SMI and INFRACFG. The code
> >    uses the appropriate regmap depending on the flags.
> > - The WAY_EN patch now uses two flags, one for inverted operations
> >    'BUS_PROT_INVERTED' and one to use infracfg-nao for the status flags
> >    'BUS_PROT_STA_COMPONENT_INFRA_NAO'.
> > 
> > Changes in v4:
> > - Redesigned WAY_EN patch and split it up in smaller patches.
> > - Added two documentation patches.
> > - Added mediatek,infracfg-nao field to the binding.
> > 
> > Changes in v3:
> > - Mainly redesigned WAY_EN patch to be easier to understand
> > - Rebased onto v6.0-rc1
> > - Several other stuff that is described in the individual patches
> > 
> > Changes in v2:
> > - Updated error handling path for scpsys_power_on()
> > - Minor updates described in each patch
> > 
> > Previous versions:
> > v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
> > v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/
> > v3 - https://lore.kernel.org/linux-mediatek/20220822144303.3438467-1-msp@baylibre.com/
> > v4 - https://lore.kernel.org/linux-arm-kernel/20230105170735.1637416-1-msp@baylibre.com/
> > v5 - https://lore.kernel.org/linux-arm-kernel/20230619085344.2885311-1-msp@baylibre.com/
> > v6 - https://lore.kernel.org/linux-arm-kernel/20230627131040.3418538-1-msp@baylibre.com/
> > v7 - https://lore.kernel.org/linux-arm-kernel/20230713150414.891893-1-msp@baylibre.com
> > 
> > Alexandre Bailon (2):
> >    soc: mediatek: Add support for WAY_EN operations
> >    soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
> > 
> > Fabien Parent (2):
> >    dt-bindings: power: Add MT8365 power domains
> >    soc: mediatek: pm-domains: Add support for MT8365
> > 
> > Markus Schneider-Pargmann (4):
> >    soc: mediatek: pm-domains: Move bools to a flags field
> >    soc: mediatek: pm-domains: Split bus_prot_mask
> >    soc: mediatek: pm-domains: Create bus protection operation functions
> >    soc: mediatek: pm-domains: Unify configuration for infracfg and smi
> > 
> >   .../power/mediatek,power-controller.yaml      |   6 +
> >   drivers/pmdomain/mediatek/mt6795-pm-domains.h |  16 +-
> >   drivers/pmdomain/mediatek/mt8167-pm-domains.h |  20 +-
> >   drivers/pmdomain/mediatek/mt8173-pm-domains.h |  16 +-
> >   drivers/pmdomain/mediatek/mt8183-pm-domains.h | 125 ++++++----
> >   drivers/pmdomain/mediatek/mt8186-pm-domains.h | 236 ++++++++++--------
> >   drivers/pmdomain/mediatek/mt8188-pm-domains.h | 223 +++++++++++------
> >   drivers/pmdomain/mediatek/mt8192-pm-domains.h | 112 ++++++---
> >   drivers/pmdomain/mediatek/mt8195-pm-domains.h | 199 +++++++++------
> >   drivers/pmdomain/mediatek/mt8365-pm-domains.h | 197 +++++++++++++++
> >   drivers/pmdomain/mediatek/mtk-pm-domains.c    | 157 ++++++++----
> >   drivers/pmdomain/mediatek/mtk-pm-domains.h    |  51 ++--
> >   .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
> >   include/linux/soc/mediatek/infracfg.h         |  41 +++
> >   14 files changed, 972 insertions(+), 446 deletions(-)
> >   create mode 100644 drivers/pmdomain/mediatek/mt8365-pm-domains.h
> >   create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
> > 
> > 
> > base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
> 
> 

