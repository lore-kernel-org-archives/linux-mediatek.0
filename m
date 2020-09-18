Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4085C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 10:06:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F687208B8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 10:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ouceDmbB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJOegUPR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F687208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lCiZpw8iFtcuXNZVEUjwUP+dE0GlOSq8cpw9IpXpF6w=; b=ouceDmbBWLYwJTK0Dt425weRE
	NlBUUQq2nbcT/+A4U2lMnXLOSoJBgMWFyr74Hc3OjbJnURd9TdGqMK5Is6P0MTevlW8fQanAsJ+ei
	g6RKTDzBID/GN0i2jOLeZhawNBbC7cXhXwAm75xVtOvJ8a16LZsEDFQQdn6i2pEjL1dTeyUn0qXJW
	htGl9JOZ+0XOaT6KTj/CUrTUSB48z8aTYM659DNEW0prv7tbmj6kwxm4WKX2USWRQm5Sbky9OlGUp
	68nMwNWcNmgOPnbwrCMXq7Bcj/t2x3khs9qH2kb0oQA8+uYekJTXS3/uxdaz4Se/4j4RF+dw6gjOi
	OQ2/MxwPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJDI2-0003VL-JE; Fri, 18 Sep 2020 10:06:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJDI1-0003Uh-2T
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 10:06:49 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 278E1208B8;
 Fri, 18 Sep 2020 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600423607;
 bh=V1UR/oMfYclAQFVbLCQej+74LjNSUS6YHHIZUTJOjvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJOegUPRHafH1Q8GTSSJwmwNgPiPKBaaXPF3RUU6RQj7JIWS+jXfLkRVaNjQBHp55
 6SsbYecbaeXFn5DMNW+kKT0pFn5iQAY2pxoF0W+l3I1vCcYjGrie/GkHXukEk1nn5z
 dtRh/A536DgIlixmtv5NI8XjoGDG3PCbjBeB/gS4=
Date: Fri, 18 Sep 2020 11:05:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shane Chien <shane.chien@mediatek.com>
Subject: Re: [PATCH 0/1] Use memset_io to access I/O memory
Message-ID: <20200918100557.GC5703@sirena.org.uk>
References: <1600423219-29058-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600423219-29058-1-git-send-email-shane.chien@mediatek.com>
X-Cookie: Beware of geeks bearing graft.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_060649_213946_B9C0CD0E 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/mixed; boundary="===============1236395961002142940=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1236395961002142940==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 06:00:18PM +0800, Shane Chien wrote:
> From: "Shane.Chien" <shane.chien@mediatek.com>
>=20
> Use memset_io to access I/O memory, instead of
> memset.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9khoQACgkQJNaLcl1U
h9DtOwf/WTTtgps3JFXuBDzVizur5HrnD6gYOcj1TkF0zTEjc6nIYk1whl18GX2U
VAwmX8EzHwafKucWuQDRbB0bYN6Zrlo1Lm9OCJAUaAHgKeajlo1DcT2Jgryo9IGK
Dn3V8g736VJNJhxhc7yFwS+lEaKhHceVtFbjyDH9zYeD9B4zOc6E1pHHIJGEGNPb
+ebRwCOPzRJGb0St9GqtFEwaTLc8KWxNSDGt7BzQWpx6X82QcxO5JfQEPrwxFhGH
E2JPvzmisE3hNtY6Sb54Wq6tNoulmC9X6QKALIPD/6v3OIEePwzQSlNRI8qNegSM
uAXb3kdPY/j1FQbnVXl4RidsWKoSiw==
=1WN4
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--


--===============1236395961002142940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1236395961002142940==--

