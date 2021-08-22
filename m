Return-Path: <SRS0=dV3g=NN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D9BC4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 17:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0AD611C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 17:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA0AD611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=borCabpZSKoVvvDGyu0zNJzthsAc4xMTFe5wvI49d/M=; b=sHe6AuX85q+rRE
	YyNGG4amtbcRLLl0nFGby4Yn+GEKDKSzJ4vraJFhN/WXgtSsElGu14z5Gkpg/Nyv3Zu8nTMABN3bM
	eMGBU1KA37uHnc7khoUmRuG2s+KZqYccaKFJCTPd+AhERk3DuDadrA2Qaohqr8P+egMeB8Jqcm1BR
	hyxj6VsYw6Gz0zPCPtNDMSxeNwOXnET7uGv/kBVtdDXci8YoMFJqQa9ovg8WZ3MNYPp81I8KDAfvy
	I6H978wDqJFLlHM4v7dfNmyN7nfw1KDY059vSlGwqZ89c3MApVI4Fxg6z8jrqVSE/IFT/A9C0sd7B
	sDxE00iXyCphgYo6ZCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHrj3-00ESU0-7t; Sun, 22 Aug 2021 17:57:41 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHrip-00ESQj-Dy
 for linux-mediatek@lists.infradead.org; Sun, 22 Aug 2021 17:57:29 +0000
Received: by mail-il1-x12a.google.com with SMTP id z2so14926895iln.0
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Aug 2021 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tO3FpggPumUudO2O7Ir/fs1af6Qf8hcFO9g7I6cp01Q=;
 b=NDkEoB50cJIffh8DEmD3xfV5OH8ema/PjNX2L8kixdAdzju1+1Q+RfI4dvsWmf6ckV
 cbsUqLyLFzaRWyrxKHgk9HO+WkFNp66FjMC0xCvO73mpe2AOuKEOT9losiWcUW3PDPNm
 I0Juj2PjGLAqKt2+Iz9cmX6gBy5MzrvAzxAH8s1TYKJbJaqQKfMgWI5aiYeXRCwwh3kd
 CJI4TEZHABSCNMA2IhdFQIizIVfW37pxWIzkxkAqqzqK5tmPuWInXDStw52NSqp8XXny
 pVSXtZOL/inFPT0NN6u8kmBCcSiariw/dIe5ePYIn0HTiy7GwQL7GtGEqlmgztShSjIB
 r2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tO3FpggPumUudO2O7Ir/fs1af6Qf8hcFO9g7I6cp01Q=;
 b=aC9yAx5Rjs6gPc1meVbuHOUYIebZvElX5gcFDEPxI8BBwTRKX245dv24yN202S0D1M
 ZpjjvZRJmK0P8dd8zl0rOakwfXK82tAq3z58wTgSYGSWg3swNgaTwt+7Fi9Z3kxd1M3x
 TpiKx4WXubsGJQKsmhqcu4O/zSwdV9qujUC7fINOkRsfXV12DjEa/oRSPmfMy5fo0E3k
 mkVVV175bkat6djI9b1lHczJQxdPXyBpWu+ESPbwMWmlu94QgkF1dnB7xbi2crIEeBTV
 +yK+9hrJJpANFGhW75xcTEJD74SlmXaMCawu534Upuw/KGG/fBLmciJ2/nqlI/BZ9o9+
 ewLw==
X-Gm-Message-State: AOAM531Wq+bdXg3KWJC0Cw0znlQRYjJnervspoBQUWxmS7C74KQUQIK8
 JSY88LBhfJThOssWZKN/i0P7Tjtf8eoOl0h5ZPFeSg==
X-Google-Smtp-Source: ABdhPJxAy4F4JBrNf2BEXyC2jHsLYTKqTZpEvWl47iBJSnZyLzmCveu6cLApJEwjHW6shDTLnoCxAWArc0HfBTHBbuc=
X-Received: by 2002:a92:ca89:: with SMTP id t9mr21038515ilo.178.1629655046630; 
 Sun, 22 Aug 2021 10:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 22 Aug 2021 14:57:15 -0300
Message-ID: <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_105727_644366_A8CF3ECF 
X-CRM114-Status: GOOD (  28.68  )
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

On Sun, 22 Aug 2021 at 13:50, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > +danvet
> >
> > Hi,
> >
> > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > >
> > > This series adds support for multi hardware decode into mtk-vcodec, by first
> > > adding component framework to manage each hardware information: interrupt,
> > > clock, register bases and power. Secondly add core thread to deal with core
> > > hardware message, at the same time, add msg queue for different hardware
> > > share messages. Lastly, the architecture of different specs are not the same,
> > > using specs type to separate them.
> > >
> >
> > I don't think it's a good idea to introduce the component API in the
> > media subsystem. It doesn't seem to be maintained, IRC there's not even
> > a maintainer for it, and it has some issues that were never addressed.
>
> Defacto dri-devel folks are maintainer component.c, but also I'm not
> aware of anything missing there?
>

A while ago, I tried to fix a crash in the Rockchip DRM driver
(I was then told there can be similar issues on the IMX driver too,
but I forgot the details of that).

I sent a patchset trying to address it and got total silence back.
Although you could argue the issue is in how drivers use the component
API, AFAICR the abuse is spreaded across a few drivers, so it felt
more reasonable to improve the component API itself, instead of changing
all the drivers.

See below:

https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/

> There has been discussions that in various drm subsystems like
> drm_bridge or drm_panel a few things are missing, which prevent
> drivers from moving _away_ from component.c to the more specific
> solutions for panel/bridges. But nothing that's preventing them from
> using component.c itself.
>
> I'm happy to merge a MAINTAINERS patch to clarify the situation if
> that's needed.

Indeed, that would be good.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
