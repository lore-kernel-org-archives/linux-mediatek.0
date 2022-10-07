Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB31C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Uu7yWAZWxiLWzHY9BD/Lt9mN4Tpbw2dRelGMiZO+a8=; b=k3ccItWKrvsTADbHwRsHrynoFg
	IkQyKOanjM5y0bKppo8trO+C3y/PrW8aF5ixoivAw0t6R+X3B0BZUXQlM01UfbnVKOa+M3R+VbNJF
	ekPTqyEtoyMm3sYPVjBDZI42FVCEJLJnJA7fOm8wRGmBNRW7SBX3TEc8YHZd2Emap0UI+QRl/k30s
	VE1aRzG2u+u3RWqy6JmB1eZzbGP4MCU3fgvIxuXB6+1t16bF69aWHdFAwvWNQvQdL31Ri8yLN4274
	+ZKo7KUCP7caxH4bsqvCfoa3rHNVhBaJulixBa7PKEc0Me3pNyh6NEKof3ndGFQABB7EFb5ezKAFh
	BgvCxvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmf4-008umJ-C4; Fri, 07 Oct 2022 12:41:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmes-008uhY-90; Fri, 07 Oct 2022 12:40:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id s206so4587666pgs.3;
        Fri, 07 Oct 2022 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8Uu7yWAZWxiLWzHY9BD/Lt9mN4Tpbw2dRelGMiZO+a8=;
        b=nd2GABOL0IEul3UCIUjexdyczC1KPfjdDotG90uXkACruF1WMEZXe+UQAaGTlU1JGO
         qyhk6UaS7Z/EG1tJSF66z6/3MDnU/SkM+AuZa8MQNbZq7Jt1qfOWO2En3NSp7DOWqy+r
         +f4bfaKpVLzO2SCRURh+SCMSMx30wR8mJcgZeGD4AGLsoyFtOWfcxjmMF7E0sy5EwBlW
         35g8LjZYJ3EabahgbDlTnSiQFosKH1jO4yWc5FuFy/I8X+KwSkzSsE2TF/waZjCaeKIe
         zfw0/JKQIMmHMsYdsJ+NyIBaDcZ3ZkhGN0dZ6Q/A4KykisljXMktyivJn5ATG6t87o+8
         jhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uu7yWAZWxiLWzHY9BD/Lt9mN4Tpbw2dRelGMiZO+a8=;
        b=pgFzckOb4kZfyYva63JE5plA+sDI07JtgEe1VewTftxDqkHlaWhE1VODuL9RBoqUi7
         DDMgkTEajmEoZyMR1+Kzr/5U0JsbwbvjPzyvLAxv1L2QUQVPtp3gp3rkq9y3YRU4fO0+
         PhXMiwkVU2fhTrmZwmF+/Fys1WBK+wPxrBvkNhzSqyqt3IZewKkM/76jRWiQwCU4bNYf
         t5aZr18Dleqdr7OqTEp2KKCTBwj8PNON4eENa3MGij1B4FJr2AVJeQek1prqwwqZZDYJ
         B5DZQN1eGxHdV0O2dXbVP2cjMaKELq9T9xUJ3dZVgcuP1wPkbaRvhewNhPyLI4V1fG8N
         qzMQ==
X-Gm-Message-State: ACrzQf1xvXEC9APmpjkFcVpX/i80fKazIHjM0esw5vMxuEoJRHc9nhg0
	xqMobCVV+hfugGN+6gtVXbQ=
X-Google-Smtp-Source: AMsMyM5TKYHynqu8eOT8lXI2y+qMphUjeEqhVyZmCVj6KdAw7sPOYbEv75v9BVvOLepwwMy2nOJtiA==
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id y31-20020a056a00181f00b005628e02ec29mr5215784pfa.3.1665146452356;
        Fri, 07 Oct 2022 05:40:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902784a00b0017dd839f2a5sm1444995pln.38.2022.10.07.05.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:40:50 -0700 (PDT)
Message-ID: <8e801854-c272-1649-c9bb-0511b7b09b82@roeck-us.net>
Date: Fri, 7 Oct 2022 05:40:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT8173
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221007093437.12228-1-allen-kh.cheng@mediatek.com>
 <20221007093437.12228-9-allen-kh.cheng@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221007093437.12228-9-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_054054_346166_699EB6ED 
X-CRM114-Status: GOOD (  13.63  )
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

On 10/7/22 02:34, Allen-KH Cheng wrote:
> Add the mediatek,mt8173-wdt compatible using mediatek,mt6589-wdt as
> fallback.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 855cebc87fb0..c1633878e869 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -36,6 +36,7 @@ properties:
>                 - mediatek,mt7622-wdt
>                 - mediatek,mt7623-wdt
>                 - mediatek,mt7629-wdt
> +              - mediatek,mt8173-wdt
>                 - mediatek,mt8516-wdt
>             - const: mediatek,mt6589-wdt
>   


