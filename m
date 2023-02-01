Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FC0C636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fh/jcCyht4qGjsnUTpbm2j8fXqThpPLNwYUK1bpzTdc=; b=4BWAv3y3MPxeBb+y0c9JqsfEHe
	xMRABGP71oK8DGgesnwOYFNkqPzyA9el8+fkU1U4tdJVx9MB57ejoC0x9TAmVuS6fBStRck4cJFlJ
	KSXzXK+ODInooGcCNqu1uCFMoMIzwR/bEp0WJ+hxPDX6LD7yH41oAMJgQu+maNSWL05q+qJeMG19Z
	5iMjadlGTXOG7s/ariOXcp1V4SeYC6VkI0r1Sb4Jy64FiO+P4Lr05bYJTgAT/j0UzVsnO/2X3jiCm
	7yLs/EeljI8IHbf9iOdxfAauBGo/5l83yXtVL9irSw9V3A2wDMGqOJ0uT7wx2tEMjVMLrK3wDH7wT
	H7rHCrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDCx-00C4tB-KO; Wed, 01 Feb 2023 13:31:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDCg-00C4ii-Km; Wed, 01 Feb 2023 13:31:12 +0000
Received: by mail-ej1-x62c.google.com with SMTP id ml19so27866372ejb.0;
        Wed, 01 Feb 2023 05:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fh/jcCyht4qGjsnUTpbm2j8fXqThpPLNwYUK1bpzTdc=;
        b=icO8OmZrMuzx2KUGJitcRn+N7c++c8nMwL7J/+uUCoy75ghJFTU1136MCuiwxS/TFC
         C/hHvbhVm+fnmOifO1pqmOq1Esb2zn6gecY7gUrt7/0pphg61bIJH8fQHUIkSvGpad31
         GbhAMTnQbeuLqMzYkKR/lNdSnUewl1nvJmbgnuMvfRFrUu7fR/RuJPJUXSUyJJP3ejLw
         qQEOvCUQq2WcRP3CMC0vd04XXdGYsbVER/ZWet7F6jWjQITv57khxVZsaKf71tGUCc+l
         MDFRqdtLnpPvA4Swec1l9lqBtxUKDBFLlQQ6IMgvvu8t5b6aPd+Beev6O5ACmhiSwuiR
         yApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh/jcCyht4qGjsnUTpbm2j8fXqThpPLNwYUK1bpzTdc=;
        b=b9RsRFsLWVvlbEMhGOjXR88wgcaUPOUIoBxGVZNahqUfQK3gvKp3x9BNb0lA5Dp/vr
         2ROwJAwo0vh2UbzhZRpbE8poWiuKBn1KXg/fmyXY57yS/jDbhly4IX9P7hZMfYW2BnKx
         JzCl8pOkkFUGN0/S60ipFEjgbDwbWwpSiGs2TA6ASe5wvNpfrpb6d5Qst92TWw7hId04
         5j3rEHZcSKhsSCG9dPojYKNTpPK+9jxrj2l5526iFWd7s1K3S9noavUdgZYiUoJd6Sa6
         48p3lmCqs+f7ipH5fKcGn7DowcR7zTwlqFrVZf5XzLlEqYe7oy0mYB6v/okFqNOLwufW
         nXVA==
X-Gm-Message-State: AO0yUKW24y4ThEkG8Z/y16pUAktTuctb8dbabUrySybWD23+Mq0dpjj8
	HXQCg1fhK/Z1xF7cSwPQUUg=
X-Google-Smtp-Source: AK7set/hM+ldTkI4tpY6x/QiTZ3kTYlEaoDvxKXKcg7/izE/dAtN2ZLYKSnTe9ofRB5utphli8gPHQ==
X-Received: by 2002:a17:907:7e83:b0:878:6387:5d4f with SMTP id qb3-20020a1709077e8300b0087863875d4fmr1994602ejc.64.1675258266605;
        Wed, 01 Feb 2023 05:31:06 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709064f8200b0088a2aebb146sm3944348eju.52.2023.02.01.05.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:31:06 -0800 (PST)
Message-ID: <f4d3e1b4-d4b2-9124-0d32-29182b155927@gmail.com>
Date: Wed, 1 Feb 2023 14:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220929131309.18337-1-allen-kh.cheng@mediatek.com>
 <20220929131309.18337-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220929131309.18337-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053110_713225_3FC95FC9 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Mauro,

It seems this patch got overseen in your queue.
Can you please check if there is still something that blocks it from getting merged?

Regards,
Matthias

On 29/09/2022 15:13, Allen-KH Cheng wrote:
> In order to make the names of the child nodes more generic, we rename
> "vcodec" to "video-codec" for decoder in patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index c4f20acdc1f8..67fde48f991c 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -91,7 +91,7 @@ properties:
>   
>   # Required child node:
>   patternProperties:
> -  '^vcodec-lat@[0-9a-f]+$':
> +  '^video-codec-lat@[0-9a-f]+$':
>       type: object
>   
>       properties:
> @@ -145,7 +145,7 @@ patternProperties:
>   
>       additionalProperties: false
>   
> -  '^vcodec-core@[0-9a-f]+$':
> +  '^video-codec-core@[0-9a-f]+$':
>       type: object
>   
>       properties:
> @@ -241,7 +241,7 @@ examples:
>               #size-cells = <2>;
>               ranges = <0 0 0 0x16000000 0 0x40000>;
>               reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
> -            vcodec-lat@10000 {
> +            video-codec-lat@10000 {
>                   compatible = "mediatek,mtk-vcodec-lat";
>                   reg = <0 0x10000 0 0x800>;
>                   interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> @@ -264,7 +264,7 @@ examples:
>                   power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
>               };
>   
> -            vcodec-core@25000 {
> +            video-codec-core@25000 {
>                   compatible = "mediatek,mtk-vcodec-core";
>                   reg = <0 0x25000 0 0x1000>;
>                   interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;

