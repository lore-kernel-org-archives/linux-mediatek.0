Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C10C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxA56lcClYQgcxSH9kn0eLVYQZH1vrJtSUbCUV2semo=; b=oieqyN08oSoxRsHdgOspWkhip7
	1owxgG+DHRAGSADfyhGNDJvTo0InR5IH7+GfmBmjJF8EATQwpnTHAi8BqdIsh90vfewCS+Lf25ulB
	WhZ+s3o5CovGWqkAQQ35qZHd0NmJ/P8DoPFozbaz2mCyFAugMRY/2TTvsDyqsPiiHHD0THKeFsPHo
	xAfSFdCEU97XnhP1K8o/UagG49hNU6I8b1SOUTekFz8ARw0yZDdq8vJHCqZKQMqS/P52iO0VghuIb
	30DP5r3LcbxlNYTXCr4lrzLkZsLjmsWClCCz5bbzwg+YhzjXYWxhicrXbj7d/89VHkWKVjvh0ZvK8
	d1MOQ9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKt1-00000004czm-2bqK;
	Wed, 29 May 2024 15:06:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKsy-00000004cz1-2vWn
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 15:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13533611B5;
	Wed, 29 May 2024 15:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40132C113CC;
	Wed, 29 May 2024 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716995199;
	bh=yxA56lcClYQgcxSH9kn0eLVYQZH1vrJtSUbCUV2semo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFxG5yzWTMSQT6N3jnRJ0bnhcPnsNZQrECVd7k7ZcJ0gU9IthcYCQ24pPqO85Y66K
	 An4W5By91u6ZfG8k4kir6NbaXA2e4deuoTzIFGibG1dDoNNuTxDukt37L1ATnMJvVV
	 qMPaHWpvJuTMneZP5DDgOuF26pVUdRdfO5IKn47zfZ7n8W25H+9u89ZZS972lZ2v/6
	 jcKZEbxn4hRIL4kNuHoho/1NaCRwPOjnvhIp/z8qsJoW9WX1GCXHWNvQKLPlVJF2/2
	 Gepy5hc0yc0tcXGj5cIyOzuNW3SdNzoxpCNpO/FaFlxn0J5PucRmHZ0fZ5BOfFfNHY
	 2FQ124DiJNopw==
Date: Wed, 29 May 2024 17:06:36 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, daniel@makrotopia.org,
	dqfext@gmail.com, sean.wang@mediatek.com, andrew@lunn.ch,
	f.fainelli@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	nbd@nbd.name
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add debugfs support
Message-ID: <ZldEfH1Yy0cH2-OS@lore-desk>
References: <0999545cf558ded50087e174096bb631e59b5583.1716979901.git.lorenzo@kernel.org>
 <20240529133130.namqhprxpvhzgkzr@skbuf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/RtT3VCISYzBUF7O"
Content-Disposition: inline
In-Reply-To: <20240529133130.namqhprxpvhzgkzr@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_080640_815559_4ECB7A93 
X-CRM114-Status: GOOD (  14.11  )
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


--/RtT3VCISYzBUF7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On Wed, May 29, 2024 at 12:54:37PM +0200, Lorenzo Bianconi wrote:
> > Introduce debugfs support for mt7530 dsa switch.
> > Add the capability to read or write device registers through debugfs:
> >=20
> > $echo 0x7ffc > regidx
> > $cat regval
> > 0x75300000
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
>=20
> Apart from the obvious NACK on permitting user space to alter random
> registers outside of the driver's control.
>=20
> Have you looked at /sys/kernel/debug/regmap/? Or at ethtool --register-du=
mp?

ack, regmap sysfs is fine to dump registers value.
It was just very handy for me to have the capability to change registers
during development (moreover we already have something similar in mt76).
Anyway it is probably something more related to development so I do not
have a strong opinion on it and we discard the patch.

Regards,
Lorenzo

--/RtT3VCISYzBUF7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZldEfAAKCRA6cBh0uS2t
rLDnAP9swkHUjJEKW5Ab+4GBdK/KDD+HxQLITJ12/+o/AUuj+gD/bpboxwJozpMB
vKM1pXtTs/fZ3qr4bBQx/eqgvfRbhQk=
=+fhy
-----END PGP SIGNATURE-----

--/RtT3VCISYzBUF7O--

