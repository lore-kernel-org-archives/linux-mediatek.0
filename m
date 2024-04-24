Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87689C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6P7PeMoVsYghy5vrFKuZZ8dvQa8FDTEh36cnupHuLA=; b=qKxf/kP3N/uY9LCLTPGPjWoNhi
	ye81xYqBb5lepmBC3S2vEaO2x9NkQQTWg2VvkGoTdBfqcAdgqbCMNjWfarlGbbcZdZnIdGJLt3kRr
	xdUZVJgm1CUhNwyER+IaZkBUIRdeHqDe2LJpNnoaWGpV0Ch5rZiowYiYrYcuKMlw0dceoOyf27bj4
	vbouJJm6DHpvUlTc/rKLf9+I13r/8JH36ma3LpEb4bNZs0vYmWhgbf1qabh4z5++hcBDK63R4DL4c
	MYvM7Bm3SgMwp1jIpNA7ibqLOCs3zJotq++Hhyxmsi95SeS23SDCtFCAq0zT8brRrn1cZ7Sawh8cH
	u29Jfzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzc7c-00000004965-034B;
	Wed, 24 Apr 2024 12:53:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzc7X-0000000495M-3vr4;
	Wed, 24 Apr 2024 12:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713963183;
	bh=JSqiDgDbyjkgKn+XJMpRiyYF7Ww8VBzY6JarthfyaiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LBcehXwzofAel3lzY+NnDkrkkkQrbfH2otP/FBGJwq5UniuYmJCgcuciYq/mPhC6j
	 BZJUmJoEKBUGCOWvs+8VDn09IJo2GagaeKicgotOgdRDBOMmtRmzZH+u/Kdg8RFdtA
	 0zvZU8WEAlu5Hc7XjWZZimdl0nQYSDXsnAH8Y8LFCuRcY7y1N4CZ36Jo88ZmNc/c+0
	 tZlrYl2fB3zgqaviTQe0zDpdymxdU+4aGcPmZGveVk7vrILViZggA68fbEeDoFZ/Ad
	 M/7GVTHBED4ss4LKoF/fmYWk7/BV8CjmkhRFTwshN8TX4aa3FUYJfp/6oTmcgIOTpx
	 Hv88iwW+Odv0A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBC3937820F9;
	Wed, 24 Apr 2024 12:53:02 +0000 (UTC)
Message-ID: <6bd66ba2-7fcc-4981-a2cd-d4500540da76@collabora.com>
Date: Wed, 24 Apr 2024 14:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] regulator: Add refactored mtk-dvfsrc-regulator
 driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: amergnat@baylibre.com, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, djakov@kernel.org, gustavoars@kernel.org,
 henryc.chen@mediatek.com, keescook@chromium.org, kernel@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 matthias.bgg@gmail.com, robh@kernel.org, wenst@chromium.org
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-7-angelogioacchino.delregno@collabora.com>
 <93c12354-2e4d-4b21-bc96-eeb55442e365@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <93c12354-2e4d-4b21-bc96-eeb55442e365@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_055308_227686_1ACCC4C8 
X-CRM114-Status: GOOD (  17.56  )
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

Il 24/04/24 12:35, Christophe JAILLET ha scritto:
> Le 24/04/2024 à 11:54, AngeloGioacchino Del Regno a écrit :
>> The previous driver never worked, and never got even compiled because
>> it was missing the DVFSRC driver entirely, including needed neaders.
>>
>> This is a full (or nearly full) refactoring of the MediaTek DVFSRC
>> controlled Regulators driver, retaining support for the MT6873, MT8183
>> and MT8192 SoC, and adding MT8195.
>>
>> As part of the refactoring, this driver is now probed using its own
>> devicetree compatible, as this is a child of the main DVFSRC driver
>> and gets probed as a subnode of that.
>>
>> Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> ---
>>   drivers/regulator/mtk-dvfsrc-regulator.c | 196 +++++++++++++++++++++++
>>   1 file changed, 196 insertions(+)
>>   create mode 100644 drivers/regulator/mtk-dvfsrc-regulator.c
>>
> 
> ...
> 
>> +static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
>> +{
>> +    struct regulator_config config = { .dev = &pdev->dev };
>> +    const struct dvfsrc_regulator_pdata *pdata;
>> +    int i;
>> +
>> +    pdata = device_get_match_data(&pdev->dev);
>> +    if (!pdata)
>> +        return -EINVAL;
>> +
>> +    for (i = 0; i < pdata->size; i++) {
>> +        struct regulator_desc *vrdesc = &pdata->descs[i];
>> +        struct regulator_dev *rdev;
>> +
>> +        rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
>> +        if (IS_ERR(rdev)) {
>> +            dev_err(&pdev->dev, "failed to register %s\n", vrdesc->name);
>> +            return PTR_ERR(rdev);
> 
> Hi,
> 
> Nit: (in case of v6)
> 
>      dev_err_probe()?
> 

I don't think there's going to be any v6, as there's nothing else to do on
this series.

Mark, if you want to fix this up before applying, that should then be, exactly

		rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
		if (IS_ERR(rdev))
			dev_err_probe(&pdev->dev, PTR_ERR(rdev),
				      "failed to register %s\n", vrdesc->name);

Otherwise, nevermind I guess..?

Cheers,
Angelo



