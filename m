Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3AuGOL+RtsyjgtlhQ1twOTD3QDsCayIE+ZhoLatVnh8=; b=pagPy/4UC9eOVc
	jcX+kdZU+q/y+AXAC6M2hQKRuy7d++qebFNVbrbmJyThI1+LMmMdRzMsUxAK7VzWTGEgNZNZYhzoM
	YtjWadadfxd8VQb1aNzIYMY0Y57AykLrt3Tf0McNb7eRNRv7kvB6+46JUg+1DZTvMnS9v3+guSK6Z
	3cVOhImBeO1dovNcV0bRxqj+ypMQ2hBDqrl1Ev+S+d+Gyq03BgZRpsehg1qF2zJsXWhwKDvFtxUQX
	KvSqukzBHgUU5WUoZEtA1BPnE0DCWeLZRWF3y5hUdIVuqu5NbmJwgy/elkn3S6QB+X6L7YpvMGwdC
	zJgJqpnM2jqSh3cmlkCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7Qz-005yGX-U1; Thu, 10 Nov 2022 13:17:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7Qx-005yEE-RB; Thu, 10 Nov 2022 13:17:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id z14so2204850wrn.7;
        Thu, 10 Nov 2022 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3AuGOL+RtsyjgtlhQ1twOTD3QDsCayIE+ZhoLatVnh8=;
        b=RV5fqXf/02xSU+of/wRNHSNDfokXIgvuEIDtcu2kKeQXudcWKZP7riIIAQARrusvVh
         Lkq1O6makjoEtKWWLpH1hPAcpXDsKZB+UvgoZRacC+SDPk0Xil24mAG+ydEyT5jp6XUa
         mhIR1h+1GF9Ms/9qw9vu/rgLJ7G6JVZxmyncSJUiUnKJ9+jNcscqpvoMhAhilt9hp6YQ
         ED2C03XV/n45iW+2+TFaMrPtEpbW5pxd3OtVcrc5/4Q/SEEqJdpbI5IuMiHdv8ZuDOBG
         HdM9FM9X0fkSZOdhZIEM8Vxx4dfH5iVq5dgJd4zL90MLpcDGOWmm55pqsy1VPIyUXZmV
         Vnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3AuGOL+RtsyjgtlhQ1twOTD3QDsCayIE+ZhoLatVnh8=;
        b=GmNDGZOyZYRKH8K18iag6HoCHQ57ALFaFOnlSaoWDb8NiBOhhfOxyf+PBpIcXup8CA
         hUY/HY8o+ZSuDD3eIJAzf3Xq+Nnpici0jmVQnDlWU6GzE60Fm2MbuDmRP9QtYO+b5UB/
         +LntbPCw2JAZ89SiCum0PgYaypC8e2+PnBEy4zanlDY7R2XFgk4lyJgUPVinvVtq/8e1
         ZSETJVjHX8Qrpd6H7bMW8fxtuydB991qrlUR+GUsYNqzbPitn0MdosPEDot58UASctxy
         5PH7AwzNJyaUAEk+wJNw8I5Y1iani/qrKzfHsXx3XrklzH2T2UOUh9w5VHtM36o07fRi
         QVlg==
X-Gm-Message-State: ACrzQf3WsevA8ErQZZnNn+eH8wNTBSDQDYLNhBxO+NCbBYO0FWcIANLU
	bE+O/3vrdMe0fjyFVmFxwRw=
X-Google-Smtp-Source: AMsMyM5u8zbufjcwPB7JaqlJrtf4ezpLmiDlsEYr4/cyk2dW/70P5nxD22butpKFtIHBptJAMs4Xxw==
X-Received: by 2002:a5d:4b11:0:b0:236:4e3c:7720 with SMTP id v17-20020a5d4b11000000b002364e3c7720mr1020738wrq.674.1668086248134;
        Thu, 10 Nov 2022 05:17:28 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003c83465ccbfsm5916631wmp.35.2022.11.10.05.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 05:17:26 -0800 (PST)
Message-ID: <6def7161-d428-a822-59c4-d6012310379e@gmail.com>
Date: Thu, 10 Nov 2022 14:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] arm64: dts: mt7986: fix trng node name
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221027151022.5541-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221027151022.5541-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_051731_911229_C500A30E 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/10/2022 17:10, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Binding requires node name to be rng not trng:
> 
> trng@1020f000: $nodename:0: 'trng@1020f000' does not match '^rng@[0-9a-f]+$'
> 
> Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 72e0d9722e07..226648f48df2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -168,7 +168,7 @@ sgmiisys1: syscon@10070000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		trng: trng@1020f000 {
> +		trng: rng@1020f000 {
>   			compatible = "mediatek,mt7986-rng",
>   				     "mediatek,mt7623-rng";
>   			reg = <0 0x1020f000 0 0x100>;

