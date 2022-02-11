Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DImaRVyvGwF8IhJ5j8P5yNzIowwU/68V/+GW15UTGGU=; b=d05SnINYcYUkAR0ueXHf1BaK4P
	SG84bWJYSB7DwtCZE+XJen3uQPH2l9mVwzwiuKAL6zEh+iS/oL7A9nt+CvBk6HYKMA04tBqK8eP+o
	v1qk4QektgZVTQ4yxwfWEuWMCmHCuuIq4YcpuUeakZfZDnEnv0Fkv07BVbtGl1/LrjtZPrzBczcj6
	CNwTiFSV/UKbnDvRdTgZq8RQi5WNJGKcoyTFZCx2EjHVfTgTBaH0TDDhV9iWQ1feCoHpDZWOLNRdy
	sK0/N690DJovs949blM3kNapeXul+HBsmN8cq41pvdJiQxZGCpGTC6HLL6nvA6dXlVZ1b5uZIoVH5
	AJSJCI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIXfZ-007l05-7Z; Fri, 11 Feb 2022 15:17:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIXdp-007k9D-9B; Fri, 11 Feb 2022 15:15:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B131461FE5;
 Fri, 11 Feb 2022 15:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D12EC340E9;
 Fri, 11 Feb 2022 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644592519;
 bh=IBFj2X+hcyPR39ZMQ3rlleTF8vNjd5w2MnpIK3BBRMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmGCHoL2jBqJx8fSZnFJir8mkhPKSgxt2JUHRSn60wV1qepXUXKX5nrall0vTrbG6
 b/4Kyddinm/0jrcIJnuDm/pPNxU2mm0I3mbiSPOQX80EEtFmpeLDb7b8vLPKk3s/Ro
 GKEDYUaWCIpvV3t4nrNROIi6XxRbm0NC9G/eyxfe+7FSsM8lOaTMH4SThmDZoM7pc/
 XikLLCFV3CnMYX1CqbZm0O6V79kllMYeXpgsHA5Hcfx5KUOSJfNJI2bsow6rSTEjel
 dLIwQcvks95mIbWaUlz2dw3PpzeUZbmP/8ZLz6gDeCZ9gqYi9pJZQ+kLVQxoE7fpwE
 LvfbdduK+f4FQ==
Date: Fri, 11 Feb 2022 15:15:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/15] ASoC: mediatek: mt8186: support hw gain in
 platform driver
Message-ID: <YgZ9gadN8RksWeWN@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-6-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220211103818.8266-6-jiaxin.yu@mediatek.com>
X-Cookie: do {
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_071521_425246_1A54EA8F 
X-CRM114-Status: GOOD (  13.80  )
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
Content-Type: multipart/mixed; boundary="===============2205781433878588952=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2205781433878588952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c+ZpsOQ7A1I9zFvP"
Content-Disposition: inline


--c+ZpsOQ7A1I9zFvP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:08PM +0800, Jiaxin Yu wrote:

Again, mostly looks good just some minor issues (I've not repeated some
that applied to the prior code):

> +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN15,
> +				    I_ADDA_UL_CH1, 1, 0),
> +};

These end up as regular user visible controls so should have standard
control names - in this case ending in Switch since it's a simple
on/off.  A similar issue was there in the earlier patches.

> +static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
> +	SOC_SINGLE("HW Gain 1", AFE_GAIN1_CON1,
> +		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
> +	SOC_SINGLE("HW Gain 2", AFE_GAIN2_CON1,
> +		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),

These should have standard names like "HW 1 Volume" so userspace has a
better idea how to display them.

--c+ZpsOQ7A1I9zFvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGfYAACgkQJNaLcl1U
h9Ct/Af/SB+lHd2ZvAn42VmwpobHVEpUjwZsElRbAQHPqUKPY43uoQ75NXOvyRQS
HLaoNrQ0kkAVtNBtcolPvRac1ke9kTDEapfuhrUuv4QrgtdgRG3N6bL+m+dyQ6g5
33pIVvYTByz9HsJbzdSFqP527RJqmIUMGucj/p91edb9vTx/SEUZSuj6qqlohr2h
eVoa/P+QCK9bs29/EAD3HmucuJispsMgmntjOE9sYcGFmMDydZSHmyBozPDUuEJ0
S/8o/RVRY7h/KFKLAcc6+kSH4SctBryW4lXtdbZzueBFSefbMzjcHePyeJ0qox5N
Xa9RTpXYvvkNT7fsmvi3+zf0sBZGrw==
=22jY
-----END PGP SIGNATURE-----

--c+ZpsOQ7A1I9zFvP--


--===============2205781433878588952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2205781433878588952==--

