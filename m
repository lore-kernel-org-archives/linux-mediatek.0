Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E684C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 11:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8FHcl8FQ7LWPsHGvishUG9eXa2hE3G0FJT29OwvLWE=; b=TZC6qXjC0yj2S+cDipQ8QCF4lU
	YNNmRHax7RN4Jv33GUhdi3hEIxp3u/ucmLzX89gmrWPHmhK5HPH7GMhLQ6Je0uj+l5fpJgWrPNSbK
	pLR8H8VTI/GQk20UpxIvMHjW/b+CnLClKA/01BmJFa/UC6aXDZIj37ZEqa4IqoWD3XPwr213Z8KUN
	iVRqvUcXD1kWg7U5qIga7CMwuKoVm1PSREsrKz8ndpNyfv8bfckpZOKz/wWf15olNkeTwBHjRTe3R
	XTgiuD9iXWAEeQJT4S2ieTWWI8Vb9wSmcfqcl3ZZ/e46/4o9rJhg1IwQGIq8y+DV6jhNSJIndzGM0
	L+yyQYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSVU-003JfA-6y; Mon, 30 Jan 2023 11:39:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSUl-003JeU-Ee; Mon, 30 Jan 2023 11:38:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id bg26so1923911wmb.0;
        Mon, 30 Jan 2023 03:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8FHcl8FQ7LWPsHGvishUG9eXa2hE3G0FJT29OwvLWE=;
        b=dQObpp8mkgw/42GS/NWrS1KwKrtRCNvP2/fPxxIxLSF/hT7TAgV3UJkSyMtA30zsLe
         XoUcFq7r80b4ooaQm1vxsrQNkLPa/vt0gd+g4d1GKY8WL2b9OmKDKDNX9cbExq971M8a
         +ns184Q+LtV4AFmjvgoCTv1tx35k5mLvHzG1nTvScKzLeKxS8jTcRfWVFJ6MeUlwiO1G
         M48j8JmIwT8Mo4l+4RkLwJi/uM8AaOfsh3RZvOzaWnuzt3gHlZNSUDd8NG3xeJpXsWVV
         hF3D7wDuV9Xu2PwTtg3BpqR7oMgEzGYoeaUHdonZ9300YzdgRwL05QjnK0FWu6leMQKd
         vEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8FHcl8FQ7LWPsHGvishUG9eXa2hE3G0FJT29OwvLWE=;
        b=bAMoKVwzUEmyLeq5ABpO+DKzXzr6+hI0OsvQ1AN6rRbt6cZLfm/euKHqGjZPBVN7lf
         5xB/GYzB5dxUWeBdR+ZUkM9VS61N4a/FC4/XxBH9IDIlwcQM4Yb2/I83PZaFjZk4TK/K
         oLDQUdkJayC2vpErbytmm+kNF6QYmSDKOfWoECrhrb1AonVUe1JmjcQU2PYRfEs4KoQr
         9LfTS9ZEBu9vNodHs8hU2a18Rl7Q8NP33LrjamApl4jAcL3eXgJfJ00HsGRUg4F/pjGf
         ujpvdpb3/ZaITuX3Mp51zvMyRq7wVVqVPh5KlT6aIFyu+ITgpODq4PFLP68/We9mYo+F
         5nSQ==
X-Gm-Message-State: AO0yUKUpwllVd/bre+/nbQhRC8dd3Pel6cXcrBKMWnNgwDU/zZC2S2FX
	CgUx1XfwxMXKYnPsxtPlU0w=
X-Google-Smtp-Source: AK7set9SBbhpGl1UMgZ6IK9FggJEYs30pNmfKdhBsS3neeguVhniJ62uvheSsRHchaEktAYjlQHmBw==
X-Received: by 2002:a7b:c38a:0:b0:3da:2ba4:b97 with SMTP id s10-20020a7bc38a000000b003da2ba40b97mr4480397wmj.19.1675078720531;
        Mon, 30 Jan 2023 03:38:40 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003cffd3c3d6csm12228110wmo.12.2023.01.30.03.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:38:39 -0800 (PST)
Message-ID: <0dec66ce-424c-e682-3f73-594e5b1edb65@gmail.com>
Date: Mon, 30 Jan 2023 12:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 8/9] dt-bindings: serial: mediatek,uart: add MT8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 allen-kh.cheng@mediatek.com, sean.wang@mediatek.com,
 zhiyong.tao@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-9-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230125143503.1015424-9-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_033843_532227_0E994E2D 
X-CRM114-Status: GOOD (  12.62  )
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



On 25/01/2023 15:35, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-uart
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Greg will you take 5,6 and 8 from this series through your branch or are you Ok 
if I take them. They are all just adding a new compatible string to the 
following files:
Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
and
Documentation/devicetree/bindings/serial/mediatek,uart.yaml

Best regards,
Matthias

> ---
>   Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> index fe098d98af6ee..303d02ca4e1ba 100644
> --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> @@ -45,6 +45,7 @@ properties:
>                 - mediatek,mt8188-uart
>                 - mediatek,mt8192-uart
>                 - mediatek,mt8195-uart
> +              - mediatek,mt8365-uart
>                 - mediatek,mt8516-uart
>             - const: mediatek,mt6577-uart
>   

