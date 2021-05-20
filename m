Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6537C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 10:57:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5058661358
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 10:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5058661358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G410II+bmdO7IcGLLmycZLZ3GRdjlAadOEuz9+LrYR4=; b=Kn1VIGKt+wVwI6f9lZiux+mDO/
	eAJnM9IpCFYwKQnC9bNTiJnI2MbiPhwbB9SCqTGKXpr3N/xz1mW2fSCUlGESCupfsbz+0RM1vovkQ
	WTwPyHSX6NtAyQ7Lfj074xUGzMzHLlbNdLRoComhoPqYhA3uZ0gsI5LY3LVJitrHXGyGlZnKAsA6z
	N7ukFXvgh8XTjDiN7pvPxx0VSZH/r426VpEJcGbWZTbBg5aB2qRGpMpEp7Wo4sXqdLiVXf44n31aR
	33x3uGZ0bgm9jFWDT0Cd+1PXiiK+jD7awGZ8jczV9+ieZYXTm+Jkt+2gviJHGUUnuZgmMueAkv8H/
	zenEXY8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgME-000Huy-Ba; Thu, 20 May 2021 10:56:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgMD-000HuV-6r
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 10:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZggdLxEioYSmHsAN6HdiHwkaCdjjLY0f9eAD0updRrw=; b=OJJEEsDr9v6KUJzcYanPAsXinS
 ivwnf1aMgu2YccaO54BDqxwIt3VDtg5e5qcFl9fXU8v5z3nzNY35s0N2IdYUanCaEBsh49+vlTaKy
 5Elq+M56obogjlIQic3jaoF28kgYGZx5hC4Aysu42bIDFcubVZyk3Zn52a6r6CPNLk3r9gud8slQM
 aOJ8TMghKuGqmITQUuCBlZFYRo6HM2Vnr6CdEreS83OvrpmnqkqQaY/+avCrJcm7a/gozWLHBqWo/
 KA5umi0oL11y9InosaTPhlAGBLohT7P0BEGRfca1It8tROsbdQIUrRsCSO3PMwuwmekrSFXEepvzn
 ztEvYy7g==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgMA-00GCjr-4g
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 10:56:47 +0000
Received: by mail-io1-xd2e.google.com with SMTP id e17so3584794iol.7
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZggdLxEioYSmHsAN6HdiHwkaCdjjLY0f9eAD0updRrw=;
 b=gwOq7/3pH8V/2gE94ERMNXP3mpo89c0EaBoRdYiv3gQh0NZ5AsxXUlDYWYADOZtuiZ
 AlzMofkhhVaVjJ70OpmgP0FVwr7nsJnfFINio4WNaXSn3f5ULLZUP3fRrz6qWMb+4xnr
 7+bOE3u0k24UY8a0FiD3P94RywWnjtlyjXWaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZggdLxEioYSmHsAN6HdiHwkaCdjjLY0f9eAD0updRrw=;
 b=UH1qPucUyYhIAramiIDxiZQIT57+xThBk57c7zhMx7CmX0qNOm85X10n1yCx0n//iT
 01IFqZl2Bfqz3hu8Dnyc8TM5LifmPK12Djj1SgvRkS4oYlEEaDIeF4vHkC1QthO9/hrU
 zP3HIVrq1R4iXcJTfdrSycxXl+PgF4hWZkU2H2M8guHLTMBvx6+V3kNt+gvx3gTgTCoY
 YOphnR2j3GOL2QIj2/kVv/Py0H75HFsFI8rW9cnWUeG9N9/mnkORh+jnG42qXWoQM21Q
 2R3FO+NgWsVCtQWrd9ZsH/jSnST8meEfDjB2d4qVXDrt52NHMt1e/tjSnUBas72sB6wS
 xtug==
X-Gm-Message-State: AOAM5311iXfghQIlbZXfAFhO73Jy+zntY4DFMEQ3MBPU8cjioBLFsnut
 RMqbo4TuVAWEyQv01b7yOxJ3FpOlniSxZQxoHvoaNw==
X-Google-Smtp-Source: ABdhPJwsRXryrVBLrnfEAhDRXkJWRvO5y68qKTU37qReKB6ekDFRs2lFm7STxXVQpa9ZsaRZSseo6EjW/Uv6Q9RgDH0=
X-Received: by 2002:a5e:c742:: with SMTP id g2mr4887060iop.40.1621508202940;
 Thu, 20 May 2021 03:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210507131406.2224177-1-hsinyi@chromium.org>
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 20 May 2021 18:56:16 +0800
Message-ID: <CAJMQK-is=wOWGL-bETEcp=shcnrGdWFh4FbzHWCTEYjg-Zk0Dw@mail.gmail.com>
Subject: Re: [PATCH v21 0/5] add power control in i2c
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, Qii Wang <qii.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_035646_223520_0944FB22 
X-CRM114-Status: GOOD (  22.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 7, 2021 at 9:14 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Although in the most platforms, the power of eeprom
> and i2c are alway on, some platforms disable the
> eeprom and i2c power in order to meet low power request.
>
> This patch add the pm_runtime ops to control power to
> support all platforms.
>

Hi maintainers,

Gentle ping on the thread. (the 4th patch is already picked) Thanks.

> Changes since v20:
>  - fix regulator check logic in suspend/resume.
>
> Changes since v19:
>  - resend v19 with fix tag added.
>
> Changes since v18:
>  - Fix a function name conflict with drivers/gpu/drm/i915/selftests/i915_gem.c
>
> Changes since v17:
>  - Add a patch to fix unbalanced regulator disabling.
>  - Add dts patch.
>
> Changes since v16:
>  - request regulator in device instead of in the core.
>  - control regulator only if it's provided.
>
> Changes since v15:
>  - Squash the fix[1] for v15.
> [1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/
>
> Changes since v14:
>  - change the return value in normal condition
>  - access the variable after NULL pointer checking
>  - add ack tag
>
> Changes since v13:
>  - fixup some logic error
>
> Changes since v12:
>  - rebase onto v5.7-rc1
>  - change the property description in binding
>
> Changes since v11:
>  - use suspend_late/resume_early instead of suspend/resume
>  - rebase onto v5.6-rc1
>
> Changes since v10:
>  - fixup some worng codes
>
> Changes since v9:
>  - fixup build error
>  - remove redundant code
>
> Changes since v8:
>  - fixup some wrong code
>  - remove redundant message
>
> [... snip ...]
>
>
> Bibby Hsieh (1):
>   i2c: core: support bus regulator controlling in adapter
>
> Hsin-Yi Wang (4):
>   dt-binding: i2c: mt65xx: add vbus-supply property
>   i2c: mediatek: mt65xx: add optional vbus-supply
>   misc: eeprom: at24: check suspend status before disable regulator
>   arm64: dts: mt8183: add supply name for eeprom
>
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
>  drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
>  drivers/i2c/i2c-core-base.c                   | 95 +++++++++++++++++++
>  drivers/misc/eeprom/at24.c                    |  6 +-
>  include/linux/i2c.h                           |  2 +
>  8 files changed, 121 insertions(+), 2 deletions(-)
>
> --
> 2.31.1.607.g51e8a6a459-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
