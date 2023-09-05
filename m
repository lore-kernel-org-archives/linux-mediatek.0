Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BDDC83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dYBXDZuShV4xLuY+1pIje2Hy9bgDWL31B+du1jmxpk=; b=1rcD1ao041OwacZ11/A4L2QSIN
	6J9Bym5vLdLJmAveV0+MI1uzNvaEVvTXnF2tnCwUNaSaYSGsm/ovWV11ckk35mf/jjz1FtdMnAF46
	SZSr1A0Dd3tMvUfHjXPasSA3tz5rarNZLVQEI/DWRa+kaW4/QO3ZZj5bzONB4CRGnr87kveSHx//2
	CzCWMVTebSZbfbJqU7+0GrhYA6SpXQz6a+HpJ6CLdrWyL/+dHp+egSq0EJI3ifF9+ZUbNdaZNnpZ2
	iB/F6TlyxxVoseQPT2N7FuxvqLWWRTr85jGm80tdB/grfklqGKAJEuwKqRqWZl4HghoLyiP59Jnbj
	rwbWbAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUgp-005xaW-2K;
	Tue, 05 Sep 2023 11:57:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUgn-005xa7-0q
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 11:57:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47BE1601BF;
	Tue,  5 Sep 2023 11:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C791C433C8;
	Tue,  5 Sep 2023 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693915067;
	bh=yW6RN8YkHd4Hfpori3CM7YyC89igPSM9JSnrmBGqE5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGoVO7xM/iLUXNkrTF0cnqtmiYYZzsF7+4NPfenz6E8aLWD6Xu5tZou3eGNkkyo1K
	 PPIDMi4k4faKWSLJwO37TvGOjobI8B/t1H8FLKEn1/hLwpAVxe2suT0sa1ZMnU9ZRj
	 Xo7mnaCJqZWHHPvCD5dYuOrM6vGL6afAzd2HIdFTEPB+RK59ktS1R+uaGJo17iLddC
	 s77ikAxCOvE3myIRAaH/9ZlOLUAaezHHKFPDOT2rOMvBwy3cuptJE3//FNbPO3Dxhr
	 gI+vdUgCltYtMNUIlgV1T+0XhLDt5yAQ0oQWNrWqBos50EiT2BLyjJxL2CggyQ4Ufh
	 wQwUcu0rv35VQ==
Date: Tue, 5 Sep 2023 13:57:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	dri-devel@lists.freedesktop.org, helen.koike@collabora.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com, daniels@collabora.com, 
	gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org, robdclark@google.com, 
	anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
	jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Message-ID: <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
 <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x4ofi2dynnfyekwu"
Content-Disposition: inline
In-Reply-To: <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_045749_342582_F8F04AA1 
X-CRM114-Status: GOOD (  13.65  )
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


--x4ofi2dynnfyekwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 05:11:43PM +0530, Vignesh Raman wrote:
> > > Also, that node actually has a label ("usb"), defined here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
> > >=20
> > > So you can end up with
> > >=20
> > > &usb {
> > >          dr_mode =3D "host";
> > > };
> >=20
> > ... which is the simplest and thus more robust one.
> >=20
>=20
> Should it be,
> &{/soc@0/usb} {
> 	dr_mode =3D "host";
> };

No. The &{/...} syntax refers to a path. &... refers to a label. They
are not equivalent.

Maxime

--x4ofi2dynnfyekwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcXuAAKCRDj7w1vZxhR
xSWbAPwP14GufIj9qWu63z44zodhNDO5r+Fdp7Je7KtfA9W/JQEAjKAsvHIcmP+S
PR79vqaVr6o6IiGV79YCJa0aHGDBsgU=
=paYv
-----END PGP SIGNATURE-----

--x4ofi2dynnfyekwu--

