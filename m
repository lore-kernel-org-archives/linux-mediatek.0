Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32EBC43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 11:03:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE8F20795
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 11:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBTQqtWc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xJpg4jZs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE8F20795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zbG76re5SUGnSyveoi15oqbajw6iE9gJoEo9vQisqx8=; b=TBTQqtWchU1VKpp+RV+UAx8p2
	m4Mhqbx369qxidQtKw8TV34tRoPAkYupBw7Ej0cviG9nRDGGez+I6rzB3DCjWkVmgFcbNcV4MX98q
	mvN8YQ1jQKUWkGxRQEHMQbO2q/rKxER52qWpT7bcqvWCX7YtudWtMKJ2kHCPiiBvSlkWBWXXTGPrz
	vWn0/8IsTvEmT+cGK8MjhBzAismjcyqmQR0tdAfhMdjkSwEo7dgYgCGsB6VqE0VaL2nHG31jxnv7l
	e6z6ahniPTNcQaDkXL8WnFYTFCmMkfCXINnQVuP5PW+O1j94SoT2yjWvPnPfXFMcAhv9lP/Kol6sX
	411HIgboA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJEAB-0008KO-L9; Fri, 18 Sep 2020 11:02:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJEA8-0008Jm-Ko
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 11:02:45 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E825D20795;
 Fri, 18 Sep 2020 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600426963;
 bh=0tKGZr5/vrAQyDu0Cn//xVY743MCuS1oNdrrqUZ6gTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xJpg4jZsRPL+6FDKr7kwSETGu+Rcj2GdPYu3N9Hq2NXFTv13W/6f8zSMiKYmdBi6n
 mAw5PSkDiBVPWdC1qpfGiRuTe2dIYz8CS2lyA9a/48P5fbAsvXd2Sk8WucKyVFOK9r
 9wJYOrCZMgsgqJm+6b2H+gHLGUomRZa/Kp73EvOQ=
Date: Fri, 18 Sep 2020 12:01:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Shane Chien <shane.chien@mediatek.com>
Subject: Re: [PATCH] ASoC: Use memset_io to access I/O memory
Message-ID: <20200918110152.GD5703@sirena.org.uk>
References: <1600423219-29058-1-git-send-email-shane.chien@mediatek.com>
 <1600423219-29058-2-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600423219-29058-2-git-send-email-shane.chien@mediatek.com>
X-Cookie: Beware of geeks bearing graft.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_070244_874696_F7C8AFE2 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/mixed; boundary="===============1173010759937217721=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1173010759937217721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2020 at 06:00:19PM +0800, Shane Chien wrote:

>  	/* clear the buffer for avoiding possible kernel info leaks */
>  	if (runtime->dma_area && !substream->ops->copy_user)
> -		memset(runtime->dma_area, 0, runtime->dma_bytes);
> +		memset_io(runtime->dma_area, 0, runtime->dma_bytes);

This is regular RAM that will be accessed by the devices rather than
memory mapped regions provided by devices, the _io variants are normally
for memory mapped regions on devices.

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9kk6AACgkQJNaLcl1U
h9Be2Af/ffqM7prFiaL+Z/QmnZkIWcCC8wYoVek1jBUmixkWC7+M3rnd18MzhcPb
lL5tNIGaILMczUu1ZlvVJt1c+ForvJv+iMdq4UFAvcSDnjwNW6nlHtZWZc6WyPU9
vOT8Xuee4vWZ3u6QbDX2nVuIkMci/R6ehH7z9i0fZY/9IqDl1tMyzw8rmYoBSJ88
GT7QnIZOeZgjdMj1p4iFRF051hw3tX3YWcRQtF+2IAvOemeiAQ53zkHek4E05AH9
WCb0R8JnnS6X2TLVWnf6gnKLSyZcYzTO0EM1ZpXCb46vvjeD2KlG9wq3t8FK3pMo
X8I7lwE1V3OaRXtwGXPaEYkMvFC+1w==
=96HM
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--


--===============1173010759937217721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1173010759937217721==--

