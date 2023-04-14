Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C6AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=; b=jTlM/4yC/hvRCZt88O/NH4+gqx
	7AFOZn5tlF0QIXwsVRxW1Gq7lrdimCQEqvEkruyDlZmmXz1KZ4MY05d2Yk0F+e/jUwtxE6MEYg0Ab
	EIPz3Tf/jMCu98aGag3dmALXpPQDS2xRRJT2EPEbSuwSh0ZAgTUIoW5Dg7V3rJOMipBd4Y8GUtmGU
	2xUzGEHUNZz6ViCJtNr5bw7FajLoT6fZHn9dnbNrjRTxwtFnUxY/ugad0QAJhEru2a5n9DIPH1VbU
	n58hK16eRgdbrpwlWk64Eoto2UFdLmRPHuGlTPlv6Rw5zlp+oLu39SjTFOqxFhC4SFebv1Qq7FooN
	ZpznDiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLd5-009zzJ-39;
	Fri, 14 Apr 2023 15:46:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLd2-009zyB-2i;
	Fri, 14 Apr 2023 15:46:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id v10so3981875wmn.5;
        Fri, 14 Apr 2023 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681487183; x=1684079183;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=;
        b=CGo8j1W2FmAqMnJH4qAKnNiqxbf8gAuLuQXj3WINrZZa2nZXrtKScsRfz+ZfBs9CJu
         MstNB5C5MjYfLqx24lPYBblayV3WVt+GN1vWPW01aBZVxvxBw5r4ib8Zz1hDE2aqM/Ru
         BoLvB6Nn6II6x/0EBKVFKSgjHR4yB9IODMTVz1Uw+YsgEDSzyLVvnJ4pH+dlKuFJ8p3J
         VHg5q6CWFrUmLJuFQUV4+K9vZefK0Qc0huP8lmoyJiSIN8YJ/Gq0l0b+4tjwm+gsPfc2
         eWJLWXDMnQ2cflu3GD3SF2QCB2aYePTtkw9lpn0G+jRsKYxRZDRjkH7YiBeMfXg04ooF
         f9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487183; x=1684079183;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=;
        b=GCu58//XmJ/h8QmTB8zAo4CpW3VKCKrEU6P7ACHRgPlOoTamsS7bT2wXExdjxJEthC
         /sB/lbapuwetovhfIYOCPIEHTmrCBj1CQzSba4kpgpQKJcuQsGonSJX7tla6xwk0WLg0
         axVVQI0VL7bVwVGYYhbezeLQv3oQioPh1qJv1go+7FdORswhyCjTCZSl1vQsYdMbOQlI
         0H3jYZ1a62WeFOZ0/3t72yu9Xv92UgrXo6GrUohglSVFhk83432ION5FpnIpiyn97trg
         No+kI6P2vcLoHKbxU4SAGP18Sw87D3Q2NYQ2zADAeRyXHz+N52m8hOisdJxW/wkBi+Kk
         TI9A==
X-Gm-Message-State: AAQBX9fq+yw5B8T/HTLQ5PaO+oH2ShVgh/4qFX7VhNyrp99C1BFDwaZZ
	+AztCCiwlH3vo7Lr5u2+5KW4nUfObCOllw==
X-Google-Smtp-Source: AKy350ax94Q0q1onTnwQMV5EE3TpgRfQw3R3Ni+6sgIb+LfrPtBcUh9No7WTr/RfBPPvrV2RcFkbIA==
X-Received: by 2002:a05:600c:231a:b0:3ef:1745:518e with SMTP id 26-20020a05600c231a00b003ef1745518emr4976351wmo.26.1681487183309;
        Fri, 14 Apr 2023 08:46:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n21-20020a7bc5d5000000b003e91b9a92c9sm4607383wmk.24.2023.04.14.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:46:22 -0700 (PDT)
Message-ID: <40cf026f-61db-2fe0-f941-bfe5c9aa20e7@gmail.com>
Date: Fri, 14 Apr 2023 17:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com,
 nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
 <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
In-Reply-To: <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_084624_885430_B9EBD5E7 
X-CRM114-Status: GOOD (  11.62  )
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



On 14/04/2023 17:43, Matthias Brugger wrote:
> 
> 
> On 14/04/2023 14:22, Tom Rix wrote:
>> clang reports
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>          if (ret)
>>              ^~~
>> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
>>
>> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 

Please also add
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

see CA+G9fYu4o0-ZKSthi7kdCjz_kFazZS-rn17Z2NPz3=1Oayr9cw@mail.gmail.com

Regards,
Matthias

>> ---
>>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c 
>> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> index abfc077fb0a8..c63294e451d6 100644
>> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy 
>> *hdmi_phy, struct clk_hw *hw,
>>       if (!(digital_div <= 32 && digital_div >= 1))
>>           return -EINVAL;
>> -    mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> -                PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> -                txposdiv, digital_div);
>> +    ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> +                  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> +                  txposdiv, digital_div);
>>       if (ret)
>>           return -EINVAL;

