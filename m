Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0389BC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOWwhYv+t8CDvyhND2LxS4NNrNKJuWikV9QiBFJH92s=; b=MltbZwpiQZwP8XKabS+n+ar3k2
	3zwUf3iZXQlGt2X5u/6X05YAci4P2SzedRryJbSygsxgwA8TjN+vHIqALlwUUxLA5QMbaxMYlp68u
	60K4y5UfUkqS4LkRPxMz/WPaoo4nstwqxYXL5jfxSanWt5fd9EgXHMMx4VBvHfMNrlmFY67qzREw7
	UTbxizhw7NYoFYBcGh2O6i2/wU2ClC/VcEFzJkEMXxViW2kKW7Q77p566sUEr9E681LE/PRQq1Wby
	YXhJMwbqHTHsCwFEjpDOjboVqXcLnqUMMWt2OuaayO+fc8VVJ0fLvEe+Kv+6E41k+gg1yV7O3f3aS
	kpBWQ9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRQS-00FNBT-1z;
	Mon, 31 Jul 2023 11:51:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRQP-00FNAi-03;
	Mon, 31 Jul 2023 11:50:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C64776105A;
	Mon, 31 Jul 2023 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE103C433C8;
	Mon, 31 Jul 2023 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690804255;
	bh=AOWwhYv+t8CDvyhND2LxS4NNrNKJuWikV9QiBFJH92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL2XhCM5GgiizRO+1NueJqOprVve9jG9ZNiTVFaZmlT0Q/zpwS7OIGkH1wOpYJzo7
	 qRZ3NRfxvT0zTMbGLyJBm8HEDAzDE1VXzpskPjW9Z6koCwUQOj5yZKHR+1uBw6j1rn
	 mqu+TreQdXB+3DlMYLWHSARGlScVJQ5XQf3CG4lN2fqdQjsYkmtsO0n1jAABoOItNk
	 yTG4BJbMlq8NUZhH6CTPE2kfSEIYlVlVwkzKKeY73KOAAHsw1WyQH8K/e84e2ePbqv
	 RtzsDIHhnQ3Ulw1hrtEaBMOf8RZPDpmzuEN04Y89w3ZWgWgoU4pF2vlmlUFYS+g80n
	 kWNXkGQ/y6fjg==
Date: Mon, 31 Jul 2023 12:50:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com,
	kuninori.morimoto.gx@renesas.com,
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
	chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com,
	allen-kh.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Message-ID: <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m510aG4cVtaJEGRZ"
Content-Disposition: inline
In-Reply-To: <20230730180803.22570-3-jiaxin.yu@mediatek.com>
X-Cookie: Single tasking: Just Say No.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_045057_116381_852A481D 
X-CRM114-Status: GOOD (  10.21  )
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


--m510aG4cVtaJEGRZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 02:08:02AM +0800, Jiaxin Yu wrote:

> Use SND_SOC_DAPM_LINE instead of SND_SOC_DAPM_OUTPUT to trigger
> DAPM events to hdmi-codec when userspace control the DPAM pin.

Why?

--m510aG4cVtaJEGRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTHoBcACgkQJNaLcl1U
h9DXVgf9HxthKv6tquZ80eqHswbBmda73YJgF+PneFtfjX5EUD8siEFTvhlHJOPb
itkNuLs0xwuvU/ocou1TJ3JVkd4SlhXF2AQUB2MKqUJlOMYiEthVhAj2RWNMEMWb
M6hNPAHydcz2O6rmMD0wknYpUUHLE+1Xv3EXeMZEKYLh8qZlrfstrqI1s/fhuQaJ
TmQTCMTZ8AmSRgZ9ENPYon30oN6/7qeEvKbyW+PnOTCqSv/Zhz1pOVf21YoY2nhO
94QnTgSNXrSZINA/rfNDUwEvG2W/OY4N/hb+gKf6qbraNOVxbw1o//Cc2tfTTWlL
P2wCPNxJJXNDAizWmcN9zeH3ZZ4Iqg==
=H16t
-----END PGP SIGNATURE-----

--m510aG4cVtaJEGRZ--

