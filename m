Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A83FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rcy9ftJKBrRHkC72YgwS3ie0/FVvPrzfi5Sffg9ACpo=; b=gc/bWJIEA4uTxBR81Wq6uVgVvV
	TV0i/dkVgRmgDOw7sdL1EcnUB4UGfeNmX5qTiFnQnV23SRAxPKIcDIsh2u5Xw63a1Cyfy/mKG11Cg
	fChaAhG7cbXrY839oBBtVJDybLfCuNpm2vhKIMnhsp9E+zPnya0LAZ+ekb+1m62nLW0ffJx/RJL/Q
	rQt6uYmObika9fJnl/5h1kWvNDz2BuG1KSiwaJtKTwgNTMfTPuicM5T8fp4LvqQ9oLAd57uVDjvjf
	ryN/cOv5BgSgrvGg+e3sfJi8brWxtBD4eTOnag73mWWppz+4rRO9zZPxZ1l/SH79nbkQngZsxKpUb
	TP+TMHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAteS-00GRjO-QF; Thu, 29 Dec 2022 14:12:56 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAte6-00GRU2-Jh; Thu, 29 Dec 2022 14:12:36 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9so2279678pll.9;
        Thu, 29 Dec 2022 06:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rcy9ftJKBrRHkC72YgwS3ie0/FVvPrzfi5Sffg9ACpo=;
        b=7drUsOCWY/TdHesbaRx/DjHFywCUwDvACuHZfu+4zNPfE2+NR84OKENQiWCvBhw/qX
         zjrhM879SoIy7Ny8JMjpi1fgsbxCaORFscE3ipzfaQXag3hOoJq34IRhUyc2QXKNrXHn
         aXBVhZyBCpTXv8E0b696vS0CAeOhxjLnkN/4sXx4F1F+lrUahHVZLdnqufqZiyVAoXA0
         ADmSy7EJTBQO1DtjSOtXki0A+KePLeMneAWMtnZvQHtvs4R0XlOekV1a0xjIRNAOkOYe
         hzeq9sF+W0sidEQrrKKxkSipn0utZftMSu3O/qE1radXgWlf13zwdi+CR/dilcX2S1u8
         4uqg==
X-Gm-Message-State: AFqh2kpFaNr++upHf+hfbuLZjHXkPS5p2dTExMtazRze3lHpT/tKn7qh
	e3OjgLVgXTUBbsQXIP9TnX0Z/qu4VHw=
X-Google-Smtp-Source: AMrXdXsAqNFfvfsB+SuolGkuRhNtkrezEQ/gDYlfmkotyqEhDt8zMnxQINy6iDMslEl7w7ZNlaGeow==
X-Received: by 2002:a05:6300:8184:b0:b0:3e0f:508d with SMTP id bt4-20020a056300818400b000b03e0f508dmr34921955pzc.55.1672323151083;
        Thu, 29 Dec 2022 06:12:31 -0800 (PST)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id a23-20020a621a17000000b0057ef155103asm1081113pfa.155.2022.12.29.06.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 06:12:29 -0800 (PST)
Message-ID: <46b4a936-c59a-ba04-4395-ed53fb72a67d@acm.org>
Date: Thu, 29 Dec 2022 06:12:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/1] ufs: update the timeout timer after resume
Content-Language: en-US
To: Ed Tsai <ed.tsai@mediatek.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 matthias.bgg@gmail.com, linux-scsi@vger.kernel.org
Cc: peter.wang@mediatek.com, alice.chao@mediatek.com, powen.kao@mediatek.com,
 naomi.chu@mediatek.com, stanley.chu@mediatek.com, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221229030645.11558-1-ed.tsai@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221229030645.11558-1-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_061234_784239_B24773A6 
X-CRM114-Status: GOOD (  18.97  )
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

On 12/28/22 19:06, Ed Tsai wrote:
> The tags allocation is limited by the number of active queues and a
> queue is marked as inactive by the queue timeout worker after up to 30Hz
> by default.
> 
> Therefore, tags for the general I/O may be limited to half of the max
> depth up to 30HZ after resume. To make sure the ufs request queue for pm
> usage can be inactive immediately, trigger the timeout worker to release
> the tag set.
> 
> Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index e18c9f4463ec..c77570caa3a8 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8842,6 +8842,7 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
>   		hba->curr_dev_pwr_mode = pwr_mode;
>   	}
>   
> +	mod_timer(&sdp->request_queue->timeout, 0);
>   	scsi_device_put(sdp);
>   	hba->host->eh_noresume = 0;
>   	return ret;

Where is the code that restores the timeout to the original value?

Additionally, I think that only the block layer core should manipulate 
the request queue timer directly. Please add a helper function in the 
block layer and call that helper function from the UFS driver.

Thanks,

Bart.

