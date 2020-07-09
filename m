Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E996BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 06:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7406206C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 06:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rnd6BeF7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogVnGclO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7406206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Zb2XJc9tal2mTbgcc+9rQxSVX6KIjm4i9PPBDBCE3A=; b=Rnd6BeF7CKZ527XN7qYfjRxWG
	/pbRGZ07mL4yXuuV8RMHqt8kmSkxc4rzD4/ZCB9gwWvh9J6H5ee6zFnqcMZXkdCS2E1USkjEhcSz6
	HngbfZfvOa83nXajugEJ+8XWtRnWtTFMMn6St/9qPZbvyK0n09VjOcjh4xUa99XBgFeFHrO9q1hO3
	u7asSJECc8k580aWyGt7L1NrThGQ1T7bOW9JK8glfXC75kmauGI5Fk7VsP93kbYOEEo6W+WN2YUt0
	YMT/NsJ1WcT0NW9eu2oFoW0gtmasIVz5TpD56J1KeimZj2ExH/PP3u0wk8caB6zAjJwe7Ep8hAtiN
	Z3kABIbkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQGv-0006L7-AW; Thu, 09 Jul 2020 06:43:05 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQGt-0006KZ-7v; Thu, 09 Jul 2020 06:43:03 +0000
Received: by mail-lj1-x243.google.com with SMTP id q7so1128132ljm.1;
 Wed, 08 Jul 2020 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lcZQQSxCy0IEK8hiqOO5BqfdMhhuSov0Y+kqA/a3/rI=;
 b=ogVnGclOk5VQFYLbCrnG1ExJQdP3PexvJGsgXX7NdByB1BvhZycnGs/glKFEPTqEAL
 SJ5XIJHIzTfFgYbfGCHUftliczFeD4jVeMAPS7juBbCg/1sxo15AwtGPi8Jo9Y6x7suv
 JhZZJSRZpVMmc51N9f5vDNcNkifcli+rEWvlHo7Hnbpaz5Q3H9OIueuwsP0FLDcQ0ldc
 4LvD3f9RfGWEiSa5B7P5xdttOjocF7E0HRX8nkeDv5pCndDC6M5WevosR39coXWRlzFr
 XIMfQvgyd0dnv/lrFwIEUqkzyzD6rEHPmDiEj3UvwVcvvObfFDrOLT3+oMmQ2LvHbtVp
 EPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=lcZQQSxCy0IEK8hiqOO5BqfdMhhuSov0Y+kqA/a3/rI=;
 b=b3fMJ8PHsERmPW0zjoDjMo5pODp0oh8Qg78ZM3F2F/RKF+IffHKCMbm/n0jiud4GcO
 RlYt8lTAeqsYoWIzzIo0xnhULKSw0DNn/pNvREvapr9AThTKrARunC/31S90NqTzeXG6
 ajnuVEPEz8IsU0t9fL4bjhPfMxq+2YPs87jDB95EUPo/QAxsRfQdbvqBAwdxb6TW7fXh
 4/2lP5/6XrXnAb7cKdNgXp82Jog1xiXgE/EGCr2rlpOierskSK8LFdVd4i0ubH5K8m1q
 ShO0XhKjAMBr13+Uq04lJFVXSS6j9O57TKATFk4aa9DfqSRpUIdjkNoMARCOC2riOr5X
 JgNQ==
X-Gm-Message-State: AOAM532CzzxGcCUyXwJ5ZflmR/hw7zl0EqLItu3XBRGYET//JnMVgc9y
 zhdnX124HK4vcuTJzHBpkP4=
X-Google-Smtp-Source: ABdhPJwnVyAuI4N9rXiPQHgqGOUY/7oxVUYgnUrsbPrWnPJbFYyTdE8oNt9lLDqVW3rTznEqPuwpTA==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr36561777ljn.76.1594276980850; 
 Wed, 08 Jul 2020 23:43:00 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id r11sm512119ljc.66.2020.07.08.23.42.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jul 2020 23:43:00 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [V2 PATCH] usb: mtu3: fix NULL pointer dereference
In-Reply-To: <1593658371.23885.16.camel@mhfsdcap03>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
 <20200701115821.GA2184169@kroah.com> <1593658371.23885.16.camel@mhfsdcap03>
Date: Thu, 09 Jul 2020 09:42:56 +0300
Message-ID: <87imex6vf3.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_024303_335996_4BD44E7D 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7501719601016755642=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============7501719601016755642==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>> > @@ -373,8 +380,8 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, =
struct usb_request *req)
>> >   */
>> >  static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
>> >  {
>> > -	struct mtu3_ep *mep =3D to_mtu3_ep(ep);
>> > -	struct mtu3 *mtu =3D mep->mtu;
>> > +	struct mtu3_ep *mep;
>> > +	struct mtu3 *mtu;
>> >  	struct mtu3_request *mreq;
>> >  	unsigned long flags;
>> >  	int ret =3D 0;
>> > @@ -382,6 +389,9 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *=
ep, int value)
>> >  	if (!ep)
>> >  		return -EINVAL;
>>=20
>> Same here, how can that ever happen?
> Maybe when the class driver has something wrong:)
>
> You mean it's better to remove these unnecessary checks?

if we need those checks, I'd rather have them at a central location,
such as udc/core.c. But, as Greg mentioned, the kernel doesn't call
these with NULL pointers.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8GvHAACgkQzL64meEa
mQbrYRAAml2Y+LWrWoV+FiUsizawyXWdMnK293fh4tAdEx26PRCockGvNBZDC/10
Bw+SsUEFg5Dv6HgqL6fnSJYER2NAzN13bcBo7hZBvFWce+4sNBh/w9q+sPjnAt2x
t0wWe1mv/k+XAPsQfJmgxmmI+o1Vo3Dzk2hGvvADYclCn7gEyjW/lYDx+Bq4qeYJ
9wEFLMiicZNMFEuIY8BMsNMzQmEP71AY6Cogwd5m2LkGOYyQ98AuvY4qHFFHwXaZ
RSclHhIcGdYifSq8IZuA9YXV5ayVQp+c7eec6i9dZ+Ne/s5hG04lV/5e6uXNtD3U
dgCpbZYbgftCU2iyDREbkJJEemzDXpKwcDX3R/48QidnmB25JOl0kxhZq6t8Qf7h
gQ0n5SwpKtyKA7lEX6wTHsIga9/dYRGY5vYnJFjgRjiE3l+O/Nyk1w3gaxC9LoFD
qh5RjrKbd0r3U5R1NxRUggF2cbbPNEl3O9DrD59sVgEnHrl13X/e5kBQXhOsYLaw
rKo9c1VFrtB3RPF0siao3noO44wZHvdMXDo+5MA5OevTQy9+k3Q9fH6+V2gcn0eY
fwi1/c7oE1WZ+awSsiZ2CZrbCSYhJGlkCkxw8GroOze5atFPnxKi9NENBJEZz5q9
nfFhcgIRdJwoiZaWyZ9dov2nXX+0K5BCKPPDU16jeg6IG6FHbcA=
=K726
-----END PGP SIGNATURE-----
--=-=-=--


--===============7501719601016755642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7501719601016755642==--

