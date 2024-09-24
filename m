Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F365CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNyTwspsagySQ2ipFBzwZm5ttcMHA9sdb99SmYxDElU=; b=POGH6gtvsdFKBJC9h6oIBfX+S+
	sdwRPwplQsWgatQJtYrGUyVax/iJAG5RLryYqS1Rmvz1X2xjgpWJyjGujPoNazXk61Lj1xMpg4MFB
	qxJWAVVe3+7ECIOFh9aN+6EjodVBuI891NmmlHYEx94XpAe1dVaVr/bbSbkKqdlhvEGEoQOijPlRk
	189bsRHC2o/k8rqTrPc5BRL74iN6KPMNAcHUtw9LHCEpmfQSYiFFf06T/+M9b5plQQooQGrqRoDc2
	d2k7UXq4+Xj/C2/bO9TWqMcikSOaRVD3mK4Y3q4jBuRR9uc2OD5NQZEcMdG6Mm89f767FES1N61g1
	tk4e2e+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st4K5-00000002GbD-3rS6;
	Tue, 24 Sep 2024 12:07:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st4Iv-00000002GQo-1KM7;
	Tue, 24 Sep 2024 12:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDF6E5C5C3C;
	Tue, 24 Sep 2024 12:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BE8C4CEC7;
	Tue, 24 Sep 2024 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727179564;
	bh=LBRldiJIOcrY+GP5MEjXsrQ804qeSK1W9On1aa+/+XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcGRmoAT3CedDgrL64QYhquF/99N1h92a+oStk9s0T2+NNXKo6BZnLwFGc13qEC4Q
	 rHQH3XbvSShxU5vtNX2N4AEm9f0JsubU1MhmNjuNlixrJ0tOQhv+0Uq3keNhWuD2C1
	 mmmg17yYGxBibA61PpACNoT0StTkba8LnfUN61C11G9ziw2f6xsb5Ij5PnJmHXrBgd
	 e7NyOZLvtS5ji2RIrufma7BAACZuiH94pJw4KdogK/p6uvXpNczfqfX//lxuPTQZcM
	 R6st9Wz+3GXpC7skvwHakXVL1zQMP+8bAI1DEagcJu2MelwCnR2Ea265NEnhz8C5ld
	 NNijYSPdL4/Pw==
Date: Tue, 24 Sep 2024 14:05:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v8 1/5] ASoC: codecs: add MT6357 support
Message-ID: <ZvKrJx0sMXIxCfBZ@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
 <20240226-audio-i350-v8-1-e80a57d026ce@baylibre.com>
 <CAMuHMdXtm+jGbbLXnCjPZZu_ZwpR-tCRuwbz0iQxUPkXG=g09A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="09XdXeePKsAeqisk"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXtm+jGbbLXnCjPZZu_ZwpR-tCRuwbz0iQxUPkXG=g09A@mail.gmail.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_050605_420350_C5D49674 
X-CRM114-Status: GOOD (  12.77  )
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


--09XdXeePKsAeqisk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 01:44:05PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 5, 2024 at 11:08=E2=80=AFAM <amergnat@baylibre.com> wrote:

> > +config SND_SOC_MT6357
> > +       tristate "MediaTek MT6357 Codec"

> Does this need dependencies?  The driver uses regmap, but it's not
> immediately clear to me what is the backend (SPI?).

It's a MFD so it'll be whatever the MFD for the device is.

--09XdXeePKsAeqisk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyqxkACgkQJNaLcl1U
h9Aeegf+JlTmfotEapBhCwzCkHyhP4vzPARCPqemBP0WpYEFPPpC/tpJ+APyZYKd
YLrBxlIJuHmEv9wDQiP7Yimltm2/e7iEV5ktOKbMtRtai5ELWUu10HBbuyVFhExm
dERrGNUi+7PDaO58V30yMlwb1jg/1cq4UcvsAYyNWLTfgyJpD/0LvOuy/Hdxu1SL
CZoS/ED1dSbObIAlLSDbHtwyljTJpMitkhSaqID293jpeg4XDbpy8VUpj+Hkg3wH
cE06JgnWqwMjIw+Ft6GaCvrrIHMSoIQAfJasq1K8LPU/KLm7Uw6QpdZadU7exPiG
pKxXuXApL4U03KfdsV9J9a7VAdzwkQ==
=NlQ4
-----END PGP SIGNATURE-----

--09XdXeePKsAeqisk--

