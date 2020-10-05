Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09141C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713B720774
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RSN2HeQF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy98+eb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713B720774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SfvQY8PFgxfYUwV3QRgy2ON0myH3icfWxKENj/GWnyI=; b=RSN2HeQFvBYAyfDgZZmNTG4al
	NNzlq2AGVcOQykl7Z3GStXQuR6Pq4zqqdYy/A3V01MoqhzfY0SHadQVrY3yJnG7YmFIDkO0pQn80X
	wIhUl/HpEd0Cdu9wUXCgBEYdYLlj2/iYvDMYfVsFvMISjTnnQOxbFve3He/GB/7TdfHNrs00+Puk+
	654U0ccITp9ALIxic6rLKWHbvZl0V9J6hGVYOlcxshKkBEsJxX7RL6IOIcCi16CmHNlCHgc8SRJKO
	sGps7AAfYzGh6QgKzpj6A57nzYaoVY7sdSpBPTDD2fPruZ6poAWSM02AjgGg9JxoWPDRJ1STzcrVq
	funfa6LVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSMx-0003gR-Kc; Mon, 05 Oct 2020 15:25:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSMs-0003fO-5x; Mon, 05 Oct 2020 15:25:38 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C7AE207BC;
 Mon,  5 Oct 2020 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601911537;
 bh=/0vJ0HMwCSkrTpW5w34rc3yXEgUT3MBnMmLGptxX8uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qy98+eb/pll06WRY9c4Hdk9tjpntJ5pyAruG18eik5s0/fQE1SlJMSZvfQsdpUPpk
 0BZSMPkAh3tXs21TzpDU7l8N6VqBiCGPOo17y4Q1JRvtEUq2RgVZhCJjYiJpuPq5+O
 q6tCRQnpcbbxDs3TVukuSm+tWILbREc8hd2aZPWE=
Date: Mon, 5 Oct 2020 16:24:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v4 2/4] spi: spi-mtk-nor: use dma_alloc_coherent() for
 bounce buffer
Message-ID: <20201005152433.GA48857@sirena.org.uk>
References: <20200929073755.3741416-1-ikjn@chromium.org>
 <20200929153320.v4.2.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
MIME-Version: 1.0
In-Reply-To: <20200929153320.v4.2.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
X-Cookie: Check here if tax deductible.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_112538_306101_C6F0BE47 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4592987753880474688=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4592987753880474688==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 03:37:53PM +0800, Ikjoon Jang wrote:
> Use dma_alloc_coherent() for bounce buffer instead of kmalloc() to
> make sure the bounce buffer to be allocated within its DMAable range.

This doesn't apply against current code, please check and resend.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97OrAACgkQJNaLcl1U
h9AT1wf9ESrZU04ckhFQ4aOa5o4YIQYd+068sqPdWJvoXIuVHFya+smMWADlWXXo
jRD77fQGo8++5zgtAv3JYvJ86yal8Y9vrg3ZCZmn6Jh4pJTMQx7pJkLABTffTU+T
7FTBAo5l1uZLrxr2BsR4ZKrkmANWBpVAtjscoz5zm5goUYTuDDspW7MzKoHEgjP+
0BBEzpKvRYA3Ixn0KX9KCtX2U6emSR+nIGOht9TjD3+XFBCSW7OSBlwsLDq7DH5I
3+xFFzP2qHz+fE2pfYjpiIAFJrDVGD8vSi83HtU6/9NxDTzUfAVT3SIPZUdSKDXg
X4F4jfG1IUlJnb59tQOD7o/Bwib1Pg==
=AQQn
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============4592987753880474688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4592987753880474688==--

