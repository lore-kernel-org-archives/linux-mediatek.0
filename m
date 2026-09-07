Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0232EC79F8C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 02:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n3xihmU93G11KDPuXpxUGjTF/aZtrqDlguEa+obsXQ=; b=TMFVQm1udoI38s7Ctsl+TB+o4S
	R6xu22H4gb9nF81Uk8Dn6UAFDIzwvDqQekyA1fs1hfoPyp6zfC68toH7xUFe7M0aWX5YO0EvMAwls
	29/8clkZ3XmcB7IxxW3RozLf5ADixiYzk86uDzUg+S1vezx2D2sCk4hrxWWv6phtGMDbut3vV4ZAn
	vEGnoqpbcFb58gKNqALU6plwNVfJuWlE8UCnApPyAtejVB6tzXJe0qOY5OezyZ/0YyGwdANhMKJXX
	EyHx9JZ7r/o2QIYwuW1mp0VAQszwNG/t47cY6u+ok7Qn3foD4ROyEnk08nVSpzjLxoTyrz2XlnuI2
	WZH+e5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3PD1-00000005itM-3bwc;
	Mon, 07 Sep 2026 02:35:47 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3PCy-00000005iqn-3B9S;
	Mon, 07 Sep 2026 02:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788748493;
	bh=/n3xihmU93G11KDPuXpxUGjTF/aZtrqDlguEa+obsXQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=kPpcBlqQEvSQBLI78Elo7gnb72DI8U8o36Fu/XYO7mpZHO+3awF+8TvtUj89a4ct/
	 YWAvRlyhjEAnlLhC9Z9Wk8oST5FPFoRByvZc7e+cgSyRAkmEB/eWb5J/OQeK7DrAbv
	 j5M8k6zCQdCD+Hkh8++lzkcSbdQ0W/7xBr3vPstU=
X-QQ-mid: zesmtpgz3t1788748484t9bf26c94
X-QQ-Originating-IP: 7jcO50RqRIZxPHY/moH8hgYnotivvrpyVTcywJ9C5gY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 10:34:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9707735077275929228
EX-QQ-RecipientCnt: 59
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 07 Sep 2026 10:34:37 +0800
Message-Id: <DL8QEYABXVMN.2CF6XXBXZ1X6U@linux.spacemit.com>
Cc: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH net-next 25/33] net: spacemit: k1_emac: Remove comma
 after sentinel-entry in match-table
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <kurt@linutronix.de>, <hauke@hauke-m.de>,
 <chester.a.unal@arinc9.com>, <daniel@makrotopia.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <ansuelsmth@gmail.com>, <linusw@kernel.org>, <luizluca@gmail.com>,
 <alvin.sipraga@analog.com>, <clement.leger@bootlin.com>,
 <justin.chen@broadcom.com>, <dlan@kernel.org>, <rogerq@kernel.org>,
 <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <opendmb@gmail.com>, <andrei.botila@oss.nxp.com>,
 <wangruikang@iscas.ac.cn>, <amadeus@jmu.edu.cn>, <kees@kernel.org>,
 <tmshlvck@gmail.com>, <c-vankar@ti.com>, <horms@kernel.org>,
 <vadim.fedorenko@linux.dev>, <daniel.zahka@gmail.com>,
 <nora.schiffer@ew.tq-group.com>, <v-singh1@ti.com>, <oss@vassilevski.com>,
 <haokexin@gmail.com>, <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-26-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-26-s-vadapalli@ti.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OOjPmw7/kYvNFpziBHOUgvSDVse/N8sfvrEHT1vw+v143DBev3KaNj9K
	d0nc6lq5/8DlPcBkYDQm+JZAaDtphg49BWIPlNHRnJn8/BjjDeuYNqDsZNC/zhFK0nDpoK/
	SOGxqGPaVOfmALdiL5CqYgw6t3Kibs2jaKxWXUShsO0Qne4RGa3c6Ls75NV1bwR920RpEjm
	wnmHfVh3wokVV8MInzZVVvZeAwOtLKsfF2yhnQwy3Gu6t4beamsZqVDWzBhFusmhonKYROo
	DV56CnAremtB9uzPJRoRekVzyYBS7ASO0mrz2hmvE0Ciwt7HhiUR6g6au+WjiJ9ZeodzaWK
	wR/sZ8y0d7jt4FCsKcqmmrQdDZTi8D8RZKnP4zDO5PpLWrra3+UZSlr2QpJ3kyYj6O+Dw/6
	8e4fb1nTfzmflhzCdIPWhbaItBa5lahfp/an2jrl17tjg6rZbe/6SbULjeR5YteQtpxN8ui
	9XwmbzARqEWr1JhWrQT5r+MoEoPHG5BOlSW7G2OF+TwEIjqfYyVu2WHjqbkICADGZocc+BX
	j9APOhiR8BSAJz0zo8GKRcM3z3HsNqobFR6ukTpPOOG0k9yqLBnn+dKSeT+zTnidT26l8/N
	h6jr181CgTsKct8+GJjK66z9206FAft9Mdw3TZ7PvMDxu25lM5vvIkG9kgV/rywyX74tWBQ
	u2b//1lIOSIaCZAURdPzrXsJBvyLUFDETQibjN6XQuQnlDhRsIfEyr6q6ZV/hCchMBlJit/
	TUelKWbjCMm8DJpXHmwDAPLSZQrkvWaQn0UqVNVPIPI8M8H1/8LGPymX9j8VgATWPRCcYoi
	dhFomeGb+n/VPULa5Yz3+ILzmkIIpIoMycsRzubAvSsYBfEL4wqi+Ajl4nz+q/R5iVfqSrJ
	3d0Vr7r8EkamzeqBw7PB8iMShVjEWH17H8fzvPs0wsefvQaP1/H0NPZ1t6yaLWXEjSfNXP7
	EPwCTR4oLnJ3D+G2dxQYrunCCTzwG8bHQrJz3IrR+mSIdWNZnzAi2WYUk5aFWfCKjBUti3G
	MxjgPTqCRiU4Vxsd0/C1+Zzloh0Dwx6ZWI008MZtiGOVMm+wdndaF19H9PyX2s6lF0PIdkT
	uKQY7yDKRQH
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_193545_713221_DF4752FF 
X-CRM114-Status: UNSURE (   5.98  )
X-CRM114-Notice: Please train this message.
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

--c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 4, 2026 at 12:36 PM +08, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap4ivQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvrKoA/jq66no0m3AM6WPip5A8SiOQeVPyie/PjbmRqO4w
PamfAQCtuus+o1dOGS/PPW44oBGtqifxJT5WcMspAw/AJH0KCQ==
=xCA3
-----END PGP SIGNATURE-----

--c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865--

