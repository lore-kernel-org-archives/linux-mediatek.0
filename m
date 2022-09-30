Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B409C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFuTCSgiQ1q3axsguxuz+z/zfzJxetBKH5EU8cOHNE0=; b=d6nD89LaBxgAiSvcuCXMKWCTH5
	zLTBMMxMEDgsznbQ9jXna2oQJ4as4NZAuO41efWP/PqpL4w3HeZfq4itb9IwMzg6bGFdyIiPAl5eq
	M5YKJPdRa0Na/Z4ALEQJhGDPOzoFcbdJTvMMQOtCW6bnyCs39NowFFr0kGcKZ7MIHo6L2jvimU9ll
	rVAk0oP9zV8f3ffD9IsiLgcolM4IrvkOdOEti7pKw5ZItVC7RExfbT0Opp+pkUiiiQCeCHBEvI/7N
	vZ+eMdqnST2HD0ndsxdDFPV8hewhHQkDhkVymrRvPilNOtxP46y3hKvDx6t0dwmXIm55NPPfpB1Aa
	89OaXqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKya-00B3wk-T4; Fri, 30 Sep 2022 18:43:08 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeKyP-00B3rr-W5; Fri, 30 Sep 2022 18:42:59 +0000
Received: by mail-pl1-f179.google.com with SMTP id v1so4692058plo.9;
        Fri, 30 Sep 2022 11:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aFuTCSgiQ1q3axsguxuz+z/zfzJxetBKH5EU8cOHNE0=;
        b=jcomTOCByzUp99jahhLvSUDi3El3ZbLVH3JBTPYSOeMJbe9XGuFJuPoHARWkOPDLL6
         xBg+8trWCxFjSiTv8NG71AwBPyRb9XKUF/4ffxZLe/QKghgJPOiIKriL4OB4HJGacd9A
         V6Wcywtuhn/9NYPIguDp3CVinL2bkBTp0zlaOgdY4u4OOfek11fLMPwTKyYB0F/vhTrb
         IzoOcG57v7PCBLW8vSNlmpwnPKGTkrzruGzYygnGEjWV3dwpWRFfqE3tEqiCjqEgnTT0
         tubMBs3PzStGGC0mCwFyxisWIHlBWHvxM9g+D0ySQDe1p+yTV0ghnVs5RCi88cI1jkmP
         GD9A==
X-Gm-Message-State: ACrzQf3k6msTfeKc/2HXbcFnOrbvmEP6iTul6F4muk9CbJoNLZ5d6Xgz
	Nbk63jTkAYiL1/HzTAJNhRAxQAGlZqDnTw==
X-Google-Smtp-Source: AMsMyM63hj0JZwb61O8N3SA/97MjlXhh7TAt954QlO2qGZP4zZRlJKTN9QDiw/tHJI3V9Tc4QCy9vw==
X-Received: by 2002:a17:902:7897:b0:178:9292:57b9 with SMTP id q23-20020a170902789700b00178929257b9mr10403947pll.102.1664563376850;
        Fri, 30 Sep 2022 11:42:56 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:56f2:482f:20c2:1d35? ([2620:15c:211:201:56f2:482f:20c2:1d35])
        by smtp.gmail.com with ESMTPSA id e10-20020a17090301ca00b00172d9f6e22bsm2291650plh.15.2022.09.30.11.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 11:42:56 -0700 (PDT)
Message-ID: <2a25bce5-aad2-cc01-5879-73005cafb371@acm.org>
Date: Fri, 30 Sep 2022 11:42:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 05/16] ufs: core: mcq: Configure resource regions
Content-Language: en-US
To: Asutosh Das <quic_asutoshd@quicinc.com>, mani@kernel.org,
 quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
 quic_richardp@quicinc.com, stanley.chu@mediatek.com,
 adrian.hunter@intel.com, avri.altman@wdc.com, beanhuo@micron.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <4d4df6ad6353b93253fb22deefb772dc59f5c84e.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <4d4df6ad6353b93253fb22deefb772dc59f5c84e.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_114258_060782_F5E58DBD 
X-CRM114-Status: GOOD (  12.75  )
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

On 9/22/22 18:05, Asutosh Das wrote:
> +/* Resources */
> +static const struct ufshcd_res_info_t ufshcd_res_info[RES_MAX] = {
> +	{.name = "ufs_mem", .resource = NULL, .base = NULL},
> +	{.name = "mcq", .resource = NULL, .base = NULL},
> +	/* Submission Queue DAO */
> +	{.name = "mcq_sqd", .resource = NULL, .base = NULL},
> +	/* Submission Queue Interrupt Status */
> +	{.name = "mcq_sqis", .resource = NULL, .base = NULL},
> +	/* Completion Queue DAO */
> +	{.name = "mcq_cqd", .resource = NULL, .base = NULL},
> +	/* Completion Queue Interrupt Status */
> +	{.name = "mcq_cqis", .resource = NULL, .base = NULL},
> +	/* MCQ vendor specific */
> +	{.name = "mcq_vs", .resource = NULL, .base = NULL},
> +};

Please leave out the members that are NULL (.resource and .base) since 
the compiler will initialize these for you.

>   /**
> + * struct ufshcd_res_info_t - MCQ related resource regions
> + *
> + * @name: resource name
> + * @resource: pointer to resource region
> + * @base: register base address
> + */
> +struct ufshcd_res_info_t {
> +	const char *name;
> +	struct resource *resource;
> +	void __iomem *base;
> +};

Please remove the suffix "_t" since that suffix is typically used for 
typedefs and not for data structures.

Thanks,

Bart.

