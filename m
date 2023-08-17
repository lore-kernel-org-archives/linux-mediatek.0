Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DBAC27C7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2QxWcxDz8QQBaIieB3TDIKnaV/ESQiBsBWpBtPRVn4=; b=LkxoKNhneP6NwVn38Xkr5yRIeZ
	vkGu9+6T8weP4nLHFetrb3gQb5Vsi/BiTmVBq4KyClnc6YdkOTWMNQ39eWodjjA2OKFL1Lh7UKEnI
	qXAxexH1RZlJbJeCO/cZl3rslWKwfVTKhz24PEPiOnvY3UtYOAxyqq29JyhUS1LsB4tkPwELtpqv7
	DNe3os83kGzHDR2DxmwEx0tsl8gvArBUBWf35bIZh/2JazOnlm2A57A1qbzgvDmDpz9mrXHGI0uQv
	QaYsOiDrj0MREzmcOV7Yx/lp1wD1fJ67cgE83joxxbfIROz4+qwkpAOWDUkRr44+D5ygzz15tkA5w
	Rxhjn4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYPe-005pTm-2k;
	Thu, 17 Aug 2023 08:31:26 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYPa-005pSE-2r;
	Thu, 17 Aug 2023 08:31:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CCEE4000A;
	Thu, 17 Aug 2023 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2QxWcxDz8QQBaIieB3TDIKnaV/ESQiBsBWpBtPRVn4=;
	b=bdxpozFFU2fFnkkE/B1UBT1L01BP5ilQfq/KnE+ll1iBe/bzno0lYwYLgLmnJNgZl2sVSN
	Skfda1ztjNvDBOu6T7OZiwR89oxJNMTNwM7CNVP9ybRCDHoVlkf3jPzYl8FDRGPl3LRX4s
	a5D8NTXoQ6sSSGikstvoTUHuRHacCAOg464MHwIfYi3V4qsECjzeXKikZ0Po2DW6Kpuxrd
	gV3WmERdYPFr1PLqVZK5nK4RG2hh+ydk43QWDEzyEoqz60zM6DaeOyukH4w4l0n25b2VhS
	smob/G8UnizyJVXDGKl3DfwMenc4hpxZjwBljYoeb21ZIiDy9byizHu54mINbA==
Date: Thu, 17 Aug 2023 10:31:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <michal.simek@amd.com>,
 <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
 <frank.li@vivo.com>, <robh@kernel.org>,
 <martin.blumenstingl@googlemail.com>, <philmd@linaro.org>,
 <geert+renesas@glider.be>, <u.kleine-koenig@pengutronix.de>,
 <rogerq@kernel.org>, <paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
 <yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
 <christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
 <jinpu.wang@ionos.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 03/11] mtd: rawnand: fsmc: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230817103110.2042d4ff@xps-13>
In-Reply-To: <20230817024509.3951629-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230817024509.3951629-4-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_013123_184288_041A3E49 
X-CRM114-Status: GOOD (  15.73  )
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

Hi Li,

lizetao1@huawei.com wrote on Thu, 17 Aug 2023 10:45:01 +0800:

A few nits for all your commit logs aside from a comment below:

> After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for

  Since commit

> prepared and enabled clocks"), it can replace the pair of functions,

			       , devm_clk_get() and clk_prepare_enable()=20
  can now be replaced by devm_clk_get_enabled() when driver enable (and
  possibly prepare) the clocks for the whole lifetime of the device.

> devm_clk_get() and clk_prepare_enable() with a single helper function
> devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
> (or enabled) during the whole lifetime of the driver, it is unnecessary to

  Moreover, it is no longer necessary to unprepare and disable the clock
  explicitly.

> unprepare and disable clock explicitly when remove driver or in the error
> handling path.
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc=
_nand.c
> index 7b4742420dfc..ab1b9a5c93e9 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c

[...]

> @@ -1157,7 +1153,6 @@ static int __init fsmc_nand_probe(struct platform_d=
evice *pdev)
>  		dma_release_channel(host->read_dma_chan);
>  disable_clk:

This label no longer makes sense, please rename it to "disable_fsmc" or
something like that.

>  	fsmc_nand_disable(host);
> -	clk_disable_unprepare(host->clk);
> =20
>  	return ret;
>  }

Thanks,
Miqu=C3=A8l

