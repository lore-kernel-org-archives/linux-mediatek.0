Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B0C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhqd6GaMITBFWsSZxAFgSD/pVcPeYfxigZYKMLZTsVo=; b=UYRt1ISrY+GF5fWrcqq8E4rypP
	DvJrUpxaPQDVpIg+Ut+RY0bdH7ethElUYhoFiyCZ1wDLSwz9RiF9pmITTVob9B8HdGPRe2Z02Edwu
	yBsB9ZkJqUl2D+f6Oi84kRkBAmoiU+Mwf6cXE4uTpkMnkFvZJ3oj59Gm+ipQ8Hh/Q6XD+kiTgO6fA
	4RD0PYrd8GvmK593AMzv6Jh4pF3LVadUsDnxvoIADBtCsOjZl4tJuQ4kU0Sx+hbHnZiRFOGpIAgou
	q86uDowDqm8nQ/hSm883ebU+DU8azh5xOZf5ZbLEGSWPmAbAfkdQxhSE51d/Qv2EU76uLvQDA2gPD
	IBE5z2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMtt3-008lVr-C0; Tue, 31 Jan 2023 16:53:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMtsp-008lRn-6D
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 16:53:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1122723wms.3
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 08:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhqd6GaMITBFWsSZxAFgSD/pVcPeYfxigZYKMLZTsVo=;
        b=i9i3CPsz3L3rpqSUAW3pyNW8xK3QlaVCRlZmBfCSGLi8GBvgwncZ7dveHHpsz8lPRD
         mMhJlTJeBeXOqQ7lZSVG/9qIHj7us7FR/puBjT4U/9WZVEuuE4vwpdAjJptwTpUANKjX
         1qbINfj79rNUa7GkxWhtgZNM5f6sIaItYWXxB8+CG2It22ZUyxu5oPRSDlJSCtdrwCL4
         cKRuEz/E4MGaLxhn313/llcXOoMKKNVTM13ObIwCCx1RZYTAuqZXESRcz5RVO3kH9nOy
         EgrJUZ+1bKGKd1L3DNS2ZdYPYM5hJWAbSKow/AR7npIddv5hzoZ9+/wOqauugcRJjTAD
         9GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhqd6GaMITBFWsSZxAFgSD/pVcPeYfxigZYKMLZTsVo=;
        b=BuNyqwIVK5Rb8jBhuf2LatJtQSLFl4MNnflTAOdS+BGcHWEEjPOSD3U2Y+Et2cbjRP
         /66qEpJuzZTvRH+cFf6ktzP0DTFs936Q18DCVKx1pc8+KpY/JjZs7Amc1tskPnzY6Xzl
         XeorLfFt05Pf5DymciINrWnnCL5V3ikP2XI2SMCsoMKboXkyly+z/fX178FHhCnm6EXX
         6rDQ0kaXU4NfSszCDIeeOBAUNlZEppj+7MTvr+jh/fobOasWz234mnAaJFAahmW24yTh
         2efYcR7DcByixCZngYyMWKIg4XH2I4vroE7x9PcRi6ly6xFCiEj2nfGa17TmUy3BUqz4
         ZyIw==
X-Gm-Message-State: AO0yUKWecX6xpyuo/Wc2tFo3VzWmYbwnMmiM2TlsEO9HsWE2wIs+bUzy
	FNSwxZDgctdZ4onYzovNOfeFpg==
X-Google-Smtp-Source: AK7set+bIUfS0fpz76LjE4PV/djVbuOCT4BlmSf/Rro7gzNlxehxQ5YrL1YdpvbOcZrodSqxeHRxEw==
X-Received: by 2002:a05:600c:3b91:b0:3dc:5823:d6c0 with SMTP id n17-20020a05600c3b9100b003dc5823d6c0mr9404040wms.6.1675183998748;
        Tue, 31 Jan 2023 08:53:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r38-20020a05600c322600b003dd19baf45asm4052329wmp.40.2023.01.31.08.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 08:53:18 -0800 (PST)
Message-ID: <35a4d692-e4f3-e5c7-2d33-2d5e15694c33@linaro.org>
Date: Tue, 31 Jan 2023 17:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
 <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
 <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_085323_291857_8F0F6962 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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

On 30/01/2023 11:40, Balsam CHIHI wrote:
>>> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
>>> new file mode 100644
>>> index 000000000000..902d5b1e4f43
>>> --- /dev/null
>>> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
>>
>> Same filename as bindings.
> 
> fixed.
> rename :
> include/dt-bindings/thermal/mediatek-lvts.h =>
> include/dt-bindings/thermal/mediatek-lvts-thermal.h

Missing coma, so mediatek,lvts-thermal.h


Best regards,
Krzysztof


