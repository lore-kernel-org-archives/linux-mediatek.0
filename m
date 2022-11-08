Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A658CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnZW+it9gAVgvNTLwS9dPm0WTYzAoEQ3VftkRv9uUVk=; b=uXoBQ+P2CFT1psZu9uhdZad8Fp
	1xNkET42A+r8dzBuKONsx43c65RFejTWG1bXHGg+ra4D3nRmXQV549zTf50VBlzXaOMuqhWGSuXa8
	L9fkVg4COOdJAcTOSX0FTg0pxU38LIM4kx9PptrisJu0gCyXGmIdmd1aeUeWhhA/UXcRH7GGoHJ77
	b1W1+ei9m2JDFA2/8MreDemervzU9WkpXxegJYlMwL5SENJNB8R/kOX5Kd2fKDpO+jePwIypLd36q
	kbuH1DSQ0KfBYb/qPCr8oMOxUjZ4Rc2j8jfFwZEwviUQUj6yPhkiZO49qr45CdSqJGyCfYxDBk2PS
	wygAxdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMCj-004gEA-76; Tue, 08 Nov 2022 10:51:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMCM-004g3L-8O; Tue, 08 Nov 2022 10:51:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id l14so20360031wrw.2;
        Tue, 08 Nov 2022 02:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnZW+it9gAVgvNTLwS9dPm0WTYzAoEQ3VftkRv9uUVk=;
        b=Ujs8FDtI0g8RDiTm1SkcwABjS2X8XHfP6L5VlsrL2jSPPbfr95N0VsMY/6eCCVG8AB
         FlBsTIU1CvFBa+uoM2sfmkBhorlUopsBrhGzvYQ9qYTBlbSRuxzMR95lL3YAnJf6drJh
         e535dnguPOKiBTPhNUmhgjOw6mpYcf17L4sjbsWkRQWJ8jEoRt7Mc6irHSGazz82D6pK
         W/Pw8nUw4FEMFkmVTEhogB2g8Tk7pz+pLbfQZp3GQeuJnazqnOwudk87jY8HViT4ZX5j
         FW2HSnH86lqmwZw7vujYK2GiLHETb/SRdu5/iBnxU+IItsindtQRASnvprBfILHq5W1I
         uwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnZW+it9gAVgvNTLwS9dPm0WTYzAoEQ3VftkRv9uUVk=;
        b=sTmG7ZA7eZM/SsUnKZISYq7w/vG++ReVna94SSfsdpO7ydAdAhn5+Hud+tT6oUVfr2
         eO2UMJg6qnqyZDod8x8ihJf1j2FIPEaRAuTD0MeXSapB9LJIkgk3YrExclgaoWN/zIpA
         /Gwwe0TegdMrvURD5/wMgMjECi3+GVsAsiNeltJo2ftj60Z17PzqylTH/kURkA9Xehg9
         Bzhwuz/pV0qRavFEhPVFvHF1DczTaln5VFpoGRQcXch0/Dl1gG3kx+P/SKtrGgxCD+yZ
         6rl6XlApYSJF9cLv9qYz/bq4wk/FzC7EmN6R9LHkAFVn+ejKQ2KuHqvMwlX7hy23YD8n
         cQUQ==
X-Gm-Message-State: ACrzQf3eNBYmHqL3jEfBRKC7htggncmnmP/ZsPB/TogTd3iZjO2XNcpF
	HIKZgsxmrh0V73Vj8gNMyp8=
X-Google-Smtp-Source: AMsMyM6tqN1J3BpRuY/aDQn+DuJOiDBrsyIsvgctg6ge/1wrpIECRn9e0F15giQoo9bhIK7fkjVTRw==
X-Received: by 2002:a5d:61c8:0:b0:236:b893:9d83 with SMTP id q8-20020a5d61c8000000b00236b8939d83mr33497801wrv.354.1667904675056;
        Tue, 08 Nov 2022 02:51:15 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r2-20020adfdc82000000b0022ae401e9e0sm9966170wrj.78.2022.11.08.02.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 02:51:14 -0800 (PST)
Message-ID: <2fcfcdf2-baf4-5e16-2f10-f56dff68035a@gmail.com>
Date: Tue, 8 Nov 2022 11:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 6/7] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6795
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
 <20221108033209.22751-7-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108033209.22751-7-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_025118_350801_7F0D3AF0 
X-CRM114-Status: GOOD (  12.70  )
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



On 08/11/2022 04:32, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add the mediatek,mt6795-wdt compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index b3d2273f323b..d9d4aa7e27e3 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -22,6 +22,7 @@ properties:
>         - enum:
>             - mediatek,mt2712-wdt
>             - mediatek,mt6589-wdt
> +          - mediatek,mt6795-wdt
>             - mediatek,mt7986-wdt
>             - mediatek,mt8183-wdt
>             - mediatek,mt8186-wdt

