Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF6DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 15:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC31205ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 15:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iGS0xvQS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWXbYloO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC31205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA//ORWZSxgpNBuuOqOi7WM3LZgX4fWD0VwNcF9K9YM=; b=iGS0xvQSBCXLOw
	s592QC8OfREnHx3m5gtnBnDZjOS+C1AWqBARvJ/0zsY2VdJ/MsHOM0sqZ79BZXDkjWJylbiyJ76bq
	ilqBNLWpTIblk2XTpCS0qC8B1DxP2CsBRM1l+g3U0TVQ3NzA1n16VjttCLx4t4zEZ8eRnDxPPiNd9
	qznushNZ4X0jC6JJvMDDJ7GvwxKPA1IXBp7Nau9autssR5z09gJtgFfrUDlLPLqfVwV/XGQhh6VHe
	F/ERxRjZZxKpKqFH7apCIyDA3Eoq6QZOs2sk/KMjDRtz/9AOEOyQiCDW4dquxlualhSFavY6s1KLr
	RKm2Ph5ARV9sz+i8Dxtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYtk3-00019l-GC; Wed, 13 May 2020 15:56:19 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYtk1-00019J-AE
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 15:56:18 +0000
Received: by mail-io1-xd42.google.com with SMTP id w11so18564061iov.8
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQn+8pZqeeBsYLaYSdtMgaSKYLpReKEXrC5TSLa5UEo=;
 b=bWXbYloOSyV1kgoaQdIGjLPgJcErVmROudPOgGbQAHlLDhMpj6rgqe1bDoDZIjwO+N
 v1xtwJMm1DcmDc+xGDwqoONccJv4dszCE+cDIWqZh+P6wGyvRhLvNZEoplATjWjgg25c
 14IAz0Ql8DIqr4l25GP9+nDvz6wC//N5z1Nc4z3PxxrZyHX50eHF/zDDmR4SCbWUdkqP
 sd2yIRgLWW8pEHCa33eKPwWt2TZWYJA3SFz8fo5od62vcq3BrMFnFgDGVnLYJ/aFhlRi
 sRBP6AzX1trb5NmI669d7MInazpVLX1udgGTPRh6HA1/kdm3o5vABwBV/1TNmvB/O8N1
 q3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQn+8pZqeeBsYLaYSdtMgaSKYLpReKEXrC5TSLa5UEo=;
 b=sis9/5k7vE3OdVkKwDgBxVT4SRMKLwXtYKVT8Dpotv5skagAmk9VqdOJdBWdGEAF1D
 ohSOyRgvxbfnx7gA69Kbmi5TsfCfFPc4JB04ac82hy88ro6BmPVyoV4tFR3Sd4ikUXKi
 05cSKc+D9zMGduZ0QIoQI6fPznWBiprrgHUSUIKnWyUwBFWADAGNjwwv8Dy9pAD+4T7B
 nOMftZzEFxe91UZq+U1QDkUaqMrzEYvZ5ZzGFLRBINt0QlN9AabAVpxhpmduP6ecxpkh
 PFnnMwEf80M9fm1hCpWqKpnLeZogoij6qfO0ha2QlPU+Vk9bjTZHCR57s1w4Yg/R22M7
 6whw==
X-Gm-Message-State: AGi0PuarZVE/3c0xtowStY+JlC7C1heAWnuqOWLoM6IthlroKQ1HDO6u
 6K5QvQHalgOyJE1F+qDnMPcFxYP5zh/qpKXYPWU=
X-Google-Smtp-Source: APiQypJ/qwblLRPq5LtXtXxXp/h1Bi1wVZTbaCxSxFRx2aTge/BKhBnqZI3YYDrPYZthrzhuKRwMhyL3Ftt55HydVi4=
X-Received: by 2002:a02:7fd8:: with SMTP id r207mr218174jac.7.1589385375422;
 Wed, 13 May 2020 08:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200513153717.15599-1-dqfext@gmail.com>
 <5d77da58-694a-7f9c-53fb-9d107e271d40@gmail.com>
In-Reply-To: <5d77da58-694a-7f9c-53fb-9d107e271d40@gmail.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 13 May 2020 23:56:03 +0800
Message-ID: <CALW65jbN-qvEgz01Shff59S77ArZtNVK7kq74XdyDjuvVSA-_g@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: set CPU port to fallback mode
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_085617_356475_E041341D 
X-CRM114-Status: GOOD (  22.36  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, riddlariddla@hotmail.com,
 Paul Fertser <fercerpav@gmail.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
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

Hi Florian

On Wed, May 13, 2020 at 11:46 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/13/2020 8:37 AM, DENG Qingfang wrote:
> > Currently, setting a bridge's self PVID to other value and deleting
> > the default VID 1 renders untagged ports of that VLAN unable to talk to
> > the CPU port:
> >
> >       bridge vlan add dev br0 vid 2 pvid untagged self
> >       bridge vlan del dev br0 vid 1 self
> >       bridge vlan add dev sw0p0 vid 2 pvid untagged
> >       bridge vlan del dev sw0p0 vid 1
> >       # br0 cannot send untagged frames out of sw0p0 anymore
> >
> > That is because the CPU port is set to security mode and its PVID is
> > still 1, and untagged frames are dropped due to VLAN member violation.
> >
> > Set the CPU port to fallback mode so untagged frames can pass through.
>
> How about if the bridge has vlan_filtering=1? The use case you present
> seems to be valid to me, that is, you may create a VLAN just for the
> user ports and not have the CPU port be part of it at all.

I forgot to mention that this is ONLY for vlan_filtering=1
`bridge vlan` simply won't do anything if VLAN filtering is disabled.

>
> >
> > Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > ---
> >  drivers/net/dsa/mt7530.c | 11 ++++++++---
> >  drivers/net/dsa/mt7530.h |  6 ++++++
> >  2 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index 5c444cd722bd..a063d914c23f 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -810,10 +810,15 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
> >                  PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
> >
> >       /* Trapped into security mode allows packet forwarding through VLAN
> > -      * table lookup.
> > +      * table lookup. CPU port is set to fallback mode to let untagged
> > +      * frames pass through.
> >        */
> > -     mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
> > -                MT7530_PORT_SECURITY_MODE);
> > +     if (dsa_is_cpu_port(ds, port))
> > +             mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
> > +                        MT7530_PORT_FALLBACK_MODE);
> > +     else
> > +             mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
> > +                        MT7530_PORT_SECURITY_MODE);
> >
> >       /* Set the port as a user port which is to be able to recognize VID
> >        * from incoming packets before fetching entry within the VLAN table.
> > diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> > index 979bb6374678..d45eb7540703 100644
> > --- a/drivers/net/dsa/mt7530.h
> > +++ b/drivers/net/dsa/mt7530.h
> > @@ -152,6 +152,12 @@ enum mt7530_port_mode {
> >       /* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
> >       MT7530_PORT_MATRIX_MODE = PORT_VLAN(0),
> >
> > +     /* Fallback Mode: Forward received frames with ingress ports that do
> > +      * not belong to the VLAN member. Frames whose VID is not listed on
> > +      * the VLAN table are forwarded by the PCR_MATRIX members.
> > +      */
> > +     MT7530_PORT_FALLBACK_MODE = PORT_VLAN(1),
> > +
> >       /* Security Mode: Discard any frame due to ingress membership
> >        * violation or VID missed on the VLAN table.
> >        */
> >
>
> --
> Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
