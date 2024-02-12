Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE30C4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vEZLSQ2lC6GM3kw7B6sPNqQpV2xiO+FOIW9U88v6R8=; b=aldzay/0zAC1y3+OstroGDh2o7
	VWL+tAfS8luzlqmEVGdUnLfm+dc4DLkx7LYHmWLM34WUjwGBXhgOgoc7iIsJk2LBRuuAotH2M9itU
	yBWh0FP84L9SUNUD5sEwwZRVnokfjmAtTLqqBtLSt1JB74Loo1J/lvBAoc/8bcThhZdpws7/Hz6rw
	e1dQESOSP6fAyS3KbtlzDUb1mfzVA94zweSAop53TA0aKaZ06q5LhZrGXSayfuFi6qLQsyOVC7ZFr
	uxVpXIx3jTgy2vfV0OylEP813EWL5E6hA3ofKPrAcO+gfKB2/Dy4vzX7ipRU2qPaaCbo/Pgx2aPK9
	VG7xedng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRwh-00000004ehu-0GSK;
	Mon, 12 Feb 2024 08:45:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRwd-00000004egR-0Hgp;
	Mon, 12 Feb 2024 08:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707727533;
	bh=37r0uDvHoWoAoOBklJ4SqXVIYvqKxmwZ/Tk0SnZaf+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fJryANDEDkxFcOEd3TUe/SVHBoEa5dLt4yiSEQeu9fSuLMqXZx/6Z9AjuSgr0sb0w
	 94y230CFIf0xaLG3dnGvej3PBfhS9NflyU/kD0wV1qHYnJlfYfkO0GogZ5VLMxeZem
	 g6FAGJch+wn9KMso8OvF9ENAObto1qxsi4WbPxjFP31pNeXZEKTUyS1oYD7rtUrmae
	 afznMbX52hgVfgCaJY1qjZO83Q9pEP+S6SwrTpYHHIo8hocnoX8QkmzmZBUyz+MgUx
	 AsYpfxfSkwKKjMCMgpab6htGn5oNB6f3QdaUq3GFXX6G/4NcvmIJMFIshQ26BWe+g9
	 v83F7VlTTi9WA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7ABC2378203F;
	Mon, 12 Feb 2024 08:45:32 +0000 (UTC)
Message-ID: <5cd419e6-2585-4f9e-b814-b928ebdb18f2@collabora.com>
Date: Mon, 12 Feb 2024 09:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: Prefer struct_size over open coded
 arithmetic
To: Erick Archer <erick.archer@gmx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rob Herring <robh@kernel.org>,
 Li Zetao <lizetao1@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20240210161619.12656-1-erick.archer@gmx.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240210161619.12656-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_004543_285435_438ABD7E 
X-CRM114-Status: GOOD (  18.89  )
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

Il 10/02/24 17:16, Erick Archer ha scritto:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
> this structure ends in a flexible array:
> 
> struct mtk_nfc_nand_chip {
> 	[...]
> 	u8 sels[] __counted_by(nsels);
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> devm_kzalloc() function.
> 
> This way, the code is more readable and more safer.

This way, the code is more readable and safer.

Apart from that,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> ---
>   drivers/mtd/nand/raw/mtk_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index 60198e33d2d5..17477bb2d48f 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1356,7 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>   		return -EINVAL;
>   	}
> 
> -	chip = devm_kzalloc(dev, sizeof(*chip) + nsels * sizeof(u8),
> +	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
>   			    GFP_KERNEL);
>   	if (!chip)
>   		return -ENOMEM;
> --
> 2.25.1
> 



