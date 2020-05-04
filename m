Return-Path: <SRS0=oHVa=6S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217D5C3A5A9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 14:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5274206D9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 14:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lyNzpu54";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K73aK+3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5274206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhOsBkzY0W56gX078JUsL/mLXImqcWlvL2mA14i0w+0=; b=lyNzpu54eqQM+i
	oXLx9bjS5lWKDRmSmNFlVQv8tDwNInUbE3sPdYeGEflZPWMZCdZv97KCUAaFzZeHVmwlUJGd7Lks0
	IF2Nt7wRSpDOkhfA1kC88Cqn/qgg+0QJlhWFh0drpNs6wuNDfK15fE0A8tzTymg2w8N79rPC/s/IJ
	95THIZ4VE+58FmCqR2vY72w34CnrJupaCR51Cv3Dw+eKDJ7o1i7/zHCqtHeA1GwY5NRhDYDhajmvH
	OdcYI7JMMSO5mFgCwmQKbqj0+dj/PLJdes25cOqHOXUeFzXOj+I8t6HLqMZBS7pNLjW571iVNZ+gC
	O1qDM6uILXvfrI26wpog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVcQ0-0004sC-MP; Mon, 04 May 2020 14:50:04 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVcPy-0004E9-1K
 for linux-mediatek@lists.infradead.org; Mon, 04 May 2020 14:50:03 +0000
Received: by mail-io1-xd41.google.com with SMTP id i19so12544906ioh.12
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/g+R1fDSmMSuxtLGeYcAV97ESR2gO90b6gQaER1uUA=;
 b=K73aK+3h8ByTePqEK2rSx6EASzMwrdGbT8R6QT+4oF8kK3oGc1gUHKD3n8ObF5qr7v
 CBbrBDhwfxv+AWWM6QTjfPhZsMzifL5EIHZPM5qK2FSH25CsUMMZ4Ssk1k4b+XX+3OGZ
 3ox5bQ6QPt4id0llvbe8R5x7hWlhmibWwd1HRLaWdXO1kn5Z/CGwBqIOspAa1lU4PY/0
 6ppkMqNjd9OG/KvaFNYm3+5AD1CVxSw961Xi4SBC/kBxFuQ5woYRwOOuCdENMNgoncCa
 plrTVIosXU1f75VJe8hJYGiuGoDdiusoIYWz4aRMlzJFUTHA/mA2lOOLEouyF4UCb8QY
 BnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/g+R1fDSmMSuxtLGeYcAV97ESR2gO90b6gQaER1uUA=;
 b=ZOfqEJwNuQplwfW3SF8fw6RWtco5FXovV/wqLRuwmtURM2mMsn0IRUo9D36TzQ7pUA
 NoSFg8lbgtnJukOX7imDK6BjeN/7EhlG9DnayRmozfPevxTofdXIjjVx+X/HOL9AfpJs
 cIW2vIQQteP39tsH9Cs89eSNaFoux9lwSALr/vJLi24kCkT9+QtvPF1pt+kk13i1EMjV
 1uyDYXJ6L10rUpy2nCJvMlzdsMpMdHY0lXO/6+TF8fNeMB3q602YOvw7pGb/ryIfUuHB
 vhKX1IbNs8/ZibgQ3szUNf6iqrMmf2jtSKYa48whZm5nsdpaWYqftIubvOKNUWG2zQX/
 5GwA==
X-Gm-Message-State: AGi0PubWnBcXKzuxt62kpsTfhhSPdh4e+/I1iloCFaxxRMsx8SJSZbLS
 g81o1tS3z+sEtRKdt0PC0fVrT3M0I8zXplnGCPM=
X-Google-Smtp-Source: APiQypIUunA/C7JtFZKuCl06GpCLRGSjHQpeo66/A6o4dchQzdz+j40TdiWgquMUWFcQWzBWW6wr2tQi8Bl20CIUxP0=
X-Received: by 2002:a02:5bc9:: with SMTP id
 g192mr15615436jab.136.1588603799448; 
 Mon, 04 May 2020 07:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200425120207.5400-1-dqfext@gmail.com>
 <CA+h21hpeJK8mHduKoWn5rbmz=BEz_6HQdz3Xf63NsXpZxsky0A@mail.gmail.com>
 <CALW65jb_n49+jTo8kd6QT7AwXdCxJOR1bOFA72fyhjReM2688Q@mail.gmail.com>
 <CA+h21hrhcqpF+nTmG6057ckB+CzHQGC+F5_bbAK7TXxmpvzNBQ@mail.gmail.com>
In-Reply-To: <CA+h21hrhcqpF+nTmG6057ckB+CzHQGC+F5_bbAK7TXxmpvzNBQ@mail.gmail.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Mon, 4 May 2020 22:49:50 +0800
Message-ID: <CALW65ja9+pCMkd_1VGYnxwwLdDnS1ZBamB-KWT=fFTdT51B64Q@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: fix roaming from DSA user
 ports
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_075002_120857_C56A6048 
X-CRM114-Status: GOOD (  31.75  )
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

Hi Vladimir,

On Mon, May 4, 2020 at 9:15 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Hi Qingfang,
>
> On Mon, 4 May 2020 at 15:47, DENG Qingfang <dqfext@gmail.com> wrote:
> >
> > Hi Vladimir,
> >
> > On Mon, May 4, 2020 at 6:23 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> > >
> > > Hi Qingfang,
> > >
> > > On Sat, 25 Apr 2020 at 15:03, DENG Qingfang <dqfext@gmail.com> wrote:
> > > >
> > > > When a client moves from a DSA user port to a software port in a bridge,
> > > > it cannot reach any other clients that connected to the DSA user ports.
> > > > That is because SA learning on the CPU port is disabled, so the switch
> > > > ignores the client's frames from the CPU port and still thinks it is at
> > > > the user port.
> > > >
> > > > Fix it by enabling SA learning on the CPU port.
> > > >
> > > > To prevent the switch from learning from flooding frames from the CPU
> > > > port, set skb->offload_fwd_mark to 1 for unicast and broadcast frames,
> > > > and let the switch flood them instead of trapping to the CPU port.
> > > > Multicast frames still need to be trapped to the CPU port for snooping,
> > > > so set the SA_DIS bit of the MTK tag to 1 when transmitting those frames
> > > > to disable SA learning.
> > > >
> > > > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> > > > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > > > ---
> > >
> > > I think enabling learning on the CPU port would fix the problem
> > > sometimes, but not always. (actually nothing can solve it always, see
> > > below)
> > > The switch learns the new route only if it receives any packets from
> > > the CPU port, with a SA equal to the station you're trying to reach.
> > > But what if the station is not sending any traffic at the moment,
> > > because it is simply waiting for connections to it first (just an
> > > example)?
> > > Unless there is any traffic already coming from the destination
> > > station too, your patch won't work.
> > > I am currently facing a similar situation with the ocelot/felix
> > > switches, but in that case, enabling SA learning on the CPU port is
> > > not possible.
> >
> > Why is it not possible?
> >
>
> Because learning on the CPU port is not supported on this hardware.
>
> > Then try my previous RFC patch
> > "net: bridge: fix client roaming from DSA user port"
> > It tries removing entries from the switch when the client moves to another port.
> >
>
> Your patch only deletes FDB entries of packets received in the
> fastpath by the software bridge, which as I said, won't work if the
> software bridge doesn't receive packets in the first place due to a
> stale FDB entry.

As I said before, ALL switches including software linux bridge have this issue.
In this case, you'd better ensure the client sends packets first after
migration, which
most clients already do in switches + wireless APs setup.

>
> > > The way I dealt with it is by forcing a flush of the FDB entries on
> > > the port, in the following scenarios:
> > > - link goes down
> > > - port leaves its bridge
> > > So traffic towards a destination that has migrated away will
> > > temporarily be flooded again (towards the CPU port as well).
> > > There is still one case which isn't treated using this approach: when
> > > the station migrates away from a switch port that is not directly
> > > connected to this one. So no "link down" events would get generated in
> > > that case. We would still have to wait until the address expires in
> > > that case. I don't think that particular situation can be solved.
> >
> > You're right. Every switch has this issue, even Linux bridge.
> >
> > > My point is: if we agree that this is a larger problem, then DSA
> > > should have a .port_fdb_flush method and schedule a workqueue whenever
> > > necessary. Yes, it is a costly operation, but it will still probably
> > > take a lot less than the 300 seconds that the bridge configures for
> > > address ageing.
> > >
> > > Thoughts?
> > >
>
> > >
> > > Thanks,
> > > -Vladimir
>
> Regards,
> -Vladimir

Regards,
Qingfang

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
