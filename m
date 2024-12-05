Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A2EE77170
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnxIRHjBzV7cfi7wa0rZSc0YDWuw3Jw9pFmJaW4m+Lw=; b=Ok7CBo733ICD7sW5wTTxQ3CAft
	uhfn3J+2OmdYCbHODjbDfswCJtLRD/oUqaNQwyHiE1brSw5B+G7tPD1oWxNygIWga0NlvwGJBX9pt
	+nJMz5477ULKssQ5GM9zo99eyKBAGfFPmOaApLW/NTMV+r10c1ZhfV675oEFmyib1D5tSqGul9e++
	rxm665up7YEvwywhkQgQOm0fH8Syz0lkfksUfGqMAAu3aOHBXJrAGKHYmYESY9EtaXH4nPodUzLec
	U7PmbtuIpl2TOv+FxFfSzBoYHd3Mm/ZGNbbHG1yhiA5GWFHSQJpxE+qPgVMw4m9yYaxtzuMY0lW8K
	/+z5CgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lk-0000000FaLm-3qAl;
	Thu, 05 Dec 2024 10:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ei-0000000FXry-3jdI
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 10:37:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8731B5C706A;
	Thu,  5 Dec 2024 10:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853FDC4CED1;
	Thu,  5 Dec 2024 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733395052;
	bh=k0Ri1gJvfMPkkmwOG5H5IkESAn8lv1SqrkOcLFEGEog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guWl3kaOoGEK+6hAPbImxmyWGcZsuvgDfS+SvtpN9yapsfB7pqHGGfp5hVdYv+Q5w
	 vuRJCFOEzZPcd6Zebd/3fx8AKcwYYRIt2OSrHd1J3yxUb8h1Rom0Xy/H5DqebnGf5X
	 2dcCaDOq9qqgy/7JnLhrUhhwK5k8bnLOoFX2Tzhd9Y9CvAuLbKVQ0fdaEysiLRWUwk
	 SYb80dJWMM3YYx1tkOF51oLUhxScy1I23lx2EE8ZPxRTsY8jpWX6xygI0m+rKvAwdl
	 2OBp+y6LpIANTG9T4G1GK6HuX4jdFpJVpP8FmAHs6E8qRz13DpF2xkEdujO4j3Rh0T
	 szxkvQEuQm43Q==
Date: Thu, 5 Dec 2024 11:37:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
Message-ID: <eyu7nm5hvwfqxgysnrzsvianzf7abvlovpxfo7snsxowmuuhpj@tah3gkqm5ldj>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
 <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
 <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ak6zeaiacfbfwyki"
Content-Disposition: inline
In-Reply-To: <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023733_014365_B66FAA04 
X-CRM114-Status: GOOD (  15.71  )
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


--ak6zeaiacfbfwyki
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 04:37:08PM +0800, quic_zijuhu wrote:
> On 12/5/2024 4:10 PM, Uwe Kleine-K=F6nig wrote:
> > On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
> >> From: Zijun Hu <quic_zijuhu@quicinc.com>
> >>
> >> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode=
()
> >> Remvoe the unnecessary wrapper.

Just spotted: s/Remvoe/Remove/

> >> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> >> ---
> >>  drivers/gpio/gpio-sim.c | 7 +------
> >=20
> > I think if you move this patch before patch #4 in your series, you only
> > have to touch this file once.
>=20
> the precondition of this change is patch #4, it will have building error
> if moving it before #4.
>=20
> actually, we can only do simplifications with benefits brought by #4.

Ah I see. I thought that device_match_fwnode only got the const for the
2nd parameter in patch #4.

Best regards
Uwe

--ak6zeaiacfbfwyki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRgmcACgkQj4D7WH0S
/k6zeggAlBhwMJaGpQIgAi04teyouKX4a/XAJG3tLwpz4YweEcrMm/fv0N42hp/d
7zUKHjQRRcVM6+TSObZ6uKEFMpac+G1YG1Fze2rNPdlf5IUOCrpKqKUaziMyvEc+
hhaccpLCXjp9gi7H7tEBDfmrR6/S3i1nnYOeDn6tYmhKVx14uA57l4Isj2h+CIax
P5d+Gq9NQl5IXDnqiEez80oo8LFhLQQIjIeO1YQM7GrbXaqoD+CfZTGXe4/woRc5
JjzksiJqSccUbPlwM+90bh5Oj0H2VARUaJTRcHTRANM4ZFTSfWCep0Wkg8DSw343
fYW4rY4vIXpWKVG9LM4j7NAoluIWvQ==
=myq/
-----END PGP SIGNATURE-----

--ak6zeaiacfbfwyki--

