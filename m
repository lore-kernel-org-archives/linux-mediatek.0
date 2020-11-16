Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875AFC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 20:00:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31BA208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 20:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V2SjvFSu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gw+LNtSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31BA208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rpX2NeYe1xWzrW5GoyrT1Bci8FyQckrQ0HLs3ERN43M=; b=V2SjvFSudDh+az/xFhlLrq6UX
	vEttuatSGUIUGRyfdVSpwUPGXiQORA5sHVaS3LR7CkMW1DH8AuGgdeb9GitCeyRHM7/abM3BpvG+5
	FhuMbGTQAmKFbp8J0aJ9MrxG/Ls+zx2OhZLttPOO4501cyYYpaSZXX4b22vX/SyN8qsS+dD3zKGeu
	7wMxigh89lTPFfszHItRhRFVS6E/bY42XR1eEMctwa8V8TlM+pHi8qsvKWVw4xfDQjoOvihAmJeMo
	jpFxOs9uMMUiuF48BUBv3jq/GOAsk75WPRWTqW2ucVVeHB0pTOSH7knomHBUBLrmavyBoT+ENJHF7
	0EpMl05Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kekgE-0002ET-Ml; Mon, 16 Nov 2020 20:00:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kekgB-0002Db-GN; Mon, 16 Nov 2020 20:00:48 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2131208C7;
 Mon, 16 Nov 2020 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605556846;
 bh=e6Pic+7L11QD6xi374GsTYuOp0GRbXjHHJECZ1AFmq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gw+LNtSyIkMGjoDYkFGWnukFLJoZkRTPy1a3rXed+cWjxxa95k2KE4I1t0Qj51GU5
 hugMMrEVrl9/j79pFtEFWugaqx0eHqtpCzBTb7eF4D4ktnP7DXLx7qQ8TcgAdlGAZ/
 jcJxYuUJOwYzEHvEtof7jjghtvaJuzkoqzEg69gI=
Date: Mon, 16 Nov 2020 20:00:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Bayi Cheng <bayi.cheng@mediatek.com>
Subject: Re: [PATCH v1] add axi clock control for MT8192 spi-nor
Message-ID: <20201116200027.GI4739@sirena.org.uk>
References: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_150047_668457_832DACE2 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6782963064784903127=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6782963064784903127==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Content-Disposition: inline


--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 04:55:01PM +0800, Bayi Cheng wrote:
> bayi cheng (1):
>   spi: spi-mtk-nor: add axi clock control for MT8192 spi-nor

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+y2loACgkQJNaLcl1U
h9CkIAf+LgGXsnM9kY0nd1NRS64B85c9CWhmqEIuIXyBnH9Nh5F97gqKOrGrcNT4
0Xg5bW0+V3LXXg3rBZTrH5wFF+D+ts10B45v9QHLp2FLCE9idgLUFEk5K3PmonAb
KPe15kR0dK2VMl6dKuWCGlPPlBPgvcIIRZU42gfjkkC5vq/AWuCnNRJRiYPSftl4
D7DKjEQVCHcM+d/V4vXLMtNnkI7IirMDeeMsXa4emlIjB3lnbsqU1x3Aux+/Q3CU
/6lu6PU3NP2RFrZP8fF/m2yJjYbofcDuaMn0tjLS06OMtZHZDuigdOUhBWchbEIO
D82R0UHAwq7NrkZOYZtHsLuKp+m1yw==
=86GQ
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--


--===============6782963064784903127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6782963064784903127==--

