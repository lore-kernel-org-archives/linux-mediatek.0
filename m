Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M+8+gXraR6ARaJFFLwgYdWdpT+ZVE+EGJvjZaZ0wq8=; b=Qn8QaWvAJ4heqv
	fBQaGou7bp4kjVCKjrR3ImVSU/L+QztDbzz6j8ztgFekd9Dsk/R3siGbPPwAUXdMsNWcUlB886IQo
	K56TAen9PqpcdbuIvm/qO9QUR6eoWXW3jZM8BXcTTEv+XvMQXVZ3PKlGC6PCOURmNPhQfYGRwCj1h
	z0yvMssfJ8ZYiJr6ffVAJeKxAoZK01PocsPyltSZNP6TOvhL3RGjY35wS+ntbv5+EawSiDL8tzPsP
	Ly/YWZkHFO2jYgAszleB3xfuhmp+e1270rTGlIDCaN8zHowCLhkemJhoc1VmHOvNqXX7WakEy2SEz
	LsBoA95+gQhHEQKJ0srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxCiP-008VOj-VN; Fri, 03 Jun 2022 19:12:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxCiE-008VMT-8p
	for linux-mediatek@lists.infradead.org; Fri, 03 Jun 2022 19:11:59 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2ff7b90e635so91857137b3.5
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jun 2022 12:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fDvBQ9pqnOyeFIGsW6/UXw+F1U5aWM1AabDKQN3DYA=;
        b=sbHxZFWtLPJzqSmFanseJeEPL/ALu0sQSxEJQocSQIsAYQUBcFJXhscWQcNSmfW230
         9rGYlKRGdc8+NCOtXd2QYQ2XQvkPWGrUdp03vXdekmYY9e2qdJp1uNuzLW9Jd7qinut+
         Ucgv06zsk3X2VyQCWX4Jb6t/PfpbW+yc+9vdGhOzMheX7HMUapqW3A1s2XfR5HIv0Agq
         elgZuBluPxPTAsSlHtoZErhKO59lkdTlBMQiKjoovrnNUk+VrG2hHbUT/6BCtCQF7T0s
         l4pxZlAX/b52GuTokRfKfbVxdKCQqSp0ZEXlF2RRTj0w4dQuw3jptgt+I1RJdICqXtZI
         HuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fDvBQ9pqnOyeFIGsW6/UXw+F1U5aWM1AabDKQN3DYA=;
        b=NHICAoVEXzmyouPLVEuumsnl3WVPcTnHXqiUxpgPZUojWJtAYakgehZX50ACXwwQFn
         ueCkOn/A5cgSoiUgpvu9yXgSy0xsPuw4yOhvftE08smWkU3zg6VNwnJcoGYS2sdLQ1lg
         1oSFZVOLGXWwYVPsGc8mnwhOlJvQRT8t2h99HxeQeMaxV0cWlgPzknv+ld0m9yS0/T6O
         Ych5Vp6anH6WxAaHP0QAT41HyicgyJbgeXbiBHcDDnQDl3fe8sA+ivIho1ZTkiOAZHMv
         c9I3Xezjm4RoahupcwuLoveOAtOgnVVq38VSol/FJUxr6VhqsdCmuFEASblJgoXE4Ov0
         KhXw==
X-Gm-Message-State: AOAM5317CYsjufsPNjxVAOjo4HvvQl63ME7Ev2OfsOjq4mTHtyf2qAbN
	122wGmsvdW9NhNROoRzSEJaobz9wupBkOl/Rjy5bhA==
X-Google-Smtp-Source: ABdhPJy51STo1wv/NPeMQzs5HJJXun6eDnFOS3demyDMpHxmfb2j2pVRLASUIT3YfUHydKoFN9BCWC8eCqX08kRNFjI=
X-Received: by 2002:a81:b401:0:b0:300:2e86:e7e5 with SMTP id
 h1-20020a81b401000000b003002e86e7e5mr12645707ywi.467.1654283514691; Fri, 03
 Jun 2022 12:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
 <1654245968-8067-1-git-send-email-chen45464546@163.com> <CANn89iKiyh36ULH4PCXF4c8sBdh9WLksMoMcmQwipZYWCzBkMA@mail.gmail.com>
 <20220603115956.6ad82a53@kernel.org>
In-Reply-To: <20220603115956.6ad82a53@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 3 Jun 2022 12:11:43 -0700
Message-ID: <CANn89i+dW+paaybeDkkC0XxYM+Mv_AOnbi6GSLtTgAv9L=TX7Q@mail.gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
To: Jakub Kicinski <kuba@kernel.org>
Cc: Chen Lin <chen45464546@163.com>, Felix Fietkau <nbd@nbd.name>, john@phrozen.org, 
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, Alexander Duyck <alexander.duyck@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_121158_368163_AA0231D1 
X-CRM114-Status: GOOD (  22.08  )
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

On Fri, Jun 3, 2022 at 11:59 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 3 Jun 2022 10:25:16 -0700 Eric Dumazet wrote:
> > >                         goto release_desc;
> > > @@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
> > >                 return -ENOMEM;
> > >
> > >         for (i = 0; i < rx_dma_size; i++) {
> > > -               ring->data[i] = netdev_alloc_frag(ring->frag_size);
> >
> > Note aside, calling netdev_alloc_frag() in a loop like that is adding
> > GFP_ATOMIC pressure.
> >
> > mtk_rx_alloc() being in process context, using GFP_KERNEL allocations
> > would be less aggressive and
> > have more chances to succeed.
> >
> > We probably should offer a generic helper. This could be used from
> > driver/net/tun.c and others.
>
> Do cases where netdev_alloc_frag() is not run from a process context
> from to your mind? My feeling is that the prevailing pattern is what
> this driver does, which is netdev_alloc_frag() at startup / open and
> napi_alloc_frag() from the datapath. So maybe we can even spare the
> detail in the API and have napi_alloc_frag() assume GFP_KERNEL by
> default?

Yes, we only have to review callers and change the documentation and
implementation.

The confusion/overhead/generalization came with :

commit 7ba7aeabbaba484347cc98fbe9045769ca0d118d
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Fri Jun 7 21:20:34 2019 +0200

    net: Don't disable interrupts in napi_alloc_frag()

    netdev_alloc_frag() can be used from any context and is used by NAPI
    and non-NAPI drivers. Non-NAPI drivers use it in interrupt context
    and NAPI drivers use it during initial allocation (->ndo_open() or
    ->ndo_change_mtu()). Some NAPI drivers share the same function for the
    initial allocation and the allocation in their NAPI callback.

    The interrupts are disabled in order to ensure locked access from every
    context to `netdev_alloc_cache'.

    Let netdev_alloc_frag() check if interrupts are disabled. If they are,
    use `netdev_alloc_cache' otherwise disable BH and invoke
    __napi_alloc_frag() for the allocation. The IRQ check is cheaper
    compared to disabling & enabling interrupts and memory allocation with
    disabled interrupts does not work on -RT.

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Signed-off-by: David S. Miller <davem@davemloft.net>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
