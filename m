Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF46C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeuQUqx3/XnP3kl4fdTaJHE8QfJAHQ/nRMORFZZv5YM=; b=IqPMYri/L9Zmisarjn7j6ANSMy
	9sAAIxnHbY1SzdBHPgNElhCrKauWJ1YNvgZpHlVTGbxtAPValc4uCfoVyjJz1AEEjGi1+eJuRQsha
	0+N8mfRMOCyvhOuKS82QUp2UZiCThNnAfLzpLxbMDI5JeVMylNEGrDOLuWeh5WEUIiBDFXKcnj8Pn
	1bFtAUt+xl5kac9pqGmrErHc1pV/QrJ82/e7V6GdMdwlMBDNrEzqKUN0ikU5TbYjZoSnt6YUwdX7u
	WZSlnf1+pV16N22Ooyq6HKzkMhP6Rr8a79DQXS7J0CL/tpdnJPKYX3QiFMgX61HLg4oFql+43mucr
	RxQJKVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPnA6-00CmIk-1O;
	Tue, 16 Jan 2024 17:23:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPnA3-00CmI9-1C;
	Tue, 16 Jan 2024 17:23:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF54C612A4;
	Tue, 16 Jan 2024 17:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004E1C433C7;
	Tue, 16 Jan 2024 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705425783;
	bh=aeuQUqx3/XnP3kl4fdTaJHE8QfJAHQ/nRMORFZZv5YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0SGn7KrXcA80C/xwi0Z/mSipWXyXqCfPLSkw8/pmneo+TeIxjJ5ef//g/+gfjqX8
	 bST+sdWxN9OIeGmD/WDg09AfEKZQPeORVSPwoSLFITnywfu/xQ71X3zrn2ycopwH1T
	 TZMvhEN9azPOhg8i+XRETu8SU63SVn1DIj+srzW1LOtgOJE8iKF3nfFu5w1nCWt0Bw
	 ERRZMoqBmAm1cxhQ4rKhlzRJsPSMnW9eBw3ErsdnION2LTyF30AbptlsXbq7Ty1aYK
	 CISRiIbfNciN83cXBjh/7Y6NG2Uo8vy/lzCk8Dlou5ukI1CMlpFdJnrDR/mm4Jq6hD
	 ItS9GqpuVQCkA==
Date: Tue, 16 Jan 2024 17:22:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	Johnson Wang =?utf-8?B?KOeOi+iBlumRqyk=?= <Johnson.Wang@mediatek.com>,
	Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Jason-ch Chen =?utf-8?B?KOmZs+W7uuixqik=?= <Jason-ch.Chen@mediatek.com>,
	Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>,
	Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: mailbox: mediatek: gce-mailbox: Add
 reference to gce-props.yaml
Message-ID: <20240116-cancel-perpetual-08320e21ec33@spud>
References: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
 <20240110063532.14124-3-jason-jh.lin@mediatek.com>
 <20240110-grumbling-tattling-0202fc5e21f2@spud>
 <8c4004d5b6f68dc096aaf2a537e429c310b60c08.camel@mediatek.com>
 <20240111-anthology-dock-c60d28ac7f1c@spud>
 <5eaccb10853215a6399759a715d2f0356782bac9.camel@mediatek.com>
 <20240115-player-waltz-8efb5885a23f@spud>
 <4f1e6bdb3e266cf0e89f8a664095ea1709f9afe0.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6o/PZYXOtaXbB6O9"
Content-Disposition: inline
In-Reply-To: <4f1e6bdb3e266cf0e89f8a664095ea1709f9afe0.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_092339_501103_0875DA90 
X-CRM114-Status: GOOD (  37.79  )
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


--6o/PZYXOtaXbB6O9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 08:21:15AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) wrote:
> On Mon, 2024-01-15 at 17:23 +0000, Conor Dooley wrote:
> > On Fri, Jan 12, 2024 at 07:44:13AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > > On Thu, 2024-01-11 at 17:31 +0000, Conor Dooley wrote:
> > > > On Wed, Jan 10, 2024 at 04:36:20PM +0000, Jason-JH Lin (=E6=9E=97=
=E7=9D=BF=E7=A5=A5)

> > > > > 2. We'll have the secure CMDQ mailbox driver in the future
> > > > > patch
> > > > > [1].
> > > > > It will request or reserve a mailbox channel, which is a
> > > > > dedicate
> > > > > GCE
> > > > > thread, as a secure IRQ handler. This GCE thread executes a
> > > > > looping
> > > > > instruction set that keeps waiting for the gce-event set from
> > > > > another
> > > > > GCE thread in the secure world. So we also need to tell the
> > > > > CMDQ
> > > > > driver
> > > > > what gce-event need to be waited.
> > > >=20
> > > > Ditto here, what level does this vary at? Do different SoCs or
> > > > different
> > > > boards/platforms dictate the value?
> > >=20
> > > It's a SoC level, the SoC supports secure feature will need this
> > > property.
> > >=20
> > > > Could this channel be determined from the soc-specific
> > > > compatible?
> > > >=20
> > > > In other words, please explain in your commit message why this
> > > > requires
> > > > a property and is not detectable from any existing mechanism.
> > > > From
> > > > reading this I don't know what is preventing the secure mailbox
> > > > channel
> > > > from picking a "random" unused channel.
> > >=20
> > > The secure channel could be dedicated from the soc-specific
> > > compatible,
> > > but the event ID couldn't.
> > >=20
> > > The same event signal corresponding event ID may changes in
> > > different
> > > SoC.
> > > E.g.
> > > The HW event signal for CMDQ_EVENT_VDO0_MUTEX_STREAM_DONE_0 is
> > > corresponding to GCE event ID: 574 in MT8188, but it's
> > > corresponding to
> > > eventID: 597 in MT8195.
> >=20
> > Is it always 574 in MT8188 and always 597 in MT8195?
> >=20
> Yes, some gce-events are hardware bound and they can not change by
> software. For example, in MT8195, when VDO0_MUTEX is stream done,
> VDO_MUTEX will send an event signal to GCE, and the value of event
> ID:597 will be set to 1. In MT8188, the value of event ID: 574 will be
> set to 1 when VOD0_MUTEX is stream done.
>=20
> Some of gce-events are not hardware bound and they can change by
> software. For example, in MT8188, we can take the event ID: 855 that is
> not bound to any hardware to set its value to 1 when the driver in
> secure world completes a task. But in MT8195, the event ID: 855 is
> already bound to VDEC_LAT1, so we have to take another event ID to
> achieve the same purpose.
> This event ID can be change any IDs that is not bound to any hardware
> and is not use in any software driver yet.
> We can see if the event ID is bound to the hardware or is used by
> software driver in the header
> include/de-bindings/mailbox/mediatek,mt8188-gce.h.

I see. Bring this particular patch back with your future series that
adds support for the secure channel then.

Thanks,
Conor.

--6o/PZYXOtaXbB6O9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaa7cQAKCRB4tDGHoIJi
0qusAQC4vZ+1x8P8AmGrCXPV8uhPrW4y/28p8NsA0qLh9iIu4wEA7K74gMAGklLL
9RRduns7EsZP8DogMqz9HEU2u3MHSg4=
=QOwU
-----END PGP SIGNATURE-----

--6o/PZYXOtaXbB6O9--

