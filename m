Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjXiNId8JPlqkN8PoloZv0CzIJj6P/Tqz1V4gByEyXc=; b=N5F/0RGoFO5hqCXgTG9DIyP/FL
	HhNI9GVW3hJJFJUeQCPH88QmoCKjHAX5ZHaHHaxLPw32bIGMNZZQXlDjAi8H3e9DnSO35rmPE2O5m
	9nVMBxAYQ93PD9U2C4FEci8jOZoGsoycrBLjsdfnH8wyjVOw3FSH7uTpo0jfOrSu4oBVPH/rRL/FQ
	iqrzjHBSGuyQo6OiIelNHYZ5XvWc/YUGyzoUvlNOv6lmeWKQmcz2BqANHAch+ZCvAD0Fu8e7aTglL
	MumEhfqJ/BFYO4FZ538cDP/fji/CDSWm+YHC7JGFciZ4C91Xj8Z7jh20wJIeNHpLirtSQ7vEGjrca
	bFVdaXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5SWJ-0006xF-Np; Thu, 06 Jan 2022 13:09:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5SW6-0006s2-22; Thu, 06 Jan 2022 13:09:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5EF2B82109;
 Thu,  6 Jan 2022 13:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8421C36AE3;
 Thu,  6 Jan 2022 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641474555;
 bh=2l1DW87RTLjlD5d4ykrkd+Y9uf5zuDC4YTgmnjRDJGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjFJuSsW+qB9yjNh9gbpGsIDAHDGRNhLiaLFMbx8hI8Y4Rt9/2a6+EkkcAvMoHQPl
 sVBF2IjGic2E0IbxbCdA733iwMJQJayHKTOYO85f93AY7+kXiosMV05GsMUVWVOIht
 X9D9QP9Mog0CEmlBXenlk0WuO06yFEO6Tdkd7esnVDWhflTFL84RIzSq6xA5Z9MEJT
 pLhpOH5D0f31i5cY8H70hzzmPzS7GGIGGM/3urrHnc1AFs+YMvDMdp2OwdzRAlyqIq
 iVasunEKNRvcLaSevU/LqAP73c31+cHe8kbGwNumDLkTWHiA0YvMd7QqqHA/pGulOn
 mQgxEt30PhbDw==
Date: Thu, 6 Jan 2022 13:09:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 4/4] dt-bindings: regulator: Add MT6358 regulators
Message-ID: <Ydbp9jFDLcvpiPxa@sirena.org.uk>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-5-johnson.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220106065407.16036-5-johnson.wang@mediatek.com>
X-Cookie: I think we're in trouble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_050918_261729_3B589976 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: multipart/mixed; boundary="===============0907760824965620752=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0907760824965620752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/S1CJoVPmII153IL"
Content-Disposition: inline


--/S1CJoVPmII153IL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 06, 2022 at 02:54:07PM +0800, Johnson Wang wrote:
> Add buck_vcore_sshub and ldo_vsram_others_sshub
> regulators to binding document for MT6358 and MT6366.

Reviwed-by: Mark Brown <broonie@kernel.org>

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/S1CJoVPmII153IL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW6fUACgkQJNaLcl1U
h9Bd3Qf/VGYYlc0k3nHmljIk50ogNHmedMadR2yeoWKgB/fCuVp8D2jvPh0K2NQb
YcEL+4v7nnw01FwsMhLWNoKTMwpGREfLJrsGCHPAujHXB0EqN/rMybXrU0F3wsWj
lFlxsttjSiO0iQk0UBrqOj27hztfeUwWRwqydFVvfo47HcUkxnXg7cJga60utgRi
WNx+jtcYP4XNrXGjhRogoGEnyB5VeHaZpumlfRDjrkc4BHq53uJqrGyymNsajXNY
3nj18IKxKe61lBXwWoCKgXve5i0P5Vo/li6x8jrCBYSpjhvmEn9mQq6P/bp6IaMU
jxooUQBFW1i9mFWrle1hZhzGF7qpAw==
=6BYs
-----END PGP SIGNATURE-----

--/S1CJoVPmII153IL--


--===============0907760824965620752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0907760824965620752==--

