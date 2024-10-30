Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D170ED7497D
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+vPqbj0th9XDhYG7rHSXkRc5GYX5cnIWjH54alg/vk=; b=tPPlRba9x5kLEG6Wx8x/hcC19Y
	pnZHYlXPtKBXnokfOYS2vPOxhwunvn+xzFPAHyRS37kw1GGJuSKgvhue+mobHgWTXn0ixIN0fTxec
	gv8S5z+vAZp/gYOZw4nFf1mmGiOQbCbot0HMpzd6/FT7kHXjWSXxCr5dvezsLbS+9UziUfBHS0z5y
	+sKXEeC0uEpinpK+DXZZNap2IH8YgImtIAScQeWZ5G22i6phcwrDQWPd4zxrOCagByofEEk/jyKng
	CSP2ltm7GmoNwlam0sQEPWz5xQYjdWSXsU+XkPXSrpaisV85zEekC4Pyg6htC/xZ+xG9lXkaOL3+i
	J4qEwF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6423-0000000HGut-39gF;
	Wed, 30 Oct 2024 08:26:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t641b-0000000HGmH-41Z3
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 08:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B577B5C5EAC;
	Wed, 30 Oct 2024 08:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50F7C4CEE6;
	Wed, 30 Oct 2024 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730276754;
	bh=m+vPqbj0th9XDhYG7rHSXkRc5GYX5cnIWjH54alg/vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vo/Yi9UHyRqKbCan9ZBlQcbdEBggvr93kfm59xyiATBKwr09WuqKZM2PVSG1UWfzr
	 PH/blxtM+XAIGD16DssnR2TWDZ6rRLfeeWk7Snt7jY48BNc+IOayDiPrYVbfaW5AWA
	 QcNowf8yS6J6XmC9wZE1SJXVgf3tugTUP7HZOzh/aB8FQStfCiK1wjLGylQSsZaodU
	 7+l+pr6n+WChPNRsAucU6jlPaGHkZqmTk0WP2DUzirjF+mYy+HJjgndG5rUVyOaYN/
	 UX5/WwX8Pzz4HeSPkCV6zM1pYyuM7m2Z4lxq5xmSs+bDelmsTEuMgUW9wG07ov/1xB
	 QM3eYlQTQeFJg==
Date: Wed, 30 Oct 2024 09:25:51 +0100
From: "mripard@kernel.org" <mripard@kernel.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "wenst@chromium.org" <wenst@chromium.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Message-ID: <20241030-hot-peridot-falcon-57bdbb@houat>
References: <20241029111309.737263-1-wenst@chromium.org>
 <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="huqxlu2kfajx2pij"
Content-Disposition: inline
In-Reply-To: <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_012556_086251_D8679FBB 
X-CRM114-Status: GOOD (  16.39  )
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


--huqxlu2kfajx2pij
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
MIME-Version: 1.0

On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) wrote:
> Hi, Chen-yu:
>=20
> On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >=20
> >=20
> > The recent attempt to make the MediaTek DRM driver build for non-ARM
> > compile tests made the driver unbuildable for arm64 platforms. Since
> > this is used on both ARM and arm64 platforms, just drop the dependency
> > on ARM.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>=20
> I find this days ago, but I don't know there is someone who apply it.
> Let this patch go through drm-misc tree which already has the bug patch.

If you are ok with this patch, why didn't you apply it yourself?

I think that's very much the expectation, so it's probably took a while to =
merge.

Maxime

--huqxlu2kfajx2pij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyHthwAKCRAnX84Zoj2+
dtNoAYCMCDvgwF9nHrinZfKHHWOLsicaXYf5ccom78linosyV9X/egXygJ4ryUPd
QqoQWFgBgO5FCorpFXFLZu6SVQg/ShD2DSGHjXQTFLgEBKuW8acqguqnMdlfW1n3
lCVPJCfolw==
=OfXZ
-----END PGP SIGNATURE-----

--huqxlu2kfajx2pij--

