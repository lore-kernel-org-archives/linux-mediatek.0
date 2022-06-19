Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94A8C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jakXNefXr+d4XHXk3yMQZ4OQ2nmGeDzmNhlPkvj1/X4=; b=OOA8hgrlVLoc2OudelB6r7Kj5i
	tpXQOOq4KphKaALGze+8j4u6/SnxKY3dbM4AqFgy507fv8/0+Jq4HWIycoT05oo8sCmoQa1HCRw3E
	+PYcFl3TnRVtmT42H7duUoXr4Q1M8GW5+r50k46KQJkQFK76QU3IXrbwK/FcFQe+epHAEeNjeplTL
	m/pHLd1vCbfRgFN2lZxkB1Xa0Y49+3bphjGrbUNp4gQuqujsM+cm2YgEHH/th/F7MqpzG+VMqN4Ov
	ustZSmTdltGhYL96hGqvlvUVcJXFKf7XceLImTm03TujVCA4DFLnISD84ZSwn/dx4t0nk/7a+AI37
	SLns3v7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tgZ-00E9P2-5F; Sun, 19 Jun 2022 12:05:47 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tgN-00E9Is-9A
	for linux-mediatek@lists.infradead.org; Sun, 19 Jun 2022 12:05:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id p8so1348858edc.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jakXNefXr+d4XHXk3yMQZ4OQ2nmGeDzmNhlPkvj1/X4=;
        b=D58WLVKUXyi+dx4Z2fQfDcotvsZXCiAWSQWbsXluKMHKlXC6jSVQM+0nw+Sdn9K6XF
         rTjtQGmVXuQyIQHrFGrwUojJHyTCDl5nxMHbA8cGs2aZVFWVFeJnwJXC5Ffr8pbiH+Jr
         JResf2C3FcIn/SNNowXrLlVKeprt7jHqsyiJsOIbawrR7MzGbgFqkCbfrFvdAR57vC6R
         R9rotoR4f0NPXh5/1HZoWVgPYWqB+lin1Nv+sHnQWY6Ex5AibOj2dpTzaepVk2XXAjeX
         R+AAhW+DbWMclZiMvAsPoUNTLW+MFB78voLjhmewSuXZpfdxoiMuMfOhCKmptP35fzqR
         740Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jakXNefXr+d4XHXk3yMQZ4OQ2nmGeDzmNhlPkvj1/X4=;
        b=7xmgef5GmdCN+MhcxcP9jv2xtN2oghkcSd61l1MrmQ4+FRpaWETHzU6Xzyob4i91w5
         P4315JMeHWRJVMeVNIQI4tcgUo9bwjiyIJChgp3OB2DEZB19ezVDAw2DNhLGH4uZcXMk
         kBsS5IBZJqy7dGKaENkFh/DjG6xh6mca1yZ42W1LZ/lUmEL671QEyS6PMbm1WNrIE16h
         BwShZbRvK+N6BcuYoaXULHq61jUzaCpCHx5OOM/WMqDt+v2Pz6yLkVdBysg+zaagQvnv
         zsIWRa/lpGY+W2HLTJzW3xDg84cBTU3ZIEeM6DIWWxq+V5zPr1xVfCclvZxj0UnPdICA
         AWJw==
X-Gm-Message-State: AJIora+gQ1tt3M9Uyu0VqiAZMPhZH7/UxemG0YIctqfGv9uahx/GvhWA
	w1x7zFNW86hik5JxQn9+Kj3D3Q==
X-Google-Smtp-Source: AGRyM1ubMh4MAcbm8HuB4hANaOoImVAB4pUW4EYnaEi/EHV0T9LSSNyaYUlQlOGQLgoD6UW/FDUnnw==
X-Received: by 2002:a05:6402:350e:b0:42f:b2c1:9393 with SMTP id b14-20020a056402350e00b0042fb2c19393mr23592753edd.11.1655640332791;
        Sun, 19 Jun 2022 05:05:32 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o16-20020a50fd90000000b0042617ba63basm7708329edt.68.2022.06.19.05.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 05:05:32 -0700 (PDT)
Message-ID: <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
Date: Sun, 19 Jun 2022 14:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_050535_380299_0F6D9A1F 
X-CRM114-Status: GOOD (  16.59  )
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

On 19/06/2022 09:46, Chunfeng Yun wrote:
> On Fri, 2022-06-17 at 18:25 -0700, Krzysztof Kozlowski wrote:
>> On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
>>> The current clock list in the binding doesn't allow for one of the
>>> optional clocks to be missing and a subsequent clock to be present.
>>> An
>>> example where this is an issue is in mt8192.dtsi, which has
>>> "sys_ck",
>>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
>>>
>>> Change the clock list in a way that allows the middle optional
>>> clocks to
>>> be missing, while still guaranteeing a fixed order. The "ref_ck" is
>>> kept
>>> as a const even though it is optional for simplicity, since it is
>>> present in all current dts files.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>
>>>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9
>>> +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>> xhci.yaml
>>> index 63cbc2b62d18..99a1b233ec90 100644
>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> @@ -80,8 +80,13 @@ properties:
>>>      items:
>>>        - const: sys_ck  # required, the following ones are optional
>>>        - const: ref_ck
>>> -      - const: mcu_ck
>>> -      - const: dma_ck
>>> +      - enum:
>>> +          - mcu_ck
>>> +          - dma_ck
>>> +          - xhci_ck
>>> +      - enum:
>>> +          - dma_ck
>>> +          - xhci_ck
>>>        - const: xhci_ck
>>
>> You allow now almost any order here, including incorrect like
>> sys,ref,xhci,xhci,xhci.
>>
>> The order of clocks has to be fixed and we cannot allow flexibility.
>> Are
>> you sure that these clocks are actually optional (not wired to the
>> device)?
> In fact, these optional clocks are fixed, due to no gates are provided,
> SW can't control them by CCF;
> In this case, I usually use a fixed clock, or ignore it.

But in some versions these clocks are controllable or not?

Best regards,
Krzysztof

