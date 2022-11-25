Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25822C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDhC/pXQLRN9ahyohFHgOCjh1eUxY+LM0kUDdUK1hko=; b=D4j4e05HiOTZOIIHkxahwbtciB
	aAnjG1WABAYtHT4PMjiNlRRah9Opb4+r4RKwylJes9QhZuC8HoaZyUYPdoilUC3yNGcV7XhAxifl1
	76Dm5dprzno9GREXs7awhmhgiV2TpanRW0UOV0oANo/WkwRG8LZO2C+cRIT74AJnEIz980VVFFlWE
	D+ySePEZ/QzQqjnJA/mrFdyYsvGnSgs2kReOGjDuogsjQ1c5cleexPJMKE8fdE3kgi32YhoPHU1IE
	Zi1AfnOYG4ZioLXBG9o46THWtAiOww/ZKsiAOMSR63aP6FZzCjnktpKwMBSpUW155VXv9o+VvvpJe
	bnqYWBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXfu-00GN3l-6L; Fri, 25 Nov 2022 12:19:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXfi-00GMy6-Rb; Fri, 25 Nov 2022 12:19:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D647B82985;
	Fri, 25 Nov 2022 12:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DE8C433B5;
	Fri, 25 Nov 2022 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669378748;
	bh=mZOp0vsvzRrNngwKyz7HgmROJmugzd6BQQN4kzDGk24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5wlKNylGWwR6ccZnV/INSMAmpV0EY9BkrXiiJe/AQR0G5sNqfMBGGACQyjqJUA91
	 WQQJpKRH91kDEgfcIP8P1MnpMeDgzSLbZ1m3fc/5nqmVx0NrTQw0WCIm2PQPLCG26Z
	 bsYrl4UMvlHkFGB41Lqgs2Z/Dy9okY7qAotKMH1vvBDGSx2LTUaF3I0ieN7VTwWHx2
	 i1Nw+hxV+2g6R0dw44LxzAs+X8zw2uppIAi+zggmEC4W8zMX8dt1Qc7ZcrQtiuCYSw
	 zqJ6lKysbpar/wNHQoF2+hoBADLgTFJe/JEu5P+dHV8n+OwVcGTsc48biZoyqRl6tM
	 P8Cq6ZRKhRidA==
Date: Fri, 25 Nov 2022 12:18:58 +0000
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
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y4Cysgk5Gic5ae9B@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kNT+QONpsQiODP63"
Content-Disposition: inline
In-Reply-To: <20221125094413.4940-2-jiaxin.yu@mediatek.com>
X-Cookie: Time and tide wait for no man.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_041911_062160_DC251002 
X-CRM114-Status: GOOD (  16.42  )
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


--kNT+QONpsQiODP63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2022 at 05:44:11PM +0800, Jiaxin Yu wrote:

> +	/*
> +	 * PCM trigger callback.
> +	 * Mandatory
> +	 */
> +	int (*trigger)(struct device *dev, int cmd);
> +

Making this mandatory would break all existing users, though...

> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (hcp->hcd.ops->trigger)
> +			hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);

...it's not actually mandatory so it's just the comment that's wrong.
I'm a little unclear why this is being implemented as a DAPM operation
rather than having the driver forward the PCM trigger op if it's needed?
Or alternatively if a DAPM callback is needed why not provide one
directly rather than hooking into the trigger function - that's going to
be called out of sequence with the rest of DAPM and be potentially
confusing given the very different environments that trigger and DAPM
operations run in.  A quick glance at the it6505 driver suggests it'd be
happier with a DAPM callback.

--kNT+QONpsQiODP63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOAsrEACgkQJNaLcl1U
h9CCdgf+JzEvQcOa+cudwzO1Ok98aky4qGZCuKQnnWtkrCayv8eiu7wd7w5G9dpU
VciYfLQ8bgQ3UOImbANerH2+FJhMtldcF8Vn5FJCG1eXpJGMRbWrjguA15/n88uT
bQ2wEInMii6ecKtSyULg3ie9tuLseZfS3jJHOwJeYFANRmaef0UUAQyPkHnnVsj8
luaShk6424tDgSWY1es5RVtOOzPH/JpBXK1DKuCEBI7DFYuAJtmqgXXIZvfwNPHe
sCV/N6DVZNU152PRSiyAX3Y8/x3NzYiSs6BXexv10OlCq44sCPYZ+HdbgY7qQL4y
w7JwiNOcmvN0sbAhK0jjSKmJ3/spKw==
=ReC2
-----END PGP SIGNATURE-----

--kNT+QONpsQiODP63--

