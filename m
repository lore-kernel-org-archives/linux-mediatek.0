Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1978CC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAqai+lXG/XM8EttQSkFjFqBGi7USxO4pZCplt3DnME=; b=VK8vsPccEs7KhQTJGghZvuxnOB
	QrGbcSVx8iF2lya8Lj9HXHUWWLI4iMBVqRnL0fx+xri8BvIKdJzBrUFXForMhc57tU7T8GKvD0Bq+
	JfbPcFjUwxTGX8m7AG60sEWZIWZpOscF81hl9RJP5YSVnhDXXCc1Bp8Iy4Nx3e6NlGE2oN04T7WWT
	tlLp4xdSBAa6umYLSd+rj+qCQp0xvzvDBRybzTFYa2Ng3z9MxMqztCWL3nnecIDER1nCGJPvQ5vOe
	vEG2oE6aGaoPfNnXgprOApYs8kjDjMiY9gLp+W+zwKPipPOGDHnOAZmCV4yWO8TdOt1vEFvNqvshr
	cxBYIjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfYb-005NpX-HS; Thu, 18 Aug 2022 13:27:33 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOezz-004qyQ-DK
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 12:51:48 +0000
Received: by mail-lj1-x232.google.com with SMTP id t21so1599555ljc.13
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wAqai+lXG/XM8EttQSkFjFqBGi7USxO4pZCplt3DnME=;
        b=mVVqXERkdEtMBQvWvwInmEeiAtkRN2jSEfsK/gHOd+N3so+k1Z7TEAWpWI0w6pSX2K
         zkAohq61XTRTyDz6+UUGzX1uZOHgp61QPeu9P2Uv6ZsgmiwgTvbWcsAJZW5kgIu5NF8v
         cLgf3I/sthTuqGVdybqLZ0piop06pn4P6NsEDQXraP1HprX1cXhl0w/sDCOGmQQZ4l0d
         IrPDp9H0uvZ4sr97AVvQXqdAe7N5FTRA0P8RJw2GiE730oQBt0lCIE3lEfkxjQT+cR4I
         4r1gCgLB4OmIVEvge7SHdIr0W58W3HuOu+RxYO7V0m5HVFDlCZDzmiXhbFx48pOYE/zN
         PntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wAqai+lXG/XM8EttQSkFjFqBGi7USxO4pZCplt3DnME=;
        b=fBPygLCsF66gIQXlfDA1oxt9OGRLsaCGSzpfyv5Hm7BQrSjd+Z7ThhR8BoZtu4xXA2
         PfzUFX/mTmQlrm6Jy0VqDX7h0TZdYdbuRNfwez7gNKytDF1T60lVQSkLawJOli8pTJOj
         gwbRzjpuXwAaPgMT2nuVIbvsaUgumBNdBIGlLx32PBqOG7mKJS+fMC204ER7T1Ep5vf5
         sky6rZrH+1ELf336XSmrUCBQKgLN+uHG0ePSO+/YX5V17uQIN3GRsRVhdxg0GG5V+H6q
         4Xj0vwR7sj9j5A59+Rv8ZOyqCoHGXGxSj/UoQpiVL7AL2XDhrXTsDX7O9HID5fqolpBJ
         bS4Q==
X-Gm-Message-State: ACgBeo0I4sctUyRqKJP8U6+b/N/qHRHQOW5lN6+bo7im3u97KsJU4Kte
	t9Ufmh+6Z26itOmOWsmufeeXwQ==
X-Google-Smtp-Source: AA6agR7nEPbqE+6xr6o+AFM2JxbiRFCsOLtcOWcSBgLsZS5/v6lBOfAfGh51i5XsjzugZinmU4Fksg==
X-Received: by 2002:a2e:9acd:0:b0:261:6fd6:cc with SMTP id p13-20020a2e9acd000000b002616fd600ccmr830228ljj.55.1660827103843;
        Thu, 18 Aug 2022 05:51:43 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id i19-20020a2ea233000000b0025df4aa1e3asm209865ljm.64.2022.08.18.05.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 05:51:43 -0700 (PDT)
Message-ID: <3d91fe87-feed-d083-9eeb-51293aead67a@linaro.org>
Date: Thu, 18 Aug 2022 15:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND] dt-bindings: timer: Add compatible for MediaTek
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, daniel.lezcano@linaro.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220818124602.20394-1-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220818124602.20394-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_055147_546085_50163938 
X-CRM114-Status: GOOD (  12.89  )
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

On 18/08/2022 15:46, Johnson Wang wrote:
> Add dt-binding documentation of timer for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index f1c848af91d3..8bbb6e94508b 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -25,6 +25,7 @@ Required properties:
>  	For those SoCs that use SYST
>  	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
>  	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
> +	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)

Where is the driver change implementing this?

Best regards,
Krzysztof

