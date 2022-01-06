Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC51FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sv5i+TQ0n04aS1UhVbwy28vaEzijbP77j0IToQYd7jc=; b=FvyjLCqK3SbZYxRu0O94EfwI1p
	2NF5ai2yZHk86uBEQQjJKOvKvR/0yPU4P7f8lGFiM6VhrDSdQcNnzAhxJRQdyeVBl9JmF5kat+x9t
	cQ0GKWxULrr6NhNqRQp0yyv//YnEMW73ipr1QYOoQQQnc5hDC36qeckicM5HC1uWlsz2Xt67w19h6
	9ja3ecCzjjyGqvgvTqg2U9ZhCqfUwS9edgdlv+N9GxaTKP3HqP+goEFrmfoHaxsG06DJz5NTGbMAl
	AwxW+q+3Mk3Ej727qvGT+6jrz5STMEFB2WYkGnrMQ6bB1eDvrpiE3R52hIIcsYsuxfuaxW9kPYNjo
	4Mem2Zhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5SMf-00056K-KQ; Thu, 06 Jan 2022 12:59:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5SMT-00053o-PE; Thu, 06 Jan 2022 12:59:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CA6C61B8F;
 Thu,  6 Jan 2022 12:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B9DC36AE5;
 Thu,  6 Jan 2022 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641473960;
 bh=jInIbXvarsX6TNet4OakeBJA6YBefMPG5+MbxEc2B60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T+/YxtIkPBS/kaKo1S6jKr+sdCdloc8avdgZftnwK3x0RyIOkyo9cD4/C9mRPbRsD
 lkXpxIzJ4jCI5+M1mEjZqFZQ/3zSqX6qCAOgwbggh5g/G+SgP9BUlIvaYe536vqb1x
 Aq9X0cHCSC4L5SoVCJz99BbejTE/idjf0BXNaiqZEjSa33NjQX/qpTuq+2LeChfS8J
 O4KP4oS5RX23CGF5acrbmAy2gcGLU3hCKIFFFKUKoi/h5HpWA242qY3B1I2z/mt8J5
 3d4Ultl40z1bVCnzxbkH++n70WY45Q0zN05ZW9p+n6U2xkFzUbh0NSo5GTJaFvVwJP
 NqdW0PswUbatw==
Date: Thu, 6 Jan 2022 12:59:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/4] regulator: mt6366: Add support for MT6366 regulator
Message-ID: <Ydbno0JM8YP9NhNh@sirena.org.uk>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-3-johnson.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220106065407.16036-3-johnson.wang@mediatek.com>
X-Cookie: I think we're in trouble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_045921_883009_67A0138B 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Type: multipart/mixed; boundary="===============0185923986142059551=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0185923986142059551==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HMjMTKWCs7502cOB"
Content-Disposition: inline


--HMjMTKWCs7502cOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 06, 2022 at 02:54:05PM +0800, Johnson Wang wrote:
> The MT6366 is a regulator found on boards based on MediaTek MT8186 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

Reviwed-by: Mark Brown <broonie@kernel.org>

--HMjMTKWCs7502cOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW56IACgkQJNaLcl1U
h9Dnfwf/aNvswddLATuwHO1btHmXygSnrjKxqpbMIL7KwJg8L9tEGthhzIJ6+xgc
rx9WwA+Smt7mMWS1YKCQ9KN/TaW9Mti2sMCLrjNlz+G8H/bU3TCdXpJk6/Ve1ZPF
eGJfUZqunpetCrOi4r/flf9zCAN06+p0DF3haYuMxoZI7UGtyy5qNUjXIE+5iIJF
KGVSlNViduNOj1RQjmBQx3OE2E1vW6BTN2g97U3CO6aGAcsvBD+T/i/xVSz3OY7y
pSLdD2UW3wEAC0sz3r8dm/WyAjd25zTb06FR1y8HbvMLtB218Seov6CoeBhvQDGP
B3/S8gTT8fSbtxfuISScQoHvlYmqIw==
=wBRY
-----END PGP SIGNATURE-----

--HMjMTKWCs7502cOB--


--===============0185923986142059551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0185923986142059551==--

