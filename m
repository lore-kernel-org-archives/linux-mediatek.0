Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD49C49361
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 16:25:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB5E613BF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 16:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB5E613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrNA5UWfR8H2zyVs7oWHCgUhUuji8zVObBpOV1n/wKc=; b=K57HuVs4cgXwFyzMNbznKnUYJI
	onSxPSfJkW0eB8xr2Jt9XbKNgfNozCZF9esQCKvmZFdfNRev0l5PIzMpedav7TBloJXkgAbDIWeiW
	UGh41Y6EguO3j2Mfy+EyNpshJgBkwuS3sh7jC6iF3t74xx1nvsi4DUdg3VM5v7Y1LPEgT7CE/GtgU
	gXhacb1VdfWsoi+mDKJRLhTJkVysDkQv/WO92OsiukxhnCzxGrUTVJNRl4Z2ashqkaw1lPJKLnSsT
	RyczfkLeM4ncJjW55wM3CZIAO9axoTSNfW8HkAvbDE/hWEshmMb1eQXIa9Zytm7J8mPhF0l1zkBgt
	41A3CMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltupD-00B5bk-DN; Thu, 17 Jun 2021 16:25:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltuoz-00B5a7-8q; Thu, 17 Jun 2021 16:24:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B70B613B9;
 Thu, 17 Jun 2021 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623947088;
 bh=INq4nssCgYsIEKzYkC0Op/vH8B8aE187QI5AyGhlWxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RtPaz8GQTTMVVgSDQIOJ+S+7TxupFal78/odxYuTkiSTyDWOtO9O73BHhefzoqrJB
 VfailCngQHg8/m/NNIvvS+L3dfcVVEvXhNsz+jPmILsuEZspNOtPc7/MW+U1psbjzT
 oLXqRwNwJ9DyoQdS8tSxnYjdSjWzUlTpaUA/mljCDV6mZNlUCeZIJw4inR3hTrhIRr
 DOzlUfyLd4cu5tCrkNBUgeHBUQ45h4fikdS3ZmGnfYTOz7FBOS3f+2rUJSijUwD0dw
 aNnF00p0XOEclfzSMbrEDAeHL0I6RBy+sd9NJ5SeJwAhvYaFgnLvrqthn9PGYKcyfr
 60KVvSVaNxZDg==
Date: Thu, 17 Jun 2021 17:24:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: cy_huang <u0084500@gmail.com>, lgirdwood@gmail.com,
 matthias.bgg@gmail.com, gene_chen@richtek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, gene.chen.richtek@gmail.com
Subject: Re: [PATCH 1/2] regulator: mt6360: Add optional
 mediatek.power-off-sequence in bindings document
Message-ID: <20210617162428.GG5067@sirena.org.uk>
References: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
 <20210611201643.GA1583875@robh.at.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210611201643.GA1583875@robh.at.kernel.org>
X-Cookie: But it does move!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_092449_390721_65D23F5F 
X-CRM114-Status: GOOD (  21.80  )
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
Content-Type: multipart/mixed; boundary="===============6805137784555976999=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6805137784555976999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 02:16:43PM -0600, Rob Herring wrote:
> On Wed, Jun 02, 2021 at 02:54:34PM +0800, cy_huang wrote:

> > Originally, we think it must write in platform dependent code like as b=
ootloader.
> > But after the evaluation, it must write only when system normal HALT or=
 POWER_OFF.
> > For the other cases, just follow HW immediate off by default.

> Wouldn't this be handled by PSCI implementation?

Ideally I think...

> > +  mediatek,power-off-sequence:
> > +    description: |
> > +      Power off sequence time selection for BUCK1/BUCK2/LDO7/LDO6, res=
petively.
> > +      Cause these regulators are all default-on power. Each value from=
 0 to 63,
> > +      and step is 1. Each step means 2 millisecond delay.
> > +      Therefore, the power off sequence delay time range is from 0ms t=
o 126ms.
> > +    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> > +    minItems: 4
> > +    maxItems: 4

> So this is the delay between BUCK1 and BUCK2, then BUCK2 to LDO7, etcc?=
=20
> If we wanted to express this in DT, we'd made this generic which would=20
> need to be more flexible. A poweroff delay in each regulator (similar to=
=20
> the existing power on delay) would be sufficient for what you need I=20
> think.

It's not exactly a delay that's being described there - it's a series of
timeslots, each regulator getting assigned to a timeslot.  You could
possibly do a general binding by specifying a delay from the start of
the power off sequence and then (for this device) having the driver work
out a mapping of those times to timeslots.  That feels genericish, you
might also have things like mode changes but it'd cover a lot of the
cases.

On the other hand this is the sort of thing that is often just not
configurable and where people often make weird and inflexible hardware
so things that do implement it are likely to end up wanting to add a
bunch of constraints which might be a lot of hassle.

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDLdzsACgkQJNaLcl1U
h9Cy9wf/ROgBTEBrrxZAUNZNi+NXNQw980J3z3LZGhLX5EOkMxzPPXdy0EuF0ek6
NJuBOiyrmSj8i1YDSY9CVcR5TSDjqL8oJGzCo5KBtfW6dXEOxHfAhlQNhIlKBgVI
YLd6Zg+D7L1EfCNx4yf98DBXaqqZuVHe4aOLP8HmjR6+8QoJBlYso0DeM7CqLKo2
jpe6mV/ihm73qeSa0WMQ9/lEln/DZ1q/xivNbYjmLqchXIp8/KilF0vw6yuVLlJY
QY2I012mnmGL/MtWmJohwU7aWZaTK+J8PMpKjglre25GCf2i/29PL68q9xwwwB4r
5VVzFXJo0iqqEAShFU6/dgitjQRSGw==
=eGjM
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--


--===============6805137784555976999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6805137784555976999==--

