Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6330FC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnHmo4gFW6DvtXlbr5SoB1hjQ5uDPFdjubw1Z5KtC2M=; b=R0jvXFbBkJAVptvV5gN8vZfn8f
	y0cR8/I5UWat87GsJXGcX2hCibRCbHrEvGmcSQNCoIHh8Lb2IUg0vQrIfbcrQkcJYEAAx5sscjXzP
	kywbGDGzl0W/I01kvyxyCQ10wYlbuMNgbBgGRqaoMlxOWH47kOXhahuNo8ZnOGE5TAVyOvHufauR0
	vVS5rTF72zGHFNb+7ORiZg4Kv7Is/3tf+AVsC2Jq6kSvIaNvq4kGcrcKA3qqL+oR5Zh7XQyM3IiWp
	isJCfrng8iL9YRNqwn2/Js/oFoGi+N7OMgpQusZ/n7sqA4/OpoYu2Uo7A+D75rvTUcgGkvvTOzJ76
	AUlxv+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlsW-0084a1-Ry; Fri, 06 Jan 2023 12:31:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlsI-0084SS-N0
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 12:31:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id m7so1127272wrn.10
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 04:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnHmo4gFW6DvtXlbr5SoB1hjQ5uDPFdjubw1Z5KtC2M=;
        b=SyOuejFSxAddEx+shYlQwcTE8G04Ie0QLwOcfTtk1fcSYKU57DghPuiddX16YGhce9
         Jf6rRZx65PFSuprnTaAP7wFSVsNjF2xgV/GPVW0om+uC/iFnTdtl71azqr/+L/FwGGfZ
         6lUcRJMtsyltsxpjCRoquGxTbXxpBdyebnizObey88eGiOhUU9bA2s9zhgE0QABSoe02
         XgrmrXQc4lWTQr4nj3YDqIOjYfmB3Hl/aIde/y2vlmEmy7wUPUhGQ2UPAdD4Taobk120
         hh+G39kDb9nYUgBX09M0kkJ1cbcV+HLFGge/242G8XwfsqQ5/HVnfhrExDt5F16026Xm
         EH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wnHmo4gFW6DvtXlbr5SoB1hjQ5uDPFdjubw1Z5KtC2M=;
        b=78YqjUw8yAhHRfanTNyWlQ4qbPrb9++qh6cwg3wP6Uxe6z5ww9OdmFUI+5149B2pCD
         ckNcZLPntruzmoIz82LepLzgimWIYZraJg3p1TSSX4aRciJMxCvWNfZpRE9ORPCqgeYa
         5oqGEDYMEEP+S+4vpaYanBrfP0mUFulaR5gxtnw6NXTm6msKRTqfTJbXFwfertB+UoKb
         O3d8fXuQJqjGNLPmvdpVdoMkrbPh3HZHFnTdb2wG5JoMUCw65LwgKQz1OzcOzBh51T6U
         FHFjOb+6YsT46EONezVIs9P5Xt8ZwlczWfGr/FnaU6CGSTQ1sSQEuW5oNdgohcBRamVC
         N+Jg==
X-Gm-Message-State: AFqh2kpgV0q6+SL+Ck3uTSg2XEoAUYeedRDsVBrnPnEYltbyeGYdMYsS
	l/xNXAL9B47LjY19Vt0XJmPzTg==
X-Google-Smtp-Source: AMrXdXt3yJJLsVYpxsoJeK59Bp5g4p+Gb5ffEsOTVk+TtXtTzeNSQgMnqWwvEuJxK7jQW4jwJ5cC3A==
X-Received: by 2002:a05:6000:810:b0:29f:9832:ff96 with SMTP id bt16-20020a056000081000b0029f9832ff96mr9277769wrb.2.1673008262985;
        Fri, 06 Jan 2023 04:31:02 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q11-20020adf9dcb000000b00268aae5fb5bsm1115915wre.3.2023.01.06.04.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:31:02 -0800 (PST)
Message-ID: <ba51e54c-8758-cbcb-bfdd-e8f2efbf905c@linaro.org>
Date: Fri, 6 Jan 2023 13:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mtk-wdt: Add reset-by-toprgu
 support
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230106115326.15374-1-allen-kh.cheng@mediatek.com>
 <20230106115326.15374-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106115326.15374-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_043106_762733_6432ADF5 
X-CRM114-Status: GOOD (  13.26  )
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

On 06/01/2023 12:53, Allen-KH Cheng wrote:
> In some applications, the mtk-wdt requires the toprgu (TOP Reset
> Generation Unit) to reset counter after wdt resets. Add optional
> mediatek,reset-by-toprgu property to enable it.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index b3605608410c..bf06dcd0c12c 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -52,6 +52,10 @@ properties:
>      description: Disable sending output reset signal
>      type: boolean
>  
> +  mediatek,reset-by-toprgu:
> +    description: Reset counter by toprgu

Do not copy the property name in description but actually describe it.

Also "toprgu" is a bit cryptic.

Best regards,
Krzysztof


