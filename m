Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sffa2Hux8GaWgWWtPY8hkrJRPTRgOSkXQuS0QSdZFis=; b=peV8VBMwjyxGq14nNZxJEaVsJz
	ZrsZZE88+r24COcYTAJTVb28h48FASOYm3iSBwVbpB/LkBs33LCrGTXbna37KfZhblXAjIyvCfR05
	FPz3MjCY9LS2LUyO9bgElLiue5NwwKiGuAafsnHPaOHc8ykk2KQNK+FL6mrJc8ShxToDcRIrESLUw
	U0pkYkwUdeVUB/rnb2DC+6bFmEmE7jQWiwkYT4HE8/xxfwo3T5j1YsO2I0YvIxZZHY7TV3Tla23a2
	saPYotc85fa6kiMxWTnH2nqT5j2c5qWH03EloU/C8A/rO2E5ccT4bWysCubN6kl4OOUZBQEzEOcjH
	/bBdl9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eLR-005i8H-00; Fri, 23 Dec 2022 09:28:01 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eKA-005h8Y-7E
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 09:26:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id m29so6350467lfo.11
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Dec 2022 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sffa2Hux8GaWgWWtPY8hkrJRPTRgOSkXQuS0QSdZFis=;
        b=aF5d0f6QVvd38Mdy/2T+RdKXdHV1tHP1d/FlSvUZJDO0AMX2oD5pTxWaKLINjsGrCk
         33voj68lDcU27Mn4+rIW2DPXtxJ+KuXcKnpA9lgUpRLcnAWU63QTKHmzOlp3vXDwOuHY
         yr/gwVLdfkqPQ2XNiOHal0noWIABZus40cUWsEukeOLonsNe8Z3OWZGztMKeP/OjiWGp
         EeP2SgoDVIoXd6/wGIkIN9JpwKznnMFEPff86tyFnvB2j6diAL57ZJmaC3Fmd2IbGG2h
         JRpNNDILKAMpPeb0ofkeHuy6/ndOpNJRZJkn6vdYUMe/4rCpx8Z5SanRUt89QrLZkcV0
         Nwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sffa2Hux8GaWgWWtPY8hkrJRPTRgOSkXQuS0QSdZFis=;
        b=M7LxxOD8kw5w9fVSJc1/LC2gNDyfWh7xfTcirrnSigst7bY4XRT/U9oew1NX752u/S
         TudX6FYdAKtHIYjySDtDdJdX00B/hW21RTr0lK4z3zhDOBgkM+aJL2tR+cryoFtK0RMc
         K0zLRRkGNymT/ijWlIOcgg+acwbghS4uB/8TNq/GsFbvMt2jYnrqaol+0+BWlcOECZfM
         EpBOSPKdlHvRym6l590lXKlkWMmxNEmH9bySDPkDeCICvkWywiydAim/yZHwju/Q8uQe
         d4KSm6NElu58UEAl8rXq/58eqjGuqRHkKaJ4NXt9A+dRRGCnMSZ7HkAjnpyDeXOWLXkD
         5HvA==
X-Gm-Message-State: AFqh2kosTx7DYmn4xU2AIR+imShQ/HVs3cE7s5RasJCNpUqXjXyE+jbe
	T+cl9rwH98DmI9LY8vRS1ldeiA==
X-Google-Smtp-Source: AMrXdXvX2r5mqocclfvoOrl6ACTY0m1OG8B3pC83AXf4Py5ZlLKVUQRwn6/iWosyd9CVfwxT2J+oBA==
X-Received: by 2002:a05:6512:3d05:b0:4a4:68b8:9c2e with SMTP id d5-20020a0565123d0500b004a468b89c2emr3673035lfv.22.1671787597388;
        Fri, 23 Dec 2022 01:26:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a20-20020a056512201400b004cafa2bfb7dsm2867lfb.133.2022.12.23.01.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 01:26:37 -0800 (PST)
Message-ID: <46edd627-c128-b979-823f-0a94fe9d425b@linaro.org>
Date: Fri, 23 Dec 2022 10:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 08/25] dt-bindings: clock: mt8173: Add dummy clock ID
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org,
 johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com,
 chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com,
 nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org,
 daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com,
 pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
 ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
 <20221222114857.120060-9-angelogioacchino.delregno@collabora.com>
 <869ae494-d74e-03a0-3622-b3a2b0b10470@linaro.org>
 <960b0707-f0e5-993b-3706-a7a275e0698f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <960b0707-f0e5-993b-3706-a7a275e0698f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_012642_365546_43BD2747 
X-CRM114-Status: GOOD (  14.32  )
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

On 23/12/2022 10:21, AngeloGioacchino Del Regno wrote:
> Il 23/12/22 09:52, Krzysztof Kozlowski ha scritto:
>> On 22/12/2022 12:48, AngeloGioacchino Del Regno wrote:
>>> Some old MediaTek clock drivers are starting the clock count (so, the
>>> clock ID) from one instead of zero and this is logically incorrect,
>>> as we should start from 0.
>>> During a cleanup an issue emerged due to that and the cleanest and
>>> shortest way to keep devicetree backwards compatibility while still
>>> performing the well deserved cleanup is to add a dummy clock where
>>> needed, with ID 0.
>>
>> Unfortunately I do not understand at all why adding dummy (fake) ID
>> cleans anything here. Unifying IDs to start from 0 is not an argument on
>> DT bindings header IDs.
>>
>> Best regards,
>> Krzysztof
>>
>>
> 
> All clocks are in one or multiple arrays, and if we don't register ID 0,
> devicetrees will reference the wrong clock, as the IDs will shift back by
> one during registration.

So what stops you to register some 0-dummy clock? Why do you need a
binding for it?

> This was done for a commonization of probe() and remove() callbacks for
> MediaTek clock drivers... since we have 3 affected SoCs (MT8173, MT2701
> and MT6779) out of *19* (soon 20), to me, it didn't make sense to write
> commonized code to address this just because of 3 out of 20 SoCs (note
> that each SoC has around 4 clock drivers).
> 
> Any suggestion to keep this one short, while not touching dt-bindings?

Just add a clock or better empty entry in your table, without touching
bindings.


Best regards,
Krzysztof


