Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 13:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXcKPeiwX22bmQx6ElblTV8+xahRvtPnZtdhjVsSu2Y=; b=unHBYr5EdqFHtaG14435LuJCW7
	cNjJ2viZEHMGNZpGFkSSzMqW/xUq0EtumNS17eWfnJIYlTMaZCv2wCaKwHHdUtjK1jmJwgO9SG7Sc
	Dw9izgUR4UmkvA/qujp4EuljIp8IEx6OxXqC7j8SB8pooO1/W6/QRaM1+XJisJL7SJIg1eQuw+vWO
	Lx5rkuu56dbT8rcEK4KPKni6BX6s7vKJNBDZ6ccmCvCtUNv4XPhrb5T0pK3H2xxEGmihSwELOPmem
	TAtEXqHM453lCInOstiSMPFV9PeV0dooPfB/4dwq0HX6erEjPwkmrzhSkgFbwhaubUIm9bB4ZFmrs
	DeNnYUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPGG-00EnbF-0o;
	Wed, 13 Dec 2023 13:26:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPGD-00EnYQ-2G
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 13:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B408CE1EC1;
	Wed, 13 Dec 2023 13:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5E0C433C7;
	Wed, 13 Dec 2023 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702474003;
	bh=IKzEPJuxRJ70VYdW/2SaiHnZpZE1vJIdBlLNxNGneUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sh3710819in+LL0u6YtfRlRkB2RQ9Q55qNflXVQzV90qC6oYwmQfmDTByHLhXv4Ez
	 auRR2iMQJf3m84D10+A2d7AqDMPBZprMmi4T7oFjZD997ce5RYmaCYpCapeQGC5xgL
	 CRSLesDsqMyXng2LI96xv8SwjfxdP/jJvLM6NBob96bILqnibz195Ui1YrEU5mmO/p
	 zh1xJnnip1dO2NeEzH0elAMgAHlaStqtZWAcCe/8bTEs5uzWieGFfsgcauvAZQzgaa
	 heGMtQxQifPtH3hYx1I5nV1Y/xuSmXPlliMrFRqA2sFmvebaerKoZOQwlTHWAF/KdI
	 5YSVPmu0OSO1Q==
Date: Wed, 13 Dec 2023 14:26:39 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Ben Greear <greearb@candelatech.com>,
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7921: Disable powersaving by default
Message-ID: <ZXmxD1foASMaCDIe@lore-desk>
References: <20231212090852.162787-1-mario.limonciello@amd.com>
 <874jgmnud8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9uLM4Nq5uaqfA0yL"
Content-Disposition: inline
In-Reply-To: <874jgmnud8.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_052650_211478_4C225BFA 
X-CRM114-Status: GOOD (  18.68  )
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


--9uLM4Nq5uaqfA0yL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Mario Limonciello <mario.limonciello@amd.com> writes:
>=20
> > Several users have reported awful latency when powersaving is enabled
> > with certain access point combinations.
>=20
> What APs are these exactly? In the past 802.11 Power Save Mode was
> challenging due to badly behaving APs. But nowadays with so many mobile
> devices in the market I would assume that APs work a lot better. It
> would be best to investigate the issues in detail and try to fix them in
> mt76, assuming the bugs are in mt76 driver or firmware.
>=20
> > It's also reported that the powersaving feature doesn't provide an
> > ample enough savings to justify being enabled by default with these
> > issues.
>=20
> Any numbers or how was this concluded?
>=20
> > Introduce a module parameter that would control the power saving
> > behavior.  Set it to default as disabled. This mirrors what some other
> > WLAN drivers like iwlwifi do.
>=20
> We have already several ways to control 802.11 power save mode:
>=20
> * NL80211_CMD_SET_POWER_SAVE (for example used by 'iw set power_save')
>=20
> * CONFIG_CFG80211_DEFAULT_PS (for kernel level default)
>=20
> * WIPHY_FLAG_PS_ON_BY_DEFAULT (for the driver to control the default sett=
ing)
>=20
> Adding module parameters as a fourth method sounds confusing so not
> really a fan of this. And the bar is quite high for adding new module
> parameters anyway.

agree, I think we do not need a new parameter for this, just use the current
APIs.

Regards,
Lorenzo

>=20
> --=20
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

--9uLM4Nq5uaqfA0yL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZXmxDwAKCRA6cBh0uS2t
rMk4AP4meRcee0zlYRgossoI8og7N/lRVYrPEbK9Pvu+GoHvbwD9H342JwJu5cTO
ESqtC33FKLmyM0+wXLDJ/KpvDg+gNQQ=
=O53f
-----END PGP SIGNATURE-----

--9uLM4Nq5uaqfA0yL--

