Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 19:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHq1f54XjOp1k4t2ELxWFh9Ki2lg3J7+2Fvi0uk16Bo=; b=ZYFUBPCtqPA9WJ
	bg72oRV8Op2CPVsjMK4N+GBqM/oU1UPt5MEDI/1hbiXfB8xbxg7aXdzf2570q27W55OIu2+WQrRQP
	jv3GkTkiGk6BOqzUafBypzOad5uRmmREuEYOSbs74d/WClM/kC7roy5N94ZvgUw+YerpOaBvC1aok
	OohCh6A0IJFhiVg/qUfYgBjfieaZk4DXODX5roiCcjKsfeg5dnEs8I8wpCAZ6FqxpCT/xWU9TZPlR
	dfsdMeoOAOD6wRAaYszoWgbFtFg7Q7IPTIoGJjpP8xi9ymMC8esH0w/JXQYL0zIayhbSz+DEJZ0R9
	tTBghnGZJqQ8/urNbLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxCWo-008SnM-Qn; Fri, 03 Jun 2022 19:00:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxCWc-008Sjn-K2; Fri, 03 Jun 2022 18:59:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F21DD619C5;
	Fri,  3 Jun 2022 18:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77CCC385B8;
	Fri,  3 Jun 2022 18:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654282797;
	bh=wNoOUeH436EM5Q4+ipBC6tMdcUFPQYmnJuswlasQq7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SoILe+FIL2S6KalxEeHmls5fUj88pDOTWr2GlXkpmPjl5+15cM4zJMc0RwCu3qH/3
	 QQIsotDeOWea8wAWWgNZGA2Vzz1rv8wKxyj8Bdude0azly82ePzu51lJpXZ85CTweI
	 5elR6Htm+9ahYC0czwCImx/nIgkILwiaxVRL1ZsjkUpbVFCexeLFzuZh0MQspNLkZU
	 lZqEetTJ1+ZuY7yIHo9e6rIAXwzXdJ9Fpo38wEB64ZorajI8T/uAg3brpJGvrtmK1S
	 9+R5sPRSMtfyS0q7/Bd4Qu8OuFPKFEVvuoLnNskg6SQZH0Mhg8PZhX9aGOINHxAEoV
	 iKbEjktYZcC/g==
Date: Fri, 3 Jun 2022 11:59:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Cc: Chen Lin <chen45464546@163.com>, Felix Fietkau <nbd@nbd.name>,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, David
 Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
Message-ID: <20220603115956.6ad82a53@kernel.org>
In-Reply-To: <CANn89iKiyh36ULH4PCXF4c8sBdh9WLksMoMcmQwipZYWCzBkMA@mail.gmail.com>
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
	<1654245968-8067-1-git-send-email-chen45464546@163.com>
	<CANn89iKiyh36ULH4PCXF4c8sBdh9WLksMoMcmQwipZYWCzBkMA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_115958_743803_999110C8 
X-CRM114-Status: GOOD (  15.83  )
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

On Fri, 3 Jun 2022 10:25:16 -0700 Eric Dumazet wrote:
> >                         goto release_desc;
> > @@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
> >                 return -ENOMEM;
> >
> >         for (i = 0; i < rx_dma_size; i++) {
> > -               ring->data[i] = netdev_alloc_frag(ring->frag_size);  
> 
> Note aside, calling netdev_alloc_frag() in a loop like that is adding
> GFP_ATOMIC pressure.
> 
> mtk_rx_alloc() being in process context, using GFP_KERNEL allocations
> would be less aggressive and
> have more chances to succeed.
> 
> We probably should offer a generic helper. This could be used from
> driver/net/tun.c and others.

Do cases where netdev_alloc_frag() is not run from a process context
from to your mind? My feeling is that the prevailing pattern is what
this driver does, which is netdev_alloc_frag() at startup / open and
napi_alloc_frag() from the datapath. So maybe we can even spare the
detail in the API and have napi_alloc_frag() assume GFP_KERNEL by
default?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
