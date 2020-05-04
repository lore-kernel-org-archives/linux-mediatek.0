Return-Path: <SRS0=oHVa=6S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F03C3A5A9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 13:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D0A2073B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 13:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XeZiJAxS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpXTUOs5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D0A2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgHl6mROdXa4EJ2xOtZ+JWKi10MkgM/rYSQn9BIbcRw=; b=XeZiJAxSM2+rdP
	DrMHuuKzp44fUSjjhKZMJwEybEqHf3/R3b8awpS4Lvi5uKfXDYTlo4Zg+UyWBNC3ut+3nG6xypgT6
	9xnaCVT9OZkWybNC9Y+t0Dfe5Za6muOqyILC5uBJ+8CPsF0ZuYEVrNaqvDRPekMeYeE9FOsnuHyR0
	IeNU3IJv9IzbMS9uVyx/ecqtVhnVUfJBFG0wewOgQ8IR3VXXjvalfIhCLi6xCgTnE/2gmD4GDP2Zi
	CtKFv9aY1MftNRapYqkHMBnGlv9IkQmJ/+kpVWTThohIMByy3BMmo5ioONgwQZ7u2wVg03zAFTUcK
	VxkjKno2sSnOjiy/1ffQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVawP-0001mL-Fd; Mon, 04 May 2020 13:15:25 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVawM-0001lJ-Gg
 for linux-mediatek@lists.infradead.org; Mon, 04 May 2020 13:15:24 +0000
Received: by mail-ed1-x542.google.com with SMTP id g16so13475601eds.1
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXEa0UDgr6Sm1oxU98rlFxrrOQrsTyDffYdHdbwRax0=;
 b=PpXTUOs5creydWHMCtoXQcyYihf8bhTtsnUlZf4q8R8MS7trUpZfbPOVaF37dAufN4
 tOqP/8bW9H05mZfBvbMRWeBnXRjddOgvWR5yvtg8GBnmfAP+JD94/omczqFibmsMOokg
 IRFya0xN9uRvtki/VZc8NeY5XJkwLeJyKauqDRL7a+BTdXi1fpbGBFCBWWMImWXz5BPy
 shvjBf+KAeinPX5AA35qbn45d4pMYT5/DF2+uYqJ/jPhiav0J498liEumEa8wwUkFAf8
 pGeGf+2fVnEN1E+1ym8aKEVExU2Yj3ac91wu6pFfsg0BOMEfF4JuTnN9tAsNg+/NCdRB
 N95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXEa0UDgr6Sm1oxU98rlFxrrOQrsTyDffYdHdbwRax0=;
 b=YR0S6G6PI8Rjvl9ue4v6irNmws4JZ9ek280cPvbdHIAux6Gym26Bfixf3gTRKsuTA0
 plEJ34oU88wwQ2o6q3b7KQvER7db+/DQZI5pAveI38GMCrGhd8/ZoSTGfa7H3skbghRo
 qRxKB0+gD3OC8FkX/KFuyR0nXI+QkBPb27vv6rFc9YxTT+zxo7LRv6cdzteaK+RLNRvj
 lAHqPw9HCPiauJ5QYIWxIfOpybj0Q8QEW/GOgjURMmL/dNQHAfK6tZAdUw7TsRGSf0Tj
 2ChsjfZnl9t4AWI9tCRCxwaes5j8OKTRPhDHxpvV72W2wjlDckK9ZMWXBup0K6MLx2Ww
 YoGg==
X-Gm-Message-State: AGi0PuZAcQPdKlt2KnfUl+7DSidwVbP7HSNiphFHzxJRiUnlsBy5V1Vg
 9I2fTEnM1B2PH7i21Atv0V0QxdDl8VIIqJtqcEk=
X-Google-Smtp-Source: APiQypKXiDanSVgOWaslcdJGl6DeLhTEFB8aK0dXtclxWxdNhm3Tvkglp60pS3/QEJQaMCiem82V+RzJp14r0AKVxts=
X-Received: by 2002:a50:8dc2:: with SMTP id s2mr15190448edh.318.1588598120565; 
 Mon, 04 May 2020 06:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200425120207.5400-1-dqfext@gmail.com>
 <CA+h21hpeJK8mHduKoWn5rbmz=BEz_6HQdz3Xf63NsXpZxsky0A@mail.gmail.com>
 <CALW65jb_n49+jTo8kd6QT7AwXdCxJOR1bOFA72fyhjReM2688Q@mail.gmail.com>
In-Reply-To: <CALW65jb_n49+jTo8kd6QT7AwXdCxJOR1bOFA72fyhjReM2688Q@mail.gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Mon, 4 May 2020 16:15:09 +0300
Message-ID: <CA+h21hrhcqpF+nTmG6057ckB+CzHQGC+F5_bbAK7TXxmpvzNBQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: fix roaming from DSA user
 ports
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_061522_918676_4AC908A4 
X-CRM114-Status: GOOD (  29.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 riddlariddla@hotmail.com, Paul Fertser <fercerpav@gmail.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Stijn Segers <foss@volatilesystems.org>, Szabolcs Hubai <szab.hu@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Qingfang,

On Mon, 4 May 2020 at 15:47, DENG Qingfang <dqfext@gmail.com> wrote:
>
> Hi Vladimir,
>
> On Mon, May 4, 2020 at 6:23 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > Hi Qingfang,
> >
> > On Sat, 25 Apr 2020 at 15:03, DENG Qingfang <dqfext@gmail.com> wrote:
> > >
> > > When a client moves from a DSA user port to a software port in a bridge,
> > > it cannot reach any other clients that connected to the DSA user ports.
> > > That is because SA learning on the CPU port is disabled, so the switch
> > > ignores the client's frames from the CPU port and still thinks it is at
> > > the user port.
> > >
> > > Fix it by enabling SA learning on the CPU port.
> > >
> > > To prevent the switch from learning from flooding frames from the CPU
> > > port, set skb->offload_fwd_mark to 1 for unicast and broadcast frames,
> > > and let the switch flood them instead of trapping to the CPU port.
> > > Multicast frames still need to be trapped to the CPU port for snooping,
> > > so set the SA_DIS bit of the MTK tag to 1 when transmitting those frames
> > > to disable SA learning.
> > >
> > > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> > > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > > ---
> >
> > I think enabling learning on the CPU port would fix the problem
> > sometimes, but not always. (actually nothing can solve it always, see
> > below)
> > The switch learns the new route only if it receives any packets from
> > the CPU port, with a SA equal to the station you're trying to reach.
> > But what if the station is not sending any traffic at the moment,
> > because it is simply waiting for connections to it first (just an
> > example)?
> > Unless there is any traffic already coming from the destination
> > station too, your patch won't work.
> > I am currently facing a similar situation with the ocelot/felix
> > switches, but in that case, enabling SA learning on the CPU port is
> > not possible.
>
> Why is it not possible?
>

Because learning on the CPU port is not supported on this hardware.

> Then try my previous RFC patch
> "net: bridge: fix client roaming from DSA user port"
> It tries removing entries from the switch when the client moves to another port.
>

Your patch only deletes FDB entries of packets received in the
fastpath by the software bridge, which as I said, won't work if the
software bridge doesn't receive packets in the first place due to a
stale FDB entry.

> > The way I dealt with it is by forcing a flush of the FDB entries on
> > the port, in the following scenarios:
> > - link goes down
> > - port leaves its bridge
> > So traffic towards a destination that has migrated away will
> > temporarily be flooded again (towards the CPU port as well).
> > There is still one case which isn't treated using this approach: when
> > the station migrates away from a switch port that is not directly
> > connected to this one. So no "link down" events would get generated in
> > that case. We would still have to wait until the address expires in
> > that case. I don't think that particular situation can be solved.
>
> You're right. Every switch has this issue, even Linux bridge.
>
> > My point is: if we agree that this is a larger problem, then DSA
> > should have a .port_fdb_flush method and schedule a workqueue whenever
> > necessary. Yes, it is a costly operation, but it will still probably
> > take a lot less than the 300 seconds that the bridge configures for
> > address ageing.
> >
> > Thoughts?
> >

> >
> > Thanks,
> > -Vladimir

Regards,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
