Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AE606A339
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4OgvpWB8;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZlzaV/MX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JuoAQwfcljWx2dFYJyXxbF5HVpquu71Q4cfUewNA3ac=; b=4OgvpWB8p/IWKQOEvuoH+yDPqf
	qEEDEanPhXFwzdiA9j6JzCM83inYRFDpMrmlBoh9f70MbZqGrrw5iVsOxwiId/JluqzhEoWaanVmA
	iW88o1pKcLHzDpaV2x7u7YmxrsrGE6DgBvKsm1k9b/KVMKBXclfSZegvK99W2CZsmt2l2fq5t773Y
	3fQlz8rwghMH1lzcj6vg0Ro+5B6f2etl2CC6k06/UeMVoxfRak/t/P+pgYD8wy8OSgQKrlFhwLcWh
	OE/oo9KxNWDwH8uWRUCS+EotkXrZ4mzVXAMRLF38WDIbU7Ae9c0uszWSGhomexX+2k64Sgmocmg7J
	GS+YFZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4x5-00000006FIR-1OPb;
	Wed, 11 Nov 2026 09:49:11 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4x2-00000006FHj-3u6a;
	Wed, 11 Nov 2026 09:49:10 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C096520062C;
	Wed, 11 Nov 2026 10:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794390546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuoAQwfcljWx2dFYJyXxbF5HVpquu71Q4cfUewNA3ac=;
	b=ZlzaV/MXm0KxLALRtJsaYjn1Og6jld/xP/jTC7hE9Gp38bcI0pIAcIvGkfkZwXRD0yrVnr
	Qz8/snotVAYZQWu6wZDLVsDDC3nomzcAHcsLB/cq15Ol7Vjjw5EX4RnRRMXZpagVe57yWB
	Q7tTgm/vAHjh1LfWV4ioJSK7R6lFesqTvbtXPZagBjj4acUrpSeLFgB40OypHD0U40cfbV
	wty+OAboG4XXR6a8gElKLkAqL33r2w+BEBPhvR6EsSShLPohtfB7XQKP7HZs97xal8urAE
	hdaWVRtl8vTIPZrmBBAdJRbm9qgqs5UMscokZHOISWvuJ3xcaqZbsNnxCA4pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794390546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuoAQwfcljWx2dFYJyXxbF5HVpquu71Q4cfUewNA3ac=;
	b=QcqDIYXR2JFkuTPG65DJRUhMyFt317k8jE7ZSJMljXrlzhEwCHqwEsaPBu19lMGR/ZyfO4
	tUVKAq3oUnwNqAl+QWFyNWYoz5KyS/9okQwraqauMaLaOtvvZ30RGQBvvmYwvhTZOK32Pj
	dSnmaQ8DpS8hfGELwD0wWlPbWKOePlMoLEFmS61xtVmXP6D+Co+W/wL21qjXH1mcLRpBpZ
	k9yOusRA6hux3eCuckRtJKsLNzOMj2LD4n371tT5EG2YFol/ob4KMO+GBSW+ZcyrH5bBlm
	ehTjKau/acGMHdSo4qdoySkIhlBYzt9zS7Mmv43XLkJhjMfNZldUCZ97SrZo7g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794390546; a=rsa-sha256;
	cv=none;
	b=gM88XHLBxnSNYuZtcLlhrnUkTqlyfqg4rA3GDhCoKikC5jwMJdSaYZFDdYcsVcno09DTah
	VAqBpejybq3Da4ejXrPIcTi6F/eoScYm3xDkjTOPccH5Ubn7QBIspe+9T7uWecYSvV/eII
	2zpzxfIs/fZn8LkDyaOeDzNXT0Lu382RulMHgzh3QXzWzXYxtzQjld8kPMdCAmaNEbmo1x
	bVP7xWRmR090N/xNcwBkeybQ4ljd3JSj40uelQEFvjiYXQU7IcugX3incSYMlz727UH7Kh
	FX6LEhaBtcafi4rNUbXI2Y+ZJe6KNNDQ886WjyEzxqim95rTT1C9iJKtGwqvAw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] clk: en7523: add a reset operation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: John Crispin <john@phrozen.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com, 
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
	zhengping.zhang@airoha.com
Date: Wed, 11 Nov 2026 10:49:06 +0100
In-Reply-To: <20261111085650.632025-3-john@phrozen.org>
References: <20261111085650.632025-1-john@phrozen.org>
	 <20261111085650.632025-3-john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014909_127176_F6F59F98 
X-CRM114-Status: GOOD (  19.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mi, 2026-11-11 at 09:56 +0100, John Crispin wrote:
> The reset controller implements assert, deassert and status but not
> reset, so device_reset() fails with -ENOTSUPP. The i2c-mt7621 driver
> calls it at probe and after a transfer timeout.

Is the i2c-mt7621 driver actually used with any reset controller that
implements .reset but not .assert/.deassert?

If not, it would be better to let i2c-mt7621 use
reset_control_assert/deassert() instead of adding .reset ops to all
reset controller drivers it is used with.

The .reset op is for (compatibility with) self-deasserting resets.

> Every I2C bus that
> references an SCU reset, as on the EN7581 and the AN7589, therefore
> logs "I2C reset failed!" and is never reset.
>=20
> Add a reset operation that asserts and then deasserts the line, as the
> MT7621 reset controller does for the same I2C block.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/clk/clk-en7523.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 8f63482cbb7b..eb893259d470 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -818,6 +818,18 @@ static int en7523_reset_deassert(struct reset_contro=
ller_dev *rcdev,
>  	return en7523_reset_update(rcdev, id, false);
>  }
> =20
> +static int en7523_reset_reset(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	int ret;
> +
> +	ret =3D en7523_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;

Is having no delay here valid for all possible reset consumers or are
we implicitly assuming that this will only ever be used for specific
i2c resets?

regards
Philipp

