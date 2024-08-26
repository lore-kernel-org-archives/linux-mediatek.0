Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5C0C5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObBjnqqW6wtbIZlueHVko8oEAEz7Tf+NNKHshQIvXFY=; b=Dt05nSBUn39D+8auI+WavoU0K4
	BBtKo4oih+YWhTJioT5Cm40o1hDAynVPVjOtDs/gE+mOwysqzWDTyoKoe2LSSFB4KTOds+2SZp5Xh
	CbABhPjzzKGp0dISNyjdNYRC++8PuloNZjcwthEXjhzaMYVCQMWUkPxDeY2SxwwB/6RwWgoKad+49
	0Ux4ob5yDHRxEFsM9VNrOIVR4YD2xVMb0vtw42AHWAm/MUCQ2bdnRPPpXNsaHMmtGS6xlMCY3aLtT
	2iHMBEAR2law/nXIlQVAfNT0jO6Uc5HWKzkZQwrkCsxSucnvCLxIzMoJDEDuXGRTPz6WilLLLxPXt
	XuFFtBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZAE-00000007Ny9-3lNT;
	Mon, 26 Aug 2024 12:49:42 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZA0-00000007NqT-1yfY;
	Mon, 26 Aug 2024 12:49:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5285CE000B;
	Mon, 26 Aug 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724676565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObBjnqqW6wtbIZlueHVko8oEAEz7Tf+NNKHshQIvXFY=;
	b=TuaABYt9EaUhaVwvZITINhU5UiQfZ2Z9oVYPSxs7XRMU/+5Qf8lbMHGiCyxipeHJTx4nbz
	iP3xsCyCt+cFj94Nyhfnotj5mf2CM636QOs6kuy+Z9Hzwf6QaxRh6yjl9CejQhCH791++q
	TOrCicK0NHVf5/WiXth2qSIEKbJg86sK0R9wrTeu1jLIBxNhbX90++nbT/yvQZezJ+74b2
	MiM9oyZqJED6HqZ9tpvrVSNgTn/vSfMNYyNDATv3xq7OxZe39QpNawJO9+emxRJICcwL6M
	di90LueqY4p4LbFpYuo+aKl/PoZBGqtQrr3yvMruosHTsamtEY0jrJNIcK2MfQ==
Date: Mon, 26 Aug 2024 14:49:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, michal.simek@amd.com,
 richard@nod.at, vigneshr@ti.com, liang.yang@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, kees@kernel.org,
 gustavoars@kernel.org, linux@treblig.org, robh@kernel.org,
 u.kleine-koenig@pengutronix.de, erick.archer@gmx.com,
 christophe.jaillet@wanadoo.fr, val@packett.cool,
 christophe.kerello@foss.st.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240826144917.2c4e202d@xps-13>
In-Reply-To: <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
	<20240826115213.389acaef@xps-13>
	<f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_054929_317662_01FC43DF 
X-CRM114-Status: UNSURE (   9.94  )
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

Hi Krzysztof,

krzk@kernel.org wrote on Mon, 26 Aug 2024 12:19:07 +0200:

> On 26/08/2024 11:52, Miquel Raynal wrote:
> > Hi Jinjie,
> >=20
> > ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
> >  =20
> >> Use scoped for_each_available_child_of_node_scoped() when iterating ov=
er
> >> device nodes to make code a bit simpler. =20
> >=20
> > Why is this a resend ? Did I miss a previous iteration? =20
>=20
> You were not cc-ed on previous iteration. I asked for proper split
> between subsystems and sending to maintainers, thus this resend.

Ok. Makes sense, and the patchset looks fine.

Jinjie, please always include a changelog when you send new versions,
and explanations for a RESEND.

Thanks,
Miqu=C3=A8l

