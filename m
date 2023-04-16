Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D9C77B61
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmJlKr7h7wrZk7+EWt+2i+sGb391Uksv0LFb5B7lgMY=; b=1bkCuTyQ1U5y7ccFlV2FELmG09
	n4WrCpxcgv3DRvxIfn5rnR89NeuYzX39R8JQbzhGjiwJ1Jip4lb1/LEh3Vk0W4zOKSP5RdHH7/KYy
	ETX/zBzkMNVHM4boDkebJ+TiCobowu/H++DC3L98CmhvLx05wJVD1hGKj+jNRga12idZ32n17T7JE
	5+km9EaNoXMQLX7j8i2oGgfFWFX75idup9mH7GUmKVMt0ClazOuazjGPwuwZs5RbvqiClevkR2z/4
	I1a99yF8QfXUl0GxsOJ+k635kn3z23z/QKCttF2TJ13qP7CHgO2p2pQ4HwnM9GUh9JcgGE9+fZ7tE
	c/1o45fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po695-00EBDo-19;
	Sun, 16 Apr 2023 17:26:35 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po691-00EBC7-1I
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Apr 2023 17:26:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id kt6so20202629ejb.0
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Apr 2023 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681665989; x=1684257989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VmJlKr7h7wrZk7+EWt+2i+sGb391Uksv0LFb5B7lgMY=;
        b=oSbPgpXvDFIZlnRCzfUa+M5xXfSTYT/azB5s8gUdOo8H7YPyoJxMsDJT/9FBXKTGN5
         4lvzDMaeho6hryYvHayGj5p4pR8yL4fYaCl+B3wYNiOj1/EaWh+ux0AJGarPrF4Vt9Gv
         /3BmMfURGNS220VFcST7FcLxTbUecKCbOwAX5ViP++6MdLThh1P0mZoAglk4vFvnZoQD
         ndmxTSgez/HJGCLoU2eIVo5HgvasKe7jC7bmpNZ0JUqHyIsWNoRGdMUHa2Qfs67FTjqI
         FMTRzwNUpvV/LDs9tXszqgAmdVrbkZRgooxxL32xLFBfc51bHXowTfkmNsNdRbeQSnOL
         i8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681665989; x=1684257989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmJlKr7h7wrZk7+EWt+2i+sGb391Uksv0LFb5B7lgMY=;
        b=f1rTFyzFiawleyUy6BQBMPrzppj5wCv7RLIvtkGm8sv+zIDuwdupfvud0ppLCLbdPm
         ejhADWCbGkLDJzV65OP1NUKD+Hqz2WBHdeX/XjkbG/KNdQ7r+hwDCP4P6a2lBgvnrHMo
         PgbHpdJz1AtwmYb/KeC1ZoOqulCtu3w8g0u+Lw2nTAnKyEu8jj2aScy9X5rzbF69Iepf
         bKdLIRoBcowOjN2gBHgdTHGZIV67TBE7t2PcThbUGHRMQGuuNxpfwf3mrAu9gGqC3pKS
         c8R7XQXnANd08PgcopuFR8Kig2YpqUdAlIefBQuruHeOA5SNFYRJSZizMxbgb+4DLdjV
         K/0A==
X-Gm-Message-State: AAQBX9dnFHGq5GBfIVgjbOs4/BNZGeR82ea65qPK4SbA+NIF+7u/eC0G
	OW8XjdkbzrIx6SxF2SlPVdkVKg==
X-Google-Smtp-Source: AKy350ZdSBYoLUiMvinEM1HVcDg1eOINAy32L8MsvIrHeB/CrkvnDl+z8dFUS9Lgv7qkJxYcSWJNCg==
X-Received: by 2002:a17:907:985b:b0:94f:3ce3:7cd9 with SMTP id jj27-20020a170907985b00b0094f3ce37cd9mr3330134ejc.10.1681665988967;
        Sun, 16 Apr 2023 10:26:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709060b4800b0094f3cb173c7sm1550313ejg.63.2023.04.16.10.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:26:28 -0700 (PDT)
Message-ID: <abefdf2e-076c-6f0e-46e3-74dae3d068c1@linaro.org>
Date: Sun, 16 Apr 2023 19:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] dt-bindings: watchdog: drop duplicated GPIO watchdog
 bindings
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_102631_534151_DDDAA9E0 
X-CRM114-Status: GOOD (  13.95  )
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

On 16/04/2023 18:04, Guenter Roeck wrote:
> On 4/15/23 02:51, Krzysztof Kozlowski wrote:
>> Two conversions to DT schema of GPIO watchdog binding happened and came
>> through different trees.  Merge them into one:
>> 1. Combine maintainers,
>> 2. Use more descriptive property descriptions and constraints from
>>     gpio-wdt.yaml,
>> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
>>     properties.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> For the series:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> On a side note, the e-mail addresses in patchwork are messed up for
> patches sent by you. As result, I can not reply to your e-mails after
> pulling a patch from patchwork. This means that some replies get lost
> if I did not keep the original e-mail.
> 
> That is how it looks like after I pull one of your patches from patchwork:
> 
> To:
> +=?unknown-8bit?q?Wim_Van_Sebroeck_=3Cwim=40linux-watchdog=2Eorg=3E=2C_Gu?==?unknown-8bit?q?enter_Roeck_=3Clinux=40roeck-us=2Enet=3E=2C_Rob_Herring_?==?unknown-8bit?q?=3Crobh+dt=40kernel=2Eorg=3E=2C_Krzysztof_Kozlowski_=3Ckrz?==?unknown-8bit?q?yszt

(Trimmed cc list)

Thanks for letting me know, I wonder what's the problem. I am sending
with send-email exactly the same way every day, but somehow this series
have such header in Patchwork:
https://patchwork.kernel.org/project/linux-watchdog/patch/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/

Which I do not see in:
1. lore:
https://lore.kernel.org/all/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/

2. Previous patches on Patchwork:
https://patchwork.kernel.org/project/linux-watchdog/patch/20230310223012.315897-1-krzysztof.kozlowski@linaro.org/

Lore (1 above) points to possible unescaped UTF character for
rafal@milecki.pl, but I wonder why send-email did not handle it.

Best regards,
Krzysztof


