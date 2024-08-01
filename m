Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C7DC3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0BRTDKOL4ZwOxBIvmqwChx6SK9IgZhrOoIUpIoIr6s=; b=eZANm2LJIj1QDWf0NBhoqoxmMA
	c9j/KdORvF2OUv7SnFs5amrVxznMQISng6xf4KeyVAI1uYkndPUK6pyJCNYp3eri21F1bM3bwYJJa
	aJiIO0AZex+VyzPeqS31BYCZevgiQI1yRBngWgZwKm8QANDbDJO9Kj7Wpu2gNROyl/RM+s/mFJjJj
	T1j00eUPvOMuQYxM04IrWNutpPBJCRvGqqMTkdS0FPDg86NCQIdckjQeTxuIsIvZ8U67+F0ThUQnn
	yhDbhBahSuorud4kFmbAj547DgoOXFhIw9e5YZcTWIIDindVedxvp6zkJcCeMM+NTuFiEDoUBe87A
	umuNxCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR0E-00000004JG3-0u8v;
	Thu, 01 Aug 2024 08:17:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQyG-00000004It8-3oLN;
	Thu, 01 Aug 2024 08:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B364CE1896;
	Thu,  1 Aug 2024 08:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8FCC4AF0A;
	Thu,  1 Aug 2024 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722500134;
	bh=D0BRTDKOL4ZwOxBIvmqwChx6SK9IgZhrOoIUpIoIr6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXhvcHMMa7wLCwAmyAaKJozjxb+FP5FormbfFAsDQIujiZX7/RP2q+LrP3MXfktZ9
	 dC7f0zMu4NJmWmZp2yzL05tLud0ykUVpsL7mdZj4NkC3Vo/PR1LO4cQ0dhdmWMJyvb
	 z0jxTjraCKhhrzht5s3VCG1Awqtm5D07H2n0rryh90VTUsLlPTJZ9bqEmGiWDnbuzf
	 xnsDQx8wVEsb4ALsAHiw6gRH1ky1R88gXGox1LbVstDCxeyCIcQ3cMbsRPrmkKKT8m
	 fPla8XxGkYBwER7fn73hRCu11iM4oVDHGu0hSGtM/E3L0xGy9s7/BzZKEJoG8quP/T
	 JbXhafXFtEZdw==
Date: Thu, 1 Aug 2024 10:15:31 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX
 performance
Message-ID: <ZqtEI4k2KBzz_-cr@lore-desk>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <ZqfpGVhBe3zt0x-K@lore-desk>
 <CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com>
 <20240731183718.1278048e@kernel.org>
 <CA+SN3srMPLcmQ4h_iNst71OkQPFcCYxBRL0Q9hR=7LjJ86TFFA@mail.gmail.com>
 <Zqs5hcFMx1g42Zrd@lore-desk>
 <CA+SN3spwT1hrXQRmk8TkDOfBwp66WWqEAczvNCS7QaTe_eM=Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0eNalxqZ9keOVn65"
Content-Disposition: inline
In-Reply-To: <CA+SN3spwT1hrXQRmk8TkDOfBwp66WWqEAczvNCS7QaTe_eM=Vg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_011537_337107_CC350963 
X-CRM114-Status: GOOD (  27.58  )
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


--0eNalxqZ9keOVn65
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Aug 1, 2024 at 10:30=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
> >
> > nope, I added page_pool support even for non-XDP mode for hw that does
> > not support HW-LRO. I guess mtk folks can correct me if I am wrong but
> > IIRC there were some hw limirations on mt7986/mt7988 for HW-LRO, so I am
> > not sure if it can be supported.
> I know, but if we want to add support for HWLRO alongside XDP on NETSYS2/=
3,
> we need to prevent the PP use (for HWLRO allocations) and enable it
> only when there's
> an XDP program.
> I've been told HWLRO works on the MTK SDK version.

ack, but in this case, please provide even the HW-LRO support in the same
series. Moreover, I am not sure if it is performant enough or not, we could
increase the page_pool order.
Moreover I guess we should be sure the HW-LRO works on all NETSYS2/3 hws
revisions.

Regards,
Lorenzo

>=20
> > > Other than that, for HWLRO we need contiguous pages of different order
> > > than the PP, so the creation of PP
> > > basically prevents the use of HWLRO.
> > > So we solve this LRO problem and get a performance boost with this
> > > simple change.
> > >
> > > Lorenzo's suggestion would probably improve the performance of the XDP
> > > path and we should try that nonetheless.
> >
> > nope, I mean to improve peformances even for non-XDP case with page_poo=
l frag
> > APIs.
> >
> > Regards,
> > Lorenzo
> Yes of course it would improve it for non-XDP case if we still use PP
> for non-XDP,
> but my point is we shouldn't, mainly because of HWLRO, but also the
> extra unnecessary code.

--0eNalxqZ9keOVn65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZqtEIwAKCRA6cBh0uS2t
rKCEAQCYVsSLb/+cpyxgo+0vejfJAGAfcQ4rWZE6BwZQX9gzLwD9H8bmdVfHms3q
rcqMITuGtKfT6S7dKQJa0nlKm1qxcQc=
=59Ad
-----END PGP SIGNATURE-----

--0eNalxqZ9keOVn65--

