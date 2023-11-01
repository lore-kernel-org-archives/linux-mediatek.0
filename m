Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1497DC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+opAGuk+SjszooQP+bzRmo6Dg400E28RdHt2ncsoH0=; b=qfQOmGGA9PRANCDd3Bsg+29o/n
	Eo5dSdexWF/iOPoI+jjbkOBr4LTLBf0jMIGWAKRX93bQy7CjAy51d88a52SAiIjSJII/iJ5ldzHGb
	qHjhBqIYtav+pkbU61a378DiaEPyM98e+YXf/y6IcpnG8JQqcnfrP3dWJ8E/pegFotCbk4jby0zoj
	CCGA+jrP77AGnoGdEsKk5lskdtqhUd51SyZl9iX2cVDoERs1l+3w40Bc1ohpqHiQrmlhM92bqQrGH
	DxUn06mA+x4Fxq6YW3OXUw7RbPB1KEPcPnbxjVFApQu2mqXXF/WwpssDXRZex4hfW8cGCWvdF158f
	IYYBNv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEHJ-007pJN-2j;
	Wed, 01 Nov 2023 16:41:13 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEHH-007pIa-01;
	Wed, 01 Nov 2023 16:41:12 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc34c3420bso29117245ad.3;
        Wed, 01 Nov 2023 09:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698856869; x=1699461669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+opAGuk+SjszooQP+bzRmo6Dg400E28RdHt2ncsoH0=;
        b=M+6+0F3Jj96YyDegTbAgY4dLWxBOyUktI0a1vgxAU33Pc8AYdiV9dKjU01wtbZZadc
         Tth3JCZFTS/xpQ+NcZIJaJeqhHRicOh621aJXRv9IzWmVbusQ3IiCwy598V4Lo0n0pmA
         A833mQL+eimEjHaMWeAP0vrgJ82QX5VgA5xukSZU+59LimqVLGgsHEOvSi5C9ekvcWdG
         +PY30TYX/vNe9fxrSXbHBstyvOVAh+A9LOxCaduKs9RfdFjUGUca22wOEjezJ0qur7i1
         XLghgar/uYSC1TiEbUgqLUB7fKvyBfcdgd7HPVA+cWUR/HYXdnt47be4LPyo08bUzuhE
         8qeQ==
X-Gm-Message-State: AOJu0YwiBHr1kaPhSY3XNMtI6JFFZY+QEn8ou6yYF/hNYGLqfmRLOh0r
	4evmFXkp0YG9IYpQTBDzOEM=
X-Google-Smtp-Source: AGHT+IGg5AzXY63twkWghPNw6C7tntLttMWoxGkD3DnikuNd8PsmAbkzHqnqH/lLjvQSnRHbLLBmHQ==
X-Received: by 2002:a17:902:6803:b0:1bf:c59:c944 with SMTP id h3-20020a170902680300b001bf0c59c944mr12504402plk.22.1698856869220;
        Wed, 01 Nov 2023 09:41:09 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:2312:f48f:8e12:6623? ([2620:15c:211:201:2312:f48f:8e12:6623])
        by smtp.gmail.com with ESMTPSA id s9-20020a170902ea0900b001c3267ae317sm1541678plg.165.2023.11.01.09.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 09:41:08 -0700 (PDT)
Message-ID: <cfcd744a-8986-452c-9c27-71a2e6b245f4@acm.org>
Date: Wed, 1 Nov 2023 09:41:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] ufs: core: Expand MCQ queue slot to
 DeviceQueueDepth + 1
Content-Language: en-US
To: naomi.chu@mediatek.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 casper.li@mediatek.com, powen.kao@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20231101082402.20856-1-naomi.chu@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231101082402.20856-1-naomi.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_094111_064715_DE174B42 
X-CRM114-Status: GOOD (  17.05  )
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

On 11/1/23 01:24, naomi.chu@mediatek.com wrote:
> From: Naomi Chu <naomi.chu@mediatek.com>
> 
> Allow UFSHCI 4.0 controllers to fully utilize MCQ queue slots.
> 
> Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
> ---
>   drivers/ufs/core/ufs-mcq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 2ba8ec254dce..5c75ab9d6bb5 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -436,7 +436,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
>   
>   	for (i = 0; i < hba->nr_hw_queues; i++) {
>   		hwq = &hba->uhq[i];
> -		hwq->max_entries = hba->nutrs;
> +		hwq->max_entries = hba->nutrs + 1;
>   		spin_lock_init(&hwq->sq_lock);
>   		spin_lock_init(&hwq->cq_lock);
>   		mutex_init(&hwq->sq_mutex);

Please add a Fixes: tag and expand the patch description. What should be
mentioned in the patch description is that the UFSHCI specification
requires that there is always at least one empty slot in each completion
queue. I think that is why the above change is necessary.

Thanks,

Bart.

