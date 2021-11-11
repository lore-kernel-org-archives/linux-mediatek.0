Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E3161260
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7E3161260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FoMoWeb3Ix8wELotv8veSmLvl2+jmepGed+KQL9AIM=; b=yZXj21I8wY50+f
	XqZZPHwVMjtSGF6y5Ym1ddLv6LkiW0SjiXr0C6x3qOqc3ayNMTPtg+E6/HX01JXQijQNdZg9oSiED
	VdghOOlanwx3ds8ZLcn0EDI5ZSdHO7/yFHnmZa1FFiG6pbC8Zwtt4dDmNspXQNeKYKNRQ3SEZ5E5n
	7cH7I7ob/Pwjow5lRjFblord4cO2RFM7wPA6cY/Y/ES35usSyoA67MqCkI37TuezOcH8oDDacYObN
	HC4vrD+rwlT3uo20JoIHiIaXa1SzcnEaGge3tDvk67y1TcEr5trMVZ1uWD3Po/2KYdurMHiJs1M9m
	Kk/BAapGIwnkb/tBEIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml1Gc-006xzP-9q; Thu, 11 Nov 2021 04:00:50 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml1GZ-006xxs-Sj
 for linux-mediatek@lists.infradead.org; Thu, 11 Nov 2021 04:00:49 +0000
Received: by mail-lj1-x229.google.com with SMTP id u22so2544605lju.7
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 20:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yH8ja7VP8p1VDclBmMvhEHUQneOCn8LZqdo+2OSyMiI=;
 b=eIzx/Cbomp+USxMUIAGgS7bftEgwznfBZbwgi6p4YI3FRo9gi/vdaBoUWKoHxfuyPB
 mw/y2pXpzxA6+5/d3+P7aH4bDsvbQSASCDLhGn5I2TrT5CpqK6ecRSNkPQN28wcFGADP
 9k8FnQxcE8jpHpctExcK3AVkY4qB7d6gviJy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yH8ja7VP8p1VDclBmMvhEHUQneOCn8LZqdo+2OSyMiI=;
 b=VNvWVzK8aBd6FlXnQs7A+Mr2dTDTTlkgHjh5Uk9QC0e2yZHCv/mLCfSOPW3mu9I89a
 IvNa95AxgTU39F+dhKiD08Ov80e5sNS/YASpyWKiepl7Yo2WOGa8dP74NPX4pHTvBiQb
 mXLCRTow7cHVPqacTlX4Njsa7G5UWHqmVLSm19f6dY4bvXa4iC0BKEyNSw+CfAkc8bhd
 vEBnw3gixztvbwkY9rof+/OWSUraLFRu2WEuBeWef6JYVCAUEXPp946yJf22owL0ju1A
 8B4jfWJBLev1KozLj+BBFbkEJkNmG8HwAas5ZNuN20TPc6JGAKPw8VkL2ZhgF9i0gCBz
 7c0Q==
X-Gm-Message-State: AOAM530QLdsFYo6NRQqLrNFsVifCmlvoAE9mrKX2k7Danv4QmitHfclw
 1B96wn2kiN3KAGVBXbCzMMUYK9JbwDYpYoksQHdYIw==
X-Google-Smtp-Source: ABdhPJxlV4gGg9kn82P4bK9eQigBUtH7JDNyQemvY5ujecR55RWBtQDaP9XzaDlfxT0NgRx3QJkfO5CE0wqzHMnZrAc=
X-Received: by 2002:a2e:9ed3:: with SMTP id h19mr4294059ljk.392.1636603245859; 
 Wed, 10 Nov 2021 20:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-7-yunfei.dong@mediatek.com>
 <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
 <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
In-Reply-To: <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 11 Nov 2021 12:00:34 +0800
Message-ID: <CAGXv+5GYLSxrmqMEpDx0aE1N1Wp7vHdDFDp9Ly0c=2f+njVpGQ@mail.gmail.com>
Subject: Re: [PATCH v9,
 06/19] media: mtk-vcodec: Manage multi hardware information
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@google.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_200047_967338_CD90969F 
X-CRM114-Status: GOOD (  17.63  )
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

On Thu, Nov 11, 2021 at 11:49 AM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Tzung-Bi,
>
> Thanks for your suggestion.
> On Wed, 2021-11-10 at 18:30 +0800, Tzung-Bi Shih wrote:
> > On Tue, Nov 09, 2021 at 08:50:17PM +0800, Yunfei Dong wrote:
> > > Manage each hardware information which includes irq/power/clk.
> > > The hardware includes LAT0, LAT1 and CORE.
> >
> > The commit message doesn't explain the code.  Could you provide some
> > explanations about how the async mechanism works?  (e.g. A bitmap for
> > all sub-devices' readiness ...)
> >
> add more detail description for commit message.
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > Apparently wrong tag.
> >
> Remove
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > index b7a51e96d4ba..eb2af42aa102 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > @@ -18,19 +18,49 @@
> > >
> > >  #include "mtk_vcodec_drv.h"
> > >  #include "mtk_vcodec_dec.h"
> > > +#include "mtk_vcodec_dec_hw.h"
> > >  #include "mtk_vcodec_dec_pm.h"
> > >  #include "mtk_vcodec_intr.h"
> > > -#include "mtk_vcodec_util.h"
> >
> > Why does mtk_vcodec_util.h need to remove?
> >
> Put #include "mtk_vcodec_util.h" in mtk_vcodec_dec_hw.h.

If this file directly uses anything from that header file, it should
include it directly, instead of depending on some transitive inclusion.

This would avoid having to deal with breakage if/when the includes from
header files change beneath you.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
