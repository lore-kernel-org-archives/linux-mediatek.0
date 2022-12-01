Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CFEC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaW+Y5gxK4xonSBAz6mJtyLDD27CG2+TRVJWwlhcLBc=; b=AulEmqiGivKHlAj3ZeA1VhVSHa
	Son7cjYWU8BDHh3mlSJ+K6SPmq1WqgusKEZjRXJqor/D64bzcfUFOSEOOmKKDAMKrzs33GAzK4ofu
	DNasAYXawM5bccafS1SRHJD1DxBkc8E3adrUYtj+RA4y8TmYL+3l4oZ/lDlYSXnp86v5MBAlu/XP6
	qjHj4rNeq/0zEAcVHp55SEGptcEuLIkkQIORUmX9TjmS5elix56JiEc65v3xITCjZrRK8xYD4iHMm
	E3gBX77Yyn1l9x4MDwOXG5mhPEJOfLu4al5mNNEZtgmmfae1C4q1k0fiVhPqWJpIFoPbdrneH/RiL
	mVPDBuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lQ2-008CJa-5m; Thu, 01 Dec 2022 15:24:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lPn-008C8z-GS; Thu, 01 Dec 2022 15:23:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6B54B81F0A;
	Thu,  1 Dec 2022 15:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B016C433D7;
	Thu,  1 Dec 2022 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669908231;
	bh=12sVLJi1eV03nDA+i/p257FYeSwqbJxoO6cnJV24q0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jibOnvj+ceP+BR55o6l9sQb1r8X/aMrdlpGQOisuZrWI+9WRbIhyylj+kTZFfYlvp
	 hNGiLmS9l2xxf4fif7DL8ttkIl9exc9XMydLUEKvtGaFge7cHgtYyVALiK4S3x9f4o
	 Gs4i+gzT4cS/dUW9koQ9VPgpSC6PSh9B6CXmXTFIFDvniE1wJjsWxP7xiBEoQXf5DF
	 Z/mYIB+yybJptD2yMIELxwqgd2Xst42X0OumPYHkleZk2z/on9OjZnlP0orCmE7XgZ
	 BXnkX1uV/88dBrZr3qN651U5LdpGE6+aRW7Hye2gsi9gVtqf+EBKwFjDnsLhaCnWp2
	 8HGX6KLuok7WQ==
Date: Thu, 1 Dec 2022 15:23:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"ajye_huang@compal.corp-partner.google.com" <ajye_huang@compal.corp-partner.google.com>,
	Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"robert.foss@linaro.org" <robert.foss@linaro.org>,
	"Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"nfraprado@collabora.com" <nfraprado@collabora.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y4jHAJgmz/P58Q/C@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3piYtER9tAyOK42"
Content-Disposition: inline
In-Reply-To: <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
X-Cookie: Leveraging always beats prototyping.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_072355_861599_E99472F3 
X-CRM114-Status: GOOD (  16.76  )
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


--w3piYtER9tAyOK42
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 03:06:04PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Tue, 2022-11-29 at 17:22 +0000, Mark Brown wrote:

> >  static const struct snd_kcontrol_new
> >  mt8186_mt6366_rt1019_rt5682s_controls[] =3D {
> >          SOC_DAPM_PIN_SWITCH("Speakers"),
> >          SOC_DAPM_PIN_SWITCH("Headphone"),
> >          SOC_DAPM_PIN_SWITCH("Headset Mic"),
> >          SOC_DAPM_PIN_SWITCH("HDMI1"),
> >  };

> Which operation should I use to inform bridge driver to control audio
> on or off? I'm curious why I don't see .trigger in the structure
> hdmi_codec_ops compared to the structure snd_soc_dai_ops?

You'd need to add a callback that the user of hdmi-codec passes in which
would be triggered by an event on a DAPM widget added in the audio path
rather than trying to shoehorn this into a PCM operation - a big part of
the problem here is that you're trying to add something that doesn't fit
into a PCM operation.

--w3piYtER9tAyOK42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOIxv8ACgkQJNaLcl1U
h9Ar2Af+KORDgtT/ighVT+gTBJm3oFdl9XsZhX6jFBIroRtVZqlgV0n2nL7IWrfL
oJQg0v/yecie2DMkQ5waSBz5RuFJktM6GkBBS21lztK1l/SpikqkDgNVAdiAEz10
FUldzHAK0zmjpp+jLHkJrATrzeMkJWDqyKXc7CVR6z8pStwYFJ9Ag6fkuKR7Y+CX
schrnd9I3hhtjcEfIG861/h8N9zVv2sRsG65nM4zjHFTMCWqxPwN8h2Ds7JialV7
gygMUpRaIdyoN79I/RllLk04yYtzQS3iVAS4KJevkYI/T9+zP3RLcuwSbzQJYdya
l5qY5/GtaQ3DiQVkOzLSxa4KfxCOmQ==
=fvZ3
-----END PGP SIGNATURE-----

--w3piYtER9tAyOK42--

