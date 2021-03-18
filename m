Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39073C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 13:31:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C719164F04
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 13:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C719164F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1scciBARuWuJgtguRu/bZaxza/Pap3VZYKGUxWUE/JI=; b=IyY9umHQQrrOof7wv3YdFUZ/t
	7QSiCB1hD3aTrx4d3+9QYY+gll66YHJT4Sh/J7FmXIZQZkAQYXEB9YeOWHrHCTnT4v3wrX1KeicIl
	QoefVPtToXCAnhuN/WyQT+f8e4VKqwGCfGnUReW3wtBxFJQU7Yl6GFJbKUkAOpICjaKpbADMMnGlF
	yV2gfYKFRsSs85u1CVLVMoJlUvIS0HVOJeItf2eBWRiXfCOTroDsVlfhUYUl6IdyomqfD6D0CDISU
	N4bzIw3dgPOLZEn0ciFm2XXEV0uLotIVvqWnB++b1NS5Cn1XQabdMYqCaXir5bNyLllaiqCnN7Jgv
	LgiiDdeOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMskD-005NJl-Fk; Thu, 18 Mar 2021 13:31:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMsk3-005NID-4D; Thu, 18 Mar 2021 13:31:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CB264F04;
 Thu, 18 Mar 2021 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616074268;
 bh=z6sAQQqqwq+ku08MYCtNPa0qu8qdyolLoJHSKZAiyFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HOooP3WlYZhHVmkIfSWQzBPToHUYNbODzRLzjmQQnPqEXq4AUHzbNj1OWgQ2zErmT
 wjvDGysvPt0TbZ+KVZx38qAJVQxrdKhHTx/nUPYCa1/hPpr/ArqGIM73K1jGXCpyrm
 8WqZ9Y0+9eG+dXl3r1H0eC+N5ee6NRAN/GdvBw076HjHhMnW0NKT3cy8rhZYaABip/
 G2XsVrwj6/uby/9rwoFejERUWl1MrDld8/ZV4EPUgHgSDLyjhDISkzOZV+JtKlHlmS
 Tgz/7OrB7B3Z+CIKyN7k40fey1ikyHT9zfVEHWZ04gosyQsrIRjyZ2gAsaSY2abRTv
 Cus/d36uf0u4A==
Date: Thu, 18 Mar 2021 13:31:05 +0000
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@kernel.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 4/7] regulator: mediatek: Add regulators_node to
 description
Message-ID: <20210318133105.GI5469@sirena.org.uk>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
 <20210312145545.26050-4-matthias.bgg@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210312145545.26050-4-matthias.bgg@kernel.org>
X-Cookie: You are false data.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_133111_671646_65290BD4 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6089911052847202638=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6089911052847202638==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U3s59FfKcByyGl+j"
Content-Disposition: inline


--U3s59FfKcByyGl+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 03:55:42PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
>=20
> Define the regulator node under which the regulators are described.

Acked-by: Mark Brown <broonie@kernel.org>

--U3s59FfKcByyGl+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBTVhgACgkQJNaLcl1U
h9B0rwgAhWIFbjnu1R958nrCRqX4nGCc4cq5VC68qC4FckALc9suDvP9cDSehbpy
UFRsmu9IUBa4CZJA5bnvRgpxlfWWk5dURVm+Mk2L6JTtEtgJnnUPb2ZVJdmqvsGc
P4CgJjG7i8fpadCWfg3gICTCJTrkmL6c4v4u5OykKVZJ1Sk/qpoSwQ4t1A2kl+dR
fVuMeEChMUWur8BWYo+4m6Hu5/t4hpm0D+a1me4IKc1W86NWUGh1VHMOAsKiW+1T
jY1F0wHnEbBhhkS8cYmajecLEtddOk5nUgXRvXRZVcqZOWnjS/yOtws/o16fop78
PuyJaHJbD3++kKfDbLX0fYazdWR3bQ==
=R5ld
-----END PGP SIGNATURE-----

--U3s59FfKcByyGl+j--


--===============6089911052847202638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6089911052847202638==--

