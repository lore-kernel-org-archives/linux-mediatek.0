Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209CAC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRbJeb/lafoOVi38gDCirQ380OjOLL/YF1Vy1K7bXbs=; b=Yjc+UCtN4PkCFExsUurFuyhDEJ
	J01sZOU9juSTIUq4MsQPRejGx0c3pgZ7440blvN//qZdRIhx1W1niI2ssdoK4RucClFHKYkg+hsh8
	jjymK9CjMQQq1spGCM3q0CkG8akcvZTh68T9UHizkBfXz6ntLaCvqgOCT62K8tEjTTf57caB95LAv
	sBEbE5QovcFrrkmuI5IYXj+VPL9iHf9zK5KIvlLPaXi26cX1FHepz3akXpCJWWGNdy3c/iV1NZs7v
	MUFqwXXtn9PdlW02U6RshF2zYIMjd/x/9bghj7GfNTl4Lrv7xgGDZGD11qGAwWoR8ZpDYz6Uykst0
	CGsC8wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYyI-00DydV-2b;
	Tue, 19 Dec 2023 12:13:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYyF-00Dycj-05;
	Tue, 19 Dec 2023 12:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C5536124D;
	Tue, 19 Dec 2023 12:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576A0C433C7;
	Tue, 19 Dec 2023 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702987990;
	bh=SRbJeb/lafoOVi38gDCirQ380OjOLL/YF1Vy1K7bXbs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=GXZM3VRuQRDhB+YjCDHplLpulygeailXQj/l7EahCLNnNk7S6KppMCFMW2fQW2Bc+
	 GcdwFTwVjKX4TizCFWGbEFjhPABemIsovIRk/9SiZMLukPxTVys6UiENN0lR7tiOb8
	 a9ruGNtUM5/WmEJhwBFNZxld+BDCZB93sJriWcgngwFfqejwkr+J3qHbebOyAUrOgE
	 VYC8IB+aPNfjqjOA1kwb82buy1ri0Sg9pNeCwqEzhV35pN//kkPi+5XctkppdXAUEG
	 nvBOahCweOHynS+ItfAfRfikVX9COGenUtcKajvvt7MIzGVdn8AyHqhffi1VBLELm1
	 oHwIdXdqzZWVQ==
Date: Tue, 19 Dec 2023 13:13:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, intel-gfx@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: Re: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZYGI0j1sQKWHyjgF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
 <ZV/FNWfw0jdXSglr@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfTXMlsJedlWZlXe"
Content-Disposition: inline
In-Reply-To: <ZV/FNWfw0jdXSglr@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_041311_149162_274368E0 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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


--nfTXMlsJedlWZlXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I created an immutable branch for this which the buildbots will
> hopefully check over night. I will reply with comments tomorrow when I
> got the buildbot results.

Applied to for-next, thanks!


--nfTXMlsJedlWZlXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBiM4ACgkQFA3kzBSg
KbbkDhAAlu3skAFMgL/czpyvc8H7iWxUzDlW5sljLuKQm3A0YXwBnsqjJmjCb/LG
H1zt31+/vygKszONX+ZtYzzzYxxeM0SE/gnaHdlexO6ohMXRdfMYF21WGwJVGLKq
iIVKhcRRxxWrB/mrgfv3s7tzBpM72r8xdOXOv72gEy25axtKmZu1B7G0UDxsRgoY
eX3bNKQYB/fL2JNR5htEUCW7ZfWIpGhPIPEjuXmIKgQOKgK97h1QpsADcftbHMpJ
NRulrstcOPJpZPvA7fpp9B0AIc3sLcA9hMR/JmGSzfZ/3ToGTXqfUAgH6mxbvWrf
Uf7HbOyyNFj2a03qHgQK6E3wDVR+rZ99v5fCriroj9g15+K2Paw5XOWNrode1NiO
5dal0ykGNFWh7Ru0TnPy0l4ouVmI3GwBAB1fBek3mSG1PpTzw2cIvIrAW8fjzEuu
xTQMjD7D8UPyE7yREFir6azghFNinIYPanaJyWycB7x1lYfwy8wbDlJNIaiWrDd6
lOSjG3iZ1XSY9LC0qibZo3vSGWFZfVjxSAMOVtsKBG3mTakCp2me/WUZDowtowhl
siROJjd87lXAh9paay6AV+KAAc4WYIQ3wzaIT8Kabya0A3aQTPh5f11l8SKfimeX
mOlNuwam1yEf3xbXUcqBnOUMQ7wewOU2tB2/g2pihA/Y0B6ZrLc=
=W3AE
-----END PGP SIGNATURE-----

--nfTXMlsJedlWZlXe--

