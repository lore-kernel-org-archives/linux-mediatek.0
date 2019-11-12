Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D6DC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 11:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146C920818
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 11:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Av1pnCDP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="rH9jGAi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 146C920818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ea4OPDyvLWhLFAtbHZ/2CzfuPmAK0EV+hMLdrikP8ck=; b=Av1pnCDPY4W/8Ms/68I7ufIoT
	o8nMaFjqcX5OhwoqY68ClX0mCXWQHKj/wFuD/wEd6t/xl4y8qX8wVO+rNQkxOZZu5EhyPIWrKO4hg
	ro+wqgogvIaaYygDVDZL8LX33cePRPhpSYJnlPrqEL89SFO6AVV5CmqalFAWnICIT8eK6gNwfRxZg
	O2lKer+YK/LIPkaIzDvPUOxRrqy4/bTZXVQx0P5C8JFBTSyP48WyutSNwnvCJDynb8tKxsUyY1a6+
	N+AgslVMNDmPV61WNQ7eq8DpE+LS4xgZk5ZEMCkWJQPCI1haam0CfYc2FpJ3/EPIssF/W2St5HJBb
	v08EaKDVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUUn7-00022s-Oh; Tue, 12 Nov 2019 11:57:01 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUUn5-000221-FX
 for linux-mediatek@lists.infradead.org; Tue, 12 Nov 2019 11:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcwNjLo8wOnJMMWVhETgrc4fOww9YZh1iHScHUx1/S0=; b=rH9jGAi/k+o/q6ui+psOjJImW
 Q2XADkVSO7oH+WMMZhZuDAASA6ExvKF6NZkiyIkFAOc2LMiH9nEGl4JK/Vgl2KaB2Ou0Us3quvZEm
 86kw5ZxQ96XqBT6AWzti0MnP35KPh1wWzQyb4BzxZZSkUv9ZolLQQh8r4a/lG4P+K4AUM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUUn3-0007mZ-6i; Tue, 12 Nov 2019 11:56:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D3FAC274299F; Tue, 12 Nov 2019 11:56:55 +0000 (GMT)
Date: Tue, 12 Nov 2019 11:56:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Eason Yen <eason.yen@mediatek.com>
Subject: Re: [PATCH v1] ASoC: mediatek: common: refine mtk_afe_fe_hw_params
Message-ID: <20191112115655.GA5195@sirena.co.uk>
References: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
X-Cookie: As famous as the unknown soldier.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_035659_545424_D33A4490 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 chipeng.chang@mediatek.com
Content-Type: multipart/mixed; boundary="===============5601211278188030937=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5601211278188030937==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 12:22:17PM +0800, Eason Yen wrote:
> This patch is to refine mtk_afe_fe_hw_params by the following
> export functions:
> - mtk_memif_set_enable
> - mtk_memif_set_disable

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3KngQACgkQJNaLcl1U
h9Ds0gf+Jf7PnO4A7M+R3v1MzM3+quMhDl2WoVBFnODb7W1GxbQglVWntQckfuJz
i9KW1BERNtbmPkRmmhiODCwRjlG7eW25VRxAbkolCf+iclcy3AUR5qcjXcx2ixx6
66YGRHDwp6cRSnx5yQYvqiOWORq8Og+1Hz6PeURbDjAEPwdwUmXQDw1gGzfb7vN/
6krFkmtBfZpXQ/IbUteu4IN6dhbNTQkaxXnf3asAeKv7Wgf3f1RbWp7wldUAvBpa
SnTasgnRZMPQHbxqS5DP5Rnla2AtsgJUDx4mFFKzloK/jt7dMjXadopaxAQn2Krm
/UN2h4kGa+hKcDX4pKFgWZfkhLgOmA==
=vQlg
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--


--===============5601211278188030937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5601211278188030937==--

