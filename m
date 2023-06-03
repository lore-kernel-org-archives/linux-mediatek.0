Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48508C77B73
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jun 2023 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJv1+07zztxnXaWB2lGLhpwvzjwzOPI66T01+jArZXQ=; b=oR3ZI19UOho+TM8vqi59h3Sx6G
	5Es4NRcS4err1huCWBSDIUhJvh8cPVa9e6IqaVn1oSuUJ2io7is6KDockk6ilKq1NDwf9V1wEA2mK
	1KQ/ea8yEyJpLLgmmK68K0i/W6MYt5YwSUcMcmtU6Gtm2INeOIx48JBtQ9quv4+8kEXTYddbJWh2e
	inSp3VgPINQ2/gp0BNzXdjuNP//12kJ/QnpaD4ody37PxcZOdMKufGcBLigN3DIhNcGQ5dZYbF0k8
	iwTdLOcTBT/T23RZhA/qcHGtomQnOlWeMQGRbcDUYVGT29CFYf+U/L8T0uB9RPA5ds3ufmdm4Urxr
	vjhzQPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ZFa-00AioV-1k;
	Sat, 03 Jun 2023 21:57:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ZFX-00AinG-1B
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jun 2023 21:57:28 +0000
Received: from mercury (unknown [185.254.75.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 65E4A6602B7B;
	Sat,  3 Jun 2023 22:57:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685829441;
	bh=hJv1+07zztxnXaWB2lGLhpwvzjwzOPI66T01+jArZXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+6zwYvDfkcEW67V2s8wtEUsRo+LG6xkCsd1FhS3pQ7RyKPIZH8NGTpoWuJBnoFSj
	 sWudrVLaPg3txEwfu/KRQNgJnDzqLlSSdUYB/7KKYl5xWXXrLKggqchaUhMDRNWaaM
	 pKxfY9cJSLO+MHLf06v2q5S3T4grbhX7NUPGEdvkeZWoadv79OJKEWrez5VOIelpMe
	 7BFzw7kOMgfvmU2YU/ZWjcNJRRSLa31JngHg2en7AyfyPGMTWmlUztaWRjStSEvh3v
	 Y+U3iazDDbitswzonWPDBuC1OMqgfjvclRzPR7ZeCuGh5vJvLw00gkNP7zMHYKcL1O
	 e7IEV8YEzXGTQ==
Received: by mercury (Postfix, from userid 1000)
	id 03463106090A; Sat,  3 Jun 2023 23:57:18 +0200 (CEST)
Date: Sat, 3 Jun 2023 23:57:18 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tony Lindgren <tony@atomide.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20230603215718.ca5hdzdsj4btnlc2@mercury.elektranox.org>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tneo32rghtw2mwkv"
Content-Disposition: inline
In-Reply-To: <20230603054139.GR14287@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_145727_570589_FE7D9F2F 
X-CRM114-Status: GOOD (  11.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--tneo32rghtw2mwkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Jun 03, 2023 at 08:41:39AM +0300, Tony Lindgren wrote:
> Looking at the kernelci.org test boot results for Linux next [0], seems
> this issue is somehow 8250_mtk specific. I don't think the rk3399 boot
> issue is serial port related.

The rk3399-gru-kevin board is broken because of a change from me
renaming CONFIG_MFD_RK808 to CONFIG_MFD_RK8XX and forgetting to
update the defconfig :( This means the board is missing its PMIC
driver. It should be fixed once the defconfig update is queued:

https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/

Unfortuantely nobody seems to feel responsible for the generic arm
defconfig files :(

-- Sebastian

--tneo32rghtw2mwkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmR7tzsACgkQ2O7X88g7
+pqWzQ//Uie7CBnwn5JUIsHsI4pPtgldOe3Z8n7rWBzZvYXWIfkk/BJg1Dw8i+Xx
QFeJoehfNn02Lkznixt6ZsIL6iVQketP/BfKSFl/QFV/LkKqqRn8lqdwOtDi3ek5
LVEN0nbMCI6KMNFZgnIU0Vg6L7RLKA/PgAZ9n0FT/rnKQBj3yJCE9/UaqdxFmZ2Q
GMSOWPh21szOK9nd+9irXGLtJBirdSK+uzkwIt8zs/Ff2NiUPbHw+cArDb1qZwJ5
t7fLF9HkbrDViQtJr5eHdmVhXT4WIPZbeob2tKUy37weZemNXd9LTOjJlAxu7voa
swsc/jVZJCjQrySnn1MFmL8nV/Ae+MDq/EceDR5JpiiS/NN4AtdzV+ieRcqhf10a
Amni6QCMoe4nqMEFAPsdOTe1obH5qiTYhRohkIBjrQQ4CgCUDk6fvlq7LFjpW+ZD
BNsVHk9jlO+VKMclFLAmgWb4gV3HF68SE2cpOCtYINFmaAqxRfiboeIEsGDGOuA7
869iSzU5Z1m9Cz0huFRH6QaDIMCI4+WWikekGuTT3vuFdh4OgH/1ZNdSz2RizkGi
oQV08HqL8tkufUhFeiLUfDZhz6LmNzanlMcQZbEzlOyN9FOqXSZ4/BhPCLJtzMrT
tjDdjj0wFg7NgAJI+v6n71GpVDzWMNufTt+ppYm7GNRsveW+Dt8=
=oc53
-----END PGP SIGNATURE-----

--tneo32rghtw2mwkv--

