Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962BFC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWIj9EC2MS4+L3CPjeZSuSnY4BB34zZhTpkrW7rBusk=; b=NtkJXmAUP7Uc8bFEuya45eEZPr
	326bCEGLmB8ZOa5ZTyVN4DwhEp72DFpKAhTU40sZENnT3D1KZGI+TfYkI1/2mCEw/7sQzFC3d6Byi
	eVu7RnCTr2eBOTbXKXEgozVDVPTVBbS1JeiPUvvrttRcUD5Sl5zNZPHIT6KFENQtzH4uC+pC8Nn9N
	XcSripz6d4vJwChP7ZH+jl5XdUA4yK+/rbTnbgUhzPFUs3dK8BMQ6yBwpmUg2PgYE4On/KPHaTfjK
	QWQc+e0lm9p227B1qq8r5J+drflTkYszyYmD2jxteC/yj3gTjG9Hq9djwNMJfzD8SQ+jCpOwQTHvD
	NV268Y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4060-00EBrf-1t;
	Tue, 30 May 2023 14:13:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q405x-00EBqN-0v;
	Tue, 30 May 2023 14:13:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F2DE630A7;
	Tue, 30 May 2023 14:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1BEC4339B;
	Tue, 30 May 2023 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685455984;
	bh=/UJDrMEFpBwl4/IycRYuBQqR/J8yidIWp4To2yuNJFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjJKbfLjLybK5h4UYXcP+3YhCW5SMzOQphTt7FNwwVcLGn4Uoczg6GbOJz1FL/ePf
	 UE7kv5sNfKH34FoZsEoHcjSYS9kmsNPxe3xRgVhsF8cSE8b0qNE1PQBagsSJZUXXna
	 yZoVROZOT/YrSsMN0fiRe2bL8vZGE7k/qgVpcJKeLeIABtvoMLnf1iV5hrqwZL5Hxg
	 2R90YRjPaYplnUPHQu6rYYyHy0hZKFOZ2HTQtAhKEHOKT0JkNKd09fz7poA5FSrdms
	 Pgto37pmCZbo01+nVNU9xi/pTi/RUF/Sk2edSMDJTaklr1ZdX7X61p2wFKI1YNK8VL
	 j9/BMStvw9jSA==
Date: Tue, 30 May 2023 15:12:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	yc.hung@mediatek.com, tinghan.shen@mediatek.com,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: SOF: mediatek: add adsp debug dump
Message-ID: <12f075ba-6886-4916-a62f-8fb004eeb4c9@sirena.org.uk>
References: <20230523025933.30494-1-trevor.wu@mediatek.com>
 <20230523025933.30494-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HZx043a6O9IOGZFz"
Content-Disposition: inline
In-Reply-To: <20230523025933.30494-3-trevor.wu@mediatek.com>
X-Cookie: <Manoj> I *like* the chicken
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_071305_406603_ABC23B3A 
X-CRM114-Status: GOOD (  14.81  )
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


--HZx043a6O9IOGZFz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 10:59:33AM +0800, Trevor Wu wrote:
> Add mt8188 and mt8186 .dbg_dump callback to print some information when
> DSP panic occurs.

This breaks an x86_64 allmodconfig build:

/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c: In function =E2=
=80=98mt8186_adsp_dump=E2=80=99:
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:483:56: error: =
=E2=80=98DSP_PDEBUGDATA=E2=80=99 undeclared (first use in this function); d=
id you mean =E2=80=98DSP_PDEBUGPC=E2=80=99?
  483 |         dbg_data =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUG=
DATA);
      |                                                        ^~~~~~~~~~~~=
~~
      |                                                        DSP_PDEBUGPC
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:483:56: note: eac=
h undeclared identifier is reported only once for each function it appears =
in
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:484:56: error: =
=E2=80=98DSP_PDEBUGINST=E2=80=99 undeclared (first use in this function); d=
id you mean =E2=80=98DSP_PDEBUGPC=E2=80=99?
  484 |         dbg_inst =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUG=
INST);
      |                                                        ^~~~~~~~~~~~=
~~
      |                                                        DSP_PDEBUGPC
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:485:59: error: =
=E2=80=98DSP_PDEBUGLS0STAT=E2=80=99 undeclared (first use in this function)
  485 |         dbg_ls0stat =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDE=
BUGLS0STAT);
      |                                                           ^~~~~~~~~=
~~~~~~~~
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:486:58: error: =
=E2=80=98DSP_PDEBUGSTATUS=E2=80=99 undeclared (first use in this function);=
 did you mean =E2=80=98DSP_PDEBUGPC=E2=80=99?
  486 |         dbg_status =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEB=
UGSTATUS);
      |                                                          ^~~~~~~~~~=
~~~~~~
      |                                                          DSP_PDEBUG=
PC
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:487:57: error: =
=E2=80=98DSP_PFAULTINFO=E2=80=99 undeclared (first use in this function)
  487 |         faultinfo =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PFAUL=
TINFO);
      |                                                         ^~~~~~~~~~~=
~~~

--HZx043a6O9IOGZFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR2BGgACgkQJNaLcl1U
h9Avzwf9FLeppnZUZA1Mmi2j/Dqy5Rxq8OrPGUDqqTTdwOLmJC6luZkDAsRedhwW
MsBawXkxc2BfO4ytooYHkRL9BcUiQ/ZgZ1wHkH/bpJJdKW+qQjiSUN9jG5qZAPIl
rte+OUXbWHcXGdnfGqLGT7QGzCwr9mSsmqWCVdQcKsR2rT9Xs/Guh9DjQlTICeb5
a+cRmthy1DPKwBu/QFT6J53w7mgWpRzby6qxkP2KFCAiY+QgCFjR2onFVnzEurT6
GzeNZdW2+U8A9nStkaXQbyrqqYaZXMvZS3w0sdinJv3LjUnknGqPVuxMU1h4nEAl
aLnuYTOkWcXKcWSZ+3/8Yy6wsv3weQ==
=qgu/
-----END PGP SIGNATURE-----

--HZx043a6O9IOGZFz--

