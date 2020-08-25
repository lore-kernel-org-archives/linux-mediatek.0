Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01441C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:34:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19B320706
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7QgaHtg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTqCrQ8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C19B320706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ljJlIslJ9kIxRokHqMIgjQnjlIvmhGfHQGWqBcJp2Qc=; b=d7QgaHtg9TQnUBOsyJigHwAdh
	XJAsm9qGMSzsHCAq4FCuduuOEAIlgqpdpr0hAmn0z/hI/6aJTzo1Sl9XxksPxXjhnCDstOgR2KvhC
	+JWeP82ejMDi+pK4Ksj5/ogNfFrS7B0NLm5JNbdDWxqSkkzizDPvvKO4M6PoCqP/Wc1gbuFUW/ktn
	/Byg2IQBrkxY+9R1mbAr9ev5aqicE1/ulMHeOmE+6gjTJLaYYZ2poRBBuMVfQO+txYP2RaKJRUcw+
	D4+t++CKCOt9nKdQz+dog2MqX1fV/bl4u1xleyP5dfRlNz7cFFdn8iUDXO0stFuUijLoqsMc+ypKT
	ipHl4jO5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAVLp-0007rQ-TK; Tue, 25 Aug 2020 09:34:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVLl-0007qC-D3; Tue, 25 Aug 2020 09:34:42 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96D8820706;
 Tue, 25 Aug 2020 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598348080;
 bh=iLhF9CJwZ8QUh5DuvKsLlkhW2dg54+n1MTOWIYJs+9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTqCrQ8br8SvcPLpu342YqgAXUZTdk11PQz2Du4qg5vwpjaGIeiewhlS2e+9cP5z+
 JjykoK9uYm5+7Q7C5s8rUAZ/ZmWre4R/+Bu6XdbrmgATdWqzXsCOenWNKvNpzjKwkq
 bz47p0VqD5HiByf0Nd+1t7IAJqV5rTtU/TYt1+ps=
Date: Tue, 25 Aug 2020 10:34:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
Message-ID: <20200825093404.GB5379@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
 <20200824194840.GF4676@sirena.org.uk>
 <CAE+NS37p38dAN1bAi_VvEYYGNiWDVFKrdHL-hTgi2nim_7Zvqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS37p38dAN1bAi_VvEYYGNiWDVFKrdHL-hTgi2nim_7Zvqw@mail.gmail.com>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_053441_516519_723D51BC 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: multipart/mixed; boundary="===============8526668506793884400=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8526668506793884400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 05:21:06PM +0800, Gene Chen wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:49=E5=AF=AB=E9=81=93=EF=BC=9A

> > So shouldn't there be a documented LDO_VIN1/2 then?

> LDO_VINx is HW design layout, so actually it can't be changed by device t=
ree.
> LDO_VIN1/LDO_VIN2 supply from VSYS, not regulator, so I think usually
> not to show the supply from in device tree.
> or I should declare a dummy reference to system power like "*-supply =3D
> <&system_power>;"?

When you say it's from the hardware design do you mean it's fixed by the
silicon or is this something that's fixed in the board?

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9E2wsACgkQJNaLcl1U
h9DBaAf/UJOBy/iygjB9JFJ4GtbOAjn/N/rUqf1/KFMnz3cPKgQYUsIJGpdxmbn5
DiJcykHC4+eYbi6+EjG+YXvfTeqXZiqBZgYy2fgI0foL8niNbNR4l4f2dizSAusa
FzlufGHoNmhjW/frLoBo544S4VCf3g/bXwum3c+bkGZCeT4uwKT8spBK1Dqt/69N
bWgQB+uCUjC0vRlMAZAnbAR45zd0H8B/eLyjIK1qGXoEeUpMQPPYbGyg1GypOK6n
h5E6oy2FV29bq/+vsCQ6uf6Xy+CWtkHma69fI1hWNP4SXzePWEpOW5TZbHb/3E3t
SgvJzDJJ2VxGUsR2uxU/jhedGNW/Ag==
=aMgv
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--


--===============8526668506793884400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8526668506793884400==--

