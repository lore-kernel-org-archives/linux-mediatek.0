Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C2DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZKUjV+JDq3t/cI0vRgnal2s16ZXLXlEnj1n19QibKA=; b=z0XeRjBPvPKo6pXYXWI66qAJUf
	c8ewuw0RSPofS34wQWswSGun6Wvh5PNJ7SnP/ZQZPRzuuX3gxTYVWeLJsz0cqF+erPBvJgDOzD/2M
	d85cuYxA7a3nL18YsYkcnS9dXmkiwcxYYmYibLpkWeM3NhAlt13+p8ImA2kwTjAb4miWGdoH8x1a3
	xFHBcB0dH4buWIgdKkaFAMZ9AkzGJcl9t9sbvUkZmroGl+GyEOSXyvrkAWKPdoEvG5UahF89MW2S1
	0s2iUPN/hz72JaZcHHHrbebMbZfbqmS4u3jI4WphPucicUhGV+ncIVdQLQENLbsi6l5pLl2ErQ5Na
	mub5jE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG1Nw-00Fp7D-NJ; Mon, 25 Jul 2022 16:56:48 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG1Nu-00Fp5f-IN
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 16:56:47 +0000
Received: by mail-pg1-f169.google.com with SMTP id bh13so10903093pgb.4
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 09:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SZKUjV+JDq3t/cI0vRgnal2s16ZXLXlEnj1n19QibKA=;
        b=cFy5aV/r9S8OI6xwl2Jn7G6okvCxyB8qsWMQFn19O/qX8MaX5Uk95plVcKUCVy19KC
         kpMgkqdKksuWJrx5+6nM9GNK9QecWXjlxo+IPz8RwG/BTfHr/WtCf2MCxYnqSGyZGKR5
         4I7jHUk490uNUp50v1lqDevPxZ8ibUrSyQ9qs3UGY2gU9hmpA+gt88rx9vx3+CbOYxN9
         nOmnP6cFv/QRCVogJiKyuQa40uFktA3Fn2APcCAUVQWL4rRFaSgu7RzR7Z9LtvJsX6//
         A5ISIIGeewitnsZn4icvmdiOUll5zuldwm5yCEg4VPsWtUvZvbddNBpLW23Mcn1CBesc
         H4dQ==
X-Gm-Message-State: AJIora+2RxFML6wOMMr7Wm1pLFlNXtjejJh/y6juiZYjHegr25eS1SyX
	gS/4MVozgLiNZ2S5fckeXrM=
X-Google-Smtp-Source: AGRyM1vPygkhuB+jI5F6MNLnqLJsgiXyyQLz9iNoFDiWlv7lCgR/mXSwyVe+zup1azDMgpR353agFw==
X-Received: by 2002:a63:5cf:0:b0:419:ecc3:6fbc with SMTP id 198-20020a6305cf000000b00419ecc36fbcmr11796189pgf.192.1658768203830;
        Mon, 25 Jul 2022 09:56:43 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:54bc:1b55:1813:e7a8? ([2620:15c:211:201:54bc:1b55:1813:e7a8])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090264c100b0016d2e8c2228sm9366935pli.238.2022.07.25.09.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:56:43 -0700 (PDT)
Message-ID: <bde55edf-8009-863d-b96d-8d3d937444e9@acm.org>
Date: Mon, 25 Jul 2022 09:56:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ufs: core: fix lockdep warning of clk_scaling_lock
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220725043000.5086-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220725043000.5086-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_095646_645354_EE47536D 
X-CRM114-Status: GOOD (  14.06  )
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

On 7/24/22 21:30, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> There have a lockdep warning like below in current flow.
> kworker/u16:0:  Possible unsafe locking scenario:
> 
> kworker/u16:0:        CPU0                    CPU1
> kworker/u16:0:        ----                    ----
> kworker/u16:0:   lock(&hba->clk_scaling_lock);
> kworker/u16:0:                                lock(&hba->dev_cmd.lock);
> kworker/u16:0:                                lock(&hba->clk_scaling_lock);
> kworker/u16:0:   lock(&hba->dev_cmd.lock);
> kworker/u16:0:
> 
> Before this patch clk_scaling_lock was held in reader mode during the ufshcd_wb_toggle() call.
> With this patch applied clk_scaling_lock is not held while ufshcd_wb_toggle() is called.
> 
> This is safe because ufshcd_wb_toggle will held clk_scaling_lock in reader mode "again" in flow
> ufshcd_wb_toggle -> __ufshcd_wb_toggle -> ufshcd_query_flag_retry -> ufshcd_query_flag ->
> ufshcd_exec_dev_cmd -> down_read(&hba->clk_scaling_lock);
> The protect should enough and make sure clock is not change while send command.

Since this is a bug fix, please add a Fixes: tag.

>   out_unprepare:
> -	ufshcd_clock_scaling_unprepare(hba, is_writelock);
> +	ufshcd_clock_scaling_unprepare(hba);
> +
> +	/* Enable Write Booster if we have scaled up else disable it */
> +	if (wb_toggle)
> +		ufshcd_wb_toggle(hba, scale_up);
> +
>   	return ret;
>   }

Can the above patch can have the following unwanted effect?
* ufshcd_devfreq_scale() calls ufshcd_clock_scaling_unprepare().
* Clock scaling to a lower frequency happens.
* ufshcd_wb_toggle() enables the write booster.

Shouldn't the above ufshcd_wb_toggle() call be surrounded by down_read() 
and up_read() calls in addition to a check whether the WriteBooster 
really should be enabled instead of using 'scale_up'?

Thanks,

Bart.



