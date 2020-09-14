Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41549C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 12:35:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D982120759
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 12:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuEflXLY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZQ70Gjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D982120759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bk0m1+depOJJ4CSEbVMrnjoHD1MY2mJrL2joIkEv4VI=; b=TuEflXLYMzsNuCc0LTmZhrJNS
	xdPUIqLBKaJjfTZDdyD0HsamwYwm8E8LLscgBW/+fX5PDMikVf7UD1H8zznSSuhPdt2P8EbaQsGgu
	kknYx9YGLOWYHrUath9mkEIGFTzxF1aYowNDR2+1TOhuxxqWJrD51AohHjbvwLbh4d+bi5jY93xsW
	/W+MdflIMee+UgeK8xfvzhx6b5f3fp5grGJ4DORTGd6srM/T9OyDmHyU3UWX1+gbml/Xm8vtGsTXP
	jV0+oHUe23MCTPUXPXV5YuYPuMajVexgbYYHzs+X8Zr5L2Zb7uSoYoId/HM60Ig3quwJI7wi4lxHo
	5QF2+aooA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHnhr-0005wN-FF; Mon, 14 Sep 2020 12:35:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHnhl-0005uS-K5; Mon, 14 Sep 2020 12:35:34 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3381320756;
 Mon, 14 Sep 2020 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600086932;
 bh=Fm9KDut4PaJIs4j/JpgUlSl6imPbBlCojh25pXL1dG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZQ70GjsSVMAVGAZtXl46ShJPi4R6iMklkXoESoet/WqxHw287SMHgEEGt6fjvI6l
 kcpX0jt1mklJfTpTHtQ8H3qiLxr6yC9oQ0FMUEtg73rh9WF378KQzb+0omKfYjpyFX
 NdaDHXENrXrzBvNv4LLonjthNdWuBAiP4Or9aG+w=
Date: Mon, 14 Sep 2020 13:34:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V5 15/17] regulator: Regulator driver for the Mediatek
 DVFSRC
Message-ID: <20200914123444.GE4821@sirena.org.uk>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
 <1600052684-21198-16-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600052684-21198-16-git-send-email-henryc.chen@mediatek.com>
X-Cookie: Disc space -- the final frontier!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_083533_727426_829337E1 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1854318896548883412=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1854318896548883412==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2020 at 11:04:42AM +0800, Henry Chen wrote:

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */

Please make the entire comment a C++ one so things look more
intentional, and are you sure about that copyright date?

> +static int dvfsrc_set_voltage_sel(struct regulator_dev *rdev,
> +				  unsigned int selector)
> +{
> +	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
> +	int id = rdev_get_id(rdev);
> +
> +	switch (id) {
> +	case DVFSRC_ID_VCORE:
> +		mtk_dvfsrc_send_request(dvfsrc_dev,
> +					MTK_DVFSRC_CMD_VCORE_REQUEST,
> +					selector);
> +	break;
> +	case DVFSRC_ID_VSCP:
> +		mtk_dvfsrc_send_request(dvfsrc_dev,
> +					MTK_DVFSRC_CMD_VSCP_REQUEST,
> +					selector);
> +	break;

Just have two separate operations rather than the switch statement, and
where you do have switch statements please follow the kernel coding
style.

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9fY2MACgkQJNaLcl1U
h9AXygf/Y3FBNX7Td9KehegefHCUBqS15IeZhWcko9jFgTgFMHNyfGyOrSkON5XM
6cHvLPc8PdjA8nTnK7BnbTqQZC0X5waqF0f5d06fQ+ElTR2N0X9eZ4yLYldTAEaF
1SWQY/tQ+FvZKnvrGn8nMc5UUQf3UrgA7Q9KgdPTg5w+FiveJ5eSWH6r2o3DUqGq
5qVUdkgAwnsUAGQ77n8Z/PubaJUScTlesLoH7hhdZa73SZNW7yuYCmDYkM7J21/o
6CcxGJvhZfehLa9rtgn0CEJG0L1t5iFaNCzGqDA9MfPfII8mCJ5qHYLVgK+/h9fp
Ya31zSS1ZIzAjIaowtDsDJwwZRhPzw==
=jIy1
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--


--===============1854318896548883412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1854318896548883412==--

