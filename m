Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2413EE49A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1Ik3NbSu/OHRXNMCFvLBT9/b05UkIh4Bdi7YU49cKU=; b=XJEGvuRFCahJAOw2JaY+jBvSuK
	9otNobfDaK4j4MNvMDdoHOxuyLc3q0JDaH+3s1dlEzAQ5xIEG5XTdBGTFL0u2yUZ4gjl9OOrmPd66
	jhqP/XVfxNOe/5Z0aMCpecr2Rc0/XVgIRbciRxrR/ugdYDUluxlnxGu2jkECq3+a0GRyxxdi+tAC2
	j33u24isqlWpNVjlPs8pLB+wC2qmagH6uuyLEIPBBc0XWal+cjzDAuW282Xew5ZKIlAHVXVbgqcIo
	hGCY1hrdLYk4fScC7+WVZ/59Pqazf8Ph4gkSZXYw4hVkYsw7Rhgg8+dimeW6FUSDvh7hUGgQipP2I
	lI6dvC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqgj-0014Cy-1N;
	Wed, 23 Aug 2023 16:26:33 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqgg-0014Bp-2q
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 16:26:32 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdc243d62bso38294775ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Aug 2023 09:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807988; x=1693412788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1Ik3NbSu/OHRXNMCFvLBT9/b05UkIh4Bdi7YU49cKU=;
        b=LdfNuz0XlPTeUwu2USMNJQXR1tSCmw8ShxEIXVPKTY4iFtBBLbpbQIrpY0C78In+jr
         Q1FEFeXJ0FrxhyG9496uM/PTJF8iIPtrLBhjBpxvTxPK2kuVdDt+84DL6NpCg6IL4zCf
         nL8nUHpSiTUTB3/GhGsAbzSwsAYizDKK/rKPbP6YEYwlBI9/RLhA6MX46AnCNQgmVYGj
         M/0Bhri1qOsCa6pMs6ln2EZKJJERaAzhDuEq2rS41rMEatbXd8YjpscKHbosmHryOFjv
         2zIvBMNYWiAs+mP55dtb4RSAZazV1gbAnBabcjqRaMK5mr2iIuBho86zL04pJXTpDAum
         PgTg==
X-Gm-Message-State: AOJu0YxtGYvR0lwW1y+FyKBbnQ3Pg1qriDcchdPZ7NuWMrgWscH28QlW
	i82Mb+aB8EreCDFm7yDkfsI=
X-Google-Smtp-Source: AGHT+IESYJf+m/xOvi/msi/qj+ggKweXXA5GfyTd1ZL44qcSqKH2Z7GVhEkGmV0dPjElPqFZRZ98tA==
X-Received: by 2002:a17:902:f687:b0:1bf:3094:32eb with SMTP id l7-20020a170902f68700b001bf309432ebmr12051833plg.50.1692807987993;
        Wed, 23 Aug 2023 09:26:27 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:ecb6:e8b9:f433:b4b4? ([2620:15c:211:201:ecb6:e8b9:f433:b4b4])
        by smtp.gmail.com with ESMTPSA id ik20-20020a170902ab1400b001b9da8b4eb7sm11351984plb.35.2023.08.23.09.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 09:26:27 -0700 (PDT)
Message-ID: <b4a5fa6a-e67b-d010-b704-2d7379bf2a3b@acm.org>
Date: Wed, 23 Aug 2023 09:26:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v1] ufs: core: only suspend clock scaling if scale down
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, stable@vger.kernel.org
References: <20230801133458.6837-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230801133458.6837-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_092630_925989_EEA567B2 
X-CRM114-Status: GOOD (  16.09  )
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

On 8/1/23 06:34, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> If clock scale up and suspend clock scaling, ufs will keep high
> performance/power mode but no read/write requests on going.
> It is logic wrong and have power concern.
> 
> Fixes: 401f1e4490ee ("scsi: ufs: don't suspend clock scaling during clock gating")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 129446775796..e3672e55efae 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1458,7 +1458,7 @@ static int ufshcd_devfreq_target(struct device *dev,
>   		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
>   
>   out:
> -	if (sched_clk_scaling_suspend_work)
> +	if (sched_clk_scaling_suspend_work && !scale_up)
>   		queue_work(hba->clk_scaling.workq,
>   			   &hba->clk_scaling.suspend_work);

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

