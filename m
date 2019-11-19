Return-Path: <SRS0=kUiF=ZL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D21EC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Nov 2019 18:19:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E7B2231E
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Nov 2019 18:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNm6Vvee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17E7B2231E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=di4MQtUsg4ghq7iNTVAdzlIucBvZ3DqhMJC5RAi2NAY=; b=cNm6Vvee7fXTBVSDqzc3nRzkT
	aRBpJdZYozOv8z/OjP2ltOEkEb4oMWjVDlIbLNWodG2wVygkBrIlyZOMmRi8+WIMnOHGt6Pq5q69s
	KRkPELxggCrqKuThphc5O2T2M/WqsLTY+heh2Roh2nnVDVC/yVXlGRbFSkCFQWTP7ZD9BALckjeSt
	UMoFzlOEINWHNyhYYWdPUVOLQAu3mzNkZYe6hhcLlnucAfhH8G6E5kA+RowXQNb1hdPVY7ShwIYEJ
	zMIvmEEaiARx7Qdl3G50/+Lyvpe9ug0Ta6jjeQP0xC6+Etg4SpmPOOo4WM/C2KTLYDabHEckTqbcd
	hQ0jSFkBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX86L-0001QU-PQ; Tue, 19 Nov 2019 18:19:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX86A-0001HA-3q; Tue, 19 Nov 2019 18:19:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8C891FB;
 Tue, 19 Nov 2019 10:19:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3585B3F703;
 Tue, 19 Nov 2019 10:19:32 -0800 (PST)
Date: Tue, 19 Nov 2019 18:19:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Luhua Xu <luhua.xu@mediatek.com>
Subject: Re: [PATCH 2/2] spi: mediatek: add cs timing configuration support
Message-ID: <20191119181930.GF3634@sirena.org.uk>
Mail-Followup-To: Luhua Xu <luhua.xu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Leilk Liu <leilk.liu@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1574053037-26721-1-git-send-email-luhua.xu@mediatek.com>
 <1574053037-26721-3-git-send-email-luhua.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1574053037-26721-3-git-send-email-luhua.xu@mediatek.com>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_101934_203335_095FA994 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>,
 Allison Randal <allison@lohutok.net>
Content-Type: multipart/mixed; boundary="===============7065251289718277082=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7065251289718277082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Content-Disposition: inline


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 12:57:17PM +0800, Luhua Xu wrote:
> Add configure SPI CS setup/hold/idle delays in terms
> of clk count support, and use one period of current
> spi speed as default if setup/hold/idle not indicated.

We have added a generic way to specify delays like this via the
set_cs_timing() operation and related fields in the spi_device struct
which operate in terms of spi_delay - Alexandru Ardelean added them
recently.  This supports both times and clock cycles as units so should
fit with what your hardware can do, the interface is new though so there
may be soem rough edges to worry about.

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3UMjEACgkQJNaLcl1U
h9DuYQf/Sh6DLOmgyjnIubrb27dh7rENm3ubM+wQws2RYtpLpn81Y+QeCeuFmG+5
qab+os+aGjg82VyLmLMU07NqDkCLfu4JVFUudK3M5ZLCZcQQ0VPhQ2CUSya+gSkr
cDrncou8L/Q7E1HlRwY+b3/S1qLxrMGYA5JkaivmCTC/RRhtUDb+6JORzIpVER15
XrgH6cJM79jkEfUWoz5AQITORtrebZnKDsYDxWzbcjLE0SleAK8AJ55zPf1QNzMz
qX3dpdyEDPfMWEiCitAOHRNzwpVdBKwOCN5vXJdbPXRJN7DhkDwWigDSaz+9uL0m
f8lMvtoliW5cyEX0Q/O+WEvR9vdvjA==
=vdlB
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--


--===============7065251289718277082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7065251289718277082==--

