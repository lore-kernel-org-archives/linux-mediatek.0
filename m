Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EB9C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 01:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVKqQ1lqgF3EkrSHUJzWYv63xAjHMBJYsr4UymAWSVw=; b=Y6BoqBXGiG60/8K0Hix7gG+WPs
	5HzgbwJCd5IYC+6P+oE/l5hYJexXPcyrv3BgYA0oJW+VVvWnWBI+TO3Tnxqlbxrf65A7r9da3VUvs
	1s2j/ZvjD8HL+7P160ZmL4BUrmInEVPlUMbo8KpFHrNKXGdbiXIjaG72SAp2fIpifOAxa1qEIkcy3
	6H1JA+p3v0Ob63rYKATdiCB2hAwWxvltwqAcNoBdC2ZVVGrBqFwPo/jJ/wvynlh2prCMSIOIKcuxF
	9In0okgYMAeXFTaQpjOiiw/WrVqnEI+3hLH7jvimLriEaT6cYZIDfV5f4h656duuYVeeQVI10zR6a
	CLcgIEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2NDI-009uEo-V8; Sat, 18 Jun 2022 01:25:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2NDG-009uEB-SL
	for linux-mediatek@lists.infradead.org; Sat, 18 Jun 2022 01:25:24 +0000
Received: by mail-pf1-x432.google.com with SMTP id i64so5508064pfc.8
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pVKqQ1lqgF3EkrSHUJzWYv63xAjHMBJYsr4UymAWSVw=;
        b=gwoIvyMg1yJEub4U9RbN4pk370+U/FTdG0FmASXW0hglpc3ABXMvrtE7qSWFqvgK0H
         /nwLfhgifz4kqpEHpMon61La4pZts1Px+JOf7gLtJNpN7QTMP/ik7lUFik9j44ivgZt7
         Vpf9tB/RzqSdeU3Y7pQvHf2k4Zsx8OqN/Ef0dkNeIohn/hTohnRi1TDoLKG8nScGPl4G
         xFBm7s5evU1LjionDVWkX7SL+EX7p1KY2J+rRjpB9rJQdj6V+shgzeq6GPuM0051F+Ja
         Ip/5VZsp5BI4nMGlpqMdFHirZcNr+1KOvO+OtMVAcYySLE9oBnkq6V4sKi8xLX53jXU6
         BYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pVKqQ1lqgF3EkrSHUJzWYv63xAjHMBJYsr4UymAWSVw=;
        b=YCh/K/NDTwREGN3KdVCaeKquoVNhIaln3johA7lB62Ld5b0AVce2eNkR3Tr22N9L/H
         0Pcvzz6tM45dizIgHra6piiTQmKNBc6Vo0aQrgBT3nc1fRZMX35+5Cn0ct+888dCSJcI
         k69swVtGxRe3Yj8cBW4K0ERbEAft+wzaQ29tLhTAyJ11qsRFFI8IaY8F8AdTXfQ+hXdb
         xTP97uWoDEpVG6V/3yz/EfWotiDWjlkhDuaeYdwh7iFXV4wlRo4KFgzXoJwhm9C/K8Od
         JTRI+Pdp4WnslmzNcVe4YsMYRvUsZofsZzW+cBpZkxidcPW0LKiGP8SWsnNcIecRJzOw
         CBEw==
X-Gm-Message-State: AJIora9vA7//5meimuCmQYps8maRByua11c6PdYSrkX+htP7tliH3HuZ
	61btkeQBFFx2hSMSCI0gzDqbzg==
X-Google-Smtp-Source: AGRyM1sDlRA2MpZMdKacPonDxwVawuYrATRsYLfBJHJBUQ/uDFZHg+lldB+kDSyziTa+j5YSpZR3Xw==
X-Received: by 2002:a63:e74a:0:b0:3fe:7c2a:4b17 with SMTP id j10-20020a63e74a000000b003fe7c2a4b17mr11437694pgk.293.1655515520921;
        Fri, 17 Jun 2022 18:25:20 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709027e8900b00163daef3dc2sm4199943pla.84.2022.06.17.18.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:25:20 -0700 (PDT)
Message-ID: <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
Date: Fri, 17 Jun 2022 18:25:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617222916.2435618-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_182522_960751_ED7601DD 
X-CRM114-Status: GOOD (  19.42  )
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

On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
> The current clock list in the binding doesn't allow for one of the
> optional clocks to be missing and a subsequent clock to be present. An
> example where this is an issue is in mt8192.dtsi, which has "sys_ck",
> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
> 
> Change the clock list in a way that allows the middle optional clocks to
> be missing, while still guaranteeing a fixed order. The "ref_ck" is kept
> as a const even though it is optional for simplicity, since it is
> present in all current dts files.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 63cbc2b62d18..99a1b233ec90 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -80,8 +80,13 @@ properties:
>      items:
>        - const: sys_ck  # required, the following ones are optional
>        - const: ref_ck
> -      - const: mcu_ck
> -      - const: dma_ck
> +      - enum:
> +          - mcu_ck
> +          - dma_ck
> +          - xhci_ck
> +      - enum:
> +          - dma_ck
> +          - xhci_ck
>        - const: xhci_ck

You allow now almost any order here, including incorrect like
sys,ref,xhci,xhci,xhci.

The order of clocks has to be fixed and we cannot allow flexibility. Are
you sure that these clocks are actually optional (not wired to the device)?


Best regards,
Krzysztof

