Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25198C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPHsfF5G/eKNcWYWTSHi0xoOr+RUpiJkFM56TjDpIhw=; b=P+tNkxuf8NlcCdwiUwpIYo22AE
	VxIpnK8puI/UIOp0DpEGPdKbkqOqeyr5gXUcIZhzcl5pYls82R9mPmCoPVePzSUUsFITX4eN00Xst
	mEHh1WPZAWEm/VuH+x2ts+tSYD+ean0+0v8fIeq/lpeQlReXwbnbceJbmbanV9x0sdKHd/PoSHkaI
	7sqj4wTQ+JPYvtN2vcobiDu+n71wJkPtoVqIovV9i8Lt0+ZKvCxdWJXimbn69fZVWIenMRKk6THRL
	EQif1LbNoTFVHzPgulBLJhmfCrxWUBF/S0rRemGKDegzNpJLwNymoMFQmlsSiTc2rYc0T4InPC6t9
	IfwnWwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okvHm-00AlgP-Nq; Tue, 18 Oct 2022 22:42:10 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okvHa-00Alai-9J
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 22:41:59 +0000
Received: by mail-qk1-x730.google.com with SMTP id m6so9660780qkm.4
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPHsfF5G/eKNcWYWTSHi0xoOr+RUpiJkFM56TjDpIhw=;
        b=cMtW7lgcJvDjvjAYrJwMB5BYBquSoGYgp9AM9VNASnhcTzA3VT2TA7IG94L7X3cPgr
         fKqLbezOGfyszHnXRLuKEo1k0pSXUsi0QxnVMbloRUMQSfdO5QyUOtyTgXrMktTAAETu
         yrXj/NY3hkY90zBqAhJELc7xuZZo6sQZkMe2dLmO2AbVhbeqPcZoDfdM0Z5KffRwxe7W
         jTXr3MEjHlD3i3UYSTxgCxQWVpwJ2Ubaonulh1xdHyK0PSYO4L66qrvARdkLD7CPW7WN
         0199owG2tuDCidKwr2wvdHtXh8yemlVgdoE5kw6D0pEczV1QwnTwPvLhRfkGz5mtMYoO
         RSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPHsfF5G/eKNcWYWTSHi0xoOr+RUpiJkFM56TjDpIhw=;
        b=pWdLi8RnR9K/1uiHeb1SV+tFJvDGl0mmHxi9qLEbtuRu2LYt06QMwQ3gBJ0mXdN745
         3MIAXchumNhrIrb3OJrw6q3IQS9gGZCfhlAmPZolg6ZoXakFKUdQ+SUh6/Wd90tn1UpA
         rEEvIgRunp7so7Wo/OB7FWJKIB/he2r23kQGrHyFWvCSMpsCVRdlqJSJP1Uo/BWteLsO
         q8MgPplOZVvKP0SKwRbaHUSZi0Lsulva3qBTkzAr4Fe+WxSCW1RNrEIP3fVifpEYWNz4
         KQqodm2EREkONMGuqrDH7/Q/BZ3dWIQnSGbZsfhY/zVBNyz0XQrF7PwNCNy6pdk/MUBd
         g4ew==
X-Gm-Message-State: ACrzQf2JbeHVwK0DNwafFgkLtzvwzsmbS13zZU+ItbC1F+q5XZPguZ0l
	RlGYB7hvsTndbOZQ2oB/3XY1Xw==
X-Google-Smtp-Source: AMsMyM7EedzjO6hEsUs2zztzn/M462CVJQYYcG6wF5jfqugCFf8K5I8jcxMc++W3EFWNNT2dw/Mg4w==
X-Received: by 2002:a05:620a:1909:b0:6ee:d4a1:fc07 with SMTP id bj9-20020a05620a190900b006eed4a1fc07mr3606841qkb.489.1666132914823;
        Tue, 18 Oct 2022 15:41:54 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m10-20020ac8444a000000b0039b03ac2f72sm2761502qtn.46.2022.10.18.15.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 15:41:54 -0700 (PDT)
Message-ID: <d6bc528e-1108-908b-fa87-c4f97bc6450b@linaro.org>
Date: Tue, 18 Oct 2022 18:41:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 3/3] arm64: dts: mt8195: Add venc node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
 <20221017070858.13902-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017070858.13902-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_154158_417375_CC0A2A15 
X-CRM114-Status: GOOD (  13.76  )
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

On 17/10/2022 03:08, Tinghan Shen wrote:
> Add venc node for mt8195 SoC.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 903e92d6156f..7cf2f7ef4ec6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2163,6 +2163,30 @@
>  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
>  		};
>  
> +		venc: venc@1a020000 {

I think you called this video-codec in other patches... Would be great
if you (you as folks working on Mediatek from Mediatek) keep patches
consistent...


> +			compatible = "mediatek,mt8195-vcodec-enc";
> +			reg = <0 0x1a020000 0 0x10000>;


Best regards,
Krzysztof


