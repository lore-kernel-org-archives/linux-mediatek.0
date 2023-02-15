Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D4C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7RJUFWr8yFaYxrhdiEcn2oKMmIGGDkUJslynTZp+P4=; b=40nP5X/2O55qSuicIlLlQvtI0E
	7HxFObTPY8MyXWl6lFeG8O44LpV3kPXD38xZFji/Q2SiT3GJOFcA/Wvg+sTkXg3GS/nzfj0Nx0jXJ
	9T1LHdEhtfikvhkdtoEOhLmyikPBWHeys55AqWcsSNBDYEXoyaPrmKaHNa6KnK78hahlVabaPbVIc
	ZBfK3jZBrgC7fMaHZKFp56Z9PW8CbVfRCy9UOf2DRqSnZykpMLtEYgUsoKZL6ugxHde3bR6MnsHbc
	yPR7ACdEpV9Sbl6q6MMpyJfDIw6uPJG8i4iTwyHD3c2ifVDNuS32wkW6Pq9cHhSP+O7vzRxLKAGN6
	cJtXw4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLfk-006huV-OP; Wed, 15 Feb 2023 17:34:24 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLfZ-006hqJ-UM; Wed, 15 Feb 2023 17:34:15 +0000
Received: by mail-pj1-f47.google.com with SMTP id d8-20020a17090ad98800b002344fa17c8bso2535392pjv.5;
        Wed, 15 Feb 2023 09:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7RJUFWr8yFaYxrhdiEcn2oKMmIGGDkUJslynTZp+P4=;
        b=McVrKIqel2sGMhljIOl+3uw230BLyiIFTJJn07gx7Cvn/+EqGQdswtsO4jPVKTSwha
         A0V4nHG6iNiSxE2OpgyIx0gaWU6sN7KhKWsWLW+ulZsaJXTJYDfHDN7tAQJ+S+vMvBY/
         bTmHwvyd3FPErcrYOrk2kjLiOO+6YNF1drbU9yDPWDoivm7nmyM6n5ZRGpZKXuZOu2F1
         W7Ua2BLEF7K5rE/59ybjHP0W63jg0Audz+CFF1E26JH+wH9QX8T5MAkwrGPNDfO2A7+t
         k9Vv8B8pv6JPxMVnXur+PsZOO/bGcNBI26JQU4oP83Mj1Biu5rzRsAT/p7xMP3c1yr5T
         /8UA==
X-Gm-Message-State: AO0yUKVE+w2i/QIt6hwFV9GzXscKdt7Wo9SBvj9Nzaxy6XTwT9tzC0Of
	CrV1uWIHAv7RHed33ZyHbQA=
X-Google-Smtp-Source: AK7set8KLjD29nGYSoiZcDjoRn7yIAWLQdb0khrbWiYyRjTHemXuKmGovegMmhMZOXZujT+FAiP9yg==
X-Received: by 2002:a17:903:24f:b0:19a:b2ee:cf41 with SMTP id j15-20020a170903024f00b0019ab2eecf41mr3717131plh.59.1676482451156;
        Wed, 15 Feb 2023 09:34:11 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:f2b7:9a62:c95d:fb83? ([2620:15c:211:201:f2b7:9a62:c95d:fb83])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0019a6fe0f975sm5076016plk.267.2023.02.15.09.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 09:34:10 -0800 (PST)
Message-ID: <fef343fb-42e3-501a-709e-f1c0b74a84c8@acm.org>
Date: Wed, 15 Feb 2023 09:34:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] scsi: ufs: core: Fix mcq tag calcualtion
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com,
 jiajie.hao@mediatek.com, mason.zhang@mediatek.com,
 quic_asutoshd@quicinc.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230215123750.15785-1-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230215123750.15785-1-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093414_012471_F8D624A5 
X-CRM114-Status: GOOD (  15.87  )
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

On 2/15/23 04:37, Po-Wen Kao wrote:
> Transfer command descriptor is allocated in ufshcd_memory_alloc()
> and referenced by transfer request descriptor with stride size
> sizeof_utp_transfer_cmd_desc()
> instead of
> sizeof(struct utp_transfer_cmd_desc).
> 
> Consequently, computing tag by address offset should also refer to the
> same stride.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---
>   drivers/ufs/core/ufs-mcq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 31df052fbc41..3a27fa4b0024 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
>   	addr = (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) -
>   		hba->ucdl_dma_addr;
>   
> -	return div_u64(addr, sizeof(struct utp_transfer_cmd_desc));
> +	return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));
>   }
>   
>   static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

