Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C9CC05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+oNqKUjSYteeXc32+a1j1XXitAiSrhnlK69sLD2wiE=; b=1p2zLW7KvD5jGCcwjpBvSDZmvd
	LscPRO5UFVpn/qpd1PWs2Ld9EaHQOIo3t+frZmz1+N/O3wISIq5EGRi+qIUhccDI5QDOPZhbKcoES
	Hop5DhGfBcRikrOjUfrJRPLFw63eS755+j8NHB64IAsK5/1BrmmEtHBJryOREmIEALwXk1Ldaiw5U
	WT6etuUOQXwtSDwMzfNh+POrZEc/M6dnu35hYokSv+UehJnf1nVyAiGZgTbmjknQ43Gf8WstoA72d
	MNSTZ7psFxlxcYh9d0yOll6Ro+v2FO9z4x9OWFndrwYDsjPhLpY7+Cyig9bGFcsykwFXjAmquyh2p
	MKmtZMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvnp-001yqP-UZ; Fri, 03 Feb 2023 13:08:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvnR-001yhT-2l; Fri, 03 Feb 2023 13:08:09 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lu11so15222661ejb.3;
        Fri, 03 Feb 2023 05:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+oNqKUjSYteeXc32+a1j1XXitAiSrhnlK69sLD2wiE=;
        b=XBlTfXiA6xY/KBhsBCXPdktvCyiHE4+WzsMBh1ofzFNiG0gYTetLQxFwVv0RkdcVE7
         TUNApe5IKU7kXXdXrnwaPS4GESt2VxA24ApJ5R5L2yHcxK917UvP22milafts/2bsC6W
         PnMakg3oUPR94YPtWvntQzkC2IM/f9DNrdSmH19qw/f/tF68qvYjUYPwbgUPUyQIFPqL
         YuFTnrPCDXG+KNJVg6fpgdi9eIiw6JX75Wxzi2Bq9bsL3ONf31kO+ngSFAGbyQKNdRWn
         kap5Ma7+kYTyhjKbZmMsWWnJ70yPJOucx6Ct8g6QUB0ccFHbTQojo3jk5GDuZXbVE1PN
         Fjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+oNqKUjSYteeXc32+a1j1XXitAiSrhnlK69sLD2wiE=;
        b=G35w3bZ4vMd/8Lwly7KyJ3ijJqIPsrzEIlH4MlVYvpmy3hbnf254OnsP9lwYaUXuQO
         ISM4J35QaNHBEa4xd1oy2OWLHDENLhZ/vEq1+UCbqFu2ACOCAwEnF+j5LfU9vD+JgjEM
         nSnl+ELyfnPLdDOFUnCtjCLUP7wT/uxcFwJZCIJsapW9ucb5qBOafPnyFGmCIDIQacF1
         V+UT5yC9Mxkh1cg459eIq3/20bfCY0v3oEvae+QIsygree0xP60QcT75X2IQMVAhen1P
         EbcgYxP1A2Cq9lH/tINLxM/IjBfezy8nsvDdpydntq910M4huWK8Azibbi0zNY12KqSZ
         T7Rg==
X-Gm-Message-State: AO0yUKVdKKW9wg+m/NcuBmxxRJDzYTZvcbaQy/3YsxtG+Vnat+f+ZPZi
	5azpPDlc+sBTQ4WaUx+ZBEk=
X-Google-Smtp-Source: AK7set9vzcCz59807cbRnRYiNnlh560czXx/j4rsr1r0CfN6ry7Bg9+duIk7hWbLlWoSjKG9B93atg==
X-Received: by 2002:a17:906:2012:b0:878:59b6:c194 with SMTP id 18-20020a170906201200b0087859b6c194mr11088644ejo.32.1675429680992;
        Fri, 03 Feb 2023 05:08:00 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id gw16-20020a170906f15000b0088e5f3e1faesm1358722ejb.36.2023.02.03.05.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 05:08:00 -0800 (PST)
Message-ID: <897b3476-d62c-dbdb-63b0-8dbf4f24ccdf@gmail.com>
Date: Fri, 3 Feb 2023 14:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/6] soc: mediatek: pm-domains: Add ADSP power domain
 data for MT8192
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
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221221034407.19605-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_050805_182496_EA6446D2 
X-CRM114-Status: GOOD (  14.47  )
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



On 21/12/2022 04:44, Allen-KH Cheng wrote:
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

Can we get a define for this magic number please?

Regards,
Matthias

> +		.ext_buck_iso_mask = BIT(2),
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

