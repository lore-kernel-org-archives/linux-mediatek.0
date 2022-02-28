Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C86EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhYEk2VIAxrSoq2DLLm2lsM7zdPwnKeSZ+aKR8qdBj0=; b=kxwHqGd/2ZHo76
	GJKsW5qYFq4CBHU+/kvjZ9vUUeONUFDaXbTxws6oOhg1KCHyuEXHl2YUho/LxRQ6kmtWCFrMxnVSx
	RVzPG4R8e1aT0a8VEZLW4uu9zQLVOhQbkQiWAS4izVbw1f9RT6TflDbw9OxjAM0s9BCUPhZ5g4Rfo
	g1S3TXskUSZTI2HANj+SNwwazQy0ittL5Yuf+T9ofRmUErN8foN/LJLoxeOQrsrgdIvNDgG/WV+fl
	6QYrK/nACC8ofzCSpy+AAJABCaFDTNhiChTyVZTys59wzzFlRhV06r8Fr3LgVGtB8Qwqda/2kHvhq
	Ui8gYRA13ou7znLxTfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOepL-00C57c-Kd; Mon, 28 Feb 2022 12:08:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOeAk-00BrAF-EQ; Mon, 28 Feb 2022 11:26:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id n14so14876948wrq.7;
 Mon, 28 Feb 2022 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0nOl9Gu2cS+40aKnl77MAdTBzkl+e2ajXLPqa1328c4=;
 b=RF4z69yluICtYu1fuLZaU5ixtaQDPyAtJIV6s7TbYCPDKfko8sreM/MwfRn1VCiVB0
 TSDCP5j9Bnpu2IOzh061GbVz6HMuZpuN1R0Vg3dYvBkElL2SqQ+XsqzJS/AaEkhVxfw8
 wjb/fCMdjSlcZ3gLtLUiAjcGxqyIgkLiSdPfg+MVpcYvPygMabCcQirectYD9SNiQcC7
 fB60JFiWqd2xEG7hLjg/wCYtRsDbH6QLwiQ9J5RvnUl6+lgM0nvbbnxwSaHUGPVp7fQK
 56bQlW4K55lgpwfxgKyCGG7EdXEhk/UsWnq8TC5BCaqrtBDDWNQ6IyZV0/E/JCHjALLN
 Qhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0nOl9Gu2cS+40aKnl77MAdTBzkl+e2ajXLPqa1328c4=;
 b=ph0lDXs1lhJpjADtBUmkPYPbRX3Ee60f++WIUBNY6whpW1b0yTrLUu6nqorkmPJdvT
 YkErESk3Wq+Shw0EBtr4gN0GVVRjtiFvBCbMt9cUm/QqCv6V72jSvN4c91Bqa0ZpkEYs
 UMw/DUN/JMZoZZE24CVRRmNqYTDcbzTp5ymqiktNQhvlpSDb5CZ/t0zHJTF0FeWXdJzG
 l3qVdDv5xb+wDDSfZh7Xj90xiGZlu7mQiQPL/h7N1Vfsq5HQhdaC2LeJFuTRTD1rS6Zd
 2e4y3QAbe7uPz07+kB/yP1bIdjJkViiV1MzgFdqCpVCRBZNCpza4qylAuhDNPbXKve1y
 kF/g==
X-Gm-Message-State: AOAM532gMeFgAalRE8gybdB/dgoOODUXSRG094FDZXCVDKYGvVrWyNjD
 6dDKW3t/weFglwX9k1crSRU=
X-Google-Smtp-Source: ABdhPJyEN3IVhZ9CqchTTNuRDYhwp5BAWHwjBXE4AYXcGoAFKxxj9OkPswk656aj1zqS3OkJFo7PcQ==
X-Received: by 2002:a05:6000:1c0b:b0:1ef:f0cc:6e53 with SMTP id
 ba11-20020a0560001c0b00b001eff0cc6e53mr1225544wrb.715.1646047592597; 
 Mon, 28 Feb 2022 03:26:32 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm9847832wrw.49.2022.02.28.03.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:26:31 -0800 (PST)
Message-ID: <530f6169-afdb-8242-f4b4-54a54a73948b@gmail.com>
Date: Mon, 28 Feb 2022 12:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/7] dt-bindings: timer: Add compatible for Mediatek
 MT8186
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: hsinyi@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
 <20220128062050.23978-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220128062050.23978-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_032634_581066_8D294122 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/01/2022 07:20, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This commit adds dt-binding documentation of timer for Mediatek MT8186 SoC
> Platform.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index e5c57d6e0186..e0d20d6adf81 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -22,6 +22,7 @@ Required properties:
>   
>   	For those SoCs that use SYST
>   	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
> +	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
>   	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
>   	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
>   	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
