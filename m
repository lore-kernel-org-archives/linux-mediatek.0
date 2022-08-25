Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BAECAAD4
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 23:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tr9JX1rDWUseLRDd+rjAH9EQ4DmqGlf98TtCf/E/5k=; b=TlkHC9dh57arnVYnx1vAFNIVaG
	yij4fvZKB3ZdS/36ypz1XZYkL1ZwXajWHy8N1AyqKMqTRhIavRrIawGuAr7SlO/86dxylAeOPju68
	Gc+XuUu89KAZLVMpSmCuU/gRrYmZIDV8SnblNbr5dxSB5UuD13fNW8kfVmNonO9SJJE83xJx5x+kZ
	hbMZnN+5JkSSGqKCe/1ssTYPQmjNbcvVMNkUz7jfoDdmRCsnsWFHd8Ms8UkQBQrQX8T7jxTUp0+Af
	Sqq5yxZ+ecX1RGbO0PTazAGvLKTfZe3+aRIIPf76xoCe//9rOo5gIEDNlFQsX4+JBHuZspZaR9UYb
	1mQtNF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMkl-004JSm-9G; Thu, 25 Aug 2022 23:59:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMkg-004JDO-GG
	for linux-mediatek@bombadil.infradead.org; Thu, 25 Aug 2022 23:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6tr9JX1rDWUseLRDd+rjAH9EQ4DmqGlf98TtCf/E/5k=; b=q4elJT76DgHg96jdJP2onvnvHk
	Q+ZOquL+HpgtpU6zUbfNl0BCsI46+skf2FgggFm5+j/AaU52Mqr27nhiTiqccDnvpKpnW+mCONQu0
	QAIZ5JNsrMF4UzdLUxejnLuTHW/tlks4TKeDOuDKzm/WRo0xB0mIDb8fCi6JWuvOP2PnmNyJvXMXn
	GeKZ1OHK6IDscC2DcVRgJvj8CrlqZAEdmRy6sFcnWuTzBVRJHaIFUvWA+CBybG0dgmK2/svyKV+om
	7Pc+wNXTsdwX1sXN3wt2gwSMBdZMSSmg5zZ9jM5RqEJU+wEI0RtMzuLUSD/7ZvFvVE9cHjQVID+wu
	Y1F3b/oQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMEi-0068zu-2h
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 23:26:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1ACB61D48
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 23:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76436C43141
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661469948;
	bh=gANNeo5xFLWx50TpQgTmSD/ajuMSXdn3OaPyPmhxXLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tIjYGOQqVzSB18XFBZDqzuEERpxgkNSETElSZ7o1WjHeCgh94xGTf3IfOLKBp7nQy
	 m6mlX1GR5rsIDMZtmYmMNZ3SUcqynZIIk4y8hRuncuizi3nkLoSxICTv2zdsfJBgsS
	 HzPnhpI6YM26VGx9LJqNDIS7KyY/fRR6Mf/bOZ9Y3HA2NF6h1/DzzsS29Xq/gURX8W
	 +cdfD0P9BFXfz3y61EBOwJ1IrOWto5e+S7QI4LZcowMDFqh2qnZ4mY8e/9ANexfiRP
	 hxXdNl/KdlbWLAucLx4NQOk3+rFZXPDZYVFNssN1sfmq2HeT5i6p2VA1xHDGz1o13s
	 7sDqb94lT2SEA==
Received: by mail-oi1-f172.google.com with SMTP id o204so39291oia.12
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 16:25:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo0GCbjE+0np+OkZi0VZ9Lzichk0DoUcBzONLrBqt0/G0dHkrRMP
	lBUQsyZ6WZ6oWtwNrbCNvkwMzBX2M/3fqCuSDw==
X-Google-Smtp-Source: AA6agR6/OpIOZrEsWat8SQRwRTVdbJeXbdtydW5Eboufpp739coHjJXCokAIiHdL3oK9fM+r9I0g37gU99hljRaQqhQ=
X-Received: by 2002:a54:4405:0:b0:343:23df:4ac5 with SMTP id
 k5-20020a544405000000b0034323df4ac5mr519363oiw.69.1661469947573; Thu, 25 Aug
 2022 16:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220812205746.609107-1-mairacanal@riseup.net> <20220812205746.609107-3-mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-3-mairacanal@riseup.net>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 26 Aug 2022 07:25:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aE+dZ=GDOQN+Yeh9MzDrFnK71E36NGe0gb17hNXgE8w@mail.gmail.com>
Message-ID: <CAAOTY__aE+dZ=GDOQN+Yeh9MzDrFnK71E36NGe0gb17hNXgE8w@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/mediatek: Drop of_gpio header
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_002618_893658_DC4994E4 
X-CRM114-Status: GOOD (  14.01  )
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

Hi, Maira:

Ma=C3=ADra Canal <mairacanal@riseup.net> =E6=96=BC 2022=E5=B9=B48=E6=9C=881=
3=E6=97=A5 =E9=80=B1=E5=85=AD =E5=87=8C=E6=99=A84:58=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> These drivers include the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop the include.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c  | 1 -
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 630a4e301ef6..508a6d994e83 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -11,7 +11,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 3196189429bc..4c80b6896dc3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -16,7 +16,6 @@
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> --
> 2.37.1
>

