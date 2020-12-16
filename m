Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77093C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 13:06:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093C92339F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 13:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093C92339F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bAS/cy4DcaKuCeAXcg3jnPcJdfXe0Jyyjej6bJUNNsw=; b=szyvFvvdhFMVaOEs7EADHjqA0
	sBFsyiI64KMlM5Whd/4Bcs1LRMMFlMqOSJiZ694OXTR3ek76kJ+0fwjvVj33kBXTV+LMNn7CfjZBm
	IJQNvgc3bSNotI5+3iXbjltvDjnC9SWnh97asAqncrDXYw5y6t3hWDlDaaQrjr+oL5mH7k72m3HyU
	hlI0kG2+Cf7tD9ntcaLEcqWqb6nHEvC0wrpL5FVUDbj81EOe69V736tPBeOo6QbUvZKsSRlWJrnt0
	irdGlPTMPsKTZnipjtvaTJ1gPRaaYz57uv7RSD10KdBNTZfwzo20+Txp5cQgXSFsSsQEOCyWHc4Xk
	KbyOYgjyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpWVQ-0004Gb-37; Wed, 16 Dec 2020 13:06:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpWVG-0004EK-Mm; Wed, 16 Dec 2020 13:06:08 +0000
Date: Wed, 16 Dec 2020 13:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608123960;
 bh=ALw34jiEl86mBurBzfxl0tOMaimss71WQubD/eersP0=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=GkUlXoUqfH7AMVen7+kTNBZrIT15FrRVQrcoN5uf9vWQUnw52d9M4Lt5EHM2bEiS7
 3yP4jofptHGqnfR4M5ni/8WZgtYE+473sJCEIsUlM4K0JgvccEwd9pQfMoYDeHdUoj
 kDEuscPgpEq2S/Vs3ZgpvNwxwXDM59kzm/JxbT1M+1wqAjrhJxXlWe07qjswpSDzqi
 mMYA27ivgAUesCbBX2nyuh+nJMrxNGRPR0QG03qTcVwKmi8nkYeQ0ymH1BU0F0/LiS
 MZFHClT8P2z6il0AB8DLPniofSq+VFsEKSA61DGmABs/4LIliStdPo1jcirr4lMBUS
 uui2ldL5NpVCQ==
From: Mark Brown <broonie@kernel.org>
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20201216130548.GB4861@sirena.org.uk>
References: <1600688895-9238-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1600688895-9238-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200923162458.GE5707@sirena.org.uk>
 <1608093259.2412.1.camel@mtksdaap41>
MIME-Version: 1.0
In-Reply-To: <1608093259.2412.1.camel@mtksdaap41>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_080602_856633_8605E5A4 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0460254095238593743=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0460254095238593743==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 16, 2020 at 12:34:19PM +0800, Hsin-hsiung Wang wrote:
> On Wed, 2020-09-23 at 17:24 +0100, Mark Brown wrote:
> > On Mon, Sep 21, 2020 at 07:48:10PM +0800, Hsin-Hsiung Wang wrote:

> > > +Required properties:
> > > +- compatible: "mediatek,mt6359-regulator"

> > The compatible isn't used by the driver (which is good!) so should be
> > dropped from the binding document.

> Thanks for your comments, but I have a question about it.
> When I remove the compatible name in the dts, there will be some error
> message:
> [    0.437562] mt6359-regulator: Failed to locate of_node [id: -1]
> [    0.440612] mt6359-sound: Failed to locate of_node [id: -1]

> Do you mean that we don't need any compatible name in dts, mfd and
> regulator driver?

The MFD driver and DT node for the MFD will need a compatible.  The
regulator function doesn't, it can just look things up based on the
parent.

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/aBiwACgkQJNaLcl1U
h9BpsAf/ZcnBIEPcD7SDXA0f+nRK2nTgqxGl+ninbflyHQWOCGfH2VqFE0jRLA9k
pZKghp6k+8G/5HthjAqCsEJ4n/5QL2e63D5JolYrBHxlBOdzqP0f5nJvE19fNaXr
+bgOqreW88GYbowu/EsMKV1xtTBeGor0xF/KDrfX5v4eMUp+GZ8a3rQgT8qAuswj
krBGwWaE8KGODbqNqBQj5KpNlI+NC2TrhdpdKd1R5vbtaXAX5uG3thZXHI6TdpFr
nw5GZzINEdcFS9QF9EtGKAEGmuaR3v2QqwTfO3HO9v2i/wz04DTOIRRu9wMI9sfi
4XuWbq1FpiWisM1J7Wcq2yOVPb69kg==
=t2MN
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--


--===============0460254095238593743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0460254095238593743==--

