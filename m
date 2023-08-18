Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD7C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20wNMj8fVoVyKhboSQHfoKHw647G9BheWqVVEyUS5uM=; b=22j8JIdlqdUMzuaSjodpyuUXs2
	pDqpCcml44UCXh09GQ6wuErJqg62K+/POCPq+/KH4ObRzkWfyCC7OvHj4VeDfe5Wp6O6Tk+j/hCkj
	29JJ/azjy4wHK1ngFHPJ1Bw7vMNAYexYur6NUeQtrEANVurslB9p63Rz8s8P7FibKy38GyRcLxgBc
	ZX7ZKPcR01etuZUsQx0sHL/9IAzdhuvSO++BSy5+j+kS/YduH3qspQwBYu/8qZeLtS9FEGjqwDg4v
	+vi/8zobXyysBsG9ZaiWL7XiYCtjK49pfGyTDTbuQ98Ie6AjtgVPXFYyPz/PpFKt0nKK1MSAsGUGQ
	dWveWGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuZt-007xXT-2A;
	Fri, 18 Aug 2023 08:11:29 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuZm-007xUY-08;
	Fri, 18 Aug 2023 08:11:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F8D1E0003;
	Fri, 18 Aug 2023 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20wNMj8fVoVyKhboSQHfoKHw647G9BheWqVVEyUS5uM=;
	b=E1kP1jnX29Q4qu4glrInautWz/RFHmzs5BNl+IerHY5vYL3V689QYZSLwGU3EW/Kj8mcTa
	MY+D3fgMG+MK5C1j4+xNmHyEgANAJi1Na5Syh9v4yUsJj71FyBGTcgDjSlynxglSMkgrhk
	QSq+PLzMOiHWIs8s4nI6ofe1I5XX0eZuv7nGJVhRniU+3RhgWwxSQESkuqPh9S8jkwHKMU
	fEZlgnpP5gP+gWcqvXHpywClkvqh8XMuNDsemLABP9mFuz+FOwuh/QuU/Fz2e8It0nhUF3
	/vwUryhfRLuFEHBth5h38xGCZ5eIWq8Uu70+nwW0kLYDz2hiF0Ttkun/IsrPDg==
Date: Fri, 18 Aug 2023 10:11:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
 <pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
 <rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
 <vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
 <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2 03/12] mtd: rawnand: fsmc: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230818101110.23fad57d@xps-13>
In-Reply-To: <20230818074642.308166-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-4-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011122_265787_FAE1DE31 
X-CRM114-Status: UNSURE (   7.78  )
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

Hi Li,

lizetao1@huawei.com wrote on Fri, 18 Aug 2023 15:46:33 +0800:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enable (and possibly
> prepare) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clock explicitly. The
> label "disable_clk" no longer makes sense, rename it to "disable_fsmc".

Yep, please keep this last sentence here, it is useful.

> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---

Thanks,
Miqu=C3=A8l

