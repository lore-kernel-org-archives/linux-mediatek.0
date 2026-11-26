Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7F606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GkFQSWS1;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=KbUuDHab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UJo02l1mQ0uehbgfZzOdVT+lGxEStk6m8nYn67wZ5PI=; b=GkFQSWS1RRorm9
	L8WUXl+vxfiz/6M5qEO3ngbbNlV52aVOhcHWDglAdnUHW3Qy/R/bJ422P5L8iu/jmYdUPCPYheIgH
	iX+NERKa2+UsCTBMZWIM/pfM3dua+99ZBRmr5SspIpksdl3y0FyQxKY3sgyXFpGlHG1N049aBuunq
	y+CyYJW6velMffbnDpWOSeWOsud1jOdQvHEGXI37BCZfhw5YsBUfwGeVDlNhaIbT4VFgwYdEXcD7q
	ShPypJfJGtR/O1FipREOI2vm7jJs8CsFUpD0TWwOaZF+cmKRYiaWT82BZEKxQafMkMVnHx7uocX3v
	TmVqxZe+ul37eF6l1XLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUCC-0000000CJmL-1y43;
	Thu, 26 Nov 2026 07:47:08 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUC9-0000000CJlC-2gXc
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 07:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795679222; x=1795938422;
	bh=UJo02l1mQ0uehbgfZzOdVT+lGxEStk6m8nYn67wZ5PI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KbUuDHab3QGZ6vcSkm6e4V7lrGNVU+qERwBBTgOUU9CruBFEClSm0lb4SWSabiHrU
	 iYzSkSL1s9h0jBhB7IySZGsWbSI3hQpaZ+mlu2hC7oH4cKg1tnYKj/aMrseLlN2/ny
	 2u8SRd38peIAqFs2MbeiqOqnIa37LBrD91XkT3QcudO4et1zg3ktHizYRaB/FE1353
	 TuBeSfK55r4ZKJBikuAVpeFvgYo9tofUWNRhKIH4CLGixdiyzYu/AWIVw2sGCj0/UW
	 Kn04B8G3Tj7lzSd0hhqIzoz/yxFJGOQutGwuae/KDIBI+Y1edscITQdhUKuQjrKjEU
	 x24MZonFJPWZw==
Date: Thu, 26 Nov 2026 07:47:00 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mt65xx: avoid division by zero when speed_hz is zero
Message-ID: <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
In-Reply-To: <20261126003314.49090-1-iasnezhkov@gmail.com>
References: <20261126003314.49090-1-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: bd172fa2e85f944e93f3e460554ef986a0a027ca
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_234705_837954_D124ED6D 
X-CRM114-Status: GOOD (  14.07  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thursday, November 26th, 2026 at 2:33 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> spi-mt65xx does not set host->max_speed_hz, so if a slave device omits
> spi-max-frequency in DT and a transfer leaves speed_hz unset,

It's better to set host->max_speed_hz instead. There's another division
by zero in the mtk_spi_transfer_wait() for max_speed_hz.

> __spi_validate() passes speed_hz =3D=3D 0 to mtk_spi_prepare_transfer().
>=20
> Because 0 < mdata->spi_clk_hz / 2 is true, DIV_ROUND_UP(mdata->spi_clk_hz=
,
> speed_hz) divides by zero (undefined behavior; on arm64 udiv returns 0,
> which then underflows sck_time - 1 to 0xffff).
>=20
> Guard the division on speed_hz !=3D 0 so zero speed falls back to div =3D=
 1.
>=20
> Found and drafted with an AI coding assistant.

This note should go below ---

Best regards,
Roman

> Fixes: a568231f4632 ("spi: mediatek: Add spi bus for Mediatek MT8173")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---
>  drivers/spi/spi-mt65xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 8b4deef..2baea0c 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -509,7 +509,7 @@ static void mtk_spi_prepare_transfer(struct spi_contr=
oller *host,
>  =09u32 div, sck_time, reg_val;
>  =09struct mtk_spi *mdata =3D spi_controller_get_devdata(host);
>=20
> -=09if (speed_hz < mdata->spi_clk_hz / 2)
> +=09if (speed_hz && speed_hz < mdata->spi_clk_hz / 2)
>  =09=09div =3D DIV_ROUND_UP(mdata->spi_clk_hz, speed_hz);
>  =09else
>  =09=09div =3D 1;
> --
> 2.54.0 (Apple Git-157)
>=20
>=20
>=20
>=20
>

