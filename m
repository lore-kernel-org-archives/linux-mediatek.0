Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7270AC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 19:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 494E9217F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 19:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hMN7Ntdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 494E9217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IxuPIFpCKc0PlJdpMvNM/wXW4nDeUyxUZvITAoRlDsc=; b=hMN7NtdiFtc3bkxcLlI2Ib8xe
	zZvBuFPpQax5ss7Bbl8RhqSEoiz0uJGIDRYcqGjiGRg07mRngGiON/33+VvPTm+nX1+QYHXUQj+zY
	1wiA6zTDwfMeIODn2PTlrrdM3NcY2Iv5aP80Bjj3oSbmmYvrfROo5sBmnkKuzTw/d3q5fGupuvars
	YPumY3DBp3womQEP+bAVf8fIp1k7eEyh17kH4Q/chRjiZJIeg49M/PvKGhcZMHy80/m83376cMSnq
	99V32Q6oDNBohTwEN2OlwJiLTMxdbftd7eu0mU+3cqfE/4emreruLBMDGPmlWo9SjBDjxfsS3Xskh
	m5dIdAevQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itcLt-0001Hs-GC; Mon, 20 Jan 2020 19:04:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itcLe-00015X-FG; Mon, 20 Jan 2020 19:04:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A43931B;
 Mon, 20 Jan 2020 11:04:29 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08FCE3F68E;
 Mon, 20 Jan 2020 11:04:28 -0800 (PST)
Date: Mon, 20 Jan 2020 19:04:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [RESEND 3/4] regulator: mt6359: Add support for MT6359 regulator
Message-ID: <20200120190427.GO6852@sirena.org.uk>
References: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
 <1579506450-21830-4-git-send-email-Wen.Su@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1579506450-21830-4-git-send-email-Wen.Su@mediatek.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_110430_562385_024A6D67 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1104426001313773713=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1104426001313773713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qa0ccP92Gc0Ko3P8"
Content-Disposition: inline


--Qa0ccP92Gc0Ko3P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 03:47:29PM +0800, Wen Su wrote:

This seems pretty good, a few comments below but they're fairly small
and should be easy to address:

> +static int mt6359_set_voltage_sel(struct regulator_dev *rdev,
> +				  unsigned int selector)
> +{
> +	int idx, ret;
> +	const u32 *pvol;
> +	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	pvol = info->index_table;
> +
> +	idx = pvol[selector];
> +	ret = regmap_update_bits(rdev->regmap, info->desc.vsel_reg,
> +				 info->desc.vsel_mask,
> +				 idx << info->vsel_shift);
> +
> +	return ret;
> +}

This looks like you should be using regulator_list_voltage_table() and
associated functions, probably map_voltage_ascend() or _iterate() and
just a simple set_voltage_sel_regmap().

> +static int mt6359_get_status(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u32 regval;
> +	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
> +	if (ret != 0) {
> +		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;

Please write normal conditionl statements rather than using the ternery
operator to improve legibility.

> +	switch (mode) {
> +	case REGULATOR_MODE_FAST:
> +		if (curr_mode == REGULATOR_MODE_IDLE) {
> +			WARN_ON(1);
> +			dev_notice(&rdev->dev,
> +				   "BUCK %s is LP mode, can't FPWM\n",
> +				   rdev->desc->name);
> +			return -EIO;

I'd expect the device to go out of low power mode then into force PWM
mode if it has to do that rather than reject the operation.

--Qa0ccP92Gc0Ko3P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l+boACgkQJNaLcl1U
h9CShAf/WdS4iLv8FmqgPQ6jxUZsWIHU4beM7oDoeI16KydYH71AEzVsF5AmZ/Fi
q6qUuiabJm+9IVCwXc55mWA5IlFDMSoYM5VCt+QwxsUxaO2QoCjs/FgdkZcvNPyu
KJfmVJdGPE3ZzA6UjDC7tVOR1CYCC8ey8U6Y45rhPU6ln4RDxTnVAFFtKlUM5UM7
/Mw/NwmnR3AtdQvHw20WbLhTqWiNR8m5XAryzMRd+H35WuF/3xRlPSRvrGYjxkAL
7R3Wbs2KsQ7J+bPCPbLf0N9WSvZurn/hMT++bQJKqeAei0V+bo2Phk66Iq7rQkgJ
TGSDUr+2JcIj+zZtLcbRkcrnQUCt1w==
=Vsrk
-----END PGP SIGNATURE-----

--Qa0ccP92Gc0Ko3P8--


--===============1104426001313773713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1104426001313773713==--

