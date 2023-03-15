Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD86C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eWJAVwfdAMUCwI3o2WJJsF7HeRR9gB8W1OrllJjb5o=; b=wSfej8lWVJb534fcrcqzv80F3J
	vennYyGkWr3hEwrez6+3IgtbFUo1w3W0SLwMS8IAOktu5tCys5kTs3d5lbKnygcN1Y5ilXAPEgoQ/
	LIFYGVTFkkDrnJpPcLHSr1QD/WPWij6A5rfomvVbRu7W1US2kQFwJtzXWJ13a9b0xPOsd/EtJaWSk
	1xILuah3oMyUiNNSflkMufoAVV7TVqiLM5xfW0Kbn3dEcWc69sw0wN+hbsAsWt6ALZVdn9NQaB2uc
	In8KFf/ObN5xoSVwafj1AK/CNDbHgYKl4ZS5Q32puIn/KD0yGtkNmYI5lz/MgGn32tR8jJt3902we
	+Rh0CgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNBo-00Cu2k-00;
	Wed, 15 Mar 2023 09:12:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNBl-00Cu1P-0z
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 09:12:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id q16so16613270wrw.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678871569;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8eWJAVwfdAMUCwI3o2WJJsF7HeRR9gB8W1OrllJjb5o=;
        b=XzSmAIL6WPDc9unS6StGpnGGh/CGMJ8Wy8hZjsWSd8gRTPzMl4yLkyH89Z+NjNNOEE
         /Zl4VkWXiNeVyyMGC7M7hiIBT32VcDKSLy3AiNF1yo1y17rrs6Q98cNSLWgczakKjRen
         nr+onVKwv62YRyFi0/Ar2V62oOKd932RzGtYRliH1EwMglxP5NqYCJwxiWMCjhIRnRog
         2R4k6Q7byMQpvMmJkzinKqrxYlBIs2v9GCUanWcefXQXQ8MJEjRntl+eLd6HQc/jPsgZ
         n2XpIhHApTZItuwQB5/c5PwtrzQI3mSIHqoIDWaieiCE+5NREvvA69rUWPdAieBmH6G8
         8Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678871569;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eWJAVwfdAMUCwI3o2WJJsF7HeRR9gB8W1OrllJjb5o=;
        b=MK4EGNjOqaryDov2gfK4GcR4UADtnszpMCJg2pD9I3ayFJdL4QDlrnn8kSQpXaXpLm
         5SYnPOd+4toEd0T7dDO6F6xlngS2Fbd9sInj/pyjjI6khLjdg2ITdb607sJ55ih0Xs3W
         LxRDtoldTfqfFqslV8JHUWfdUJCO3XNL4w3FkNnimo5G1A2yBymsFoCl4JRXmlqivqA7
         1YXM2YM/n97n07iviDel2I+Ghq7ISU+H11rkBaiVUg+kATdDbvGiaLxI2WQEdChf1rxL
         3+rQ317rEVR94JSKhYPoSB2mogu8NRDQjSN1cNxUFmR4j92eImrMyrM9E3dYaYUZyX5c
         4xVw==
X-Gm-Message-State: AO0yUKULHY0v2rkulPx6UVVnVgRsgdsAEY81QKmXXvRPoAP2SD92Lb/9
	csF67owHTUP3tl/VCAL1BpA2bQ==
X-Google-Smtp-Source: AK7set+eEbACpzLETf5+yoKzRbTbJU8SVnRF6TSezwW6SQk2wIN2YnBbU8HXUTnpArYwaQ5lSXadsw==
X-Received: by 2002:a5d:4c8e:0:b0:2cf:e710:a4b9 with SMTP id z14-20020a5d4c8e000000b002cfe710a4b9mr1357985wrs.32.1678871569378;
        Wed, 15 Mar 2023 02:12:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7? ([2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6b84000000b002cfe685bfd6sm4027654wrx.108.2023.03.15.02.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 02:12:48 -0700 (PDT)
Message-ID: <f4801f1d-cd6a-2a3f-155c-e72d3d28da30@linaro.org>
Date: Wed, 15 Mar 2023 10:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/9] regulator: rpi-panel-attiny: Drop of_match_ptr for ID
 table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
 <20230310214553.275450-7-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230310214553.275450-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_021253_363737_ACDF11F2 
X-CRM114-Status: GOOD (  18.37  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/03/2023 22:45, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
> 
>    drivers/regulator/rpi-panel-attiny-regulator.c:390:34: error: ‘attiny_dt_ids’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/regulator/rpi-panel-attiny-regulator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
> index 34514976475e..3953fc1f389f 100644
> --- a/drivers/regulator/rpi-panel-attiny-regulator.c
> +++ b/drivers/regulator/rpi-panel-attiny-regulator.c
> @@ -396,7 +396,7 @@ MODULE_DEVICE_TABLE(of, attiny_dt_ids);
>   static struct i2c_driver attiny_regulator_driver = {
>   	.driver = {
>   		.name = "rpi_touchscreen_attiny",
> -		.of_match_table = of_match_ptr(attiny_dt_ids),
> +		.of_match_table = attiny_dt_ids,
>   	},
>   	.probe_new = attiny_i2c_probe,
>   	.remove	= attiny_i2c_remove,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

