Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEC4CCA47B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYY4oyP2yJ05X0fyoFzWVBZP+Opu7IULHq7eoqZi9XU=; b=AZAIVIvc99nwF3qqmZMeKv9x0e
	ddEqinlpEKVeplee3tHO6rjR7nvUxp2Vd9V5VjZYWMdnBD6w6X0XI/lyDNdjfO/oQIOOXhPz7vf6c
	mlbmu5dkmLr/OVVkWvuEtgADo0Vza85oLJ5vOTW9TkCqy3cSa5ohb2SG1gqN9sMufclqN4LjIFJsa
	zfFoEg1V0uV+EVGKfqs0tbgt91hKqOD9DtFar6SStn3SxqTyTF7VkNjZ/AvA4halP0PIAUUXGknos
	WYs+MweBwLRS4YpPv620P2uLTbuzmew/rACxHeqeWFjW2jeit8FPr0Nyjut0aLZmJMDcZucd8R8xu
	0mW3qRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j6q-002QU6-TO; Fri, 08 Jul 2022 08:13:09 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j31-002OX1-Ci; Fri, 08 Jul 2022 08:09:12 +0000
Received: by mail-io1-xd2c.google.com with SMTP id k15so19072504iok.5;
        Fri, 08 Jul 2022 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kYY4oyP2yJ05X0fyoFzWVBZP+Opu7IULHq7eoqZi9XU=;
        b=kovIpw8pBU9WmGuOEzzXwc4hO2pgx3qRf1Q8w0Rflrd7EwpDimHkEscQeEcy2aHMbX
         ZZVR8F3jfmZRlN80QxInOSUHs3Q9ibjScjiYGRwfoltLK8eXhhmhyqKClro6v1tPgDSI
         0cRnCKtV39qwvb7Qu9pnra56Z8+LSrz33R+hLMlxB5zKDjsUOgtHfBcCPUnxtxmOmCtR
         bki0aO9PcNmkQp864ekmiyWGGwxRJUgxoAUwRNobPbB0+1oo7VJoJEYmuFXyD+vLQq+d
         QQOOcvrXMBnmHbF4jxlZjS8RfKDE6MfSKoSt/fPznvnZJaCdrVmew60mVL+TlQ4ptZkX
         BqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kYY4oyP2yJ05X0fyoFzWVBZP+Opu7IULHq7eoqZi9XU=;
        b=HvMtW7TQBeoB7EW29e5z0DrG7WLO5VENP5YADwD5IxczERmHbCjXHVe40Zle+Dvldm
         f3Vp4H8WS/4V9blWU5iX18lazQO+cxRMyWQbDYAn7KF4zAVbEr8erxYIAwNiPa0X69pu
         stqD7on+THeXWpMmCm+mDy9gaWXoiMxM1Pi0pO8flU2L5e3q4g8JgUQ9DorJpFDhwkVC
         b8x6pAHaFd/3YAbagyLKBLLI7ltSbd5oCVEzssdxfQFRKFp1QCHMcBL9GEo/1MxTnUEX
         6hMYkn282bMG3ny0kFMSdUT2l+bOHtIElPzVGuP4DP0ZMIo9hhpbeBkzGqjzypT+O3sK
         aK6g==
X-Gm-Message-State: AJIora+1X4FBmQ7GgigO4BBGNMIINi9uspPTNc+LGa/quXhcXZb6hHDw
	S0mjlfJXhjjePA0h19JceBs=
X-Google-Smtp-Source: AGRyM1sgdwuKRZltbNBJhP7k91fifj8h8gY8hnSNgkvQJlmUw0qOjSn8aiLgQ0VhOIQtUUxL3gWggg==
X-Received: by 2002:a05:6638:24c9:b0:33c:b7e8:4a14 with SMTP id y9-20020a05663824c900b0033cb7e84a14mr1349840jat.293.1657267744672;
        Fri, 08 Jul 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y2-20020a056602178200b00665770bcec5sm349652iox.49.2022.07.08.01.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:09:03 -0700 (PDT)
Message-ID: <2fa2ee1a-6336-b8a9-89eb-2c7b7bfd02a5@gmail.com>
Date: Fri, 8 Jul 2022 10:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND v4 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Content-Language: en-US
To: kewei.xu@mediatek.com, wsa@the-dreams.de
Cc: robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
 david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220708034758.22747-1-kewei.xu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708034758.22747-1-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_010911_506064_6B172061 
X-CRM114-Status: GOOD (  13.65  )
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



On 08/07/2022 05:47, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v4: resend patch
> v3: add reviewed-by owner
> v2: no changes
> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 16a1a3118204..4e730fb7be56 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -27,6 +27,7 @@ properties:
>         - const: mediatek,mt8173-i2c
>         - const: mediatek,mt8183-i2c
>         - const: mediatek,mt8186-i2c
> +      - const: mediatek,mt8188-i2c
>         - const: mediatek,mt8192-i2c
>         - items:
>             - enum:

