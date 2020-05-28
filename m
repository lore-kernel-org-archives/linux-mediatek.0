Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8F7C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B8920888
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:45:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txUuFJVq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2E2WVro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B8920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ll8+EAdINE1/A1JjGzGRTiu+ryhuKpxOJchLGcqfpE=; b=txUuFJVq6yCyXdfb/LTkd3bfy
	qDecWFfDUt11yDQIQIyeN/3eRVxkMcOpGxyTIBnLITYTOPJLwJG7hRhtatT8SVZ7JKM7M+RPr7EeN
	XT+4pYAcx3NY4ht9U21siOzWXd1RXMuAnJKR0h3gJc1QP2aJDc32+zeJnxirI79uhGFDWSDKXjnPM
	vIKuKRJU6RFrCnC1o8HvbS70CpAKvAbfX3Il+eCBOL1x4QDrqceJY4NnZMBhhyrhaL5rwijEfUV+Q
	Phbdt+FN3rjeih0mU3Z5azmsLQRPSb3BXGet++chjyVHiO1mDGpXu5bXdfDBjyyBODOhErTRBnV98
	6IpF5VVeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJmb-0000Zf-B2; Thu, 28 May 2020 14:45:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJmG-0006Mn-EF; Thu, 28 May 2020 14:45:01 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BEB6207D3;
 Thu, 28 May 2020 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590677100;
 bh=X9YK+GDEsdW2T8WyDGxweojlNXR+vB7BnE1HKRUoVxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2E2WVrocVGuy1b/MoQhvijltZBfFRIPA1HuIMFqM5dN6XLFuQWc89P9MA+V3Em7x
 9Rgm9qI719tIY6fUpzodZNDu7Nt24Upte5jX83v0rzQGTFaN+0PlHnIxzjfDBJ8YwR
 f5bCGf7jklLlgV/qFq/P4M6JnQzRot0Ta1CnpqS0=
Date: Thu, 28 May 2020 15:44:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] regmap: provide helpers for simple bit operations
Message-ID: <20200528144456.GG3606@sirena.org.uk>
References: <20200528142241.20466-1-brgl@bgdev.pl>
 <20200528142241.20466-2-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20200528142241.20466-2-brgl@bgdev.pl>
X-Cookie: Small is beautiful.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_074500_497879_BDF459E4 
X-CRM114-Status: UNSURE (   6.38  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5722626693748587935=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5722626693748587935==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RMedoP2+Pr6Rq0N2"
Content-Disposition: inline


--RMedoP2+Pr6Rq0N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 04:22:40PM +0200, Bartosz Golaszewski wrote:

> +	return (val & bits) == bits ? 1 : 0;

The tenery here is redundant, it's converting a boolean value into a
boolean value.  Otherwise this looks good.

--RMedoP2+Pr6Rq0N2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7PzmcACgkQJNaLcl1U
h9DzXAf9EwegJko8ZtKiJNAmWI/0roZMdNBpTkKJLOfFqs0LbMZdg1Tg3UA+jOe6
AM9PSwU009hn4dmLdAbnqIfXhp1e1zPUb537lozVi/6cAbc6yzwzZBxajJjUxjk9
amrt61H/LZBJyyP1qrY4a/vNtu0R558ozAuMmINAfkEsFdGQq6WZ63N+bcJzPiF4
kxSTX7Mewb0jyB6ZAilOMkuRFNR+bCGjV0MNVd41MUT+zEcgaMP7Dv6eJ/PUBJ2y
klySoD2xOzlpxBUpKblFYuso9Q8iRrGGjr49/rh1rYuKjRz/wt8cbwe4NjrG0N+q
E8vZUZWNgG2ZVnG3DbKIx5QlNJxtDA==
=EkdN
-----END PGP SIGNATURE-----

--RMedoP2+Pr6Rq0N2--


--===============5722626693748587935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5722626693748587935==--

