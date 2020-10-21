Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42C7C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 13:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319B7221FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 13:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gM4PM05h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8GMHKrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319B7221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P9/mzcljZy4ahwZexvYZXMsEjzVv/rz66nQ+aLZNMBY=; b=gM4PM05hZQ9xz/GgmURQ0KEI+
	iCeamGXwZ+8Sph5c/9nqGJhBhfkC3wBF9ED28t9zcIBtmYn0C0iBoaEqgTEoqDKX3HtOOUzDEvCLd
	a1N8LcOsdMYry2IrzkUe7lBhzx7X9lc0lg9NbmF1pJPbY1SbhwLk6ns3fydBWjWiYEu88jvImMlEJ
	5CQeFd4cFKL1wwJUVz8A+mOAL7yLCSuTBV+lTxDk+2EsDn6LTqr+yksB8xJApcaRDGxgZD8FkPtjo
	BMCvagbaZiUEYjpym6XOrtflPYT/esXnzb4JfK9e1yO3JSB26AUtDpE1vJWJR980/V6DNXWSLv0QY
	kbv/IYhsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVE5s-0005cQ-Ej; Wed, 21 Oct 2020 13:23:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVE5o-0005bC-1l; Wed, 21 Oct 2020 13:23:52 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 783C2221FC;
 Wed, 21 Oct 2020 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603286631;
 bh=b3cPCH2ChrkOo+0On+GCFaxbYKBDb2R2dmjWrh01th8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8GMHKrLxbXtok127CPq0GuZB0QXEqO6wvjYff7dT8f+cwsco4b+i5UzG+DMV6/Hh
 3LstP0uMgqsEhjIy5mJi53BTEJx9CMxb+d2XH2ni4s5Cj/AT/PKQvMtJaSnCHbXhRT
 A8HZn3KJOuhf/QzBL6w+/Hllt4uEfx6lChajJMF0=
Date: Wed, 21 Oct 2020 14:23:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 2/5] ASoC: mediatek: mt8192: add platform driver
Message-ID: <20201021132339.GF4497@sirena.org.uk>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-3-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1603270435-3548-3-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: That does not compute.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_092352_259409_ACD34271 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8434914317220134936=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8434914317220134936==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Content-Disposition: inline


--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 04:53:52PM +0800, Jiaxin Yu wrote:
> This patch adds mt8192 platform and affiliated drivers.
>=20
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  sound/soc/mediatek/Kconfig                    |   10 +
>  sound/soc/mediatek/Makefile                   |    1 +
>  sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   13 +-
>  sound/soc/mediatek/common/mtk-base-afe.h      |    1 +
>  sound/soc/mediatek/mt8192/Makefile            |   14 +
>  sound/soc/mediatek/mt8192/mt8192-afe-clk.c    |  669 ++++
>  sound/soc/mediatek/mt8192/mt8192-afe-clk.h    |  244 ++
>  sound/soc/mediatek/mt8192/mt8192-afe-common.h |  170 +
>  .../soc/mediatek/mt8192/mt8192-afe-control.c  |  163 +
>  sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  306 ++
>  sound/soc/mediatek/mt8192/mt8192-afe-gpio.h   |   19 +
>  sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 2389 +++++++++++++
>  sound/soc/mediatek/mt8192/mt8192-dai-adda.c   | 1489 ++++++++
>  sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 2139 +++++++++++
>  sound/soc/mediatek/mt8192/mt8192-dai-pcm.c    |  409 +++
>  sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  778 ++++
>  .../mediatek/mt8192/mt8192-interconnection.h  |   65 +
>  sound/soc/mediatek/mt8192/mt8192-reg.h        | 3131 +++++++++++++++++
>  18 files changed, 12006 insertions(+), 4 deletions(-)

This is *way* too big to be a single patch, please split it up - it's
over 600K.

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+QNlsACgkQJNaLcl1U
h9AabAf/Q9TXeXUMIPn9NWo9v/L9LDjOuG3v6YsvGz0dOKzOGAaBjfvSbd9Wtxla
FGAFsK52ABH7Au6Gm6lKAGgRYY1iP+bG0Pfy0Ow4XdHrPLv/WND+qgFgnaqOZ2Cd
fb7IpP2f57dbOFvFttnhJW132G3wv50HM3TGcX3ZIMdL0x6becq28d3tg05RUJUn
8I0581pbZ9NOiux3Z0qAYsI0j9I8GQLgYmOTXg2v+FivJ5mrRctnxPSy7fhsi9xQ
+k1rpv8+jY/NDbOVPenM/f/EoT2WAynU3KNQbW4oEgTX0z62TDV7A9SX6dO5ncBd
t5HhufaFXlQn1FBV84GrEXTq9ObMsw==
=JxKv
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--


--===============8434914317220134936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8434914317220134936==--

