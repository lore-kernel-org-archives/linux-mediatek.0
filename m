Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4059C6379F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzRhNOEqZ6otVdDMPPDeehfgx4iYyErBm5BV2nKoj+I=; b=v05c/61E00oA/N4kHqIao5r/FP
	3nH3bYGxDOdL7QBY90Wwzt7hN03aLDM2g7yxsrWC+qm5p7r0X48LJmRzmgngk2lzW8hUJy4+7Qd0K
	N2pLtxv+vaE+rCCE+2ec0ReKDV9bLwHqedGO3ypasxKGdMeJ2DRyrVSYPF9ePVQdpSyEciwsFGS1X
	prVGdngpIHkM4X17bK0tamQzl8KbmAd9aLxKBRnsEr7K+wOkPCNqzhm2rR6Lw7gUxm8L2KsQ7FAwt
	qQJJqEVX8/JT+ErwWLGBQfxNgh8tNg5iBVqt2Gm03OM7Os4gGpeyzio7Fu5xD9yQD6TllmkHqBber
	R6w1ycMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNu1m-001YNL-UH; Fri, 03 Feb 2023 11:14:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNu1b-001YJy-No; Fri, 03 Feb 2023 11:14:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id q19so4845631edd.2;
        Fri, 03 Feb 2023 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzRhNOEqZ6otVdDMPPDeehfgx4iYyErBm5BV2nKoj+I=;
        b=gbjn2BhPSkF/JyklWXUgKAyCSvSXiUeuU9Vx7UlVX78DXCsVv/IGvvg1GH6eKcZ3j+
         g6mQXo9cmJWHwufBPMtRMNpChz5h2d43tmiffUKfJQecs363oIOSPc866P+pHPHvGOCn
         /ocabbLUhXKo5cVmLDEMa0D2g6QV2eDO+PgenAIAIGLuiVEmZ0BHbRuTeHyWiTIHMglS
         nfoqFIB1RbYXPu8P2N8ipXp8rFQBXI58SZPd2WrvGLEW6DulaEzO+Tj8Oj/5WOw+4u0z
         SxU80B3SieGVg48F+l3JnLUTKN4PlC71+VfhWrBbgcnm8KCf9dyKKiCJ0k4QmCpbwCY8
         +dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzRhNOEqZ6otVdDMPPDeehfgx4iYyErBm5BV2nKoj+I=;
        b=fWRvv8g0aWC7AoxywmELvarre4A2RhIyhjn8kgF0jq79R8sLw2BcAgkCXSCW5sF3KP
         lC1Ac+uUtuVcLr0ErBcPvWk4WjoPQY/b+Qy7vUURc8kGG9+NysNLeh3BKoUJgj2tlC8a
         0euXMEVBWq0+cIvEEW801GsTYSNOuuj/y5X8WN30Rhv+lkJ0tS6AGVSehS2wVGV4tF8F
         1BUBwrLngjZJeAoRtYba1KYtVOZzmZZfcj61f+6acU0USNnDTj2PkfQk0b+Gns/7/pmG
         Y+ItGqQvzCkDQ3eXSr1LRSHSBfkXZiYInjnOTxg86VJFfB7QALiqMYYgOIbTSemOr3UN
         8bIw==
X-Gm-Message-State: AO0yUKVrsXmJsvAoCCUTGGB7dw8hSUwCxdXcRUpmiS8mfaV85YdE6Jqi
	t8KLs6/xZtdywvyhggSGKvM6EMYWAq8=
X-Google-Smtp-Source: AK7set846aawl7qp/socuCnmS3sx9OowfDg7l4wvHAmZ4js1qkVmfadMsu4MnsX3SrAKFPmoy06xng==
X-Received: by 2002:a50:f692:0:b0:49d:221b:4b3f with SMTP id d18-20020a50f692000000b0049d221b4b3fmr8530287edn.21.1675422873130;
        Fri, 03 Feb 2023 03:14:33 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id es26-20020a056402381a00b00488117821ffsm973829edb.31.2023.02.03.03.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 03:14:32 -0800 (PST)
Message-ID: <6c7b2874-8812-c706-3e82-b701bb69408e@gmail.com>
Date: Fri, 3 Feb 2023 12:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/8] soc: mediatek: pm-domains: Fix caps field
 documentation
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-6-msp@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230105170735.1637416-6-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_031435_829099_57769BEB 
X-CRM114-Status: GOOD (  16.30  )
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



On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> This field is not for ACTIVE_WAKEUP exclusively. There are a lot of
> other flags defined as well.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")

No bug here, nothing that needs to be fixed in the stable kernels. We can drop 
the Fixes tag here.

> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index da827e91d462..34642a279213 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -95,7 +95,7 @@ struct scpsys_bus_prot_data {
>    * @ctl_offs: The offset for main power control register.
>    * @sram_pdn_bits: The mask for sram power control bits.
>    * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> - * @caps: The flag for active wake-up action.
> + * @caps: MTK_SCPD_* capability flags.
>    * @bp_infracfg: bus protection for infracfg subsystem
>    * @bp_smi: bus protection for smi subsystem
>    */

