Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD21DC6FA90
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 06:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyfZU/JafD8o6/SPahDQv0jUqUXGqfaIFI7Q3Ul2auI=; b=K9Igso76eVbNnmUduMbBlKLs0F
	gyr03qasHDWkGYGi7zlPb+6UdVd6tgLNdvchrMOqJ4TbA6AEojtvvUHMi/lLeEm+x5hF0PRRy6i5y
	TUPBd55pBLpXIP5i+AcRSvrcZZ5Xw15/55oUdOWaJBWEEo7fHWf4NGrm81qJlLYmedqkidXzKph1D
	cVnNv/ox60vmfdoXB1zULQx/U93YdNtrVEGDEppHdvbPV1zoBdsYfXV2tg8qPdMvm+sgfv7mFBGKG
	ddseVWHZorXEVg70/30NGu2WxYItfQnrS7ceMu0X3ocXOafgOaklbT9KzYHQaS8cOXsPEQ8e9hjZ2
	WDHxospw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFqh-00DbHR-H6; Thu, 22 Sep 2022 06:38:15 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFqe-00DbFH-IG
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 06:38:13 +0000
Received: by mail-lj1-x232.google.com with SMTP id z20so9799274ljq.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 23:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=qyfZU/JafD8o6/SPahDQv0jUqUXGqfaIFI7Q3Ul2auI=;
        b=kkd99uZxOdiNalyDhr8+He7hgk7NzeStc8HhuMSENnPjGg5C366/cLNg/a268b7aRY
         5FH1wAENXzz80lUMaNZ306V8yotqdPqE3YxE+wPwcPDhlDX/Zson0A40UeuKXDaEEa8F
         L7cQi8UJTDRbBnqgd8I43iHQZPLkC8E1iJvC343ZOsrcQJgik38mGMuP4nTykKe/bWc8
         MuLJQaf1ByHh9wK7CDMgHOOgCCSwedl+graYTN5ROFJPlNKdnT3ku8gDe/hJj6le1JEZ
         x3O5F/7rOwOxuRpFUxaZtGUBvdU10MfGNNDWhMvU/GmoKsV259wsEZWxn1a4tklEHtk2
         xwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qyfZU/JafD8o6/SPahDQv0jUqUXGqfaIFI7Q3Ul2auI=;
        b=jUYS+rHW75dl/02y78a/O1XcspqK52RgFHdbO2kFTrOLqjSRrmf4QKG3magSje3iEg
         +RpY9NtL6FSh+KtSMGytkdlnB9YNQtAUTuRi+g0xnCOvxgPQ2BGyUinjhumR/L8FkUPm
         k1lSC7rw3chcIhxqdLVnd2Mgs4DM63VzlR5eIZAYjuwQb34yQKid7uLwvCo7CWSx4Jd4
         ymkx/tF9bOFtEf3n+fqBNGklUxAY4v3XXeNK4qdQ/hvo4HAUJgXLOGRAjOmMW4XoW5g0
         jgUMzEKQ95d+jQreREfNbvj6dn70tfo2Uy8K3iXzO2ixGedTyNf+X9OtTluwzs6hT53B
         Ti8A==
X-Gm-Message-State: ACrzQf26yt4biVuqyicgu7zkzmp4LdxBxSmR4BByQhqU3yU3yRAHn+3D
	OME5eJHehXEjQ7Tv/9SVu2vjQg==
X-Google-Smtp-Source: AMsMyM74j0aPxMSIE9NbVNKhB5RET6Vu035qf1/l0Aypj5PElvYZATE6ZCJU/M40ykreSuiv5OANYw==
X-Received: by 2002:a2e:84d6:0:b0:26b:dce5:2fe5 with SMTP id q22-20020a2e84d6000000b0026bdce52fe5mr529732ljh.12.1663828688613;
        Wed, 21 Sep 2022 23:38:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b1-20020a056512070100b00493014c3d7csm767484lfs.309.2022.09.21.23.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:38:07 -0700 (PDT)
Message-ID: <821b3c30-6f1f-17c1-061c-8d3b3add0238@linaro.org>
Date: Thu, 22 Sep 2022 08:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/2] dt-bindings: net: snps,dwmac: add clk_csr property
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
 <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
 <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_233812_635717_BED78939 
X-CRM114-Status: GOOD (  17.41  )
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

On 22/09/2022 04:15, Jianguo Zhang wrote:
> Dear Krzysztof,
> 
> 	Thanks for your comment.
> 
> On Wed, 2022-09-21 at 10:24 +0200, Krzysztof Kozlowski wrote:
>> On 21/09/2022 09:07, Jianguo Zhang wrote:
>>> Add clk_csr property for snps,dwmac
>>>
>>> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index 491597c02edf..8cff30a8125d 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -288,6 +288,11 @@ properties:
>>>        is supported. For example, this is used in case of SGMII and
>>>        MAC2MAC connection.
>>>  
>>> +  clk_csr:
>>
>> No underscores in node names. Missing vendor prefix.
>>
> We will remane the property name 'clk_csr' as 'snps,clk-csr' and
> another driver patch is needed to align the name used in driver with
> the new name. 

You did not say anything that you document existing property. Commit msg
*must* explain why you are doing stuff in commit body.

We should not be asking for this and for reason of clk_csr.

Best regards,
Krzysztof


