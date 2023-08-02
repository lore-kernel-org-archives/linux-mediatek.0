Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D0DC04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH35rR68YiF64NtZQcsz/U88mcVubvnckv7ZlfTiAcM=; b=LVkidGbrXyG99uB1LhDYuMSSkC
	kIcQLFJpbLOwyugejzFNIC+v6DgtJShgF5k1kjp8MEJ/znAfaURHPa5HmXBeq/GsqhPTMXGCKfZe/
	IAerCUx4hiLvNzFpInV5J2z7ZnqEHHk2LkjTYrR3opdFGziECLNxUsVydoru2njXB+EA5WN676DPs
	jFQ+b6DM6zO89HKercbK51jcb+tBtq+D6WfMl9Ng2uI9GKy8LoLdDsbiklIqX92Av1ZtDPMtbivG6
	zZalxaYEtnFK4KwfAZ+T65Dhqf7zTD+YcL3HYtfTWPRWFCxUITT2gy1S2pBffFkJZlDPLlkhe+Hac
	3i2fSP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qREsQ-005NFR-2V;
	Wed, 02 Aug 2023 16:39:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qREsN-005NEn-2P;
	Wed, 02 Aug 2023 16:39:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FBD861A0D;
	Wed,  2 Aug 2023 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B890C433C8;
	Wed,  2 Aug 2023 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690994346;
	bh=gCY+4gKYJPLF0buq2e8TbUdOApYVtpsq9Zqk1Krfyaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMbKnCXUKPxbMj4iwpC9jTo7Gz3KbbcElkrCmtY/3vKhMWDEIYzXSGaSEv1FUxEF4
	 A4tj4qNtYOlTzoYJthKfwK/2tFybou4h1FPDGN5P+6CmPn0Zv+XoJpQEeiVnZuD/sW
	 EvBrwudBUz9vJbGng3wZUNseR1nvpOr4+/2cRg51u8BGZm+yT1mqZkiOoeyfXMX2ui
	 11VgGFA2MEkjLMUdGBNMSmbx5nw7OqS1hz/36q0MvpLYPQ5I/rRKvVBKe0l2yz42oB
	 L0wOzrnFlJUUhJGQS6kj2FT/M4uMNdBs3CDJoLEDnJfM2fYWoQxJm+DWGyVivfd1jI
	 V8z7b8fVO7v0g==
Date: Wed, 2 Aug 2023 17:38:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
	"ajye_huang@compal.corp-partner.google.com" <ajye_huang@compal.corp-partner.google.com>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
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
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Message-ID: <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esxvPNSC1jmy+MV2"
Content-Disposition: inline
In-Reply-To: <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
X-Cookie: Humpty Dumpty was pushed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_093907_871210_34E175DA 
X-CRM114-Status: GOOD (  18.40  )
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


--esxvPNSC1jmy+MV2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 02:52:57PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2023-07-31 at 12:50 +0100, Mark Brown wrote:
> > On Mon, Jul 31, 2023 at 02:08:02AM +0800, Jiaxin Yu wrote:

> > > Use SND_SOC_DAPM_LINE instead of SND_SOC_DAPM_OUTPUT to trigger
> > > DAPM events to hdmi-codec when userspace control the DPAM pin.

> > Why?

> I have defined an SOC_DAPM_PIN_SWITCH that named as "HDMI1", if I use
> SND_SOC_DAPM_OUTPUT, it can't be controlled by HDMI1's PIN_SWITCH.

=2E..

> 2762                 if (w->dapm->card->fully_routed)
> 2763                         return;
> 2764                 ep =3D SND_SOC_DAPM_EP_SINK;
> 2765                 snd_soc_dapm_widget_for_each_sink_path(w, p) {
> 2766                         if (p->sink->id =3D=3D snd_soc_dapm_spk ||
> 2767                                 p->sink->id =3D=3D snd_soc_dapm_hp ||
> 2768                                 p->sink->id =3D=3D snd_soc_dapm_line
> ||
> 2769                                 p->sink->id =3D=3D snd_soc_dapm_inpu=
t)
> {
> 2770                                         ep =3D 0;

The expectation here is that you'll connect the output to a widget that
corresponds to the physical output on your board and put the pin switch
on that, ideally with a label that corresponds to case markings or what
the physical output is called on the board.

--esxvPNSC1jmy+MV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTKhqIACgkQJNaLcl1U
h9BL/gf/YGDdkzd1Hoqak9skMbqWOPWuNgOeP/0fj0q8HB3qg7eQOy8Y5REObrFC
wfPs8VX6jpzF/JmEzkWRpOdFMMx/c4rTlYB/d/Jojfhh4wslOJCqxe8hfAK/8aZs
WZ3GLf9fCdrPoKRnB0DebPt8Fp8LVMuf+H3dHtd6DsEUDsfAieGnMYAixcFbSezq
NEuViV+xWHzEwpYW1Jwve8rMnAkUPNK/nzZcUb7isbVQd+7J3jIcGi2VTB2FG7GF
BM3gl4wysF0zVCyQTVmQCmlzzU/Rc0JZ5UrBkBXukhce7kZlETx9Y/WFgzFqh1Da
zArLRsDtbRyWE98VC1QS9ZU8ZAAk5A==
=N0bb
-----END PGP SIGNATURE-----

--esxvPNSC1jmy+MV2--

