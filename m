Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21F9C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:05:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4667206B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFLVrA3I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uI7LWHi3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4667206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I1Ukgz2a82/4OFxxZWHbmYO8XkyJv6nOEyazh5X+hIk=; b=lFLVrA3Il2Qgm3P0GWES4bm3A
	/BhBbKAHZMOFxxhxlW4fRuW1Wgms9bXI7DO8RlYIEobjgJrqueyIIEY5AavxSarwoUqAXSmk8e7r/
	KTUfyMudBi/ABoqmxEejiGCB0Y4BfchJZVwrC6EOPi1oGGOi634X2Tq2uzzgI6H1xbfbuljpCG7Jh
	YO/mUtpcfdEimMoVLLqE5IePCLsWj84zrylghmrmli3nBM2SxT4bedf3wqqvLUizPbwE564847T9f
	vrs6vYJpCAPeRgTngmSXq4hx9Nm4gwhW5OZzxc4Hxxj+R53sTCHnNSCVTR4ZgQJaWBcuT20Hc6iFI
	TbVro9yCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAAID-0007D5-Sd; Mon, 24 Aug 2020 11:05:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAAI9-0007Bl-Tw; Mon, 24 Aug 2020 11:05:34 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0443206B5;
 Mon, 24 Aug 2020 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598267133;
 bh=9APzb+PIK28bYSi6UfNZRcD15AFZZuBMXg3adS+rpc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uI7LWHi3gy3FVvYd39Lj7Q3nWy2hq5jsyryJzwcxW8RTZqgwfjWbctyzU/z8DKTwN
 hEGSqZctJAo3maBX3X/U31Vy/iO8Kc6l+uyjeNlDBFRcy9QqzfncV+KgQ//CNQHSX7
 YpwbJwTP39TX8nppWsgCeYU3GGpGn9siQaUw/yoo=
Date: Mon, 24 Aug 2020 12:04:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 1/2] regulator: mt6360: Add support for MT6360 regulator
Message-ID: <20200824110458.GB4676@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200820114524.GC5854@sirena.org.uk>
 <CAE+NS34WuWnT7zvsHhaciWVLT2y0wpwt0wXAp3UmjEuJ2its6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS34WuWnT7zvsHhaciWVLT2y0wpwt0wXAp3UmjEuJ2its6A@mail.gmail.com>
X-Cookie: Weekend, where are you?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_070534_051215_C5323BB6 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: multipart/mixed; boundary="===============1238285479767076548=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1238285479767076548==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 06:23:19PM +0800, Gene Chen wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:45=E5=AF=AB=E9=81=93=EF=BC=9A

> > This device only exists in the context of a single parent device, there
> > should be no need for a compatible string here - this is just a detail
> > of how Linux does things.  The MFD should just instntiate the platform
> > device.

> Trying to autoload module without of_id_table will cause run-time error:
> ueventd: LoadWithAliases was unable to load
> of:NregulatorT(null)Cmediatek,mt6360-regulator

You shouldn't have this described in the device tree at all, like I say
the MFD should just instantiate the platform device.

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9DntoACgkQJNaLcl1U
h9AI7Qf/aKJwrqZi6N40mt5MpwiV+hZ9suHb3xMS5nDmfB/Wbs5e2QhLRELVG8Di
V/J+aX+cSq7xN9elG/yRpB6Rv3jEZ+HuzNgWnZT6EEwTO6BFa8JdiDS9Ya9JzOf4
I9mT76nHMMxb0io4hTy0YjxbZIh0BtHU9NK97n3LsG7btQLsQD2eZfdVQHU6RUFy
A55EqlQAvNBZ/fRrl0uJmE7iuuOz9KISKypEcBi96+ztklTRTsoet/9XqoqghOkO
ch9U8SL21g3Y5/GNW1eyHCA+ZVTeTQQ/mxO7ptJoeMU1FF9/gc7gzd0n/O17MbXH
SSApfApl1vKX5VfDD8xKLFEM+9khCw==
=rBbb
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--


--===============1238285479767076548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1238285479767076548==--

