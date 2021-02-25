Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157DCC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 07:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5A5E64E85
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 07:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5A5E64E85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d4K9h7Rv/DX3jqsFhLMOjiYogCpRwyzlzkkEPkRK+Ak=; b=rSSmU+2r2f9/F9h1f2FJNJ7GF
	T/FFKivRJcbN0Fs1iCP3Zb6upEIunSL7gYbDpou1diBoJhr7MmyPwYcHqaagsF5PMwxY3EEyuQ0Tw
	ohQkHD4mPB0xwwtwHvmY3lkPO/BgmsVE+gcQqBE33zUM2RKuQBO+SV6raV8JwcnQtb4yFxwooTAQw
	QIQ0d1V9kThF2bWOrZ5gXIx10DBS2P6sRORrIbw8/aw2ornkX4VbjKqPdE3yvJDyyO6fJ7Xrlezje
	serfU2MAzxksqkat86OmTfDuc00RCFiFC6eCwWsMJmG+zKzbBfnDY9pnE9/g/EXYlHV5Cwvt2i1HE
	ZrnhwrJlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFAkx-0001Tk-DD; Thu, 25 Feb 2021 07:08:15 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFAks-0001SV-W9; Thu, 25 Feb 2021 07:08:12 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE2305803A4;
 Thu, 25 Feb 2021 02:08:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 02:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=AZu9RdHKS45RqbSECTd/B4xBxs/
 yBPCajZ0CCWUQcYY=; b=F2haPlwESmhsHIgpowjFwxWOr0QbuH5RaENdmik2sON
 QjMZqPrwtpfZdxRq7xw4lHg0nVy2vG3PSgw6C/3QSgIdlLwDskdmC37WqJ6P4WPe
 bWY9NiSeayJ1nXNhQ+nDlAhMwGqvu8HDU9xA8/pnebmYc/kXM1bECEvyPSnzFdij
 5lA58RDVyIvHOgzTmDXHHnKKRjLzcge4tucz4CvpV2d0WQQ73aAR1NV6U/l6/cee
 rLtGAKKsqOJHhEKLfqtJ47r8g86uTqunfrZQZYEvgIcOSIZsiICCrK8Drpp4tRK5
 eBH7zwLZJu9jqhjQ6tOABzqctn5AGNQrnTBFmhxph8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AZu9Rd
 HKS45RqbSECTd/B4xBxs/yBPCajZ0CCWUQcYY=; b=UMrinhy+cK61AOhbMKwx9C
 GFb30hWLQw5UdoOx8pxmhiRopiWfTVQ+W6MgORc2dNzTYYU1WI6IIXM7mjhCS2uT
 NgpwsM3cB7R2z3cyoWtYYCxYKzNw9L2T3BhKmEjvRLe/lbocC/deWpG2M4ISoWpH
 tZGqAkretzNg3UPJXEHoR5dNIAZ6/uh4z7OXZ+cM6O6lS9W4LQQwcdzUC1tZBY1d
 CrWappn1PFJmhQFqdA39KdrjTEnKHP8z8ZBOQQeYVv5E7PK+MEe4clZ1VYV/AQD9
 PsTPmXosctM4Z95uA6UTNd1C2MpYbX+Yh43o5S7IiPkDTmLb8G6mmqu0kdGLCqJg
 ==
X-ME-Sender: <xms:00w3YIBdueJnRZlKvFrknRG-Dx_X6lyia_1upL53zyaavNM0cqZDBw>
 <xme:00w3YKjr44wHD-t0zfIEZJdfAb2GMAaj8mTGHDjWkfOtWLsHZnoa07VynCLZ1rhB6
 Z19Bq-QmAMcSUWNg_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:00w3YLmeBKkBcd4aey9uT_4Je4M8FkZmqtWudKoqvLdnTX9jZtDdLQ>
 <xmx:00w3YOw2ASPGv603sBv6tV_PF3vN4zGlFqCO9rrEfpH9vkx7UMooOg>
 <xmx:00w3YNQusIQZcMjJ8SBKhdmUzETfdLV6YaWWy6IHFb16kq7-9yTCUA>
 <xmx:1kw3YOAg1gYFaF7YTyaRoxB9Ry69BXhMUhhYV-ZqyGtr56zAlbI1UQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11857240064;
 Thu, 25 Feb 2021 02:08:02 -0500 (EST)
Date: Thu, 25 Feb 2021 08:08:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/11] drm/atomic: Pass the full state to planes async
 atomic check and update
Message-ID: <20210225070800.cylmzc4aw4lf64m3@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
MIME-Version: 1.0
In-Reply-To: <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_020811_196395_48CF4473 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/mixed; boundary="===============9220980084664626149=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9220980084664626149==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlwiyewnrnff76nn"
Content-Disposition: inline


--rlwiyewnrnff76nn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 24, 2021 at 12:33:45PM +0100, Thomas Zimmermann wrote:
> Hi Maxime,
>=20
> for the whole series:
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied the whole series, thanks to everyone involved in the review,
it's been a pretty daunting one :)

Maxime

--rlwiyewnrnff76nn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDdM0AAKCRDj7w1vZxhR
xXSQAP9UU9PXpkIhgKjNrqj/cEuwE6x8DBwzz7lZblBuahSxVgEAmjXn+ByN2oJW
HFh1nkqeJIGSo3HrbEWp+YkGuQ0BuAw=
=HL4n
-----END PGP SIGNATURE-----

--rlwiyewnrnff76nn--


--===============9220980084664626149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9220980084664626149==--

