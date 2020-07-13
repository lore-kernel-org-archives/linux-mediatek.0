Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CA8C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 05:44:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0259220674
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 05:44:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D+hgDt+T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRSdQDBt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0259220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lo31QOvOMyi/n9XXs3rFQxN8Nqk4Vldr8x7OcTKfTLc=; b=D+hgDt+TlkeNNGptZt1t8nd1l
	eUmyzQb7jkXntuLC4imb5gtP8yhVMohfcsmg1dStv1sL7TuC5gMjE48u1uKUwEIGktklrdSGfnByn
	Ky+8+7/FRnmb1RdQeao0/sMYHinL73sXZx7Nfkz5i3kUmvGEu9qvVdIp5ljZ7R6/3C2Gb9h9UM3ot
	h7HiJovH5DRVGWKW/vr9ZvNpFRbNSPdDxpSBnVYiifPBV/hWaWhFA7M94r5ndqC7tNUaRcqfSfgCh
	zOa7JY51YGlrSmNZE5QWIibRxgt9g0PDJWvCPaMvuiZ7g5hY0aNb2BKdyNS/dR1Kte7h3Ph4c6dLE
	dPvNmw/cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurGJ-0005Xz-JK; Mon, 13 Jul 2020 05:44:23 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurGF-0005Wc-K3
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 05:44:20 +0000
Received: by mail-ej1-x644.google.com with SMTP id o18so14682446eje.7
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 22:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rp7+bh2mU6TpEEtWpOr+87rCm6MPnrvLOWdtUzMHKQ8=;
 b=CRSdQDBtxmD9eFlVT0K5jcruX9Eb95imbaOtpnYb7gl8aEBpXbsxoBVC4abKx/J+Ld
 DFDhaOOfCqUgceSh2DeJvNwSBdWGz4Enfbn7+tsEQatlol7t82YFPryAObOhHvlVQ1A+
 fkQzDtU1fT+c4rqwAN9nfZyl6z1t9Vi91nFGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rp7+bh2mU6TpEEtWpOr+87rCm6MPnrvLOWdtUzMHKQ8=;
 b=UAbhGXVoQ/ljddaOLK4IDYcFHNCXfcWqDrRVILMj2JfOb8zmWXnVRWpHFNMaoH5LBT
 jwLOpnCM0DMyAEUXTsVZcfcE+jqzBF9FsQPpU6K46zXl4SKCtvuIeoObgZ0HpjVbNvPu
 GzQlIjD/96OdDz2d0EGw2mJKSFw5FGFvjhF/u/FVOkoQJ2i7azl77J+vGhppuU4S1co0
 D2wdY+JGY0UpxVhFUWgNM+bSnPE1XhPwIBCqGIj7ENMHU7s7q608Xt06GDu2Dfv6OQah
 mCurJSXiCr4qmKCyxg+X8+t9/Xy8fFTcSX0mFVD/inwZlndixohrrIFt476nslxe7du5
 ANpA==
X-Gm-Message-State: AOAM533QX6BpgkYYyhcLBH1vXevk0qW0qKueBa5A6Ymc5pPMN0llsL8c
 nk+5ccETkmrdqfTu8N2h6evgLnfZ8T6JVCO5Hgx1WQ==
X-Google-Smtp-Source: ABdhPJxKhhkxwRWVmaaKVxOyh3qvejCjDIr3yNQRWD870hkkTeHHZbJtXmbbx2iPuNB7nZjoO1GN3ll0CJpetV9WDDo=
X-Received: by 2002:a17:906:b45:: with SMTP id
 v5mr69591620ejg.464.1594619058124; 
 Sun, 12 Jul 2020 22:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-2-yong.wu@mediatek.com>
 <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
In-Reply-To: <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 13:43:42 +0800
Message-ID: <CANdKZ0dwsaP=s8AgRbDx2_0y4JmPnF-X0Rb=4vor2MWCYWfGKw@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-binding: memory: mediatek: Add a common
 larb-port header file
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_014419_692261_DBE3FD5F 
X-CRM114-Status: GOOD (  18.29  )
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
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 2:06 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 11/07/2020 08:48, Yong Wu wrote:
> > Put all the macros about smi larb/port togethers, this is a preparing
> > patch for extending LARB_NR and adding new dom-id support.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
> >   5 files changed, 19 insertions(+), 4 deletions(-)
> >   create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h
> >
> > ...
> > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > new file mode 100644
> > index 000000000000..2ec7fe5ce4e9
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + * Author: Yong Wu <yong.wu@mediatek.com>
> > + */
> > +#ifndef __DTS_MTK_IOMMU_PORT_H_
> > +#define __DTS_MTK_IOMMU_PORT_H_
> > +
> > +#define MTK_LARB_NR_MAX                      16
>
> include/soc/mediatek/smi.h has the very same define.
> Should smi.h include this file?
>
> Regards,
> Matthias
>

Looks like this is being addressed in patch 5 in this series ([05/21]
iommu/mediatek: Use the common mtk-smi-larb-port.h)
That said, should that patch be merged into this one?



> > +
> > +#define MTK_M4U_ID(larb, port)               (((larb) << 5) | (port))
> > +#define MTK_M4U_TO_LARB(id)          (((id) >> 5) & 0xf)
> > +#define MTK_M4U_TO_PORT(id)          ((id) & 0x1f)
> > +
> > +#endif
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
