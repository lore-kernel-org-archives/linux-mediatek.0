Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAC1C5CFCF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=; b=DG5zGKZgr3kvpZmxNHU9q3e8jn
	MGcuAh3eNz4yDtlS/1q4KqLWiglGD7JkM6/yolg9Co+kqYLEqWmiZ/JNvxmy3LBsscYpldNqULk01
	FmgK5tnC3ezGZAEqGmsyXdISWtP3JmHfePIua4TtDCpzfLaAMG9sqsanJXh1VFt1AMKMg+5MNc3HS
	EbWM7XIaKyKybEbfsk0G6mrHFtmowwhl4E22awQWHmheK25pbnqxPQ+7OPl5TZnLYFm8+V3taZzpD
	jGMNFWytjN6Mlt0zy+3MNzXX6x/Ef5skTW1xNQHrkEpGa90CGRM9XDnzcVVlerE2OmSOepM9KQpfe
	6GQRJyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY6R-000000018bw-1cY6;
	Thu, 13 Aug 2026 16:16:23 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY6N-000000018aa-2A6l
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 16:16:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8485b358552so750349b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 09:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786637779; cv=none;
        d=google.com; s=arc-20260327;
        b=Er+ke7X4sLac65Zk01DRnS/4Hez5Cc/L+A+ZK5bMJS/erFwpe0MpxWkiextlp/kQZm
         hn5E1GdA5n/U+mhpvglCPg/1YKg0wpwuJz/L3a/J2spV8DSOCNDMyXO3ycT+03VQaGgK
         1AwLcTZ9KIwiaSERamRdKaDtTl0Ml7wA75I3ZC5SCCIW/M4hIy2cmHx6ron1VJjnXL3V
         ofb08zrLvnWUxZhhrtUGXM3Fj0JKIrmVHT7k5U9Guz063D6W3yu8zlzLJ0ofLVtHPsSR
         O90s/Q14Sy6/qHZAOv4WK/dVoxNJMMgYEJP/uEJoVuypTdCjByWv8v1usGR2hUf3ENhE
         ryKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=;
        fh=7LgWG7xXTD+MC7nmP6fH9VZP4imLdTTKn2r8rnErOP0=;
        b=mPqNpeqM7h/8d7G9QfFRAAnjJzWuZ82QX8tAGHkkTGvYNtiRy5iWKIm8D7fXiwfyEW
         icNTcou2tqqL2brBX66jhsb3UNn9/y94eMqF/0zX5hTOU8fBDusuOuohshuB1BrZ9qCR
         IUxTHfKsQGV/fDdVRD64v4WLxfatSAkvnJjvhWc19RW3ROgRRAYawe3/pc5+xJ647Kn2
         4WIcw51oDTuW1wZ/OeO1wcZnEaGzdpuktkIA+Ttq/HSg+I3DPyCW5b+tu0NIAo/G5BMW
         W8HdTspkSlsqvw+8usQ5N5Au3yt9UhIpXjtIXUItnuvLumpgjWZ296dozbbmgoXNq1jx
         Yr/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637779; x=1787242579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=;
        b=rs5AylSHtL3wivoZjY4HnbHRSr+p5ZmMgF1DDMl+/8Uk0y1NtLLxH+Lo+mtPb4xqGV
         pLEGYZurnqjxKXUqGFTBevx1Z/Kl2nCkDXjSJAfo7ix2z4PWsj9x9iP35edLfXvUNSIv
         NiSFXPlZ3JeZJcyxonKCbJqE6i2sgAjOR1zDEC5Mk7w6CNpUi8GSXTR5tvfnD7LznM9e
         BULaIIpo5qLm6xKM71FzSZd6bSOVQmFVwgeTDNBSYil+s6FbvVqAv9BwmsDWFT735LVP
         Jkn38fXZaDqO4gP+/PyPFugPw1qIz7l1+rqKbyONcL51ctTyan46Zn06iKC/IaXJz52f
         rdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637779; x=1787242579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKTV2ZTSUoxL0x2hN/gj5r+kKUiy8iekG3jkXHZrZMA=;
        b=eFKIfUF2BCXCZBkFxs/8IObcjd4xT/MaxxAvTpfOqsCsUXf4s6OdniiLsrmFeydDoQ
         DxHk6T09Fv8jd/DIs0ReMxlFk/vEYhmtFU5DWJisYKYu7S7owBVFlDPSxPz4SL5ILKiA
         JfQUgnW/WMrE11bVeBUJo9u5H7ftkSLNuZfLAc00khzc2nRpVyfe6Vcu/X5izKEKCXos
         hmHEnameskRunuFYYWv1Fnu32e0SpOSnIH+9P03f43id1qt54FCa+OnEFhk1VnUkBF7M
         MAJEZh3sjpylRcBEGyABvjW+UjNtH7g/EabLBI0DDOEsFWJt/p7ZR13nG5wOQuQy7qE2
         BWfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAKqr2P8KqCBXqOcqGRjmpdFP4ZJPBd/32zamAjpANTeRDocJIbAddMnovDFlkzeeLPx8GARJkElHeIhyGbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZckn72UIoNOEDfhPSn8djJbmc5T46d7iESGClOj2QT1qd52x+
	9CXZPpuMuRncXaPvgnZ8/ygcNW2Vh150iJxAw14bnA8TNHQTNq2y8rNXhSMRZUKK/aMKjiLFSD2
	rOM5upRXJlIE9L+FkOg7e4NqjIIyu0LM=
X-Gm-Gg: AR+sD13iJ6eGTr92Z5YIKi+nDc41cCI0eHW+8hbZtYvYi6Xy4wIaPVHJ4yxupNhmuFD
	AVNGCgM6YO+dmceOsIZTUuKg0DBrtSyK5j3/cIzzqKsbzD65VJYO8tqPrUpByDKWHELAPYHDviH
	3s+ffV9M5WuAod6I+HmeRSL1JX1ttPGytpZUZnqMz++GLaTZkVhcgDOh2Y/JQGwUiJCVoJd7Njh
	i8EczJbbh31ph+SmDUASUJ+MBHQ3FGaW+D0bK2+Db+sZcjT46ldsJOJCdpZ3oku6BpI0tXB1bCO
	rQ53V8RsDA/2VzVIWEaEQa0kuWQ3vQpNlVj+1cstcFPAXc86QQcaEsYVpsCcERX7ByABzs1fTIx
	cq1c=
X-Received: by 2002:a05:6a00:94f8:b0:848:4754:28e4 with SMTP id
 d2e1a72fcca58-84fc6dd20d5mr7964377b3a.15.1786637778230; Thu, 13 Aug 2026
 09:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
 <willemdebruijn.kernel.1372b82f50882@gmail.com> <0e1f71c4417099399eda78fd2a082b2444e42af9.camel@mediatek.com>
In-Reply-To: <0e1f71c4417099399eda78fd2a082b2444e42af9.camel@mediatek.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 13 Aug 2026 12:15:40 -0400
X-Gm-Features: AUfX_mznkHuU-cF144mVumH8tZacn1_Y1N_Jk90APs0ZCVnzLy3r3jqX6yEARUw
Message-ID: <CAF=yD-+AF1aW5D5H_QPKE1yxyU2wLxOmT8c2Fm4CJsPY=BjW-g@mail.gmail.com>
Subject: Re: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"sd@queasysnail.net" <sd@queasysnail.net>, "imv4bel@gmail.com" <imv4bel@gmail.com>, 
	"alice@isovalent.com" <alice@isovalent.com>, 
	"eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
	"horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, 
	"willemb@google.com" <willemb@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"kuniyu@google.com" <kuniyu@google.com>, "ncardwell@google.com" <ncardwell@google.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	=?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	=?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091619_569241_7A535B5A 
X-CRM114-Status: GOOD (  40.61  )
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

On Thu, Aug 13, 2026 at 4:40=E2=80=AFAM Zhaoping Shu (=E8=88=92=E5=8F=AC=E5=
=B9=B3)
<Zhaoping.Shu@mediatek.com> wrote:
>
> On Wed, 2026-08-12 at 22:29 -0400, Willem de Bruijn wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > zhaoping.shu@ wrote:
> > > From: HW He <hw.he@mediatek.com>
> > >
> > > A device supports GRO_HW, and the device driver enables the
> > > NETIF_F_GRO_FRAGLIST feature. During a tethering test,
> > > skb_gro_receive_list() reaggregates the GSO packet. However,
> > > skb_segment_list() cannot segment this packet back into
> > > the original packets, which leads to IP fragmentation or packet
> > > drop.
> > >
> > > Scenario (Tethering/Forwarding):
> > > 1.Driver submits a single TCP packet, P1. P1 is kept in the
> > > gro_list as the first packet.
> > >
> > > 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> > > multiple TCP packets by HW_GRO, and its non-linear data is stored
> > > in
> > > frags[].
> > >
> > > 3. P1 and P2 match the GRO rules, and since there is no local
> > > socket,
> > > they are aggregated by skb_gro_receive_list(). The resulting skb,
> > > P3, has a frag_list entry that still contains frags[]:
> > > P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
> > >                                     [ frag[1] ]
> > >                                     [ frag[2] ]
> > >                                     ...
> > > 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> > > skb_segment_list() to segment P3. However, skb_segment_list() only
> > > segments the entries in frag_list. It does not segment the frags[]
> > > inside P2, so P3 is not restored to the original packets, which
> > > leads
> > > to IP fragmentation or packet drop in the following path.
> > >
> > > When NETIF_F_GRO_HW is enabled, do not set NAPI_GRO_CB(skb)-
> > > >is_flist.
> > > Fall through to the regular skb_gro_receive() path instead of
> > > skb_gro_receive_list().
> > >
> > > Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> > > Signed-off-by: HW He <hw.he@mediatek.com>
> > > Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> > > ---
> > > [2]:
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/147060=
32__;!!CTRNKA9wMg0ARbw!kigb147-G9EgNqdWMhaQ43udYOvN90SG6bVjeM-GxTsPo3E07_tb=
ysuoEieszr5CbCqT94AYpt1b_M7VsgNaZcjtBS_AnYo$
> > > [1]:
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/147022=
09__;!!CTRNKA9wMg0ARbw!kigb147-G9EgNqdWMhaQ43udYOvN90SG6bVjeM-GxTsPo3E07_tb=
ysuoEieszr5CbCqT94AYpt1b_M7VsgNaZcjtu0bQPNI$
> > > ---
> > >  net/ipv4/tcp_offload.c   | 7 +++----
> > >  net/ipv6/tcpv6_offload.c | 3 ++-
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> > > index 3b1fdcd3cb29..641c47fb1ea2 100644
> > > --- a/net/ipv4/tcp_offload.c
> > > +++ b/net/ipv4/tcp_offload.c
> > > @@ -395,9 +395,6 @@ static void tcp4_check_fraglist_gro(struct
> > > list_head *head, struct sk_buff *skb,
> > >       struct net *net;
> > >       int iif, sdif;
> > >
> > > -     if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> > > -             return;
> > > -
> >
> > Interesting that ipv4 and ipv6 diverge here. Nice to try to make them
> > more alike.
> >
> > >       p =3D tcp_gro_lookup(head, th);
> > >       if (p) {
> > >               NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)-
> > > >is_flist;
> > > @@ -430,7 +427,9 @@ struct sk_buff *tcp4_gro_receive(struct
> > > list_head *head, struct sk_buff *skb)
> > >       if (!th)
> > >               goto flush;
> > >
> > > -     tcp4_check_fraglist_gro(head, skb, th);
> > > +     if (unlikely((skb->dev->features & NETIF_F_GRO_FRAGLIST) &&
> > > +                  !(skb->dev->features & NETIF_F_GRO_HW)))
> >
> > Would it be better to test skb_is_gso(skb) and only skip fraglist GRO
> > for HW-GRO skbs, rather than disabling it for all skbs?
>
> Yes, for tethering packets, HW-GRO skbs are aggregated by
> skb_gro_receive(), while others go through fraglist GRO. However, care
> must be taken to avoid packets arriving out of order. I will work on
> it and submit V4.

Oh right.

As long as the choice is only between fraglist GRO or not fraglist
(rather than GRO or bypass GRO), it should not introduce any new
reordering concerns.

But the decision cannot be made based on skb_is_gso(skb) of an
arriving skb. Because when such a HW-GRO skb arrives a SW GRO context
in fraglist mode may already have been opened, and it is too late to
convert that to non-fraglist.

So essentially HW-GRO and fraglist are mutually exclusive.

> >
> > If treating the features as mutually exclusive, another option would
> > be to replace these datapath checks with disabling one at
> > configuration
> > time, in netdev_fix_features.
> >
> If V4 work well, there will be no need to check netdev->features.
> Linux kernel GRO will be more robust and able to handle scenarios
> where both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST are enabled.

What is your plan for v4?

