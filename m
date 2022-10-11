Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECA4C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 12:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDcL9+bBzbkp+KJx7T0xtbSPbbNIbsOAPMQB2E5GrtY=; b=FURQvDvin5GONOwwYGKoQktk70
	C1G9mEmuEenZz3PsZS4bALn+NQ58zgTISemP0IOUxZ7OCP685w8IIG+y0ksq+y1XdFt5JLwo5g+eO
	OGdjDNnwblADtqsbkjX96MUFSir9i4/8ScZkrzDCR2RRUCa1cbcRlr/31815elbaBmdE17N+EjpRE
	CAcAIh/ksP4JxzVuyo4VeITykq34oLcfETfvq+l7jscrD8mqXv3noVIedGeUmVgVNJMiqlwBkiPKP
	lnSSQQGj9k0COqfLcK5PQ2sklHWptyKvFhjXkS3etMwlervUJ0sS5BBZuXHta/Plj7Cf4xElAtjT/
	XUeCbWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEIU-004D6Y-TE; Tue, 11 Oct 2022 12:23:46 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEIK-004D2Y-9q
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 12:23:38 +0000
Received: by mail-qv1-xf32.google.com with SMTP id i12so8821205qvs.2
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Oct 2022 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDcL9+bBzbkp+KJx7T0xtbSPbbNIbsOAPMQB2E5GrtY=;
        b=N+NatMm2WFYZ9mlYoAn0l9SfSVSiVLQceQHaHCdUaWDDV5dzyZGrZFCohOqc6+l/Wy
         UL/lnRKlEhyWOhIYKablbsfREcV+noOV6VdWjGj0fpWW8ko2oTT6CVh/OcJrNZF8dEhB
         UFJomVk8jdBWafzbWL9DJobEwBdpEyNvPvikaiFZtuQW5eBVRj6QBOIlXxCoCcZbp4CK
         pP4scW0ATERDCFzEQok7RfNm0PdmdcKnmg5Sdy4N6mov7vn1IvqShkpDfTkpTtvDepB3
         e9gvkJvdPWsKYlnFac7mznRbl0yATAzgZFQ8jbaH5XxoDOMHjiC5xkcSEj7oRJCIrd1q
         qjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDcL9+bBzbkp+KJx7T0xtbSPbbNIbsOAPMQB2E5GrtY=;
        b=o6fXIVyqwsBdyAthl0DrUviWXxS3X/OgJGjlhxYh7/SK8Hy/1pjKxh+77Y22nH+oWM
         QJpOiN/DKxReo3msziy+Ujv2qo2MvISNR3fGuHF+t6TxYEGSxW9+ZRKU7po6gQB6HgBZ
         1qwJmnL7F0ZaKpFwQ1tCgOSHxJvTpwA7zBN+IFMhBJJbnwL96PHZRDamvCd4dDd3QjU+
         3hf2GcMoFK9jWrzzmxavjP53xK0ju8zNozpcc/v31PcCRHnS8RKTCL7Sac9BFFQO/Vsw
         tQ2+Y/7FUeWSC1iXN5Wy0MbX0fpRFyRqgqHWCsUfAya1NgfBrOcBj48PEEWqgsn/EiAR
         2XwQ==
X-Gm-Message-State: ACrzQf1BtpRC8WTdlBOa1INy9RY+b31WlpI26jdXDE9F3dZZwuohG2Oa
	fiPWKhpEQ3ZucPJ43Dfsd1gdvQ==
X-Google-Smtp-Source: AMsMyM5WBAgPEtbDPqvpOtzVhrgo36KGJWwWy4bAnO2SXyUL6V2OnRATsznb7iVc9nuz8KjnaB3sCg==
X-Received: by 2002:a05:6214:2464:b0:4b3:6cce:9860 with SMTP id im4-20020a056214246400b004b36cce9860mr16026754qvb.120.1665491014660;
        Tue, 11 Oct 2022 05:23:34 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id bp36-20020a05620a45a400b006ce7bb8518bsm4348208qkb.5.2022.10.11.05.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:23:34 -0700 (PDT)
Message-ID: <1d2613aa-3225-a2b6-521a-b2df70a30ed5@linaro.org>
Date: Tue, 11 Oct 2022 08:23:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/7] dts: arm64: mt8195: add MMSYS and MUTEX
 configuration for VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-4-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011070356.682-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_052336_414678_675499A5 
X-CRM114-Status: GOOD (  16.65  )
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

On 11/10/2022 03:03, Moudy Ho wrote:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Compatible names, node names, and GCE client registers for
> VPPSYS0 and VPPSYS1 should be renamed or added to match
> the binding file requirements.
> Also, add two nodes for MT8195 VPPSYS MUTEX.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30 ++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..3e73bd58e54d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1476,12 +1476,23 @@
>  			#clock-cells = <1>;
>  		};
>  
> -		vppsys0: clock-controller@14000000 {
> -			compatible = "mediatek,mt8195-vppsys0";
> +		vppsys0: syscon@14000000 {
> +			compatible = "mediatek,mt8195-vppsys0",
> +				     "mediatek,mt8195-mmsys", "syscon";

No. You change multiple pieces in one patch, some of them have much
bigger impact, like adding compatibles.

Split and describe *why* you are changing it.

>  			reg = <0 0x14000000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0 0x1000>;
>  			#clock-cells = <1>;
>  		};
>  
> +		mutex@1400f000 {
> +			compatible = "mediatek,mt8195-vpp-mutex";

And you add some new nodes in a cleanup patch...

Best regards,
Krzysztof


