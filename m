Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3677DC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96E0613ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96E0613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZxkPjdq0t2UqriuTpZo6Shb/EbrFI/NKjuWOxY6+fc=; b=zTXi+VbWnziZMD8/JpTing/0H2
	b/rjnYD0VhxJ6QdlGT9WEnxM9AG9dcgvSOjTOfSRiu7AlNCog1rWunPZAhmQKOod8VYub2CqJWuv0
	7O1czzJfLb526gavzitjaEo2mXj1xntw/6IIe3W+7ympEd1YRPdSSJZxBQSHto9fqNFRqV9HjO0M9
	QDEtSPqHP0FyvfGdRd2GpaNhH5Yj/yi03qhhRnHK8dqrNwpwP2xle9q9So71WMDm0nobJrFHXWxHX
	0zsSPRJZMAULFGwHPY9ZL+yXGv+EMjtx84pMykBvgebdWjNqLsqNE3nTxcFDpbOa1JcXKSeK5CvZu
	4CxfaNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhny-000Wby-68; Fri, 28 May 2021 19:05:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhni-000WVz-DA; Fri, 28 May 2021 19:05:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53258613E3;
 Fri, 28 May 2021 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622228740;
 bh=lqi3vTldrg3lO2uMoy79gkn+ZcxnYUyNsZ59gzqQAQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PVpoQi74raVze44HIFtMvfDSSFlIhYshwtx9vF0D/KJKWC0busEzp5ix4pv3953VB
 RT1kNi4j1auGPUMAsLHR2gecAz8jnQfL2y40jzhDcn8vvtlU6WbbbjjJdWC/BDuBtV
 CFvXyglRZoHJhKIbTsuAKON9gvZiz8dYr8vb5DXbrwNz1AWmcxMzwg+csCTmjMEIKz
 RRB4YIeKRIZ0rHH4gd4TOUuHCd3iD90loJdtBwXHLTT1DOOWX7kAsNNRtHN6XA1xZE
 RG7Xe56Gd0k58/8JALvn0njtw8A8Yr0A5+8Bx8rdcknbJ4nSdkPTy9RFhBWmLjJc35
 uvXI/sfgKKl6A==
Date: Fri, 28 May 2021 21:05:37 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 1/4] i2c: core: support bus regulator
 controlling in adapter
Message-ID: <YLE/ASUV9vNWxKU4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-2-hsinyi@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210527075556.1709140-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_120542_516893_EB3ECA88 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: multipart/mixed; boundary="===============5254960725938014855=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5254960725938014855==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZcBwgiaQRAiB+3tH"
Content-Disposition: inline


--ZcBwgiaQRAiB+3tH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:53PM +0800, Hsin-Yi Wang wrote:
> From: Bibby Hsieh <bibby.hsieh@mediatek.com>
>=20
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>=20
> We can control bulk regulator if it is provided in i2c
> adapter device.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

It looks good to me. I have to admit, though, that I am not a PM expert,
but I trust you guys here. Let's apply it and see what happens.

Applied to for-next, thanks!


--ZcBwgiaQRAiB+3tH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxPv0ACgkQFA3kzBSg
KbbDAQ/9EHqJnm0ee4GH2yEYDaqegGNIzj7KFvtNQVb9I86E8sJgTda4xocrGxu1
5y1fUo/jWXBFiQkfZpwSMAKhhh9ZLkFwr/sOInd/HzLoYkg23E1GdXP5qwm1CCtC
P6mDHQ6q6bjpXnX1y2s1tL9hgc9n0WyUbHw6y5PA5Ecrnc2BphnPUq+eyVm4CcYe
mIZV40uS2jX7lothPyypA5nAtf2OxplnNrVHpW8QNcg4GcdEfApJikppvOnmH9IT
K1dY329k2n8wt6qiHKKepLdq+g9fDlaYzw1Rcum+3JIdqzMM4w3h5/hKsBf7YsG4
hdodoTEKZGg3jbp+bPYSP1igLJtOrSgb18FNpTcG3/paczxkVE2k8+YRBbl4YMfV
pB6u7AI2QYofPthhQMUCkqR/UC02+i4XE3ayZrOveZ4RBMMtHO2Qx7wC+08gUwnd
0EFNeUnW5xrSZph7Hsucjfkuu87kY3a4zTCPqgPZblXz5CFCnNT/ko4hgC+ogjRn
epaQpCFSDFexQZ5YgPJPqFDlItG3sEHfi+mWguGX71grM22x9Mi6MsPQsS8qIe6K
IUYzYNa0pbEys5dnsYvi8bxG1Ta0kSvA6uBYgAZv6UF/aVj4VY6R4o9Vjz8pMYyz
8m2Vc5HWoS4swVGOl2ukrixo+yZ4oH8UwIGcNlFRctw7HCyKiPo=
=W39l
-----END PGP SIGNATURE-----

--ZcBwgiaQRAiB+3tH--


--===============5254960725938014855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5254960725938014855==--

