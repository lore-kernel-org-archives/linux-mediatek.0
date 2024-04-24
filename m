Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BE5C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2zecfNezQcLS7/TPEc/i/RBRBH4yoSAoRIJo8Y12us=; b=WNivrHUEMDJ+A6EQgSR7b6R834
	V3kxpUVY39d+5hcujRAYHLzUfi3+33fUcGfjtEIB8vjtKkUULFskE7TF++nMG4gGH4u7IVJj+KYXW
	6jGZdktJyI+E6DpA15f6FZFJzAM6nxKfUs5h8287OSceDY2jVggIoVTFyVML3e8BnrnuhE0dK2CRm
	I8nWS5f8c3yjjnzVXdJD+MpndzegBMtWkOvIVxlBqRRDCrzsObMbrMOlhmwq7z6+Dc9SoZjDWI4F+
	EiuDjltx2gjExiw6j9lWKKAFOnVz0svvHbDkyC4YWH4p1uNTyTTP+jtW6Js6CEo41vLWrE1TtZHDH
	PSyH6/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZyB-00000003ifK-2kQK;
	Wed, 24 Apr 2024 10:35:19 +0000
Received: from smtp-24.smtpout.orange.fr ([80.12.242.24] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZy8-00000003icq-02RY;
	Wed, 24 Apr 2024 10:35:18 +0000
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id zZxwrgXWsHa8WzZxwrW7sY; Wed, 24 Apr 2024 12:35:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1713954909;
	bh=h2zecfNezQcLS7/TPEc/i/RBRBH4yoSAoRIJo8Y12us=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RewpzcqrFLLCX8GSjycSHK/O7YxBxMhCOig8ckghUv80CaJFslEskHhJ1Y8ioT2Hu
	 tQkdEdydNfFXFCgq/t5JH+UCKBSCRD0QQKPW2FXw53Z3qAQ+i5dCDtotEqjXk5A7Jh
	 4lmyuc5ygkVRv32F1a528mNyAo+WgSTElkNu4YopJ//yCdVRXZciBexmZeS/kUPJxT
	 geFAUo18k7wvt00zkCqux9gJGwpUuC1zCh86UOu72UcqLLKBtZvMlfk4Ex0fjgOwH9
	 6KfIOFqKj2C657lUcx2eEGGMBzSXh6GKymFn0DmcYZNvr6e/ZbgYmcn4MypF44DIfw
	 3pQZzecB/H2+A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Apr 2024 12:35:09 +0200
X-ME-IP: 86.243.17.157
Message-ID: <93c12354-2e4d-4b21-bc96-eeb55442e365@wanadoo.fr>
Date: Wed, 24 Apr 2024 12:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] regulator: Add refactored mtk-dvfsrc-regulator
 driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: amergnat@baylibre.com, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, djakov@kernel.org, gustavoars@kernel.org,
 henryc.chen@mediatek.com, keescook@chromium.org, kernel@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 matthias.bgg@gmail.com, robh@kernel.org, wenst@chromium.org
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-7-angelogioacchino.delregno@collabora.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240424095416.1105639-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_033516_615095_E4F94DF7 
X-CRM114-Status: GOOD (  18.36  )
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

Le 24/04/2024 à 11:54, AngeloGioacchino Del Regno a écrit :
> The previous driver never worked, and never got even compiled because
> it was missing the DVFSRC driver entirely, including needed neaders.
> 
> This is a full (or nearly full) refactoring of the MediaTek DVFSRC
> controlled Regulators driver, retaining support for the MT6873, MT8183
> and MT8192 SoC, and adding MT8195.
> 
> As part of the refactoring, this driver is now probed using its own
> devicetree compatible, as this is a child of the main DVFSRC driver
> and gets probed as a subnode of that.
> 
> Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>   drivers/regulator/mtk-dvfsrc-regulator.c | 196 +++++++++++++++++++++++
>   1 file changed, 196 insertions(+)
>   create mode 100644 drivers/regulator/mtk-dvfsrc-regulator.c
> 

...

> +static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
> +{
> +	struct regulator_config config = { .dev = &pdev->dev };
> +	const struct dvfsrc_regulator_pdata *pdata;
> +	int i;
> +
> +	pdata = device_get_match_data(&pdev->dev);
> +	if (!pdata)
> +		return -EINVAL;
> +
> +	for (i = 0; i < pdata->size; i++) {
> +		struct regulator_desc *vrdesc = &pdata->descs[i];
> +		struct regulator_dev *rdev;
> +
> +		rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(&pdev->dev, "failed to register %s\n", vrdesc->name);
> +			return PTR_ERR(rdev);

Hi,

Nit: (in case of v6)

	dev_err_probe()?

> +		}
> +	}
> +
> +	return 0;
> +}

...

CJ


