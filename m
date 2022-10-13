Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B9EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Db/4zGq9AnUW0anup6bunyNOeO5IJ6uMsV1WWiHKMZE=; b=XSWIymv0VS1w8RihDbR4rwvs8w
	MAWN8wLsxNmaLQrD6h0dT2oNl2IRuDmS+Ian9D/pQmCzmbLBGg0uJKx937ja3AI8phNkKvt18tL92
	+mm4cxPNPNGo72ORV/q5IrQdOEoX2/1FKdaZCyNuQLn0W8sE0XEcdiEmR6uucfP01KTbe2IdO4JpL
	yyaHKxKSFBDBelhnghNdB8s+wgQXvWbvCs/OOik2FVWedENZeeUK6Jd6IYlw8VwQCWqNvzKv2QPR1
	DEB9l93Vm0/8uyQpwWRcbykyAZh42DvzpFLFm7YL4CClipjGdCPkxdcHdCOGBZMHltYDwmYcVVAlM
	HdctXuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oittC-00B9v0-82; Thu, 13 Oct 2022 08:48:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitt8-00B9sn-II
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 08:48:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12AF061707;
	Thu, 13 Oct 2022 08:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0257CC433C1;
	Thu, 13 Oct 2022 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665650901;
	bh=Db/4zGq9AnUW0anup6bunyNOeO5IJ6uMsV1WWiHKMZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEapUYCHB06YXa23vtKTxTyzrtuKKDnXIPmDjxtiyRjGHFAQ+uMd1jDX5sqHMphi2
	 tDLE9WBt/5dpW0D1CinD7As+zXg/q/WjQgZJVorR+XJQbWb5PnYhz+0bE38lFhK1zM
	 j0/rCzYSqoDWxGo2ZrbPexsNTsY3xxH2mgxc6PE5kEH5I59D02MO95Awfhj0E7Tnf0
	 gZ1Rc+oa86H9H05ud0cF4Js06TFtRxTsORS8CPleBODDp3JJ8zW0oMvwE9B0UvY5eg
	 YXZ9RHjwGLyh4c5H8TaaTSLHtVtpF5TC8kz0Tw2ZGDB+roJd43kACGJv1tPXbhgTym
	 Pfgq+IRQugeMQ==
Date: Thu, 13 Oct 2022 10:48:17 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, daniel@makrotopia.org,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
Message-ID: <Y0fQ0f3uy5p9f2mP@lore-desk>
References: <cover.1664356281.git.lorenzo@kernel.org>
 <87r0zd4mxw.fsf@kernel.org>
 <Y0aH8T8pTARNWcPE@lore-desk>
 <87zge0memc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IZ86U2XJZJKcmdx2"
Content-Disposition: inline
In-Reply-To: <87zge0memc.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_014822_693930_C708BB4F 
X-CRM114-Status: GOOD (  16.74  )
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


--IZ86U2XJZJKcmdx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>=20
> >> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> >>=20
> >> > Enable WED TX support for mt7915 and mt7986-wmac drivers running on =
MT7986 SoC.
> >>=20
> >> What's WED TX?
> >
> > It is the same as we did for MT7622. It is the capability to offload tr=
affic
> > from lan/wan to wlan. I specified "TX" since MT7986 supports even RX
> > offloading (I am working on it at the moment).
>=20
> It would be nice to mention in the commit log that the feature is about
> offloading traffic from lan/wan to wlan. That way it's stored to to git
> history and people like me have some clue what the patch is about,
> otherwise we are totally in dark.

I think Felix has already applied them.
@Felix: are you taking care of it or do I need to repost?

Regards,
Lorenzo

>=20
> --=20
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

--IZ86U2XJZJKcmdx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY0fQ0QAKCRA6cBh0uS2t
rLI1AQCX4CDrVuzbbjZnQ9FFkNL7JCemSr2XSVdRQMYzw/MY9wEAo10yZAJytWcT
FIybrAIjDLIqvOH3sbFNwwSL2b+KnQU=
=6nXc
-----END PGP SIGNATURE-----

--IZ86U2XJZJKcmdx2--

