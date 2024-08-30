Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E89BCA0EE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=; b=c/K5CYWPNdE03iLzO2lNlIPeY2
	7zhynFIAAqxTM1YW2d0onrwbUY0EmNIVNWr094tTOnhp7TpflNz+3PPP54KB15/wqLTcQMdTykTNw
	CQMALgeAvI+W/tO3tDwnDxYyoYjsui/QfuZXNJeVvkXbn084AE9+gZZj9P+hDdEmls4P3PIDK7e3+
	KXnW10e43pExHd25I3wdJvqCeEVHHqzweYNnGG4KaZh9GRFUumwmybjeTAVd0OKacVZGRr1lZChrA
	TBEL08yezM/hxGeIqaUnd3YO8Xi9iQ+sBjKgWLJC60gmLnWhObGLaLgFP8MrCTFKb0RvvjrCXkJgc
	4eDdyNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwLR-00000005BUX-0ICD;
	Fri, 30 Aug 2024 07:46:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwKa-00000005BOv-3o50;
	Fri, 30 Aug 2024 07:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=; b=bf3eKyGK22jHVS6jNQYnKZ7rhR
	HDcjYW1JHER0Aov65bgRm9HdZBCbt4XT5h9QR58S5dONaJdjsn99iLwB62KiUYm4HJmlVSkLs5s5L
	S5ewXaM7Bzn5DWGQQyCkFr8faRkV2Adi/Vw9wGGUN4+vNBoxoV3SynsGPqqzBHnTJR8QjnkPzlAAj
	9CRL7yGOS7lZ/S2NemmQVq0kMvHjrn40f0r6+K0HeK6jGFgmcl42qIWK4gnWsLa1ob83ivdxOw7JU
	tqYdx9CTuJnREabjKfe4E5NN8Wpw+R7GfdW9rmGkUw0NZhXdh8jFbMbGbeLrQ4qftU8eiBfrrrvPa
	0hzUGOow==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwKV-0000000Bb70-3Vdn;
	Fri, 30 Aug 2024 07:46:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B771BF209;
	Fri, 30 Aug 2024 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725003953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=;
	b=KkNtioU+WkZU8XZauR1n22NpmH71HFly2u9LmqlUqpZSjxsw4D3GNaQ5b8RXOdRP1vIblG
	1BuAc/S3FaJlaTnMaxMPR0UE6gbAg476eLE/QamnjS9z+uIOF2mwRoIfCgwHv835j1RtvW
	m0zsNyod3wMcqq8cnPB1jN2H1P6rmLDO9HHI5S1UQ/laGZiXm+EjSjV2R6wuv2noboi4nH
	3Pq8Msc6rC+4ul0Zncwyhvt9s65q90WrR6JI+3/LBW8ChufwLbugaEO9c6DU+S+OwMiqoi
	p4PFJKlUzZmlxJsYYFb4y8Su6oy3DiguDX/0m3yFr7XoBLtTPvwInK9gm+PLaw==
Date: Fri, 30 Aug 2024 09:45:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, <michal.simek@amd.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <liang.yang@amlogic.com>,
 <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <heiko@sntech.de>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
 <gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
 <u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
 <christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
 <christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240830094549.1c513ba2@xps-13>
In-Reply-To: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
	<20240826115213.389acaef@xps-13>
	<f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
	<20240826144917.2c4e202d@xps-13>
	<c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_084600_072243_85AC31E0 
X-CRM114-Status: GOOD (  13.80  )
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

Jinjie,

ruanjinjie@huawei.com wrote on Fri, 30 Aug 2024 14:34:38 +0800:

> On 2024/8/26 20:49, Miquel Raynal wrote:
> > Hi Krzysztof,
> >=20
> > krzk@kernel.org wrote on Mon, 26 Aug 2024 12:19:07 +0200:
> >  =20
> >> On 26/08/2024 11:52, Miquel Raynal wrote: =20
> >>> Hi Jinjie,
> >>>
> >>> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
> >>>    =20
> >>>> Use scoped for_each_available_child_of_node_scoped() when iterating =
over
> >>>> device nodes to make code a bit simpler.   =20
> >>>
> >>> Why is this a resend ? Did I miss a previous iteration?   =20
> >>
> >> You were not cc-ed on previous iteration. I asked for proper split
> >> between subsystems and sending to maintainers, thus this resend. =20
> >=20
> > Ok. Makes sense, and the patchset looks fine. =20
>=20
> Hi, Miquel,
>=20
> Could this series be merged, thank you!

You've sent this series on Monday, we are Friday. I answered a first
time within 5h and reviewed it within 8h. So that means I will take the
patchset:
- when I have the time to do so
- after several days to give a chance to other to review it as well
- unless someone speaks up against it in a "reasonable time frame"
- unless a robot that parses the patches on the mailing lists complains
  about it (usually within few days, up to a week).

In general, a good rule of thumb is to refrain yourself from pinging
within 2 weeks for non-urgent matters like this series.

Thanks,
Miqu=C3=A8l

