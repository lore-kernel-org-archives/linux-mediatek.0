Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22D3C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:02:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4052395C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGRsJHg+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z/CS/EUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4052395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HkX7a1oaqQxJD/Go2v+QF9htf3L08I2yedML3uQXP6g=; b=kGRsJHg+qO5cukTrmRL/WjkxY
	JFf0zSMfFOpR1KSJD6TVFppiSwLIxNtUcigIsdNasufYm41cG/KMWymtnpVK1HV4qE3AD0gzQqDOa
	QcVKg6TdzgbPdZ7TioEpH4PANp31zqXJWHQdQVTu9/xVocQQZorh3Wuq5a1K9kyUFGxkMuFQ/7rB+
	rDVIq1g5GDqo9SWv3cDXKivI6dNNv9rBi3P7vXUjx+GD3DJgY2MANkHyLFfvNZm8cpESHGx6Y1bep
	qOcyvfW0oTJfq57M6lHTYgDMxFc/6OwORkiP+UWqNdL94pnO4Afetlbmdzo8fp+qAMqhQO5cXiYGT
	YItqYf3RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgzv-00028g-Mm; Tue, 22 Sep 2020 12:02:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgzm-00027B-SS; Tue, 22 Sep 2020 12:02:07 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91C522388B;
 Tue, 22 Sep 2020 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600776126;
 bh=FAzNl294QE+Pk73zfSc9ZCv/wnXSmsx7fdUvZBqsPkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z/CS/EUQtbALVxt0bK/NwPbg97VA7K5YiObhrk1yCFZspmS+jATXU7zk/JlF8KJZQ
 uxPalyL5qTaIS3iWzAI9pO4WLXv6a11PcYS2co94SNa/D0RFI/4B5GTliRdGercVqW
 OK9EstzqZczOoskaRxx15jOdmWiE4SlKDgGfNESw=
Date: Tue, 22 Sep 2020 13:01:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2] spi: spi-mtk-nor: fix timeout calculation overflow
Message-ID: <20200922120112.GS4792@sirena.org.uk>
References: <20200922114905.2942859-1-gch981213@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200922114905.2942859-1-gch981213@gmail.com>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_080207_032798_550836D0 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 bayi.cheng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3035055959936471721=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3035055959936471721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7gQyIpR7q4QSXYu+"
Content-Disposition: inline


--7gQyIpR7q4QSXYu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 07:49:02PM +0800, Chuanhong Guo wrote:

>  		if ((op->data.dir == SPI_MEM_DATA_IN) &&
>  		    mtk_nor_match_read(op)) {
> +			// limit size to prevent timeout calculation overflow
> +			if (op->data.nbytes > 0x400000)
> +				op->data.nbytes = 0x400000;

If there's a limit on transfer sizes there should also be a
max_transfer_size or max_message_size set (which we should pay attention
to in the core for flash stuff but IIRC we didn't do that yet).

--7gQyIpR7q4QSXYu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9p54gACgkQJNaLcl1U
h9Bj1Af/YXCUW+7r4wFHXnbDYWGLaIDSH1EBxg+osM3SkN/IcE2rowTsLliZ4VUD
84kMrP5KqglN2081XuEx0PFtMWLgc5VXrFmxqS3E0t5oi7jqIgzDnT9jIXYITtHQ
UO8ZR6IGZ4nVVW+vHUc1vLBakKXOatjJkAwESGGzANYeMLEaDQTn6fDwVx2btYG9
Vo1wl6L5FYFTshq8Q/aC65qjdG52YCRC/3a/uhgIHIlWJ42mORi5lSXOGsbzmaNv
fyT9UXy0BdjXRTPIiNRbEZIioba0dAOFLEg43KZQZilNdgQmnX9ELA9QeCbMbnFu
lq4QZDUVpDhBxcrF/+gCVPINe5wyeg==
=Z/HV
-----END PGP SIGNATURE-----

--7gQyIpR7q4QSXYu+--


--===============3035055959936471721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3035055959936471721==--

