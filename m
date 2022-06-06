Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFC4C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QVQ1IMWz+xY3u/TeRYRuPoGsr4aj+2YJz3A/r9iJGo=; b=0ihEOfA4Jf3fis0Zwh1sKjmiH1
	sMIUty4exM4S804suz5OHzq5IoOVK5/jmfiKTZYO5hhssB47D9zp5VhS9NJh5/Rpf053xprhjKfBc
	PbnQGal/l+iKLvePTzYJ87sN6XuYlsN/fNfvWyCHuB/H2xhy5OwzeY9KL9vT2xEikTs0EM1KJMWPb
	06IXeYkJH2G+HZyaesNVhpxPBZ1dVO9A9OR3Wizai2IvfstnbYEW71kmPB5sae7eDFkDzTbqSDt6Z
	u3ZvBBIweB+T5Qwm+9/GILFPKMF7xaMtOhtd+CeliZ8DTFXf/aMd0jZ5pND4sf5UlJm8V4W5rsyrL
	f6IWlncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFHh-001y8r-UR; Mon, 06 Jun 2022 16:08:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFHW-001y69-KN; Mon, 06 Jun 2022 16:08:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18E9F60B69;
	Mon,  6 Jun 2022 16:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B34DC385A9;
	Mon,  6 Jun 2022 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654531721;
	bh=VcnSGVYbTblm760SjoQqgE9wkQ5/rRfgycH6HwRHJBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+beBwDxRnKh4QQe2VqHO65haLEa4SFcYqmwQ5ha8+WUYCaxluVJVO3WScGsMh7p/
	 yCfF9SVghYkLIH6xbuY7EblAx0+pw2kCeFY+U8r5aYiYId7tg1gWkBet3TOBYGLIQT
	 PcGrSh8CCrUG5ygkR02Frlr2vLWxWu4elm2N6km6BG/SAlnAB2hA9vt/LQe6X0dQsB
	 l9+KnyRf/Tk2tZ0WgxX6uJlruPDsrpmtYtQVC3nbp0WKqm9tlPjhyXCBWfx3JGBLic
	 6DN4asOH0MIrEIiwReQNoKx9++AZ6UztiGOM76QW95uzWgz6z9uoC1ZFVsS5+hc9Y0
	 yB6c3lFfV6NaA==
Date: Mon, 6 Jun 2022 17:08:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com,
	aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
	tzungbi@google.com, julianbraha@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 19/20] ASoC: mediatek: mt8186: add machine driver with
 mt6366, rt1019 and rt5682s
Message-ID: <Yp4mg3ObzfQJ3FgP@sirena.org.uk>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
 <20220523132858.22166-20-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220523132858.22166-20-jiaxin.yu@mediatek.com>
X-Cookie: Zeus gave Leda the bird.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_090842_784489_9C7CED36 
X-CRM114-Status: GOOD (  11.92  )
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
Content-Type: multipart/mixed; boundary="===============6882526250979902747=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6882526250979902747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rL9qmwu0rrfH0q3"
Content-Disposition: inline


--9rL9qmwu0rrfH0q3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 09:28:57PM +0800, Jiaxin Yu wrote:
> Add support for mt8186 board with mt6366, rt1019 and rt5682s.
>=20
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c: In function =E2=80=98mt8186_da7219_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c:58:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_n=
ew=E2=80=99
   58 |         ret =3D snd_soc_card_jack_new(rtd->card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-da7219-max98357.c:15:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c: In function =E2=80=98mt8186_mt6366_da7219_max98357_hdmi_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c:161:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_=
new=E2=80=99
  161 |         ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_J=
ACK_LINEOUT,
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-da7219-max98357.c:15:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/medi=
atek/mt8186/mt8186-mt6366-da7219-max98357.o] Error 1
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
: In function =E2=80=98mt8186_rt5682s_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
:61:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_ne=
w=E2=80=99
   61 |         ret =3D snd_soc_card_jack_new(rtd->card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-rt1019-rt5682s.c:17:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
: In function =E2=80=98mt8186_mt6366_rt1019_rt5682s_hdmi_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
:137:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_n=
ew=E2=80=99
  137 |         ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_J=
ACK_LINEOUT,
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-rt1019-rt5682s.c:17:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/medi=
atek/mt8186/mt8186-mt6366-rt1019-rt5682s.o] Error 1

--9rL9qmwu0rrfH0q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeJoIACgkQJNaLcl1U
h9CFwgf9G5LGVON0H/dhjgLQ816wyvWWAsYE0+WxJJpawHUSAJG6kzTYC82FZhmg
sKZTDn6T5jUPGtP/wzWpE+EzcUyUds+Uo6QzoZ4rqzYCEid76p5sksmT5oGdmn8R
HaQSkTKIWF6OprneORmZda8SBV+UcpqScD8irzR1x5V/ZAxo7BRqfOw3ZiTcz8Ru
RgJf+UcRdUoECGjsxBl0yA4BLMfk6Bt8SDPr/KG5J4mkdFxzRwZCz68nyWdt0CFE
FDU1KIBy/P0Oy5eyMdw1n+gT63rWT2swrBcjfanH+HML8cj4Yo63Fl7wMxA1C+WN
ZB/b3z4o7yvK/wM7PbzvknzAm0536w==
=91r5
-----END PGP SIGNATURE-----

--9rL9qmwu0rrfH0q3--


--===============6882526250979902747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6882526250979902747==--

