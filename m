Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSL4UAL8IYwDOLzEE9JFahRdCY9u3ue4LfXQgKh66aY=; b=jPjUeRxgOlvqrgMqg8wSNTn0ya
	XsgSxRRhdq0zSb0vhy123/v/myEqEeEFJ5B91Je+F+Zu2SSeK3FYp6eKRJ91GBe+uk57V8WLOmZYd
	LHvfaPoW6UYcPHp1vPize3vh5aHh1bwZOSdUjqx5q6bxwRRZr+f+gHmk0KZVG4XV4sSlI868TCjJ8
	ZU6l9V6hUzRTk7y68oBF9XIP9Y7qMZ7PNm/64bqKKkzu01Eq8T47QBk2ZGu1hEKLhTlvuKNrmVJMO
	RTqHosMVer9odJJr7S4kVCUx03RGEZfBN92R1DmHVhwIi2IU70PN/gWO4plMk1keyTvXqQtQPEUf0
	v96kOIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58Fm-002tjx-8O; Tue, 13 Dec 2022 16:35:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58FW-002tVm-7V; Tue, 13 Dec 2022 16:35:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE640615E6;
	Tue, 13 Dec 2022 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82E0C433D2;
	Tue, 13 Dec 2022 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670949321;
	bh=qihIQCMPrJTCAef4qkglbnoZxzlmXFeUf906h3WI2bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fO1G6bGV/KeloymJW66oTo+yy+4yiT37YGEdNR/LT98AlF2QyOlkQ4lyIzmmC9Yja
	 YOMMnFWSG203NY/ONt2prT6lxOZ7dDs76fJ4cV9KlRU9lNIMTFQqee3CuTxvGGo5NQ
	 dx9q+nHopU1j+ic41SEa4x8AxO5czV+M4yY/zXLn32x4e9JwgBEkZAg9Aho7/3SDye
	 MCUA7Lg5uMvgdGaHcRZaFOpW+bWxkcnTVNd1eKn+ATVb1Vww+u+adQt9TcwZ4L0ox1
	 Gu2W+dwVSoudhK9Qx6pFfylt/zuhILMN/mvj9FPRYb4BGTMcbiN5PU6HASzBE7Z7Od
	 8cbCBwqUtCjnQ==
Date: Tue, 13 Dec 2022 16:35:14 +0000
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
Message-ID: <Y5ipwqzHKTK8UdlC@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/zKtWsydBRDCvDgl"
Content-Disposition: inline
In-Reply-To: <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_083522_363992_F29C59D9 
X-CRM114-Status: GOOD (  18.08  )
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


--/zKtWsydBRDCvDgl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 02:23:32PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2022-12-05 at 12:07 +0000, Mark Brown wrote:
> > On Mon, Dec 05, 2022 at 09:34:17AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=
=E9=91=AB) wrote:

> > No, I mean that if you want to control the enable and disable of the
> > output path you should implement a DAPM widget.

> May I ask which driver file to add a new DAPM widget? Is it the bridge
> ic driver like it6505.c? Or is it linke the "SDB" added in this patch?

I would expect this to follow a similar pattern to everything else with
hdmi-codec.c and have the actual ASoC stuff in there with a callback
exposed to the rest of the world.

> Yes, I should add a new set of events, such as:

> enum {
>     HDMI_CODEC_TRIGGER_EVENT_STOP,
>     HDMI_CODEC_TRIGGER_EVENT_START,
>     HDMI_CODEC_TRIGGER_EVENT_SUSPEND,
>     HDMI_CODEC_TRIGGER_EVENT_RESUME,
> }

> Then provide handles for these events in the it6505 driver. Am I right?

I'd expect more like on/off for a DAPM widget (the DAPM callbacks are
pre/post on/off) but yes.

--/zKtWsydBRDCvDgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYqcEACgkQJNaLcl1U
h9BIcwf+IZPAQvqXRw2Cg6HsT7fk7Rmm2c4pKUU8NYJA7vobVG315cVSIGTIXIqD
ImaHqf5kMeCNdt5eX5Hox3j5q3b2drkrcyHP6rj44Bb7lzqhHadpfXi9XaX7DT4d
FrmlVfM2gwCXMSKbsKKPHXdqABIi86R5bN79MxoAhgbfisu5OmIrm6ZvYYvLXSlC
nAXcEMeIKZGzhSQIEZCAQ0koNeKZAdmHz435pKjqYWCMbzCsTvXDOJq5GBB8rsiH
lsuMIxHbyBoPUZdhuPj0WAzBMgAY9Kir3RQ1+Xd3epA9LYpWHn+bqotaAqEIlP7Y
1c1+QoUZgnbL7M8UCa5+mryUEIhzGA==
=uzkH
-----END PGP SIGNATURE-----

--/zKtWsydBRDCvDgl--

