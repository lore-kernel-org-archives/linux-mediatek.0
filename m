Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E969DC282DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 19:49:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB63206ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 19:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLm+VTJg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB63206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jpZZZcQD/ZtrlGB0yw4JGPDyQV73koGViLeGutox6dY=; b=HLm+VTJg3sngIR7sEyQRIZJ6z
	A94VS7FfAVWwFSUjs1IaXblnGeCbY7gVhoK0q+e+HVBXuaY4zjBcOdnpfGH6VtgTXlAFAmUNWPoub
	SGTOnAhqEABviPgSx6sxtkVDC5l3X/kfqBot3t/ZF6GFo4T11UxFZtjpqOCyDWqDixQL0XMhA3w9Y
	cBRvQJBei+4xgvtggFPMTzlIsIyInyaat4FZiVH2keR/KePzLgtG4Wr8xejCRNEl40SIpf36j2dsW
	nhJ6mYCp4GDiG6AKL15xi0KQ1K3IecPksrHIUkQbnTyjFPa3EAjt29jmM4UgmZkO1oDevxM8nOPGD
	O2Ax4fUuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdoO-0000ee-7L; Thu, 09 Jan 2020 19:49:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdoF-0000WI-0K; Thu, 09 Jan 2020 19:49:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2264531B;
 Thu,  9 Jan 2020 11:49:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CFEA3F534;
 Thu,  9 Jan 2020 11:49:31 -0800 (PST)
Date: Thu, 9 Jan 2020 19:49:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add support for a second regulator
 for the GPU
Message-ID: <20200109194930.GD3702@sirena.org.uk>
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-5-drinkcat@chromium.org>
 <20200108132302.GA3817@sirena.org.uk>
 <CANMq1KBo8ND+YDHaCw3yZZ0RUr69-NSUcVbqu38DuZvHUB-LFw@mail.gmail.com>
 <09ddfac3-da8d-c039-92a0-d0f51dc3fea5@arm.com>
 <20200109162814.GB3702@sirena.org.uk>
 <a40baddb-cbab-d8fc-3fd9-0582f1b5b24e@arm.com>
MIME-Version: 1.0
In-Reply-To: <a40baddb-cbab-d8fc-3fd9-0582f1b5b24e@arm.com>
X-Cookie: Killing turkeys causes winter.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_114935_136161_4879AD03 
X-CRM114-Status: GOOD (  29.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1994723687520357620=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1994723687520357620==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 09, 2020 at 04:53:02PM +0000, Steven Price wrote:
> On 09/01/2020 16:28, Mark Brown wrote:
> > On Thu, Jan 09, 2020 at 02:14:42PM +0000, Steven Price wrote:

> > > I'm not sure if it's better, but could we just encode the list of
> > > regulators into device tree. I'm a bit worried about special casing an
> > > "sram" regulator given that other platforms might have a similar
> > > situation but call the second regulator a different name.

> > Obviously the list of regulators bound on a given platform is encoded in
> > the device tree but you shouldn't really be relying on that to figure
> > out what to request in the driver - the driver should know what it's
> > expecting.

> From a driver perspective we don't expect to have to worry about power
> domains/multiple regulators - the hardware provides a bunch of power
> registers to turn on/off various parts of the hardware and this should be
> linked (in hardware) to a PDC which sorts it out. The GPU/PDC handles the
> required sequencing. So it *should* be a case of turn power/clocks on and
> go.

Ah, the well abstracted and consistent hardware with which we are all so
fortunate to work :) .  More seriously perhaps the thing to do here is
create a driver that provides a soft PDC and then push all the special
case handling into that?  It can then get instantiated based on the
compatible or perhaps represented directly in the device tree if that
makes sense.

> However certain integrations may have quirks such that there are physically
> multiple supplies. These are expected to all be turned on before using the
> GPU. Quite how this is best represented is something I'm not sure about.

If they're always on and don't ever change then that's really easy to
represent in the DT without involving drivers, it's when you need to
actively manage them that it's more effort.

> > Bear in mind that getting regulator stuff wrong can result
> > in physical damage to the system so it pays to be careful and to
> > consider that platform integrators have a tendency to rely on things
> > that just happen to work but aren't a good idea or accurate
> > representations of the system.  It's certainly *possible* to do
> > something like that, the information is there, but I would not in any
> > way recommend doing things that way as it's likely to not be robust.

> > The possibility that the regulator setup may vary on other platforms
> > (which I'd expect TBH) does suggest that just requesting a bunch of
> > supply names optionally and hoping that we got all the ones that are
> > important on a given platform is going to lead to trouble down the line.

> Certainly if we miss a regulator the GPU isn't going to work properly (some
> cores won't be able to power up successfully). However at the moment the
> driver will happily do this if someone provides it with a DT which includes
> regulators that it doesn't know about. So I'm not sure how adding special
> case code for a SoC would help here.

I thought this SoC neeed to vary the voltage on both rails as part of
the power management?  Things like that can lead to hardware damage if
we go out of spec far enough for long enough - there can be requirements
like keeping one rail a certain voltage above another or whatever.

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Xg8kACgkQJNaLcl1U
h9DhIQf9HZ2Q1blNvGt1n4U2y9oZgTgphMEa0JMJU6uCB4DzokV/ki8co9SwPcFC
feV+gosXXo6A98jenPsWIobEfWSUiwEYa5w3ClUYlcVrKLIwlUmThXvSiIS1+uva
LEnxvF+4WP37piAr891qK5iZdpOoMniy8m1bBXSm75midArEGcV2rqCorXEStIih
LNey+eFBxgweMQNmVL/FElCItrW6+x9HyxEGdBL4TLDMOpxC1cb/qyQUs9dAlRwQ
evp+V1ZYh5rSuQqAF5XEJwA+f8k33X0VJki7BJ+Nh3IkQpVWtg0ORKW3e4hw5+DW
B6Gvn1/3P+OYjc/Azm6w18G1USraiQ==
=M45L
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--


--===============1994723687520357620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1994723687520357620==--

