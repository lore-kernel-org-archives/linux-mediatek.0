Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F77C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Try3irplSKe/2aO5s/FaPFYzmob8WvVypBxxb/yEgKM=; b=zh+o2M5W7QNJJA4pdIg/F6fFUx
	63F24XrU7lwi2+W2nUaofsIwNloRp5UrX3OZi8f7KpyS1u5bDbC74b5aLwuuIMz7u2XgzhtflTIU9
	mHaP95+OKJz7nnspnwkG7kJR/BT3MwGMOwz15JFwBjB5X+MNEn8Sq0Wya54lH6tAGcItX6cNVHegu
	UvczQIs8hKeoUKOwpUCjH+y8ZcEeRPTX8h0DAX2Ew9Pvn1A9ytNmkREuVf7ISBUARXKJwVs2KL74M
	NuJTSuuIgkwkncsm/GkeHh0y0H2Gzi0stEOsf5h72IzIyLyzKQtMwvEKyqeHfXHOWiOsUM3H3Thw2
	g2rn3j3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AGA-002Nza-0H; Mon, 05 Dec 2022 12:07:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AFx-002NhG-GP; Mon, 05 Dec 2022 12:07:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95371B80F91;
	Mon,  5 Dec 2022 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08C2C433C1;
	Mon,  5 Dec 2022 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670242050;
	bh=K+Dd7xGXTDkGOUmFSn+Tmrppo1MrzYY2Lk+azYRrNIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1gkj5247+U4OLnyaCx2lbX33R9pdpFcyuxaNcBbQzKrA1hlMuZw7xpg76kPEO27x
	 kUm7v+2SXEaVcuxFuOz86wLmKDzu8jfpk5jdqtYWWkq/1y7iJm+ITBsy+uOXINE5gg
	 D/IlOVOJUaYUQqS9NqMbjywD7kVo4V0mpp0VNEChvkZSJhIffAXsFnv/ZjJ1haKzM9
	 xB9L/3UcEy78yD/SaFiHTyYNCWOhT+r1FIFXZsC54p7ttrL5HoYvAjVP1FUBxLIid3
	 K9TQjW0zvBmMidab5XPUhSr1LVM/uw0Gh5Vounv45TXpabRWy0RSWfyiqpbjOyX1cI
	 LMBCv/rdqg6ww==
Date: Mon, 5 Dec 2022 12:07:20 +0000
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
Message-ID: <Y43e+EsNCrCpZSIH@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2Zxw/Hvoq9IhDAxu"
Content-Disposition: inline
In-Reply-To: <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
X-Cookie: If it ain't broke, don't fix it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_040733_860187_EEDD24E7 
X-CRM114-Status: GOOD (  17.74  )
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


--2Zxw/Hvoq9IhDAxu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 09:34:17AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:

> 1. I have added a DAPM widget that is "SDB", when we open or close HDMI
> PIN_SWITCH, the callback 'hdmi_tx_event' registered in the widget will
> be triggered. Maybe you mean I shouldn't use SNDRV_PCM_TRIGGER_START
> and SNDRV_PCM_TRIGGER_STOP?

No, I mean that if you want to control the enable and disable of the
output path you should implement a DAPM widget.

> 2. If I don't use hcd.ops->trigger notifies the bridge ic driver to
> switch the audio, which ops should I use?
> I actually want to know hdmi-codec.c and it6505.c except
> hdmi_codec_ops, is there any other way to communicate?

Like I said you should use the event on the DAPM widget.  This will
require providing operations for the events to the drivers.

--2Zxw/Hvoq9IhDAxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmON3vcACgkQJNaLcl1U
h9Cbhgf+LMvcJgTpZwsDot1swl9dxC4R5KoASnnVtW3qUnTy6RJishGkt+FKlLX8
aw/XM5uZSMX1WA040KY4LRSrz/jSPdW2esD5PxtNo7+z87LmRi/AL9539cd8zu89
jNhbtBAQDyiNp1Y5mNKjEoL6wCbFS7Zt8XMnXHxddRKZClHNgn1q5/ZbfkbNP++Y
zsXuNSRUT4lzbBlfe2tRMJ1mPdz2R1Is+7sbNZIPIU4t741icrKukcCYPOuYfQeb
38OZ3gVyERI/AIfp7P0X5SLklXuTFFxAhbg617Bp254suyarICucIyvSvp7iTNxq
hg3akba+kzI36lZ6YuhE4NvJC589kQ==
=lrjL
-----END PGP SIGNATURE-----

--2Zxw/Hvoq9IhDAxu--

