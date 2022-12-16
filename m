Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TduGez5okMoaMoWtG+a/gDZ6K+tMIFN63iCFQSQsXnc=; b=hqZq2h99pstgZmtL/b6c5hEhCD
	rXU5Xg8iZiZQfT30WvSpMM0DobQGhRzyJvf8m1Th1IHWDK3qsdk9CdCV6v3vHEXH0LSavKd9qG2HL
	0gwePkCu5lLzk0cLQ/Ep3yU4vMAAxOX96IGHT8hL4LBgmeZQzngLdAm1YY5Oaxc90HPvksVzSqkgX
	vaCdrAXlEwVzScI+quxIb7ybvmzxhpD/Q5HCcxMGTRV+j+Fl9H4q/l3jnQKM4MOjmCkdUPGbXQYAV
	aVpbOP6eMZIQzDAGiSmlBbnPTV4cy50HyUg5VuBMz+Y4o0sJKo2qCr9HAD3dprQIe3lGLGAJY/qNp
	FoFT4WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68h9-00EOSr-C4; Fri, 16 Dec 2022 11:16:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68gv-00EONS-C6; Fri, 16 Dec 2022 11:15:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso3854988wms.4;
        Fri, 16 Dec 2022 03:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TduGez5okMoaMoWtG+a/gDZ6K+tMIFN63iCFQSQsXnc=;
        b=poGvMOI+DZhFnvewifa7xuMgoYfEN6GfdHixircewhmNWI1wf7jJRpF6FLe2k+gBh+
         BfaBVFfBiZmo8WvNNTkM1KA2ip8M8Inf32AtLoX875ooAjtN+w5lJ+waGJsab2ThhKAj
         m1+vBp3R5kwpep77ei/Pid7DFabFUTtpheALbrtR8L9+2DQHbgiS7k+HVUshCj0mZy4A
         z2B7TSCqZHlCM0+sgeWTfBf34NWB+670zIUaIMF4rVYWbIq0lFLpY0P06BQmT6rfRItw
         lDrc2JcsKGgGiVgw516DWiUEqgVltFg1DfjtTCYkzoThvNDSJv8VIghV9G0SoUfnSVE6
         Qkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TduGez5okMoaMoWtG+a/gDZ6K+tMIFN63iCFQSQsXnc=;
        b=KbrXPJqUSad6n0RnFoO6VvHHrkbeOFQs0WjsN4Yi8ZpyaiAMttFIWVL8RufKhctCu7
         evUSxm6iMxgZVywAGnTmXpWOhf+yXs+fAg7AYt1zWJiPlPWdO5f5+mAqQwoxrhhTYDXg
         kjTM0RxFqMuqLe+q7GCPfTG2oG4epTMvZzIVmf4TlFVODFElLyLSdL345sCoR7q4uS1n
         Vp/DjnQ9jQ1dnqEjHeHXjIcbkdVubjERyVTXrQO57ZLmj18iRGayoJ08o9IYlTeOh2JH
         CFs5N035AdcvP0utYrWsg6L7fKt3EG0YBcJv4XjXCK+v74NZGG+jLgVIUVFovoJ1Ep2F
         LmAw==
X-Gm-Message-State: ANoB5pmzuRPKGS6tFYYLFo3LHndOAEcYgI9nzBsUHtO8K4bqkuzHBp5i
	+fJjnAuD0KTPRD7C5+eXFkM=
X-Google-Smtp-Source: AA0mqf7JMvc5A1nsCgHMY4tDpIPErZEnQUIERlUiYi0wkELvSsM/N+Zzruki8wtc4cD0x7K7L0Oilg==
X-Received: by 2002:a05:600c:3555:b0:3d0:8643:caf1 with SMTP id i21-20020a05600c355500b003d08643caf1mr17299280wmq.16.1671189347575;
        Fri, 16 Dec 2022 03:15:47 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i26-20020a1c541a000000b003c6c182bef9sm11257713wmb.36.2022.12.16.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:15:46 -0800 (PST)
Message-ID: <9511c5b1-203b-a7e3-b96b-614e1c52639a@gmail.com>
Date: Fri, 16 Dec 2022 12:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] soc: mediatek: pm-domains: Add ADSP power domain data
 for MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
 <20221215120016.26611-3-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221215120016.26611-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031549_492016_AAE27551 
X-CRM114-Status: GOOD (  14.49  )
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



On 15/12/2022 13:00, Allen-KH Cheng wrote:
> Add ADSP pm-domains (mtcmos) data for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8192-pm-domains.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
> index b97b2051920f..19e58f0ca1df 100644
> --- a/drivers/soc/mediatek/mt8192-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8192-pm-domains.h
> @@ -287,6 +287,22 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>   		.sram_pdn_bits = GENMASK(8, 8),
>   		.sram_pdn_ack_bits = GENMASK(12, 12),
>   	},
> +	[MT8192_POWER_DOMAIN_ADSP] = {
> +		.name = "adsp",
> +		.sta_mask = BIT(22),
> +		.ctl_offs = 0x0358,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.ext_buck_iso_offs = 0x039C,
> +		.ext_buck_iso_mask = BIT(2),

Not defined in upstream. It seems we are missing something here.

Regards,
Matthias

> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_2_ADSP,
> +				    MT8192_TOP_AXI_PROT_EN_2_SET,
> +				    MT8192_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8192_TOP_AXI_PROT_EN_2_STA1),
> +		},
> +		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_EXT_BUCK_ISO,
> +	},
>   	[MT8192_POWER_DOMAIN_CAM] = {
>   		.name = "cam",
>   		.sta_mask = BIT(23),

