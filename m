Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067CBC4741F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 15:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D062076E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 15:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DgVohDl9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAmO4VFc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D062076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mNpAwgUhGLXMVplIntvac8V5qwMDDMWnGSxshuws5Hg=; b=DgVohDl9VeQhh6/1M+Q+fO6k/
	cVKHHi+8rrLLtO9ZQSzIvX919Qwe1VK8ipso+OmxOCh6IdCbGkTKOolOVM+0816g4xOUk85EWzQut
	vHGATVHnrh6284thxuaNYk56v9dw4eBQjggX/8oLtsBsCXwXGnCxgkLHAFiArepvYS5TxJVGSE+7V
	G5ayKHYAj0PU/1GzCKsanY9U+N9PvTwUNCp6O0M6Vu4lsqBicFjkUvsQ5RyB/IfeQhB+lh0qnNxj6
	erEms9ov+tzLtD8nyyfo7qcLMZRCz4KHpyuA500cGxD0Xr90ubVty5xZ8z5CEnUoKA1b453M+NA4f
	YNcV8VEwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYW6M-0001pz-GO; Fri, 30 Oct 2020 15:14:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYW6I-0001ok-8X; Fri, 30 Oct 2020 15:13:59 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02A6E2076E;
 Fri, 30 Oct 2020 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604070837;
 bh=pPiXS2mW1/f2W1unM/FQYVWjCc8CEmjH+3MTSNc4q9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAmO4VFcfTr29sqAFL//ZYeZJI/+LWSzSjAPQj8ivi5D0Pd59FowG6y+BTeg3X+Ze
 4N//F7KpzJiQJcnE3Tf+IkaqJ+yIU2UHiMhTRGVNHFWeQqWXmwv2ZiA3nO8ms5uHHw
 Y2ZDFHqgjW+BMV+nqE2RhrS9GE8q2qm+MGQCEvjg=
Date: Fri, 30 Oct 2020 15:13:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 4/9] ASoC: mediatek: mt8192: support add in platform
 driver
Message-ID: <20201030151350.GG4405@sirena.org.uk>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603526339-15005-5-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1603526339-15005-5-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_111358_396670_EA23D7A0 
X-CRM114-Status: GOOD (  13.13  )
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
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3603973946556870138=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3603973946556870138==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Content-Disposition: inline


--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 03:58:54PM +0800, Jiaxin Yu wrote:

> +/* mtkaif dmic */
> +static const char * const mt8192_adda_off_on_str[] = {
> +	"Off", "On"
> +};
> +
> +static const struct soc_enum mt8192_adda_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8192_adda_off_on_str),
> +			    mt8192_adda_off_on_str),
> +};

This should be a standard boolean control with a name ending in Switch
rather than an enum.

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cLa0ACgkQJNaLcl1U
h9B3mQf+IE/V4fVVJUw8bu2K5OgDC+dzzOkFhc1RMgevIXZErAn7w1rRfNixP5+p
bxPBf8cJgi7WP90wmkGlqRSZMAte4s+T2Bv85D+JadK8HAvJVUifXZTIunErmzyk
HTqxun6K6Fi2Ud61b8h51dMZA/XlBFfkDg4rgb+uAnMQ8gxmxkPjfhDjKqN9N0gt
Ymr+3RsmyETHFq37rS9k1RRb3OdkSVZpnHONfcLsJ1s/lGiS1XMp7b2dJskqotnN
IFeSqpoDfpAXhCioX3Wurw3kHAXaqByDIIq5Pyg9SIBFk5mczZEsCSrMcK8nbTG3
+iZkU7z8BsjBmysZsO4vr/hY6JLPVg==
=3vj9
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--


--===============3603973946556870138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3603973946556870138==--

