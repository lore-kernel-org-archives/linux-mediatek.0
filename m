Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BE5C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 03:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872722072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 03:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEQ4Hnvi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsxWeaXi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872722072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zr9q7QVkOnQyh+Y6Au9AZMNebKqMcyyQxAxOyZSL8/Y=; b=TEQ4HnviPzNRaX
	2A0usxrd0j48IAABxWO+9H7HR+HVf44rj1GNa87ZoH6OUFzIWyv01khoCTDgVvzxnYTM0NWku0oon
	voFp8FWfxZlYEPsx677zL3T3uuFvOcn7LlLOwTrOSDYVCN/BIawgmQaPsrPM9AQvQ1cPy9PKiDaG4
	PSULSWaTu9Kcqf/dQ25wLburzVp/o86hxiMPdWjjXUvb1oDx8d2LhPDFwWkzo0afYzjNZqplqeplG
	ZlBolCGKCn1OD0N1pL5EGmlKPnW5PAoH/s1iXX7N9AaL82DSJwvUBslOdMhzWBeBsIG/gTKduk9Gm
	137WtxEfMuEwt6nOgJsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOBr3-0004Iz-9J; Tue, 14 Apr 2020 03:03:17 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOBr0-0004IM-It
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 03:03:15 +0000
Received: by mail-il1-x143.google.com with SMTP id i2so9759122ils.12
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2020 20:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvvX428jhA03WN2yaKHPbkqaFaksfSra1Adu8XMIvnk=;
 b=lsxWeaXi7KzM9AHRz9I3JGG6nz3zZugSUkekvKuK+DbygExzEtKRUvMtby+huNU2aA
 5TmBsboQd/Nosp2M44QZfFkSrPTiuXYBE32zZdQUyoxi0WIkSbIU6LwlqypQSPCRboZW
 l5rhNUrPpFwa1dW9233XjtmeODqwSj6Y4ZoxPZ5tM+3TBqg+kdGYqAVVm3pjlNIwiKsW
 vY6dYz3ae12FKAuPJM6v8ZDGaB648qnI03GpkXHf8C7KGRutPeZ5fW49tFykS9j80Qmg
 w/D7AEXamHkAotXZIzomuXjDJ/HiGpuksmffIfy5OpR3yrl2Yru3EagATt219x95K1iM
 Oejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvvX428jhA03WN2yaKHPbkqaFaksfSra1Adu8XMIvnk=;
 b=e0WRR7/f+WtGvagotTNMqsKfpvxHy0MdtrpnS/cnNkRce4bCYX+F5LlN1UWy/oxgCS
 D5VnTnJ3NhTUOTBZ84BCk1k6ciW0EnxANtQQ2k2qTpt7V0wF+fMcI2PlFtP+1BpRtwmt
 tmk++F7yzvJkVmH3nw+5GHfQ9flEUNuMH50v3yrI+g0EYu2Rdn8rqE4cWoS/gTxh4qr0
 jSV23bjws35UAIWUQkhh+ARi7dw+v2/DmR0H3T5OxsTv5/VJCW2ctLcfgV1Hx4UWXcAE
 rX6b6SrhglTnsAxKiQiFbVuiKsWht5CxV2/XhL8GhOzs+qGMdk9j2dmAqghEt9FLTqXr
 P9pA==
X-Gm-Message-State: AGi0Puabkqg4WDCyTWp2AcwUd18GV8/+4nTecjsU6mIsXewQbuQ8VKxu
 kBLDlIDEt+HDiJsPCFr7wo+OSMXI2uPAOqYstaQ=
X-Google-Smtp-Source: APiQypJdxOiHOVepSY+VJkvtNtZWPvs+Ogm/uxPCVhz3OiBFQ0RTo9yglWG4d2rrW8/Lzr5mGBOtamSbDoyYatU0RkI=
X-Received: by 2002:a92:c991:: with SMTP id y17mr20440596iln.239.1586833393592; 
 Mon, 13 Apr 2020 20:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200409155409.12043-1-dqfext@gmail.com>
 <20200409.102035.13094168508101122.davem@davemloft.net>
 <CALW65jbrg1doaRBPdGQkQ-PG6dnh_L4va7RxcMxyKKMqasN7bQ@mail.gmail.com>
 <c7da2de5-5e25-6284-0b35-fd2dbceb9c4f@gmail.com>
 <CALW65jZAdFFNfGioAFWPwYN+F4baL0Z-+FX_pAte97uxNK3T6g@mail.gmail.com>
 <CA+h21hp8LueSfh+Z8f0-Y7dTPB50d+3E3K9n6R5MwNzA3Dh1Lw@mail.gmail.com>
In-Reply-To: <CA+h21hp8LueSfh+Z8f0-Y7dTPB50d+3E3K9n6R5MwNzA3Dh1Lw@mail.gmail.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 14 Apr 2020 11:03:02 +0800
Message-ID: <CALW65jYodd=GoWrGTcAWEO6wNQdvSQjgO=4tmNYNnmbCh7n8sg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: enable jumbo frame
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_200314_643116_3A9153B7 
X-CRM114-Status: GOOD (  19.97  )
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
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 6:46 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Hi Qingfang,
>
> On Fri, 10 Apr 2020 at 05:51, DENG Qingfang <dqfext@gmail.com> wrote:
> >
> > On Fri, Apr 10, 2020 at 10:27 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > >
> > >
> > >
> > > On 4/9/2020 7:19 PM, DENG Qingfang wrote:
> > > > So, since nothing else uses the mt7530_set_jumbo function, should I
> > > > remove the function and just add a single rmw to mt7530_setup?
> > >
> > > (please do not top-post on netdev)
> > >
> > > There is a proper way to support the MTU configuration for DSA switch
> > > drivers which is:
> > >
> > >         /*
> > >          * MTU change functionality. Switches can also adjust their MRU
> > > through
> > >          * this method. By MTU, one understands the SDU (L2 payload) length.
> > >          * If the switch needs to account for the DSA tag on the CPU
> > > port, this
> > >          * method needs to to do so privately.
> > >          */
> > >         int     (*port_change_mtu)(struct dsa_switch *ds, int port,
> > >                                    int new_mtu);
> > >         int     (*port_max_mtu)(struct dsa_switch *ds, int port);
> >
> > MT7530 does not support configuring jumbo frame per-port
> > The register affects globally
> >
> > >
> > > --
> > > Florian
>
> This is a bit more tricky, but I think you can still deal with it
> using the port_change_mtu functionality. Basically it is only a
> problem when the other ports are standalone - otherwise the
> dsa_bridge_mtu_normalization function should kick in.
> So if you implement port_change_mtu, you should do something along the lines of:
>
> for (i = 0; i < MT7530_NUM_PORTS; i++) {
>     struct net_device *slave;
>
>     if (!dsa_is_user_port(ds, i))
>         continue;
>
>     slave = ds->ports[i].slave;
>
>     slave->mtu = new_mtu;
> }
>
> to update the MTU known by the stack for all net devices.
Should we warn users that all ports will be affected?
>
> Hope this helps,
> -Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
