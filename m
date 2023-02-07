Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE01C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJMeS4Tmloj1pu2OIOf+gkFxkv1db8ca8VVRRkbdn2c=; b=w+fQ5NMnwdQMjZ
	96xfN7ABxUOsRLnX8VPZxpWsouIimrZSWEI9VjCKxI7iz64x+ScZtS78GVOOO331aVb1gDcr10HBp
	Pps5HV7zrusi2/UfaoGYa5tmo2lCR7oLn2iKdXQhtLQRVpNnu6nWo6BkXnLSNuYsm7Ob7mDOUtmR6
	zZ3YXAyzNezn3dcZnuf3pSy57sYY0uEQJJnvyaqzVWSry3HCMfCecFBR+IV08iUo6NK423vlEt2/G
	PhgaRNlrnfC+HZ8P2Vbj416dvrxqBTj0AktaedziDgzvYo9aRFQ4zBdzgA4f0pW+iQGUkHWk6ouNH
	q36cUS2VA1WOYQa9h/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLeG-00Bplp-Nu; Tue, 07 Feb 2023 10:56:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLeD-00BpkZ-Uh
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 10:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675767382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJMeS4Tmloj1pu2OIOf+gkFxkv1db8ca8VVRRkbdn2c=;
	b=Yk/6f9ghUaA3xx09adhIHUUSzRkPfYAN+Ev2dNtEDUP/3w3tbQYq4Lh/zSLqZ6prT17+t7
	0WyFH784AzELvXinzbmDfQIb8mKL6qv0yFfQ6KuUJsenVl+KdQ57MEP/4gkRKc7M29xHwx
	8/FI47UnjUmciIZlVIYiWZOMVoSf+Cw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-KLKcP8zDPBWzb8gv-n4tqw-1; Tue, 07 Feb 2023 05:56:20 -0500
X-MC-Unique: KLKcP8zDPBWzb8gv-n4tqw-1
Received: by mail-qk1-f200.google.com with SMTP id u10-20020a05620a0c4a00b00705e77d6207so9435254qki.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 02:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utLBczvzekSz+cWIa2fZgxlACvw9W5bN6q2slvl+YPI=;
        b=IXQd+s2WeuXMhrcMIGqKp/r04rYWBLnlM4J72+bdGGhSMDusafQVwLZMlsTZvC1Zta
         xCxUdNfdE1n0kUJJthcgOaXZRsBxNdLcbrf1a0wwseHHP8yGDeY1KzMeqxJXeKyVItge
         6AH0Mp+dgP7ifz488I36NbcTYO15o4SvxK+FejmtGSqxrHaZLwaQBG3AxZUc6wmmbyBb
         wyfdXqpDXcYSwYGCiAeHZoxw46kZsw7ft+lfFUu0L0rj44Cx67JsEtXKo8G7qEfedxB0
         wrWhXdOhxwyJHfhvFkl5ldmGTgLhdYW1yKQ2kFnjaZwpqtct61mJta/EALeisxatZ+eF
         P8Xw==
X-Gm-Message-State: AO0yUKWNlkLICbmc4jafPH1hByeH/cibfRy4CDggcxMn2zFeItyGd6+A
	v3rYIhtZSwv487k0NZP+wbhg7hhyc1eL06tIUtCHC89xj5MOp2b9+Fuzdxv5EOwXNRUQvNEcusp
	ptY2G1nXrfGs64RYJPB/fdftLF3ZLc/h7
X-Received: by 2002:ac8:5709:0:b0:3b8:4951:57bb with SMTP id 9-20020ac85709000000b003b8495157bbmr5547283qtw.5.1675767379823;
        Tue, 07 Feb 2023 02:56:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/zTGzMRBR7nAgHkQ8IpNXUs+WHjz4jc2IOn+RfYLyKZo3Xwo4UgiGqPFMVxiMcEINisz+yfw==
X-Received: by 2002:ac8:5709:0:b0:3b8:4951:57bb with SMTP id 9-20020ac85709000000b003b8495157bbmr5547245qtw.5.1675767379532;
        Tue, 07 Feb 2023 02:56:19 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-28.dyn.eolo.it. [146.241.113.28])
        by smtp.gmail.com with ESMTPSA id s26-20020a05622a1a9a00b003b62e8b77e7sm9218291qtc.68.2023.02.07.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:56:19 -0800 (PST)
Message-ID: <c4c90e6576f1bc4ef9d634edda5862c5f003ae3c.camel@redhat.com>
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
From: Paolo Abeni <pabeni@redhat.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, 
	=?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=
	 <arinc.unal@arinc9.com>
Date: Tue, 07 Feb 2023 11:56:13 +0100
In-Reply-To: <20230206174627.mv4ljr4gtkpr7w55@skbuf>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
	 <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
	 <20230205203906.i3jci4pxd6mw74in@skbuf>
	 <b055e42f-ff0f-d05a-d462-961694b035c1@arinc9.com>
	 <20230205235053.g5cttegcdsvh7uk3@skbuf>
	 <116ff532-4ebc-4422-6599-1d5872ff9eb8@arinc9.com>
	 <20230206174627.mv4ljr4gtkpr7w55@skbuf>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_025626_105066_1F95403C 
X-CRM114-Status: GOOD (  32.14  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, richard@routerhints.com, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2023-02-06 at 19:46 +0200, Vladimir Oltean wrote:
> On Mon, Feb 06, 2023 at 07:41:06PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote=
:
> > Finally I got time. It's been a seismically active day where I'm from.
>=20
> My deepest condolences to those who experienced tragedies after today's
> earthquakes. A lot of people in neighboring countries are horrified
> thinking when this will happen to them. Hopefully you aren't living in
> Gaziantep or nearby cities.
>=20
> > # ping 192.168.2.2
> > PING 192.168.2.2
> > [   39.508013] mtk_soc_eth 1b100000.ethernet eth1: dsa_switch_rcv: ther=
e is no metadata dst attached to skb 0xc2dfecc0
> >=20
> > # ping 192.168.2.2
> > PING 192.168.2.2
> > [   22.674182] mtk_soc_eth 1b100000.ethernet eth1: mtk_poll_rx: receive=
d skb 0xc2d67840 without VLAN/DSA tag present
>=20
> Thank you so much for testing. Would you mind cleaning everything up and
> testing with this patch instead (formatted on top of net-next)?
> Even if you need to adapt to your tree, hopefully you get the idea from
> the commit message.
>=20
> From 218025fd0c33a06865e4202c5170bfc17e26cc75 Mon Sep 17 00:00:00 2001
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Date: Mon, 6 Feb 2023 19:03:53 +0200
> Subject: [PATCH] net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for s=
witch
>  port 0
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Ar=C4=B1n=C3=A7 reports that on his MT7621AT Unielec U7621-06 board and M=
T7623NI
> Bananapi BPI-R2, packets received by the CPU over mt7530 switch port 0
> (of which this driver acts as the DSA master) are not processed
> correctly by software. More precisely, they arrive without a DSA tag
> (in packet or in the hwaccel area - skb_metadata_dst()), so DSA cannot
> demux them towards the switch's interface for port 0. Traffic from other
> ports receives a skb_metadata_dst() with the correct port and is demuxed
> properly.
>=20
> Looking at mtk_poll_rx(), it becomes apparent that this driver uses the
> skb vlan hwaccel area:
>=20
> =09union {
> =09=09u32=09=09vlan_all;
> =09=09struct {
> =09=09=09__be16=09vlan_proto;
> =09=09=09__u16=09vlan_tci;
> =09=09};
> =09};
>=20
> as a temporary storage for the VLAN hwaccel tag, or the DSA hwaccel tag.
> If this is a DSA master it's a DSA hwaccel tag, and finally clears up
> the skb VLAN hwaccel header.
>=20
> I'm guessing that the problem is the (mis)use of API.
> skb_vlan_tag_present() looks like this:
>=20
>  #define skb_vlan_tag_present(__skb)=09(!!(__skb)->vlan_all)
>=20
> So if both vlan_proto and vlan_tci are zeroes, skb_vlan_tag_present()
> returns precisely false. I don't know for sure what is the format of the
> DSA hwaccel tag, but I surely know that lowermost 3 bits of vlan_proto
> are 0 when receiving from port 0:
>=20
> =09unsigned int port =3D vlan_proto & GENMASK(2, 0);
>=20
> If the RX descriptor has no other bits set to non-zero values in
> RX_DMA_VTAG, then the call to __vlan_hwaccel_put_tag() will not, in
> fact, make the subsequent skb_vlan_tag_present() return true, because
> it's implemented like this:
>=20
> static inline void __vlan_hwaccel_put_tag(struct sk_buff *skb,
> =09=09=09=09=09  __be16 vlan_proto, u16 vlan_tci)
> {
> =09skb->vlan_proto =3D vlan_proto;
> =09skb->vlan_tci =3D vlan_tci;
> }
>=20
> What we need to do to fix this problem (assuming this is the problem) is
> to stop using skb->vlan_all as temporary storage for driver affairs, and
> just create some local variables that serve the same purpose, but
> hopefully better. Instead of calling skb_vlan_tag_present(), let's look
> at a boolean has_hwaccel_tag which we set to true when the RX DMA
> descriptors have something. Disambiguate based on netdev_uses_dsa()
> whether this is a VLAN or DSA hwaccel tag, and only call
> __vlan_hwaccel_put_tag() if we're certain it's a VLAN tag.
>=20
> Link: https://lore.kernel.org/netdev/704f3a72-fc9e-714a-db54-272e17612637=
@arinc9.com/
> Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA unt=
agging")
> Reported-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thank you Vladimir for the quick turn-around!=20

For future case, please avoid replying with new patches - tag area
included - to existing patch/thread, as it confuses tag propagation,
thanks!

Paolo


