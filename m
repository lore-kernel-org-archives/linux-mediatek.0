Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D22C5DF93
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=; b=dyRQvV/H1jJn2id1I1JtcxV0Nd
	1N3TCx3gsH2V+moj1Nlm+ZVw/hqoXHrGcPgBfSOzQM/+gOfxaJxl/G6oeCdLsg64w8W4mgQwoYmK2
	Onr6yMNa/l0FGOf2KUnwj09knBubgxZyi6ymJsG9ZP1I7ymPBSZ2Z3n2v2GZGpqevAQHTsLHRKFK3
	/NW3TeqirAYXZE0czCftlwClcbcvXyZgskXxBUKAzXHwhMbu7Pa3JuwBbHft5yaElQ1tSOCgWtas+
	/iHqWNeiPrxjz6c/vzMoV9Ybmtql6JdGb7P4tUcSQMdynLY0JnoAb5eLCBPNr39XV36FmrDsXOG9j
	230/l4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQsr-0000000DdFe-1lhI;
	Fri, 21 Aug 2026 15:10:17 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQsn-0000000DdEC-2mZk
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 15:10:16 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66b32bb75beso1687757d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 08:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787325011; cv=none;
        d=google.com; s=arc-20260327;
        b=chOFf7/+ISY38mc7sElpzVUvC3vFcRNZRNmUoqabGJBrD/g3kkfqN9ORVdb2sn9+If
         w2oLvIDojPYV40RWQtQ1BrM9osCcI+I5yGSj3Jx6zHmsyHQJqdZy7G4k1m3PhfUFBLZP
         P7mzOVpiNx8nTZQpFKE76fIF2mdflnj90b071nFPatpDq1fKLdJnsHa0vx2jBiuv6geY
         yHFR56/oQb/iebdElSI1HLK8vrwbBZeam1mJGh5QO0jL4WE6XoTqbuCYLd98xgav1p/0
         zWdttGC/scIsQF6I+KxhBz5EHu/P9ufSRgPenEnlLiA8XbBTQmfW1VF4wNOU3Fyp8eGw
         uc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=;
        fh=k6EAQWYiJKrBca2QuavpoT+MweX47WS+j6xVQBtX7Fw=;
        b=lelsPt24ev29sKou5QoitZ1qy5hnNKMbQbU0p9Hwg6VcpCoSPQy8BOEMokzgiH1ysU
         uGTNfgzFuZoYizfNNIlGPBI/lg8fgQQKGS8cUgAwyem3k2I6oLMma7Lkqep54eFTGGbK
         eNRDUH/BRx/OduRFbvjDDDlcXnPNjwpn3W7cJqJvAVoWJ1iKpmNOc42hw/1XrRMI5/SQ
         2wygeddGssNnpabRB27Uj93xfjarIvw3mt8SkadZezrFlXCBVjhvDSyax+eefgXXji+H
         vyXIl+dVAmfuFNDW3F1xOQGhyMcIf0DyngpAdoMRJ/rkSTawSh6z4hlG1kntNF+2vpzl
         8TQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325011; x=1787929811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=;
        b=T5W12H3JrM2GotFkd7Yrt5rON8quLtzcoxl2mIU4lW0aKiJSc8nwqTc4atXZ6AlSSh
         fJ2ougAo1E2OPqXD3H69QUmVC/SX8bt+uD8axHPnbM+A31aGIo3WiutqJRu0Fmg2s2ki
         KugHdkZKjm+I7UzBkiRGnCeBm6sLbOnL4Km4b7vsVm0GXh6ZgVsWJF3ZixxDkqqS3+vV
         T70FK7SOb6a3n0UzKUeozqLhjBysPgDkEV3i4BkQ9dsY4XdzAvhGqXv7Hl5ImZOPlReW
         FqZn4pIxivhklayb0NSi1AkEYdVqKirr3nezWKX+z5ZaRScZk1BbWgBlGjBXwXUGu1P5
         Aokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325011; x=1787929811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8jP/MvrXSs70WMEBo5IA2IeHY9qdWxXWvVO2bIo13w=;
        b=THfiuWj+S7XmTZ42bDQpsRxKAzwmMAJCZ7RDmEzkksQq1rnShFmlVO7ipPCTWu7VGv
         aWAtCUUHbZpOfkzbVo8i4cZ3J5fXpsoM3fgfV/a1QyGe4MbQbeBryklcTtnxZlQqZs2X
         zkJ2JWX68rhoXrbIyi5yELEMfYXiNAXK2FmTHe5FTTxCR5k8ULXHAuLNOyFCmgZqvfL5
         vXYtdffAG+9vJp0icqpTMasRmZnFkesr4HDc35E/QQ1bw3qtUd53XqxPB4Ujaa3VkmJo
         vexpnjdcT4vosISXPMqZt7EsZ1EnkbVLDxsvwgWob8iUzKgEYOuuFDxBie+XXulij4wq
         ndiw==
X-Forwarded-Encrypted: i=1; AHgh+RpiAnsOWHOX+HLCoPsdA8rEBy95qVApiReYQDjtYQF16sDPOYU7XOrlR0OpEINYEtYvh/iBbDWJL91pMTh3zw==@lists.infradead.org
X-Gm-Message-State: AFuF++mTYtYp5Wk2J7/EOSjxpfiCLSXoC1qiOoc2Qtrn3I4CccEMTepW
	kelgvg8feaXwG02gaTbCntfqwvAjATTYsdyizTCHQOF8zGtlw4ylffg9VPxMNe/jlXo9ThZzwm2
	6z9sBiK3WrKkoEVWI4yxgdorI2ZCkVxc=
X-Gm-Gg: AR+sD10/UbxJjWP7/07C2pu8+ROBH7mMIfFsNpxENUItb3CMBIqdsgRmA/UgNDnSd4v
	3Od1tR7/FpbCCGjfxvlskMQ/BRvHoyI+UvsO71SbXEc2LnFbucHqVaGEfbhoqae9wIoDunGdGOd
	lBDrHXwz30YUy6xwoYJnWjjliVw13ey67MbB3ENTWcd5wb0NCGK4FWopw2yWatLZH+RuKuwW80s
	yjde/p5O7EF5ZQTVJevo0BMAhDUYn8UQYa3NS7KMg3wZsWFvksYK218C/B896PRbVJg/MqngRt4
	JzvyBBmOklTAQ8uqhfIllmhe0dfRaXxUas0nRdsaRqmd+bREp9f9RtbDokXHW4og0oWnpKIBLBC
	NS/Q=
X-Received: by 2002:a53:dccc:0:b0:66b:ee21:4852 with SMTP id
 956f58d0204a3-66ce4a1321amr1957781d50.13.1787325010568; Fri, 21 Aug 2026
 08:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260819093226.193385-1-zhaoping.shu@mediatek.com>
 <CAF=yD-Lx7aHQEr6MN7D8LBp9ctZz3B3dmfsyhLbPxWaiK1UBzw@mail.gmail.com> <ef026015528638cb69404f22976479515251e4d5.camel@mediatek.com>
In-Reply-To: <ef026015528638cb69404f22976479515251e4d5.camel@mediatek.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Fri, 21 Aug 2026 11:09:33 -0400
X-Gm-Features: AcwNN1WIhUj4DkwKagzxOfTG0D1RVHOFkdHA6O1sbDTgVBzQt97XErr-O1wBuek
Message-ID: <CAF=yD-JOVSLoasxQHnRE-mvS_oQZ7f=wHeCc7nxBgw2g_4-C8g@mail.gmail.com>
Subject: Re: [PATCH net v4] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"dsahern@kernel.org" <dsahern@kernel.org>, =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	"horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, 
	"willemb@google.com" <willemb@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"kuniyu@google.com" <kuniyu@google.com>, "ncardwell@google.com" <ncardwell@google.com>, 
	=?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_081015_027760_FB34D551 
X-CRM114-Status: GOOD (  27.43  )
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

> > > @@ -395,12 +396,20 @@ static void tcp4_check_fraglist_gro(struct
> > > list_head *head, struct sk_buff *skb,
> > >         struct net *net;
> > >         int iif, sdif;
> > >
> > > -       if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> > > -               return;
> > > -
> > >         p =3D tcp_gro_lookup(head, th);
> > >         if (p) {
> > > -               NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)-
> > > >is_flist;
> > > +               /* flist GRO applies to consecutive non-GSO skbs */
> > > +               if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist)
> > > {
> > > +                       NAPI_GRO_CB(skb)->is_flist =3D
> > > NAPI_GRO_CB(p)->is_flist;
> > > +                       return;
> > > +               }
> > > +
> > > +               /* Fall back to the regular GRO path */
> > > +               if (NAPI_GRO_CB(p)->count =3D=3D 1)
> > > +                       NAPI_GRO_CB(p)->is_flist =3D 0;
> > > +
> > > +               NAPI_GRO_CB(skb)->is_flist =3D 0;
> > > +
> >
> > This reduces the chance to have to flush, by downgrading fraglist GRO
> > packets if a hardware GRO packet is detected at the stage (count =3D=3D
> > 1)
> > where fraglist is not enabled in practice.
> >
> > This is quite a bit of complexity. And if hardware GRO is enabled,
> > what
> > are the odds in practice that the device does not produce any
> > hardware
> > GRO packets, yet the software GRO stack is capable of assembling
> > signficant GSO packets. I suspect low.
> >
> > The solution is technically correct. But would simply disabling
> > fraglist
> > GRO when hardware GRO is enabled not be simpler? Or only keeping
> > the flush and avoiding this micro-optimization.
>
> In V2, for the tethering scenario, we directly flush GSO packets.
> This is the simplest way to address the reported issue,
> but those packets can no longer be aggregated by regular GRO.
> This is the main difference from V4 and Jakub pointed out this issue.
>
> V3 disables fraglist GRO when hardware GRO is enabled.
> The additional suggestion for V3 is =E2=80=9Creplace these
> datapath checks by disabling it at configuration time in
> netdev_fix_features.=E2=80=9D
> However, if we disable NETIF_F_GRO_FRAGLIST in netdev_fix_features,
> UDP packets will also can't aggregate by fraglist. This will affect
> UDP performance.
>
> V4 is more complex than V2, but it can maximize the number of
> packets aggregated by GRO. It works similarly to how regular
> GRO tries to further aggregate TCP GSO packets.
>
> This is a trade-off between code complexity and
> the GRO aggregation rate. You can choose either approach.
> If you have another solution in mind, please let me know.

So this code is there only to allow UDP to use fraglist software
aggregation mode while HW-GRO handles TCP aggregation
And fraglist aggregation is only really useful in the forwarding
case.

The benefit over non-fraglist aggregation is moderate. I'm
a skeptical that maintaining extra code for this edge case
targets a significant workload and is worth it. Open to other
opinions. But i'd just fall back onto non-fraglist broadly.

If keeping the optimization, the patch needs to be respun with
both the commit-msg clarifications, and a Link to this discussion.

