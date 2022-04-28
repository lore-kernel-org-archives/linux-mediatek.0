Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A22C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rjmy3lISYrG5OqT9pmy0GS/9C+xsf8eRT+aDqN5lxsw=; b=wvEfM5ayEblHAwALdQGsDWKi4U
	YujuClV6ZmbpsMmZqlBxmf3+3XBqqWsyR1EjwkvAHAeDajvhGtsIVJUuhjvVOabFPrFLn1+ZiVIyU
	Y2Y+WbMKAJX9FYxWVuhXcovwaUlY8k8bBUYxyDEGAFv/snYmn06qsN0Mx+zzA6JbY0y12mQz8g5wc
	HeV9038Kcd/SlD6DTCl682E2l+t3DZzd0Z1uFgO8XW2j47LZX5G0lY4oQkkKzfjQsZj1jLqDdRxys
	Xnq1vtwc9MkADkoZ37GNL7CAxzcJ6n89V1FDjAf6jCZod0ZDaAcmkCFxSxkqdvCsNeYykhUP5aNwj
	yaJyLfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk32I-006kL6-7k; Thu, 28 Apr 2022 12:14:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk31v-006kCf-1Z; Thu, 28 Apr 2022 12:13:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9285161F2C;
 Thu, 28 Apr 2022 12:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D50C385A9;
 Thu, 28 Apr 2022 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651148034;
 bh=vxjMPjiYyFGhSMcGT25wyA/WTwatpL4xQZLW21y1LrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CZ6V0X68DhdaTkp6BMzGTX1rWbkZ1DzkL2YhYLd502WaLC5hwoO4uMqjMlVQlu898
 yTH+GdehFwnErraXDMs8PVMX4Ha7/ae6hCmg8SHgzegUoSqyvR7RBqyoEq4QZo31zL
 2PVwD+W7KLhSKfZW8BxscVA/BHixp+9TiSPUUBvcJ4PZP7u0b0z5zUHdWq+gGArmoF
 kcs73wCOduTNJz5pS2rtOBXp1/eEd0ykp1evkbcjfN8BAUC3UiiZktAJWVeIEpuC5a
 0OzZZsLv0dTEuYuSJUffm9lb6Gr1CT/f+naBJKllxKJED3w2hUgx0b4PkL2nFRArvv
 PLwyVC3QwZCnw==
Date: Thu, 28 Apr 2022 13:13:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com,
 aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v4 07/18] ASoC: mediatek: mt8186: support i2s in platform driver
Message-ID: <YmqE+80xyBoIJvto@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-8-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220428093355.16172-8-jiaxin.yu@mediatek.com>
X-Cookie: Bedfellows make strange politicians.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_051355_159785_8A6BF208 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Type: multipart/mixed; boundary="===============8713818233246722324=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8713818233246722324==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qf2Y0CXE7QOl/F3W"
Content-Disposition: inline


--qf2Y0CXE7QOl/F3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2022 at 05:33:44PM +0800, Jiaxin Yu wrote:

> +/* clock source control */
> +static const char * const mt8186_i2s_src_str[] = {
> +	"Master", "Slave"
> +};
> +
> +static const struct soc_enum mt8186_i2s_src_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8186_i2s_src_str),
> +			    mt8186_i2s_src_str),
> +};

Not clear why this is user visible?  Shouldn't the machine driver be
setting this.  Also please use more modern provider/consumer terminology
for the clocking.

> +static int mt8186_i2s_hd_set(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{

> +		return -EINVAL;
> +	}
> +
> +	i2s_priv->low_jitter_en = hd_en;
> +
> +	return 0;
> +}

Same issue as on the other patch with the events - like I said there
mixer-test will find a bunch of these issues for you.

--qf2Y0CXE7QOl/F3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJqhPsACgkQJNaLcl1U
h9DxEAf7BCZnRGuhD7QVceeLK9ft/+r5G6bcDYr/AzaD0m2ib8uHS9gAD2tNCPzS
hqNii0XqfHOk8qRHngTUCf2jArvOxs/04PUbVN9osjE3US4GasV3r5A2mjdH5Xjb
YfmoJbCF/LDmP3if9QwJkJEPJ13sqaEQLbO6MKBn9H/iMDXQGzXtLT+A/7vFmnlz
5Z4kFX2c+4/M3Kkh/tL+5mAWE42SYETASHjOFnvFvK8EyRsHraxWahmN7Q1ZlcIb
O/hK/hlH53YEyBysNZ4WG7U3CHHIJdf7XUN9/akMdwFo69exz+qHy2PItw6cix2Q
B26GhDB6BEav6uk7TLEz59R0iKw+eQ==
=QnX1
-----END PGP SIGNATURE-----

--qf2Y0CXE7QOl/F3W--


--===============8713818233246722324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8713818233246722324==--

