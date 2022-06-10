Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGmciwf8OvkegZH+uNIoK58HZCru3Y33OmrpSpCD1fA=; b=N4s3/xfgRKnxy1KzH1uRGN83WV
	0bcglcVZVNqK/oZO1Sn+jCJ5thCBTzq5DSE96lFI3qS4PGHlEgWJBpAI0PH75bdvdRNGe6Y8H0xSV
	wPaLmNbjDqnUYiv/Q2JGbLVy5HtLgWiAt47fbMKiBp6Rn2P5kmLtJfR41TYm+O+hOyPdz+Q3+0c/D
	KZQSvNN7dGcRG0iWfZ6mfMcyHl4lLdrwOEOPO4jm0dM+9okH+w0RprrdzSVQzlPwDA8E1U6iCByXd
	s1jxEm1zJL0Ktlv8k0KiH1iYN0tTLpQIIJ7gNviZKuBgER2pQcYG2/sjxoR/HQrsHjGPqVY4W4pmc
	yNJEBkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdMM-0083km-3z; Fri, 10 Jun 2022 12:03:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdMI-0083gS-4c; Fri, 10 Jun 2022 12:03:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A4AC5CE35D7;
	Fri, 10 Jun 2022 12:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656BC3411D;
	Fri, 10 Jun 2022 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654862598;
	bh=f91prLddVZ6W3Wxb6Hqxhw4VdV2kGrg/IH7kR4PdhnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1znS8ABzt3/7+3tW8r9w0ODLWoHYuds726WAKeoahr9hFltRLm81H0CA03oc5Onx
	 23VM+SJfFghn425BmH1i2xpNVPDVsNSvEL/cpHEuCZoyxDGEaAo989Whdcq+w8Xr0x
	 eM1QnspuhULq9B32zaxPnZEYYuRFsh5AvVkZYA+n9Rb1/XRe3sNm605YjInqypuQGf
	 Ct0RLvUATkkDNkfEu+LaV/yPbv5tU1dN7tRgiZFdckQmCpZSAeMflyqASdKidO9ISp
	 ZlUgqPC+kRCvY06U7U1bpuV5knThQEuewmaR79v8OzQme2AWBWAAH0vkrEzq39r705
	 METMJ1sJh6Oyg==
Date: Fri, 10 Jun 2022 13:03:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: ckeepax@opensource.cirrus.com, linux-sunxi@lists.linux.dev,
	peter.ujfalusi@gmail.com, pierre-louis.bossart@linux.intel.com,
	linux-imx@nxp.com, krzk@kernel.org, jarkko.nikula@bitmer.com,
	linux-xtensa@linux-xtensa.org, cezary.rojewski@intel.com,
	shawnguo@kernel.org, linux-mediatek@lists.infradead.org,
	nicolas.ferre@microchip.com, patches@opensource.cirrus.com,
	linux-amlogic@lists.infradead.org, srinivas.kandagatla@linaro.org,
	daniel@zonque.org, linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org, nsaenz@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
	alsa-devel@alsa-project.org, kernel@pengutronix.de,
	jbrunet@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
	lgirdwood@gmail.com
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Message-ID: <YqMy/FkxDPKmzdrB@sirena.org.uk>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
 <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
MIME-Version: 1.0
In-Reply-To: <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
X-Cookie: Teachers have class.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_050322_595576_C79BA8D6 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Type: multipart/mixed; boundary="===============3789782466900547433=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3789782466900547433==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQXJNv1MQUHjV+R+"
Content-Disposition: inline


--uQXJNv1MQUHjV+R+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 09:03:15PM -0500, Samuel Holland wrote:
> On 6/9/22 8:32 AM, Mark Brown wrote:
> > On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > [22/56] ASoC: sunxi: Update to use set_fmt_new callback
> >         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a

> This patch is wrong, which I pointed out earlier[1]. It will break audio on the
> Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
> changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.

Your mail doesn't say that this will break, it says the change is
unexpected.  In any case, please send an incremental fix - there's no
need to revert the entire series for this.

--uQXJNv1MQUHjV+R+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjMvsACgkQJNaLcl1U
h9DEiwgAg5/u/EffroYC0gc/E++OVOkz3gwInEgNAC9hOiZUubIV0pLgHmDWF03b
jPn25vdDiJrTgFiUmwAYyaI1N8iwXmd1UllhVOv/gLkFfltVeVeI5bb7VHjskvpU
Xx9nbpqcM0LhbDF9NG+WYAoVy5NB/aJZRKoCWoc2qbqyxE4kHlcQ+uGmXHyJDseS
8BmRAzbUgyMhj1H2rxUsdSJBv07mGmLozTE9V6Ah8CM/7n4PVN9VjDs29qDcs1v2
4cxYC5JHT+tbp1KldMeaAv50v0292Sfvps0RbW8zrLY4WwXo5mYJWrS+TYv1UQ+M
XNVup9oVA23wO2KVtvmWoirnwl8blg==
=hG/3
-----END PGP SIGNATURE-----

--uQXJNv1MQUHjV+R+--


--===============3789782466900547433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3789782466900547433==--

