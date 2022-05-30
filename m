Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPsu8dcBU5gWX/Bp4A5F7HCtQiwi/lkqXW1m3L4f5D0=; b=pwJthUSPyOgwTCmyEazS5iLb3h
	It9bHm33WCyj9X0Y0EH+QqXRv6eRi2Cd2wmagVHXdvf9/xa0gU4BcJsc98Qyp4yXVvCuhi766vwAy
	wX9EW2hr4sFiD7BX8Wn4YZjzqL0COePamDL7T+P3LsACZu0KJbc+njJff/x16hs8bPbXaNW3RU7h7
	fab4eyi8e2LU+QtZNakylopqCJ9WxxU+VGyLyB6pf/PVFiI4S+3FypPY7NBVMccVHE9qHm6Y/qSB8
	MtfOZ3688x0rFaHAXKKIk3UdLeQ/b7gfFJI0umYC9QspYrRs1tYCRtWF7cfcVJBSn9Y9A+/5bgjk8
	2HlQ7o3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgba-007K1a-SO; Mon, 30 May 2022 14:42:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgLE-007C7O-Jd; Mon, 30 May 2022 14:25:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0F2EB80DA7;
	Mon, 30 May 2022 14:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABBAC3411C;
	Mon, 30 May 2022 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653920753;
	bh=saYkzz6/Bxx+TCHOWJ3kqLX/CFp8+t6kRB+V5Vc0gWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TajnoueX0WPBLvP2NyXtPjnH7Lbf17+aIc8WM5OMeAbXKnTN0fGlgenaNQyB44Hv1
	 OFIbLofzQEbCr0j0IcGE6uJsfMJ8ANOxkaO66bFnHWQlzrqSBX5PlaG5pYJ7Yw/g3w
	 uu7DcTrRgHPeUJZYP1dOzV3lVBzK4qhpkPtKhxSo3LnuUmNFgKmAsx/67UrBmRNmme
	 NYKDJ/TrBAmeJDFbmeN9jZbEuIZq1IN1zr5iXa8loEY/gmUxlAZig6R8wzHR6gAPdc
	 v7PSI3ez232iK4R4yDORQRQVV8ewieBfUlo4fE21UC5uCkc4E+a0R0mLmQAu6mdxW9
	 21ikbrKkdfpEA==
Date: Mon, 30 May 2022 16:25:50 +0200
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel test robot <lkp@intel.com>, lgirdwood@gmail.com,
	llvm@lists.linux.dev, kbuild-all@lists.01.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] regulator: Add driver for MT6332 PMIC regulators
Message-ID: <YpTT7l0oAJ51Df5A@sirena.org.uk>
References: <20220523154709.118663-5-angelogioacchino.delregno@collabora.com>
 <202205262341.pY4PkDL7-lkp@intel.com>
 <540be3e8-6a97-5e80-3767-892025ded07b@collabora.com>
MIME-Version: 1.0
In-Reply-To: <540be3e8-6a97-5e80-3767-892025ded07b@collabora.com>
X-Cookie: May your camel be as swift as the wind.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_072556_847875_C6F9C57C 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: multipart/mixed; boundary="===============3600377601805289375=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3600377601805289375==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M/QnrxKiHPTf+/lZ"
Content-Disposition: inline


--M/QnrxKiHPTf+/lZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 30, 2022 at 11:33:28AM +0200, AngeloGioacchino Del Regno wrote:
> Il 26/05/22 17:12, kernel test robot ha scritto:

> > > > drivers/regulator/mt6332-regulator.c:15:10: fatal error: 'linux/mfd/mt6332/registers.h' file not found
> >     #include <linux/mfd/mt6332/registers.h>

> Note for maintainers: this failure is expected, as this series depends on the
> series that introduces the MT6331 and MT6332 MFD device (with its headers, used
> by the regulator driver of this series)

> https://patchwork.kernel.org/project/linux-mediatek/list/?series=643602

That's

   mfd: mt6397: Add basic support for MT6331+MT6332 PMIC

It looks like that's not yet been applied - please resubmit when
that series has been applied.  I'll need a pull request for the
MFD bits I guess, please make sure Lee knows that's going to be
needed.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--M/QnrxKiHPTf+/lZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKU0+0ACgkQJNaLcl1U
h9AsZggAgZpjGrzxtd8KkXrv69DF/0hxAr/jx7H3w2zmf8aLSB4qEedlb5dWzKZk
vI88CBNqC2odiuuNYqCF1IiiMQZD1ADsbtBZTzbti27HJ++Gplo6S6SuNzn8IrVJ
93g8sr8sZ44zNixlJttjrQRlQ2DvzBOMZgd/3HboinR8fv8rwqM/EfHEjJaFE7uI
tZcB0sjaEAFbR72N9wV24okXAFQMCOpEgRz/DG6ivdIbQPpeg6LDD3hNnm7oEgRB
rXcN5A/8t1djYba7C1WBmEtwE0rIuMbmI/i+CR6mpTeN0D/U0EBe7PE2LYJzazfn
BFMlFIahn5vPuC9lY4Yv1rc9i21W7w==
=FtuI
-----END PGP SIGNATURE-----

--M/QnrxKiHPTf+/lZ--


--===============3600377601805289375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3600377601805289375==--

