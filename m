Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0A1C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:07:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B34619A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B34619A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NclCMVL3e8ztiXtJcg3vEVMWjgbButCRG7I7xVAU/fY=; b=qpSyijKYFvH/NFMqjQILi2Vvt
	u8qPN63LH+5/rdXYlXKjE34t8OpVLaypZR2L70/dzsLso1K0B2eFvyvGkFLBA9sipAKG1re62FUe2
	2UDRIoMXyKQo5JMCH74re2U7BLrenGtTyeqJx1PtttA5nI1ljkC87+8KVuoXPzyaUOgutyP/a8/Q8
	wWZwCewveEVoJxvnxqiaL81+lN0YCAN2ZVl9Nag5WGSEkIwYU+i+aewp0YwPteQkFMLgXJPKXdDHn
	Do578k1RrU4dSUA+am4rWuty0E99vIAJo6W3Z4X+ECyYc4Q1IY2ocBiuidTbWqQ/K2gBqAgwfrYe2
	Jxf0oyOJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBH3-003Lh4-93; Tue, 30 Mar 2021 10:07:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBGz-003LfQ-1t; Tue, 30 Mar 2021 10:06:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so9964214wml.2; 
 Tue, 30 Mar 2021 03:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oq9UephsG7Ndog9Y2lymOiNgDZewzYP5gXsmPeuCte4=;
 b=e5ji8GitTs0qpAmrwJUQNpPUwAGRNUYPo8pqrZLnKaQbu3PRoNAmK9/DdqNiWA67HE
 SI94duc4p0g6F6KNBNgYDJVOm4uRkVidCLZBDxVMEt6O9DCk7Tg4lMG8B9c8kMewz6rT
 LHgsc8Ivk5Wf0SM3aS7/A5FMO2Vup9pvJ/BN/FfcJr8oC6xUHYdjaQPv6Tveu92fImiq
 f9JymzEYLwVYqNNhneDsmSyuIf2OYGRlndQATjd/V/6YdTty/0BBQGZ+29VSDSDwqXjO
 yP602c3f7u2zeWBZPX3BvMveusVuCEQfJAu5gpSGDCAOXXqBonzQswmS39c3Pm7bI9wq
 JTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oq9UephsG7Ndog9Y2lymOiNgDZewzYP5gXsmPeuCte4=;
 b=RWtLgQQXsvTVwBkdYbJi429vBjorcsrQt7X0qS8pzDm0o0rJKqOl3h4htHBvH0hokw
 7mbK6FEOOYxtzGEEvINXs5FF1DD0/qRFTMGY6uaCdI7jjh/r+1RnSc/xeSm7l4QRj1GF
 ER7hA+tQAi2B05Jlrpz8enA8D+v+me9JPkP6DnigEJY12H1Zy9V+tRpEJkHHP0yH5Rtb
 XZo+9vEUxCpjJvd33UVWNY0yvLDIFMOjR/c+zs1nGgoowI6B4dOKe+SIRhueOP9GyfI1
 s0E0jtsq9Uaj+E4xEMX7oKnjrWOVPHXSiq7YQUOmgwG8vBJ5wZVYCT7wdSX7HMg/Yfot
 ebZg==
X-Gm-Message-State: AOAM5324ad2TC6BpVHvU3iJDzq48SPcGQwNkeGAoGcFGY9nF7hsLJvu6
 aP1g9y+DMnexfLmN6AGGg0LDGyPAvC0qt455
X-Google-Smtp-Source: ABdhPJxpLLdEWxIfMOKgc2jFVAb9HLpu3QobV++6pfCkM4TKOjXXzsJ1AvCukMymrfromVfMhd0HGA==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr3184711wml.135.1617098816459; 
 Tue, 30 Mar 2021 03:06:56 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id p27sm2706208wmi.12.2021.03.30.03.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:06:55 -0700 (PDT)
Subject: Re: [PATCH] soc: mediatek: pm-domains: fix missing error codes
To: Jay Fang <f.fangjian@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: dan.carpenter@oracle.com, huangdaode@huawei.com
References: <1615790877-55259-1-git-send-email-f.fangjian@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <75cca9ca-1c4b-58ed-f925-3fa0b4b04a74@gmail.com>
Date: Tue, 30 Mar 2021 12:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615790877-55259-1-git-send-email-f.fangjian@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_110657_396275_09224842 
X-CRM114-Status: GOOD (  15.80  )
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

Hi Zihao,

On 15/03/2021 07:47, Jay Fang wrote:
> From: Zihao Tang <tangzihao1@hisilicon.com>
> 
> Fixes one smatch warnings:
> 
> drivers/soc/mediatek/mtk-pm-domains.c:492 scpsys_add_subdomain() warn: missing error code 'ret'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>

That got already fixed by Enric [1]. Anway thanks for the patch.

Matthias

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210303091054.796975-1-enric.balletbo@collabora.com/

> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index b7f6976..5778dad 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -487,6 +487,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>  
>  		child_pd = scpsys_add_one_domain(scpsys, child);
>  		if (IS_ERR(child_pd)) {
> +			ret = PTR_ERR(child_pd);
>  			dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
>  				      "%pOF: failed to get child domain id\n", child);
>  			goto err_put_node;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
