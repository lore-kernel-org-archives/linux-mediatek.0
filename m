Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90243C433E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C5B92075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9+LEjxh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oBSA29ZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C5B92075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=44N+I7Bx75X906Yr398hJT8k+2w2BzFoeZgepEaS+N4=; b=l9+LEjxhJJe8/gU4oTz8aLy9p
	CclbC5mcwmQE7OWSEJ7D4ruU8rfG8M0yFEYOmYO25hR0l04ZYWXTQwxpRzNFFkWwSQD7qqnQvpQwK
	o4bAqDGQm/BrL+xvYJqEbv+sw5/Qlk+hyhYju9SFR9SPDEeMdua8hCAuO1I3rDnQs2X9HIbWlyMZp
	f3g3a1XqXSFbD7l6eh7O5XOMaHIliJwE5tVc2+zB3G4FVp1TmOmFJJPCBHsL0U906EiUxzsZj/zDi
	C5mT0S6trVrSwBE3yWdnMKVG6G1BgPmsslLYtnjvLQhNiU58Of4JcV+BIr5cuKP1uv3CUE+fuB/Om
	rVX4CngQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusVZ-0001Ph-Nt; Mon, 13 Jul 2020 07:04:13 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusVV-0001Nk-3i
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 07:04:10 +0000
Received: by mail-ed1-x544.google.com with SMTP id bm28so10010795edb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9He2Y/cj2b1yofJp3r0tciWRU0GFm0a2fXfgV5d2ZsM=;
 b=oBSA29ZRXnyX5uNrdKdKimE/m7zWdZXNnhrXmKWKgnyN/SH230LhrcwzyL4D5IYCjQ
 q+j9awO4n+F2erswVyiQg/WMcIkxFh/IgNX4JZT8Q8aB3qp0IaeT4wjmr6f/xn1O58TX
 4LtOfoBBudGY9551aEhRNWgZVLL5lJSfEBVd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9He2Y/cj2b1yofJp3r0tciWRU0GFm0a2fXfgV5d2ZsM=;
 b=BeDJWF0pTQ/M2r3IFqWa0/FJ2TUTnWYjTGkNlQ/gaDMJnJyINNtOaSPAjeQyFL+Cw3
 /5xsKgX8I1BH+T206/+tvpcRdremDM85pla4Ppaz985u/xfbMFh0SuRrRXtCSJigEolc
 gcNmidqR0PjwgPouY/KH4cWqkiCdwmvz5sNfpJYsxO5rDnpC73rdeDpxcZUyYkF0RxeL
 mcqeDJwL6JD6Rsv7hFPiEkZAppG81pJVO2HJP6oL0/s/DfJHK9B5+KZ/mTJ3a55RmN8F
 RBNeZ2rdh4Gdttj/XzeDFSHywi10Gdz20UwsI5PaYpviGESJBcDD3+76NwW7RC3ND9nl
 Ea2A==
X-Gm-Message-State: AOAM530uUSczaicwY4DiJO+DIQOxwhcZjI8fT3UxcsV088Rs6ZOSgMiw
 0bMvzePzQwEIc1NLV0frnKrTv3yukcjqc4ZQaoiMlyaCk/iOcg==
X-Google-Smtp-Source: ABdhPJxgek6wFGTNWYGWXYoVuA91A7Bl2JN7v5ipfo4T7zContyupAUFj7BG3ePmDatYcqA77vTV3vhHfoLVelT2s64=
X-Received: by 2002:a17:906:f117:: with SMTP id
 gv23mr43961935ejb.528.1594623847288; 
 Mon, 13 Jul 2020 00:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-12-yong.wu@mediatek.com>
In-Reply-To: <20200711064846.16007-12-yong.wu@mediatek.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 15:03:31 +0800
Message-ID: <CANdKZ0e3=AeCxpSHVk7daUE01L7AgJYmZ7jeOQDT169SaowL-g@mail.gmail.com>
Subject: Re: [PATCH 11/21] iommu/mediatek: Add power-domain operation
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_030409_240403_6028B565 
X-CRM114-Status: GOOD (  15.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 11, 2020 at 2:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> In the previous SoC, the M4U HW is in the EMI power domain which is
> always on. the latest M4U is in the display power domain which may be
> turned on/off, thus we have to add pm_runtime interface for it.
>
> we should enable its power before M4U hw initial. and disable it after HW
> initialize.
>
> When the engine work, the engine always enable the power and clocks for
> smi-larb/smi-common, then the M4U's power will always be powered on
> automatically via the device link with smi-common.
>
> Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> If its power already is on, of course it is ok. if the power is off,
> the main tlb will be reset while M4U power on, thus the tlb flush while
> m4u power off is unnecessary, just skip it.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 54 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 7 deletions(-)
> ...
>         for_each_m4u(data) {
> +               /* skip tlb flush when pm is not active */
> +               if (pm_runtime_enabled(data->dev) &&
> +                   !pm_runtime_active(data->dev))
> +                       continue;
> +

pm_runtime_active(dev) == false implies dev->power.disable_depth == 0,
which implies pm_runtime_enabled(dev) == true, so the
pm_runtime_enabled(data->dev) can be omitted here.

>                 spin_lock_irqsave(&data->tlb_lock, flags);
>                 writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>                                data->base + data->plat_data->inv_sel_reg);
> ...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
