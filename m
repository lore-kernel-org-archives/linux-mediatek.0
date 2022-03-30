Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+zbtKpQwWZ1rrf0mC8YCXr+hRnDpqTX3eOgtOeLdUo=; b=uHU1bM+unOtpjsyCqTxTPlMCKK
	GDxZNDJU9o8nKlLFSaXgPUIE+oqcE6HMwb7Fpq4LI3Ghmc8XQxeA1/kDPXwgC6IjKyFHUR0YcTZZS
	0ouGtH/daoZ437OzAS7qzE2gLbt5flMDQiX5u/l9QUi9VrMyMIEAud+YYIQiwCUyerV9K4t5Qr8GG
	Xh7P7aywp9gCEdrxgDU5w7aP7SLjAgPM0KwD9aMEYmE5bPDt+iVNYpJyYP5PZsTThDClFklm/aWTx
	W4rJgSD0guMZm9tK2mCF43G2u4gtcw+lyfCE6KvHqcu2TcdW5lzx39y5GWZp1eRK06xaIS2D8F7uG
	93+CjMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXsW-00Fuo8-A1; Wed, 30 Mar 2022 12:56:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZXSn-00FinP-JU; Wed, 30 Mar 2022 12:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D955B81B75;
 Wed, 30 Mar 2022 12:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B08C340EE;
 Wed, 30 Mar 2022 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648643410;
 bh=wMFzbAJ1w3I769LKcQvR0OeV1wjnRKl15NqgNqHjMPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jooz5o26y2T7lucnkeTlKNAUZ6dwp3eoPFEtxeqpOFFaLNFKr5oWouRbAlRA4eOpU
 R4GJT0rTVrF95heK9efPmE+2RKbqxBBb6hW6ti3o4Ay0qwCGCcQIlzuGopfhxvI9YH
 6DVldjBxxNxJPB+tlFbmflOjHnioNZtEYaeFwyij4glVPevgwWQqQH7h7V9QCYoVdX
 Z7ZLTB/E+L+UkqVieV7+/kkd6Z5x7SR+N4vLdwkNov88B3292HF1u+xGFVA0p8gpyH
 boOy/oJPqR5/jKoH+gw1Xrxj22CghA0VjZ1uVJ8x2X38JcHH8koY+2XJ4zOiENX9/Q
 x+1IXAavckAzw==
Date: Wed, 30 Mar 2022 13:30:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>, 
 robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YkRNSoBKFvYYyZLu@sirena.org.uk>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
X-Cookie: Two is company, three is an orgy.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_053013_844930_B5D4C7C9 
X-CRM114-Status: GOOD (  11.87  )
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
Content-Type: multipart/mixed; boundary="===============3886689049051676888=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3886689049051676888==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jOMai26txzsrB1Jf"
Content-Disposition: inline


--jOMai26txzsrB1Jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 10:33:06AM +0800, Jiaxin Yu wrote:

> "(Although I think this would technicallybreak the ABI?)"
> ==> I can't understand this question, could you help explain it in more
> detail.

Making a previously optional property required means that systems that
previously worked may stop working unless they update their DT, DTs may
be distributed separately to the kernel and perhaps even baked into
firmware or similar.

--jOMai26txzsrB1Jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJETUkACgkQJNaLcl1U
h9DbEwf+JUOC5DnLCotwK80wPY+Rv+Fxpva35UGKpU+JgyM/o50OQtmaefr3nyZ7
rItM7lPU81Hj7CJv0/hKjwsTmIVugxE7tOao1mBV9wLaStQfn2tx79wtLhiSYeNH
Ig0F79Jy0tY/TnytxA7d8XYUzguiwLqQIBbC6VHIYfO08FdMyloI+3SILPHK1VM+
SN23X+R9nG0CJImoNZMP1DDGodHkB9u+YhhB66cULenBpGMVNDKU1cPLTytp3nvP
bDz70kaMHgFqMgY01LMzQ/1TBfRMm7isoInZl6nGUnDOo9pCzmctaPZyBgRQ5mod
XaHgRucIShC8OJ16S0YCPs8CfbgvvQ==
=2Po5
-----END PGP SIGNATURE-----

--jOMai26txzsrB1Jf--


--===============3886689049051676888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3886689049051676888==--

