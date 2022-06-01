Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C38C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQZQi/Jrw3qvYPq1w5WSVXwwszr1N2uvMGdGYFMBq24=; b=xEvcGF0DlGxQFy
	Jr07JHCGud2gAjMW22lWbsyF2duM8MtFFqROnycgoH4BQ5mM8M0SDDfcX/wcIl7anSrBEX18nwzv2
	XPUKRTnWbBFNcWglqojOv5a71/pkSb6oDp2AUobGcaK0RmVQ9hNfJ9fBrutuCK6UdKntuKA7jDfbc
	t3ec4ss8mLZat37jG0K1CbrWZZ4gqapeYjKbFPY1v2UkjrpOrnLnoU2/ZdCBj9N/yQorycSRqjLE/
	TReuuJma0VMpEFcU1ytCXb97hNjOjQJwGXDGx2mOR6mVMqUxF1+49RkRytTIvpT7CbGMf8jUDdboa
	JshWOgLgHPXqS9JgwUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLcj-00FJWy-Qt; Wed, 01 Jun 2022 10:30:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLMJ-00FCIt-5q
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 10:13:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id fd25so1498135edb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AlvALx0zMnGDVnEapBQ7KHJlm9HnZCeBAZQY2Z7YIfQ=;
        b=MyCjNSjG2AHbNB2hBMdKLs7JyeIE2MU21L7NxYzqYkgJshTjTAEE3mD+wxlpLMSZa1
         6kCgUApP3XMk/l0RKFbqTKkRmn+B8M5eZoQ9wj6leLnRPShsmt0NiHxg5OAui/Wjj4iJ
         i4vfSEUecvq6/DBHNM7UiaodK0JQQ7g3UoEYaWKtumlj0/PvIpngsENEmCTNfzM89Tb9
         QkF+JF2c2z/S4FXGch+hlLzAcJGTiwGowPWEiaeRIqEt7wYuCN7+DXZTH5/EvCioiExI
         p4j/Ly9/9+f7IV1cf8EFCHLLNIAVtSW+2Z8+zxv26svn+bQyu09y+iFILQTj/RvG+YQl
         /OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AlvALx0zMnGDVnEapBQ7KHJlm9HnZCeBAZQY2Z7YIfQ=;
        b=KO0f6mZzNA/IJSb09SqWXUfF1X+H6aOyMoQsVEFIjGerSYw1ij6oLAvo2tIY2weSjf
         xMcXO7CMbWoj/XBiZLeZVhd+fu537QoT1egbO96u9v5aQIKw7GBQ7NeBkw9gH4rETk4c
         9NCcb0n1EsE+vYRomIX/gTkdAPYqw/ESRY+K2BAEeKh+7rc7FJAY9w/+Ah7EyHuRPnXB
         2piWhddSfjB7lviMyjmQcMVfP9uc7APdcJzbDbHnA2cxiVAuPge5MtiOYDX7Jb5Gx3/w
         jWKXsFDY0Jc0ghWJ78Cu/u+GsLyN6g7W0GxJVmyLVKbabyxGl87kzLz6rnlC3Ht7z344
         L8jQ==
X-Gm-Message-State: AOAM532NYDlqi2LBaJAoyFKUblRnZGhoH6KQWv2cxNNK4brT2SEchMwJ
	Qzvsun3Gy5kPK7qOxhlqviCUvA==
X-Google-Smtp-Source: ABdhPJx/6T0uvLJqvrWkeIA6nNBw+V6b78iDiCeD1eckOus4w0IQXWKCNYVm2nBgb3y+6PpRaLcMOw==
X-Received: by 2002:a05:6402:51c9:b0:42b:63c2:6657 with SMTP id r9-20020a05640251c900b0042b63c26657mr51960414edd.255.1654078425689;
        Wed, 01 Jun 2022 03:13:45 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p5-20020aa7cc85000000b0042bb1e2e2f7sm716587edt.8.2022.06.01.03.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:13:44 -0700 (PDT)
Message-ID: <44798b51-1410-d1db-3c53-0a90beb714ea@linaro.org>
Date: Wed, 1 Jun 2022 12:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 12/17] dt-bindings: phy: mediatek,tphy: add MT8365 SoC
 bindings
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-13-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-13-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_031347_258482_9474B491 
X-CRM114-Status: UNSURE (   7.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
