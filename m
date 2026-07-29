Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74DAC53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 18:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBrvDEnJYvhnFH7fX5PvcLxlTQTad9r13RWJQAwNzRY=; b=krBLaDwN6T4eYq8+1Gzn1gUeOB
	FQlwc5YOkydGXN2iXFjpbPk16PFo8XFi3F5M16NR6MGCSgORKMCqGVl9DouH68Jqgf3heyNE8BptW
	CH7RjT5tBUmC9f84xoaIYa1aBu/l4zR/DciWOjDWpv9lW2i/nCYuIsEvCqCxr+95BXFDNfn7VHcsK
	mZSovqxjcYMgPNO2T5kAT4kf2Xx3jmcwrNPbLAXjCikg/xqzJlzbSVAKcUgXCHkOy17GzdcuzhKeH
	sHJkLv1/TJn/nmQOFb0L6yig2yEFJTIdkgXtdWkZ0GDDwt4hMwhOJC31Z3A6gRyr3jCSOXYDoqp4d
	tRr/WQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Tb-00000008qde-3eeb;
	Wed, 29 Jul 2026 18:57:59 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9TY-00000008qd0-2oKq
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 18:57:58 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8111c0c7561so16584297b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785351475; x=1785956275; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EBrvDEnJYvhnFH7fX5PvcLxlTQTad9r13RWJQAwNzRY=;
        b=eyx7+rZ1JENTk3L3P+zzAXABJHRajGP8fH22/nK2d9IhsoPhXDZp+gYdQ7Z5zZyS8w
         66chiar6+OJk7U1ceiqlMJoPLeJQkGc+UwfvpzCfCRkJF1GNIMeHTp4ZrE4espq2jteI
         urUcNE71huHnU380qqsAVXeQgSpDd20edw8asjVmPa8hN+7nUvh7/PIklXZbuEr7Bgp8
         6OHeryRutnCrAe2WVMLGzV4g3gaDjJV7F4xTvlx1eNUGTCtbCEvJHqcu6XwAHfIHYzQT
         0CKY0s6C9M03dA2nEaqjbNvfEhsNPN7w3Vr+6XdCmYe4ThcdAXmDGASNtB1ya9zoJGlv
         oH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351475; x=1785956275;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBrvDEnJYvhnFH7fX5PvcLxlTQTad9r13RWJQAwNzRY=;
        b=NJsLAZew5QkLNeSCg9s/CJQFIFYVhBarTbeCa8NP+uOXpYP6JWm1h+mfN7a8MfUW7k
         A5QqHZWWBr709gI3uBveHnWM4KH4hdRFb6liIlMg5wQJjCVmHygcteaM8J+Yq+Z2nfMn
         Rrr9ej8a82z52eUy7yOXfs0zfXJl8ydZjWJv8TVVvlPkM3Va7MHdRhNFPJcAFKUr02ci
         XP1c7kW3J2D1FW3TYA6BIHHa+muUXAWYBrDI8ZbigMAbzBI4mYtsnQK5LgDmZeAbdsAR
         ixuXQStUO6C8iCJZUWUA3tgK9nzWRYAfx5IoL9z32kXwFv0O+nxBkaK3AFuxxVPNwavN
         acvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmKahEHr0/+72BmT4Lg4a3DhZdDnC10ALr2o60BsZk1PDKWhuSbTEH0VSYN3LEohEdfo4jl32VaLrZH2l4rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5gdgHl9vIfHvwsBxjDFm2bCQ9Q/119A8e+90KOKYdSCpLsuyU
	dll74rYCa2CuyDg70jAyReE1xxma5X5rDqv+QHz6fmeATxvp5tn5/zEB
X-Gm-Gg: AR+sD12hNJ+5Mgx1AZlNfx9yt3aIPD0WaisqkI2J21Q5PRm3aeYVP0mzmN7Z/Wga6wH
	4J7G4EdY4EhoHI0X9KBv34ykLHZ0Q0XavX8WlHBjsr0OV9tTYqYFZVu1+Rju3uzk52ob3UqTwG5
	GhoQEo97ceHCsC13cBOaqPWfnd+2mpTxR8EtbWZS/g3dISZk47+UKfLcbWt5vBEDNkYPnI1HYUf
	RcL0j009wNQ9Ba6izgyo1QFa4m3h3m2qFp9IKrPDzYCn2A25LJkjxFEwFEF6YKo8QkAKGjQYyxQ
	EJ4TyOiqisrYuNZX+pzQaP3wqFxvLP6AfFsEvUJhV6sflMUV3YJM/CIyb6mG1xRDmbR/HUQplYf
	oS4A6gHzgNGSvGnM5eH43vbCVIouR/ZlJtKxi/2zIvK05QsAYgKuC8A5mADGsYdSd31A5wSxsUB
	Ny/8UgoH2TebIlS1EGGwjKiX0xJGEQJS17WFvWPGajqxZN1fsTOFR3iXQz0avsXVCAgObjgb072
	5Xi7RnRbLG/vSMMBi6qywtyG+e/gSiWglPgWA==
X-Received: by 2002:a05:690c:c08:b0:81e:4886:2727 with SMTP id 00721157ae682-81fb5de8df5mr374317b3.58.1785351474737;
        Wed, 29 Jul 2026 11:57:54 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa2756af8sm24846587b3.3.2026.07.29.11.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 11:57:53 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:57:53 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "willemb@google.com" <willemb@google.com>
Cc: "sd@queasysnail.net" <sd@queasysnail.net>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
 "horms@kernel.org" <horms@kernel.org>, 
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
 =?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "kuniyu@google.com" <kuniyu@google.com>, 
 "ncardwell@google.com" <ncardwell@google.com>, 
 steffen.klassert@secunet.com
Message-ID: <willemdebruijn.kernel.1758c8f19209@gmail.com>
In-Reply-To: <0f5668da79eb9a13dfdb9c97c7d71c5153b3a48f.camel@mediatek.com>
References: <20260723091601.72103-1-zhaoping.shu@mediatek.com>
 <20260723063935.75bf55e3@kernel.org>
 <CA+FuTSfgBbPkdLanqEgbDq-jLVQJax4fUxQ-tuzTuFwQANwxBA@mail.gmail.com>
 <0f5668da79eb9a13dfdb9c97c7d71c5153b3a48f.camel@mediatek.com>
Subject: Re: [PATCH net v2] net: gro: avoid nesting TCP GSO skbs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_115756_765027_8B31FD71 
X-CRM114-Status: GOOD (  36.52  )
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

Zhaoping Shu (=E8=88=92=E5=8F=AC=E5=B9=B3) wrote:
> On Thu, 2026-07-23 at 16:02 +0200, Willem de Bruijn wrote:
> > On Thu, Jul 23, 2026 at 3:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.o=
rg>
> > wrote:
> > > =

> > > On Thu, 23 Jul 2026 17:16:01 +0800 zhaoping.shu@mediatek.com wrote:=

> > > > From: HW He <hw.he@mediatek.com>
> > > > =

> > > > On devices that support both NETIF_F_GRO_HW and
> > > > NETIF_F_GRO_FRAGLIST,
> > > =

> > > "devices that support FRAGLIST"? Isn't it a software feature?
> =

> Sorry for not making it clear. The test environment is:
> device supports GRO_HW, and enable NETIF_F_GRO_FRAGLIST in
> driver.
> =

> > > =

> > > > the hardware or driver may deliver packets that have already been=

> > > =

> > > If you have a driver in mind please name it.
> > > =

> > > > aggregated into a TCP GSO skb with frags[]. GRO may then
> > > > aggregate the skb again in skb_gro_receive_list().
> > > > =

> > > > This can create a nested GSO skb, which is not handled correctly
> > > > by the
> > > > later GSO segmentation paths. When the skb is segmented by
> > > > skb_segment_list(), it not be fully restored to the original
> > > > packets.
> > > > =

> > > > Avoid this by setting NAPI_GRO_CB(skb)->flush for GSO skbs before=

> > > > aggregation.
> > > =

> > > I don't think we can do this. For GRO_HW devices re-aggregating
> > > in SW is quite helpful, HW often runs out of contexts or times
> > > out too soon, generating skbs with 16kB..32kB of data, the SW
> > > can help bring it up to full TSO.
> =

> I'll try to explain this issue below.
> =

> > =

> > Also, after e751256486d0 ("net: gro: fix double aggregation of
> > flush-marked skbs"), it's not clear an another bug remains.
> > =

> > If it is: as said "nested GRO" of hw + sw GRO is intentional, e.g.,
> > for BIG-TCP.
> > =

> > But it may not be anticipated for skb_gro_receive_list. One option
> > would be to skip the fraglist GSO optimization for such packets.
> > =

> > First I'd like to understand better what exact bug remains.
> =

> I agree that re-aggregation is useful for improving GRO efficiency.
> =

> However, as a general rule, a GSO skb must be segment back to the
> exact original packets stream. In tethering test, skb_segment_list()
> cannot correctly segment a nested GSO skb produced by this path.

So the specific issue is a driver that builds a regular (HW) GSO
packet followed by software GSO that uses fraglist?

Then I see three paths to fixing this

1. decline to further apply SW GRO if skb is GSO and in fraglist mode
2. if in fraglist mode, further apply SW GRO, but do not use fraglist
3. in skb_segment_list detect this case and fall back onto
   skb_segment

We already apply option 3 to various cases where skb_segment_list
cannot handle complex use-cases of fraglist.

This patch chooses option 1, which is fine. Alternatively it could
fall through to the regular skb_gro_receive path below.

> This issue can reproduce in the following scenario:
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
> =

> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
> =

> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> =

> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
> =

> The patch only prevents that nested case before skb_gro_receive_list()
> aggregation. It does not affect packets that are re-aggregated by
> skb_gro_receive().

Thanks for the detailed explanation.



