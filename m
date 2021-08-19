Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE2BC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 14:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C4261153
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 14:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40C4261153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7MMiZk7TxkKXjsxZrGU3ym5pwFNpOQFDSRQWwB7IGE=; b=FSedS4D7f7xiTn
	56rvNRUwNBBonXo5QLCK7nJ9gkBek6tGvxQCb89JZiiyRBaLnn33RTOB8LO+lKvY9q6bONExqJUd+
	7FGdFRKHE8Ucvi2sfftmO9JRZvCP//ubGS1jVWIAEv3zsooeXqIyhNxeF7WW9NoIliAdWI3S0+4Xr
	R4W7A4PA39jv5o4J3t/OmfnC32lt/wvELNFHPbA0LzyAkB4T/YsCRObAR0Wk04y4pTf4uMh9N0F0J
	Usiv40F8vpfqQLu7mRjxdptsLlQal9fbMgNP9vqDYsWrDWxlEdw55xE4KIrWiBjYQyypzOxcPJdVN
	cU0+2vCxQPHbmFgmO+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGilb-008asO-IW; Thu, 19 Aug 2021 14:11:35 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGikh-008aYj-Lg
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 14:10:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b7so9117080edu.3
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rb9V42rg0n45GVH3GY2bVeX0F+8SMJocuuGI1FyjcmM=;
 b=iJEPUU5oZEQ+HWwTgTCgLhFsbcZY/sN4h/IMNe1p8EeCOxcgf3JVciTGX87OqGRILz
 Urxhw5a2EAGgRMcidl2dwJCCCNjUGG+3Aq90qboKf6+1WMDC1oxL1rZspWV1ngDaYwsV
 SSO5y5R0ILHZz2TBbDnJjnbVGQnmK6+W9FW53lMoxbuOFnxeBiFz1jk3h8V4EIdyBR0y
 N+u/wHUfjMg9Ibs9phlJMeMO9p/VILY8p8K6VKTmAN7+7nOwCJw4kPu2KNOjA4HOElnP
 14V9a4ullK9qeLa87hC5WKNqfxQrOQAMCWlXZVYnTUrLieLB0auCQCaenqpPDW1tlikX
 tE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb9V42rg0n45GVH3GY2bVeX0F+8SMJocuuGI1FyjcmM=;
 b=LAzUdOuIfv2zap0fvU7u9XhbJ0YhXg0gDVqe2ipibDJkaBc0QLmdPebJxX8+YylM1v
 ZBY3qi1Zs+3nMInrzn+6UxlNc7raA8sxvNMtThxrEoVheEZT863wW1X29bEebizn2btV
 BTqvqeC/cTiewaa7gXZEA6jTRE/kQFA07LQQi3TzaDNJ5EU+mdGm+Q/4R/avxJpB926C
 XKkAvEDfH9AMzIrbiXbjSG+eKP07kOGnRAD1b7OUAeQVmm+Fg/uTHpn8mDlR2OOHoKoS
 jAg5ScXtQmrcMnWvMDUnh7j1w2uUHmKwzQjdoFR63pAJS6YckEZpbeHgjTNLytFTv9W1
 AXzw==
X-Gm-Message-State: AOAM532/4qHaqQGbBEYwJr4KsBQPZsA1iZhju6aB0zBuM60EzvC7Ey3y
 3ra2h13/CJeQJuGE0/5x/Q7pa7DZOr8gE5nRK3bmqg==
X-Google-Smtp-Source: ABdhPJwsG2az69sF2C7NBuTLTqeCC9h1NnsP0/piYeVTCMnzsFbdwVTCtw/GXuxcx6yC4CKvqxzNAm07Sn6//4vK+aU=
X-Received: by 2002:a05:6402:1514:: with SMTP id
 f20mr16652377edw.17.1629382236918; 
 Thu, 19 Aug 2021 07:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
In-Reply-To: <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 19 Aug 2021 11:10:25 -0300
Message-ID: <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
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
X-CRM114-CacheID: sfid-20210819_071039_865869_72D7B629 
X-CRM114-Status: GOOD (  32.64  )
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

On Thu, 19 Aug 2021 at 04:13, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your suggestion.
>
> On Wed, 2021-08-18 at 11:11 -0300, Ezequiel Garcia wrote:
> > +danvet
> >
> > Hi,
> >
> > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com>
> > wrote:
> > >
> > > This series adds support for multi hardware decode into mtk-vcodec,
> > > by first
> > > adding component framework to manage each hardware information:
> > > interrupt,
> > > clock, register bases and power. Secondly add core thread to deal
> > > with core
> > > hardware message, at the same time, add msg queue for different
> > > hardware
> > > share messages. Lastly, the architecture of different specs are not
> > > the same,
> > > using specs type to separate them.
> > >
> >
> > I don't think it's a good idea to introduce the component API in the
> > media subsystem. It doesn't seem to be maintained, IRC there's not
> > even
> > a maintainer for it, and it has some issues that were never
> > addressed.
> >
> > It would be really important to avoid it. Is it really needed in the
> > first place?
> >
> > Thanks,
> > Ezequiel
>
> For there are many hardware need to use, mt8192 is three and mt8195 is
> five. Maybe need more to be used in the feature.
>
> Each hardware has independent clk/power/iommu port/irq.
> Use component interface in prob to get each component's information.
> Just enable the hardware when need to use it, very convenient and
> simple.
>
> I found that there are many modules use component to manage hardware
> information, such as iommu and drm etc.
>

Many drivers support multiple hardware variants, where each variant
has a different number of clocks or interrupts, see for instance
struct hantro_variant which allows to expose different codec cores,
some having both decoder/encoder, and some having just a decoder.

The component API is mostly used by DRM to aggregate independent
subdevices (called components) into an aggregated driver.

For instance, a DRM driver needs to glue together the HDMI, MIPI,
and plany controller, or any other hardware arrangement where
devices can be described independently.

The component API may look simple but has some issues, it's not easy
to debug, and can cause troubles if not used as expected [1].
It's worth making sure you actually need a framework
to glue different devices together.

> Do you have any other suggestion for this architecture?
>

Looking at the different patchsets that are posted, it's not clear
to me what exactly are the different architectures that you intend
to support, can you some documentation which clarifies that?

Thanks,
Ezequiel

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
