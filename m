Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0610EC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 16:02:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C538F20791
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 16:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R4biAVN4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgHf/GGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C538F20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JBRom+CU13MiSenfXkHQ8R9IsNPAyxzhpM6oMiAijsM=; b=R4biAVN4lYKqSW9VGxePyir3f
	A/l0tJo8lfraaKBbxPjTgHTslb4Y1bT05bpa1OP63OyD+GFK5dZmt1HQBXpF6wKGGSy/04xPA+o4b
	NfuPy/EeOrKck4ErT0w0W21eY7EfyJXD2cf3bVuRUdSjbk4ZbuUWWCzERaPoDZvIwZ2vDbFUMHzth
	xhJkQG5YgzwWv0RNMd/+akUGsrVsr7or5WY1/2u0jOaBtjP3Pu8zu+mvSzjegNAexu4NUAVfTJyGJ
	rSYjkL8teqV/47lJd1+/PX/+cyOMVeaJLiS/HOg+KRcDaYkblMS+GKV6yvyoe8M+/+zFMuVue++90
	fb1Th9yXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6c9M-0001UO-RK; Fri, 14 Aug 2020 16:01:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6c9I-0001TT-U1; Fri, 14 Aug 2020 16:01:45 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 341332078D;
 Fri, 14 Aug 2020 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597420903;
 bh=bwt4I1Ivw+5s6OaoKYWYSNGKjE4/A6uymfb27r28z6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgHf/GGPT4X5Rh3a7QelbgRyOu9jbsHEgWPkF14MskZ4qfuSVe5YhbU4bvrSsNNjQ
 JggiVYC73FnhPU2fZZ+iHhZXVtTw/Jb+a8JNUUCzUfE6Qucl5W+YW+7B04lXQfjyBu
 BoBIz68fhhXmp9nCPVgQAaYoFxAdWulVUbR6KsGs=
Date: Fri, 14 Aug 2020 17:01:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 1/2] WIP: ASoC: mediatek: mt6359: add codec driver
Message-ID: <20200814160115.GC4783@sirena.org.uk>
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597401954-28388-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1597401954-28388-2-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_120145_057517_B59669DA 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, bicycle.tasi@mediatek.com,
 linux-kernel@vger.kernel.org, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2573673878179239782=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2573673878179239782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2020 at 06:45:53PM +0800, Jiaxin Yu wrote:

This looks mostly good, a couple of very small things:

> +	ret = regulator_enable(priv->avdd_reg);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s(), failed to enable regulator!\n",
> +			__func__);
> +		return ret;
> +	}

You need a remove() function to undo this enable.

> +	dev_info(&pdev->dev, "%s(), dev name %s\n",
> +		 __func__, dev_name(&pdev->dev));

This isn't really adding anything, just remove it - it's not reading
info from the hardware or anything.

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl82tUoACgkQJNaLcl1U
h9Azugf+KQT2qjv6S1GYzqybbbwsXf9EyoEnEt+nTpEnAUPp4fJMT8SboJ0j++fD
4je+pUPhMO3oMDD+s7/1npVhSowHCaO1943wiq5X31lTnio2zcYYFiaI577/8E9Q
jcrESOC0PUcLZjuUPGc4I8Ae2yh9uen2vMoJqmSDZaRYKW38a3V3vAjV5Ky51l2/
vTw65kfnt87EVF7X18TiheJmgK3ZYWkgV4ugljUQ8FqWxnnUHtaQUUzF7Th5+khJ
aAQM1NW022CE9MFXd8idK+RvGbWuQZBjv+MIOpy2eE5RpdQvbSUgrC+up6bDntjF
FCirVs8xfLOqqP4ld/eJlZxW2vF3qg==
=eI4S
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--


--===============2573673878179239782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2573673878179239782==--

