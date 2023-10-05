Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05098E784A9
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCYFX8DqNzwL6GYU1rfcPUGS3N4C41iYiCIn75uvSfk=; b=0IG3rPlI/vcXtP2FwCvFsMPaFp
	8nLCNc8PbUbQ/gCMbxBLGeZUMWpf61Vgoav48zJE8PUqWsqHZECfycytkGrN0fD70a76keQ5P51hX
	BqcBDXy92IBYpwA8/3dbLXemkl7ivgyOqjeJYT9d8oVChv3+2FW7Eb51Q5SpS0UIWcqVT3z+XKRbH
	84SuGEHuHBGQvegU2Ikjmq9cta0ltjjqStAZHN0rgVvH6WGBI4ktPNvxFqeauenJlF+mlbLYMDrR6
	Rk2/Te2JLPU173NhHqrvnOP4lieUdaJx6CZad/5QoPHtZ7CWYxxGXA+CV1nICgvhtf2t5SAtLidmU
	oQITT5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHkh-001Veh-2F;
	Thu, 05 Oct 2023 06:22:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHkd-001VdA-2s
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 06:22:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso5083285e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696486935; x=1697091735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCYFX8DqNzwL6GYU1rfcPUGS3N4C41iYiCIn75uvSfk=;
        b=tKbLv/2EHP8kvp89j7MF+Hw5YTiln9L7BDUhDwAM0kYqrqYX2zUUD/0QbjrX2iksOf
         psXYb94J8LJTCAEacWHWTXulOAxicBmAT10m8hgEIcJL/F1eLZ4EqiMvxkPIU3VFImwy
         ovtOieXN1kr1f+5TSGQmiqXfZAiniLVWoVi1TXDLTltIiWRZTlsRYEvp/oRjF0/D3Fi6
         kOFAyS/pJzGoDMQwChDeAl85fpcapwAooKJGAt5exe52BZmCy6Ermhn7OGik84wKwfjh
         ODn1YEU0U+p5lpqANodl/NgwySY03Js1d2zI0+z4t1zB4U1Y8DIE3hef2HWjHzROs7Yi
         zJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696486935; x=1697091735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCYFX8DqNzwL6GYU1rfcPUGS3N4C41iYiCIn75uvSfk=;
        b=ZXZtqIYY/FVpDVUuO5dnry/7Y6WXoBb49Rup10A/1iHhoAf+2/DD6ggCQZFxCCVdfz
         DeLCl6sgV6/y55rhH17MpG3xNHcvPAYNPE2W7MdMccum9qJmJiYXdqW4aqH+ckgyKMIm
         S6wC3LaICNvo/M+HMhJBeULMSXesjFl9JZghKxGrXxwaCxLzawYimO93dWoAbO4xCi5Q
         LPfbWpyADqIjRKlAGV0yXI0SEdAtJmKtS4d8Txam/S7GQvTFra9wLa/IZdKaNsf/MiiX
         rCCT4iYObNDkMduOg5g+M2nrHnYy6NaYR0sJ7woQnBJio9UAb/dQUjTAbU+MwlH7JJv7
         MVDQ==
X-Gm-Message-State: AOJu0Yxi7PsGXfo4VLeDYXya5UxJDH5lUZs/pn10LQniZxF6iW5epZCa
	dYVhs+Eb4LMBM9+v0mxDOdpGiA==
X-Google-Smtp-Source: AGHT+IGWRD93uyqouYy7cDYKEdj+YgCmxQ/c3dT08yZKwt4jO5D/UibpzgDbKf1/XmbUczotJUREvw==
X-Received: by 2002:a1c:6a0d:0:b0:3fc:1a6:7764 with SMTP id f13-20020a1c6a0d000000b003fc01a67764mr4004459wmc.16.1696486934337;
        Wed, 04 Oct 2023 23:22:14 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:8222:dbda:9cd9:39cc:f174])
        by smtp.gmail.com with ESMTPSA id k22-20020a7bc416000000b00404719b05b5sm744928wmi.27.2023.10.04.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 23:22:13 -0700 (PDT)
Date: Thu, 5 Oct 2023 08:22:12 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 0/8] soc: mediatek: MT8365 power support
Message-ID: <20231005062212.dpkscqq27exdnssm@blmsp>
References: <20230918093751.1188668-1-msp@baylibre.com>
 <CAPDyKFrUbWBQgMm6wYwFfybiRQKhBpwH7wwcXaT+KrQJLevq3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPDyKFrUbWBQgMm6wYwFfybiRQKhBpwH7wwcXaT+KrQJLevq3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_232224_158715_CB983A24 
X-CRM114-Status: GOOD (  30.91  )
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

On Thu, Oct 05, 2023 at 12:09:06AM +0200, Ulf Hansson wrote:
> On Mon, 18 Sept 2023 at 11:38, Markus Schneider-Pargmann
> <msp@baylibre.com> wrote:
> >
> > Hi,
> >
> > no real changes in this update. Rebase to v6.6-rc2 and according change
> > of directory.
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
> >   BUS_PROT_WR(_hwip, ...) etc.
> > - Use the final bit values for scpsys_bus_prot_flags from the beginning
> >   of the series.
> > - Changed scpsys_domain_data->caps to be u16 to accommodate the new flag
> >   MTK_SCPD_STRICT_BUS_PROTECTION.
> >
> > Changes in v5:
> > - Create defines for all registers and bits in mt8365 power domain patch
> > - Redesign scpsys_bus_prot_data to use flags to store reg_update,
> >   clr_ack as well as the difference between SMI and INFRACFG. The code
> >   uses the appropriate regmap depending on the flags.
> > - The WAY_EN patch now uses two flags, one for inverted operations
> >   'BUS_PROT_INVERTED' and one to use infracfg-nao for the status flags
> >   'BUS_PROT_STA_COMPONENT_INFRA_NAO'.
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
> >   soc: mediatek: Add support for WAY_EN operations
> >   soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap
> >
> > Fabien Parent (2):
> >   dt-bindings: power: Add MT8365 power domains
> >   soc: mediatek: pm-domains: Add support for MT8365
> >
> > Markus Schneider-Pargmann (4):
> >   soc: mediatek: pm-domains: Move bools to a flags field
> >   soc: mediatek: pm-domains: Split bus_prot_mask
> >   soc: mediatek: pm-domains: Create bus protection operation functions
> >   soc: mediatek: pm-domains: Unify configuration for infracfg and smi
> >
> >  .../power/mediatek,power-controller.yaml      |   6 +
> >  drivers/pmdomain/mediatek/mt6795-pm-domains.h |  16 +-
> >  drivers/pmdomain/mediatek/mt8167-pm-domains.h |  20 +-
> >  drivers/pmdomain/mediatek/mt8173-pm-domains.h |  16 +-
> >  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 125 ++++++----
> >  drivers/pmdomain/mediatek/mt8186-pm-domains.h | 236 ++++++++++--------
> >  drivers/pmdomain/mediatek/mt8188-pm-domains.h | 223 +++++++++++------
> >  drivers/pmdomain/mediatek/mt8192-pm-domains.h | 112 ++++++---
> >  drivers/pmdomain/mediatek/mt8195-pm-domains.h | 199 +++++++++------
> >  drivers/pmdomain/mediatek/mt8365-pm-domains.h | 197 +++++++++++++++
> >  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 157 ++++++++----
> >  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  51 ++--
> >  .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
> >  include/linux/soc/mediatek/infracfg.h         |  41 +++
> >  14 files changed, 972 insertions(+), 446 deletions(-)
> >  create mode 100644 drivers/pmdomain/mediatek/mt8365-pm-domains.h
> >  create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
> >
> 
> Applied for next, thanks!
> 
> Note that while applying I amended the patch-prefix for patch 2->8 to
> "pmdomain: mediatek:", please try to conform to this when going
> forward, as it help me to better filter emails.

Thank you! Sorry, I will use that prefix in the future.

Best,
Markus

> 
> Kind regards
> Uffe

