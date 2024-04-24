Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A43C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT+vTamhgNNxCWbIx+JUdYr0dVrCYA99sltJXbg92vE=; b=SbFJXDcDuUwJnONqEMpJLF3ACU
	qPj+n2hkCBdvLkhQ4H1LasBiEVioYkEAqFXehiFVi4evfcMhLezVLqTB2QQDPOybG9szuJe4MSYDm
	Wn2ALQS2VMGXYclnhp4pYJnuZZ37mXUdtdj1Ir3CQcJSF2keMhvqUCeNhHs3JmI5prbsx3hGBve4w
	NEZDgV1HXqr+jMuW16LJcUgTgpmh9+uHHk4aGQozUxH0Nlb35gryTALeSUdjF8X49RsMSa9MhQYVl
	DlEB5b/rMppeLS3VBNChuRYXYi2Mc0b3hsNku9EUmGb818dNAZB6z7CU/IZunmGT/2vzPtdiJGV1g
	8GPvevkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzc99-000000049QQ-3D1Z;
	Wed, 24 Apr 2024 12:54:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzc94-000000049Ns-1dGI;
	Wed, 24 Apr 2024 12:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713963278;
	bh=qdaeX/Pk+DcIM6hJBtx1rCYaCblxZTumnXXazIdcr6U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PnVmdGqf8HNZ4N3lv0SMsNW1uefy2c6NmZlfQ7Wm6sH3LQNrgaaguQIS32x6d/nhp
	 VgNCTOK74JdtJAjlTXIuBd0Cof6DWqGYlrX+Mmp/NSJS1ZwpWDk1uSbqslD25SgPvF
	 IiMxF/r/J1FmZLMzuen/YRC2q/NXwlJ221c6K74XaEV+osftenhVgQQFabtLOyDL8D
	 SHBZmQNRyYB/PVZ6Xj0s9ct8lOBm03imz0shNsqvueqQnRglZzfKpwTiOD/1xvcMfz
	 NveFP1QsUsZi4/DoCu8xoLUXml9M9iFPdWGx7t9cMx0dhd6EiQWcC57kYTqjdQyJNu
	 biLom3dB4HaHA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DAEA437813E3;
	Wed, 24 Apr 2024 12:54:37 +0000 (UTC)
Message-ID: <44257461-b9df-4107-8684-2d9c1b7ad6ba@collabora.com>
Date: Wed, 24 Apr 2024 14:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] regulator: Add refactored mtk-dvfsrc-regulator
 driver
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 <6bd66ba2-7fcc-4981-a2cd-d4500540da76@collabora.com>
Content-Language: en-US
In-Reply-To: <6bd66ba2-7fcc-4981-a2cd-d4500540da76@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_055442_576441_CA45A8BD 
X-CRM114-Status: GOOD (  19.11  )
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

Il 24/04/24 14:53, AngeloGioacchino Del Regno ha scritto:
> Il 24/04/24 12:35, Christophe JAILLET ha scritto:
>> Le 24/04/2024 à 11:54, AngeloGioacchino Del Regno a écrit :
>>> The previous driver never worked, and never got even compiled because
>>> it was missing the DVFSRC driver entirely, including needed neaders.
>>>
>>> This is a full (or nearly full) refactoring of the MediaTek DVFSRC
>>> controlled Regulators driver, retaining support for the MT6873, MT8183
>>> and MT8192 SoC, and adding MT8195.
>>>
>>> As part of the refactoring, this driver is now probed using its own
>>> devicetree compatible, as this is a child of the main DVFSRC driver
>>> and gets probed as a subnode of that.
>>>
>>> Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>   drivers/regulator/mtk-dvfsrc-regulator.c | 196 +++++++++++++++++++++++
>>>   1 file changed, 196 insertions(+)
>>>   create mode 100644 drivers/regulator/mtk-dvfsrc-regulator.c
>>>
>>
>> ...
>>
>>> +static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
>>> +{
>>> +    struct regulator_config config = { .dev = &pdev->dev };
>>> +    const struct dvfsrc_regulator_pdata *pdata;
>>> +    int i;
>>> +
>>> +    pdata = device_get_match_data(&pdev->dev);
>>> +    if (!pdata)
>>> +        return -EINVAL;
>>> +
>>> +    for (i = 0; i < pdata->size; i++) {
>>> +        struct regulator_desc *vrdesc = &pdata->descs[i];
>>> +        struct regulator_dev *rdev;
>>> +
>>> +        rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
>>> +        if (IS_ERR(rdev)) {
>>> +            dev_err(&pdev->dev, "failed to register %s\n", vrdesc->name);
>>> +            return PTR_ERR(rdev);
>>
>> Hi,
>>
>> Nit: (in case of v6)
>>
>>      dev_err_probe()?
>>
> 
> I don't think there's going to be any v6, as there's nothing else to do on
> this series.
> 
> Mark, if you want to fix this up before applying, that should then be, exactly
> 
>          rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
>          if (IS_ERR(rdev))
>              dev_err_probe(&pdev->dev, PTR_ERR(rdev),
>                        "failed to register %s\n", vrdesc->name);
> 


Uff! Forgot the return!

         rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
         if (IS_ERR(rdev))
             return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
                          "failed to register %s\n", vrdesc->name);

:)))

> Otherwise, nevermind I guess..?
> 
> Cheers,
> Angelo
> 
> 
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com




