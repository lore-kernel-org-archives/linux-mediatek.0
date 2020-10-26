Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBB2C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 12:33:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880D4223AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 12:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1OYgwWE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSTvQ9Jg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880D4223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wNaZ6iQ5QtZTTYl6O59snLYepvMwg5Gc8gl/Hw6a1Ug=; b=E1OYgwWEPuwgDioHlYwKuf9Pt
	sJUw9g4KwGXCQyGPC/+UXf/+na3oRYrTNz67myGFHyBVU8rS/D9U/5aT2RVgTjNDsKPArl82v1yqw
	BTCxFLsL/3tVHgcKEmJ8mho8ls6QnCeM60jCyNo27p72il7aPOFn9rGq7vLcwhAy5PwQa4CmhaJTL
	OWOLmrwzJMvihrUsmuqzBS7s6h9+7rhTF5b2Y82yvOUMKg8+4VSdGAoccrJIyHYFxuqtD0zM/qBga
	sM/Kk2A5lwCDn49OjA30hl9CJU7JJB0EcZyTq0LP4O9qZhuh2glfE312kQfBsViyCh+Au6gXeQf+2
	cPInrbe7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX1gs-0007FZ-HM; Mon, 26 Oct 2020 12:33:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX1go-0007Eu-Pf; Mon, 26 Oct 2020 12:33:31 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3801E223AB;
 Mon, 26 Oct 2020 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603715609;
 bh=4SFrOofkbOuHq20J4eNmo7bqNQONigwBpTqFe+QuLaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MSTvQ9JgDU4E266eDtnpE8fF00rqLD5a/zR06pFR74pkcYrVT49BHkMKe6c3hBZ/Y
 pl1wiSQKrZux5zzJ8W8cjqWoWJQ4RPXGOqeM+tlMindjzcY/6jLJm+zfLlf9D+RdsU
 z+hJjyvLO00Pf9ZfTwtTiuUnnzWjC1QQgY/+0THY=
Date: Mon, 26 Oct 2020 12:33:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
Message-ID: <20201026123325.GC7402@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_083331_031139_5F857C0C 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1941886927728397349=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1941886927728397349==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 02:41:25PM +0800, Jiaxin Yu wrote:
> We can choose to drop away any length of data from the beginning according
> to project needs. Some projects don't want to throw away any data, because
> they want to use recorded data to do echo cancellation, so they have to
> make sure that they are aligned with the reference data as much as
> possible. Or there are other algorithms in the upper layer to eliminate
> this noise. Or some projects want to eliminate this noise form the kernel
> layer. However, the minimum recommended value is 50ms to skip pop noise.

This seems like something that would apply equally to all DMICs so
should be done at a more general level rather than in this specific
driver, for example it could be done in the DMIC driver.

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+WwhQACgkQJNaLcl1U
h9AEVQf+KDjMkz85oAAg0VSQQiu0FRenOToPtwGoQnRHHFP4/5pWNlo/BFTRsPwW
Ws/YQ+VVaEd4tRYjkiwwyl6wTG4YHhuYotHDt8ytKVlsmOAiiL7t4FD0OXbW4LFc
zhJT6TTQ8hLXystWPFnD0ls22uWoH8PvKIMZhLO61kb39D6zMYUiHZBCBeeUzpdE
KlcnnCYNa5KQ/NLKDQJyRDLbQdTkkA+B+Tg2K6NF/iuV3AX8wd6FJjEdsjRhJHHW
gUAnKtK9vcPNNfY388XcSXJwhllb6DvWRQf0RvF4+IYVO9Hb/2Tjpuk4DcKCN/xV
+ODyoEfWbZqBWEjcTOePJ969+sAiyA==
=a14I
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--


--===============1941886927728397349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1941886927728397349==--

