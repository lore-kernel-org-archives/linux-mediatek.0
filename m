Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20399C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flkVgJSkLgJ6BOpNMmZn044hSm3xppsdwA5+7hs10Sw=; b=n4hYXtWfEwIYE6zCAGpisZziEL
	QZuGB8q1p4rdY4845vsS/lc2xwiBFbthQr2DrhZ5KpKpVAo/lR2iccZqLOOt2BLDwJIzmfJNV3qDN
	43kdYaWfwH+3g0SHayHrd0N4nxnQ/oEvWfkTOTsoizbFM/Vs09CDiU8Bi+IFRqPa2MRqwOT6mcMS0
	BivkpTTXrzS5nwPdoFDeRFDm7AfI29hKtILIoaljuJ3aPX2Zf4erwyRYpVVe7OfkgYyZ0YhAu7gaI
	5HJGB6A3+SLfGVymDr/BWsK4bHwWUsVIQMfYG6QhHMioCVM78+iAZM9VdvTguXYYjOGuUNVfH3xrr
	BYBxG2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcWc-0071hX-FI; Thu, 04 Aug 2022 15:12:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcWY-0071fD-NK
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 15:12:36 +0000
Received: by mail-lf1-x135.google.com with SMTP id z25so31279876lfr.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=flkVgJSkLgJ6BOpNMmZn044hSm3xppsdwA5+7hs10Sw=;
        b=VoNdeeXAdgGXCwnYXIP0vshrJlTj60Rj0SlnPnxPXaKKWiUFheu9gCKm8hfkKqss4q
         uYQzS3hcLbXxbCwFsFCrf6KwE5Yi2bWFe7YoI0UIhgzlrMqmbNYlgjbPE+tHi/0JDK8p
         Jx2NKK6q8R9eW80z/ftc4GQg5ypo3E0oKACcSRzK1M/qfq4McC0vPWDXWfaldPwFvaGP
         R7o4j4FZvOjyxtuiNODfEQ3DyTbxyLjW921OdjA2jHLFmdZL3bpldBpuQQYSIwifglt+
         ByaQjKOzWHbsGOd6yPtP/Byff7IzkdG3a1TVnSONhRzjxJTK66sDwmzeIBw1LJrSNzGw
         Sp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=flkVgJSkLgJ6BOpNMmZn044hSm3xppsdwA5+7hs10Sw=;
        b=Gy3w5tcixui6IyxfFlslkThqdeHGfCEvL7oLUHdT8oMcx33Fxpg5KqGF1VPDYsmcum
         II49x6y+uyeWPA1p4XlTiDvbF7quOCJIE12LwnAFpiOqJrTZ+LsZ70IZ07ZzRcLdfkN5
         i2zzqEq8WMFLH66OQp3/hZm7MLxUUmy09wPrZ+xyn0TXwGsdXxDpWTZL1GG/ScuiPr8Q
         AsI9DUwf2Tr2qRv/HiBLldHZveI6jAlGboB79FMSTmtKzTXEwbYdGvSeBQLE24kb7ak4
         hh0L532qB0GUkwpShaLL/lgUAUMqOVak9Gwgc8sCjGPglLmoxC04GT8nSoE2XV7/YnMV
         iZ3w==
X-Gm-Message-State: ACgBeo2Uihs13WmzCX8FurCiCT1TIWran5vt9Q4isjsRXKWgBZoRJD3+
	DgdxC5Osyly8MctUIeiGBFbcqA==
X-Google-Smtp-Source: AA6agR4xRfdJNey5VDI+Z+Ke7JJhcpNk9MMKaJuqCPEr/8M6Ybdcf7CJcsxxJBA11P5XBB6r/pHgyA==
X-Received: by 2002:a05:6512:2202:b0:48a:1153:d3a0 with SMTP id h2-20020a056512220200b0048a1153d3a0mr798559lfu.423.1659625953271;
        Thu, 04 Aug 2022 08:12:33 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025e51a00a5asm156500ljc.41.2022.08.04.08.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:12:31 -0700 (PDT)
Message-ID: <96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org>
Date: Thu, 4 Aug 2022 17:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 02/20] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220804021553.14867-1-tinghan.shen@mediatek.com>
 <20220804021553.14867-3-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804021553.14867-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_081234_851130_E8AD9F6D 
X-CRM114-Status: UNSURE (   8.56  )
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

On 04/08/2022 04:15, Tinghan Shen wrote:
> 
> It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> matches the 'else' conditions for gen2 HW without gals.
> 
> Rewrite the 'else' condition to specifically identify the compatibles
> that utilizing gen2 HW without gals.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno
>  <angelogioacchino.delregno@collabora.com>

Unfortunately, your patches got corrupted.


Best regards,
Krzysztof

