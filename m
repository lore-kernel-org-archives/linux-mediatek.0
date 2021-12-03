Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E10C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 17:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFIAmfEBYRd9CnuMkihWnMZpvRH7rMCi4mlmapZMWiY=; b=wC7defPhXATz0BZZHh/e2daCdg
	GC/vsk1/V0FtJPWdIrI+34AvCcl7jnyg5+GgoRt07TYRRVZ/9BzZB56tXw3IVednjeE73uTkDeskO
	pXwEtJBBVW4/5omSCsrH46uPE2bV79DYtu2IWyPnjSU/MbBEUXw6qaAQUYR203gE0VcH3zpnHKNAo
	qDEOAvdSd+qTCqddputwEdsMIJ9EDb5aqivMIpzV4fmpe/3GcJOhoLItZT2xCtet5NvzlRJeKqeAk
	YU3JDAB34iWZ7fSC2BohRrM0sOSEY2nA5sAFq4kaM1QcqhSKlKarEIszg6eOOJjK6MRslkW6tx4QK
	MzfRZg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtCLq-00GfvY-Jc; Fri, 03 Dec 2021 17:28:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtCLo-00Gfv3-Bj
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 17:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638552477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ih2mCI6BR45sAqzck9JuUSB44OMgB1b8bhrqbdy6LQ4=;
 b=fSsTrcnPKeN70nt9GnR8B/vND9YZ6FpWZj8rYWYOTfgX2vTiRIT6RrJc/XjQoVWk/qOx2v
 xPvPXFA9BK+6jqprsny8ySCsZJCClBBP/XzAwfcfQe3Zi5wtoZY78b3/ZkEV0HUD/HGhNM
 VulHFEORKotH5oRiDj+k443/hMif7U4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-B3V-Lf1PMa2xX7Gyn8kj9A-1; Fri, 03 Dec 2021 12:27:56 -0500
X-MC-Unique: B3V-Lf1PMa2xX7Gyn8kj9A-1
Received: by mail-ed1-f69.google.com with SMTP id
 b15-20020aa7c6cf000000b003e7cf0f73daso3108070eds.22
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 09:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pjpVqfL0j9h8hFQ9g8tUuSN/8IcQIhyatEuo1e1FnXU=;
 b=A4wE3/1WHSIMK/4lGOeyU9Wb/enyjGHu0mgwzXw/UrYoPoFzUu9RAYoIYpX8ZTo4fy
 5E8QY5yzMhslfMNBuAllXZ4mW0joq764Ix/O0eA7sLwoqbYkeQaW0rOGe7++omiC1GL/
 wTBNttT5Vzp1bjg1rNfJ+CI+g1ZBSBqEfULF26MfzmQEtbV0V4+KBV8AfaTGCqGwounf
 IQ7P6SNFe0TPTceB4LY6sZ6tN7WusOifgaZNcPrzMNg1rMiSTy9QmZ8KMHE43HyhfjQR
 EzMHiV8FB+oHl/XIc2RyV+DVErUhwjYviGHQLdhVg1uw8i6QL8VhTa0iWYjhHcQq2Ro9
 yIjA==
X-Gm-Message-State: AOAM531zaPJ3aa/+vONUKJeo6my0u8Zr+kUF3GSZhfuQcSApTuGTU02N
 ofF9q3jOfualwEWT4DudrrhEQUBItlL+dmNtFMK/Ok3gYJX7WpMv9XbAnfmHDGMP1mX4AhUk2LX
 FJUGnMMYdI4JzZ10XVi1xYiqQ0RJ2sFLF
X-Received: by 2002:a17:907:7805:: with SMTP id
 la5mr25244937ejc.188.1638552475018; 
 Fri, 03 Dec 2021 09:27:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzFoi4V1Y38uYwgXtOPfnQ5k5olvJt1hjcEEyiD5yXDa1bvSIH6+nbTGmE+8NMBdSK/Bg3ng==
X-Received: by 2002:a17:907:7805:: with SMTP id
 la5mr25244917ejc.188.1638552474834; 
 Fri, 03 Dec 2021 09:27:54 -0800 (PST)
Received: from localhost (net-37-182-17-175.cust.vodafonedsl.it.
 [37.182.17.175])
 by smtp.gmail.com with ESMTPSA id a3sm2445752ejd.16.2021.12.03.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 09:27:54 -0800 (PST)
Date: Fri, 3 Dec 2021 18:27:52 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, sven@narfation.org, jf@simonwunderlich.de,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: mt76: MT7921K monitor mode not working
Message-ID: <YapTmM3EztojTS9F@lore-desk>
References: <YapBMGjLcjuBo/vw@lore-desk--annotate>
 <1638551402-3864-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1638551402-3864-1-git-send-email-sean.wang@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_092800_528649_6A43C66D 
X-CRM114-Status: GOOD (  23.89  )
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
Content-Type: multipart/mixed; boundary="===============1181348074475299671=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1181348074475299671==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2d1Hv3ATuhUm5puw"
Content-Disposition: inline

--2d1Hv3ATuhUm5puw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >> On Thursday, 2 December 2021 23:13:31 CET Lorenzo Bianconi wrote:
> >> > IIRC you need to disable runtime-pm and deep-sleep to proper enable
> >> > monitor
> >> > mode:
> >> >
> >> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/runtime-pm
> >> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/deep-sleep
> >> >
> >> > Can you please give it whirl?
> >>
> >> Jan gave me the card. I've set it to a rather busy channel (2.4GHz
> >> channel 11), created a monitor interface, attached tcpdump and then
> >> waited what happens. I didn't get anything and then I've tried to set
> >> runtime-pm and deep- sleep to 0. This didn't change the behavior for
> >> me at lot. I saw two packets and then it went silent again.
> >>
> >> I wanted to try the same on a different card (ath11k) in the same
> >> system. But it crashed my complete system - so I had to recreate the
> >> test setup. This time, I've set runtime-pm + deep-sleep to 0 before
> >> creating mon0. After doing this, it seemed to work.
> >
> >interesting, adding Sean to the loop here.
> >It seems the fw is mainting a different state in this case.
>=20
> fw cannot receive any frame on monitor mode in deeply doze mode
>=20
> so it seemed to me we need a patch to explicitly disable pm runtime in dr=
iver when monitor interface is enabled until it is being disabled.

ack, I agree, but I guess the point here is what is the difference (from th=
e fw pov) if you disable
runtime-pm/deep-sleep before/after the vif is added. I guess it is supposed=
 to
be the same, right?

Regards,
Lorenzo

>=20
> >
> >@Sean: any pointers?
> >
> >Regards,
> >Lorenzo
> >
> >>
> >> Kind regards,
> >>=09Sven
> >
>=20

--2d1Hv3ATuhUm5puw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYapTmAAKCRA6cBh0uS2t
rCiaAQDynMHJ4nmPLYaB2HHROmr2j3LJ0hZZVGq8xkq2pxcJSgD/bA94FR3SBt35
vdNr/NkAQiEihVIh5n00nvpWgMypBQA=
=YHOk
-----END PGP SIGNATURE-----

--2d1Hv3ATuhUm5puw--



--===============1181348074475299671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1181348074475299671==--


