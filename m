Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDD6C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:55:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDADD61380
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDADD61380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FNyI1IxyIauooDfAtyL1/YgHi4rT32u+gA6vQL/WQfQ=; b=pcmJXjSixjs+UuLs/NaxOKcgU
	UB2V/JVWvdBLgcWttTpvY/cOtk3XwYV0M/3CPHIroRs5hSYZkr02cqJxaCarMBV8+E4saPy669N/i
	xIFHGrWSusABKq80tGHF52kIcZlN8wUyNKmxbVQnhk2c5+uhHKS3zFdordLAfQgl1N09AT5nXNP/w
	OsRd0TvtebQ3K6gZVSyFwNzP3Mqow82XMKCHOoqWRLJ/R1mRD9zmmDyhuCWNvAppV+FLT6f2FiFLT
	z+gl67XB8Ve3T7EJSaPtHSQujYyAbQF5d9yYXaR9BkrVZKOkAMe0t9DBWyKJfaD+WUc8ap+muHyVO
	MUkGMildA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTmB2-002miY-9j; Tue, 06 Apr 2021 13:55:33 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTmAx-002mhY-Cm; Tue, 06 Apr 2021 13:55:29 +0000
Received: by mail-pf1-x431.google.com with SMTP id q5so10463613pfh.10;
 Tue, 06 Apr 2021 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzi+xZuEe7YL8nR3XrQA5qGB550pcYqlu0ZeykRMdAg=;
 b=HaE3Y5iTRVyhOC5Hr9Zn3j3wRMmZbn1X3zNXgGA1HvrJZDXYf4Z9TrzYbbh6jfpG1O
 UXXpfv7qZ1GuDaMguK5iyZBqD6NQs8gydcdl7BRU9bosmQhCwN+fRH06n273M6JkwCzr
 SwgDLz/bP03NhL6/VwvLbw49xsBl2ISaBe7GjkHTEWiEubMz4HUQr3piwvvBN4ak/DFH
 KwnvpEC1l9ra1lHNjjcgCLuXTjCr4Toa2ojx0vBcC/+I6279Qo+xzofTdZx3JudEXOlc
 UY68t3KR6rodYZGy03eWcOA2lBrt98rdx5IvWB8WBKG0JaSuwCipb189LjKNlxcyfK+9
 3YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzi+xZuEe7YL8nR3XrQA5qGB550pcYqlu0ZeykRMdAg=;
 b=WxaSezXtxQdCP4ZKi4RkWQsEVUkqNDoONegxi+2SBSAzQ2IbYmY5Id41q32l3atdKp
 gS9A6/EJT34zm+YHOb4QImqptbiux3xF9Yt/dknOfgfbd/5D4Y5ZffwqHDmf8eo/FnpN
 MWDipGSk2/VjCIAUSkJ1nd8b4kgKH7+04m/KZGEwQbIQSBWYiTTyZx9YI6bCPRWNbiDo
 CdpsAV5bTQ6vxbdebh+DKLwEjElyZcNBODOVuZEVVDUTRbGHNqUtALTDiYgTmyQ01t4d
 aye5sUMRztu/rUhiz8qJ9La/1BOMCsuPCofBAFwXeVWemaTaOapxX9/G1JKnFNVD/g6j
 Cp4w==
X-Gm-Message-State: AOAM533G5vy+zrS577hEAT4LIlwLOyFqSKAhaRA7QDw+sniuVHcrAFQ4
 bN+5TV15TDJ+/L4UfxBjJ1g=
X-Google-Smtp-Source: ABdhPJzu7pyeVqM0Lx3pmuMpeUTlU8rx58GW0kCSbh3X33ZJScOrnqfvqW6yYkSrhFiNZsDxN2KipA==
X-Received: by 2002:a63:d61:: with SMTP id 33mr27507180pgn.201.1617717326012; 
 Tue, 06 Apr 2021 06:55:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id d13sm19081937pgb.6.2021.04.06.06.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:55:25 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] soc: mediatek: devapc: support mt8192
To: Nina Wu <nina-cm.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-6-git-send-email-nina-cm.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f52189e3-26b2-fd44-7059-f3bf0f79fbae@gmail.com>
Date: Tue, 6 Apr 2021 15:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617259087-5502-6-git-send-email-nina-cm.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_145527_579786_48399578 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/04/2021 08:38, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> Add compatible to support mt8192.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---


Looks good, I'd like to see DTS for this as well, although I understand it
depends on the clock patch series. Please note so in either below the '---' or
in a cover letter.

Regards,
Matthias


>  drivers/soc/mediatek/mtk-devapc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index af55c01..a5c15b5 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -251,11 +251,26 @@ static const struct mtk_devapc_data devapc_mt6779 = {
>  	.vio_shift_con_offset = 0xF20,
>  };
>  
> +static const struct mtk_devapc_data devapc_mt8192 = {
> +	.vio_mask_offset = 0x0,
> +	.vio_sta_offset = 0x400,
> +	.vio_dbg0_offset = 0x900,
> +	.vio_dbg1_offset = 0x904,
> +	.vio_dbg2_offset = 0x908,
> +	.apc_con_offset = 0xF00,
> +	.vio_shift_sta_offset = 0xF20,
> +	.vio_shift_sel_offset = 0xF30,
> +	.vio_shift_con_offset = 0xF10,
> +};
> +
>  static const struct of_device_id mtk_devapc_dt_match[] = {
>  	{
>  		.compatible = "mediatek,mt6779-devapc",
>  		.data = &devapc_mt6779,
>  	}, {
> +		.compatible = "mediatek,mt8192-devapc",
> +		.data = &devapc_mt8192,
> +	}, {
>  	},
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
