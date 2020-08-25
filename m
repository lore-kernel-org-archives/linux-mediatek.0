Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FCDC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 10:08:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE5A2068E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 10:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJk43aoC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAHKwHhE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE5A2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2hosMzfILZaEu3biv6JR46X+etjEfE2xnUKMgUAiv8k=; b=sJk43aoCX08lrsbVpofHJo/gO
	7bXYpDHit7z9UtsDd5Tdfs0X8iSqg/EOskG6/MEznnqTcPwHA3YDeAt2H093NiXbleX73jAo84+93
	tTnPXTHQkAVcLI/27JDbKSODzWrO6mGP96IZVPQS96xC0pPjz0ggs9go9u9Xh9ZX9Si668W13JJga
	BeqJe6hAzUH/bnKPGsFPRls+uoePfZZ9Zwag1ET9gVjSYUYq3UVphiRGPO4lwzHGO5UDHJnUvyc5p
	AiN9f3OT3unOlBalju0neK8rlbBK2Hj0pdUx7RxKyZjMvTLcVH6Ty1WFXz9nak5c0K9tIIq9JHO/m
	csaF9r6UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAVsj-0001T4-BO; Tue, 25 Aug 2020 10:08:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVse-0001S2-Kh; Tue, 25 Aug 2020 10:08:41 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A7F52068E;
 Tue, 25 Aug 2020 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598350119;
 bh=n9qU1VSIX6taYiBT6mEUe2Plo9U8hi0SVYmW+Orzzd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oAHKwHhEbqG3Luk+KNI3Up89EAA3hMJmJGkV9m4yPc1m6UsLhIV28q2ZTJ9lSXR4l
 wnsPvF0CxCwEVBMzwt4znGF6GTXVcAT3C1VP9lT3jxhqWkqvIGvuPScHpuSCsFNrVE
 +/0SJQNTnYv3XgOWHf5riql3ZsVpVqXizwtWvmnw=
Date: Tue, 25 Aug 2020 11:08:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
Message-ID: <20200825100804.GD5379@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
 <20200824194840.GF4676@sirena.org.uk>
 <CAE+NS37p38dAN1bAi_VvEYYGNiWDVFKrdHL-hTgi2nim_7Zvqw@mail.gmail.com>
 <20200825093404.GB5379@sirena.org.uk>
 <CAE+NS35eh9PhRA1M2f2med52WhRsEfWp=zWUfgETq4odHouxDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS35eh9PhRA1M2f2med52WhRsEfWp=zWUfgETq4odHouxDg@mail.gmail.com>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_060840_779709_3DA44ECF 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7445152196278117848=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7445152196278117848==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 06:01:46PM +0800, Gene Chen wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:34=E5=AF=AB=E9=81=93=EF=BC=9A

> > > LDO_VINx is HW design layout, so actually it can't be changed by devi=
ce tree.
> > > LDO_VIN1/LDO_VIN2 supply from VSYS, not regulator, so I think usually
> > > not to show the supply from in device tree.
> > > or I should declare a dummy reference to system power like "*-supply =
=3D
> > > <&system_power>;"?

> > When you say it's from the hardware design do you mean it's fixed by the
> > silicon or is this something that's fixed in the board?

> fixed in the board, not silicon.

Ah, if it's fixed by the board that's exactly the sort of thing that
should be in DT - the DT describes the board so if some other system has
a different configuration then it will have a different DT.  With supply
properties you can just leave them missing in the DT, you're not
supposed to but so many systems do it that the framework will handle it.
Otherwise if you want to represent VSYS you can have a fixed voltage
regulator with no control and hook them up to it.

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9E4wMACgkQJNaLcl1U
h9Co+wf/Xf8KbC9/vFFir2BN6SL1tFkB0IvZMWZj1u+U08sPmTCIh2KRaC8xDJxI
y6HF+I7FRWlcaj9ozuuNedPeXJi29wZC7BkgExRo31AMpx+SWE3blPoJit/M/YnI
zk7ZAQKh63RF/Zaqk+drtruqz4w1yQ5vLXTLoQcbzk8YMTqfnUiBaNkFv1TCL1bq
0Qp6/LyejmL4sHZ2SF8WF0TvepxuR9EXGMB3cabyE+J8nw68QBisaHVFk99pVhul
QIqvJOTMLq/XZeHklnt1rXdmHcIFzp0FUQyx6eek6b2nMjsSPlAtozQjFxZBl9Uw
1fiHa/CwqrgxU5Iv3JIuf+WM1tMNdw==
=M9CH
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--


--===============7445152196278117848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7445152196278117848==--

