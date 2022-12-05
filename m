Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD63C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyzTPV6X9xNiTCbyGstKIWGMGMo8e5LT5ChhPCYnMlc=; b=5EPGw59id8my3Qt8oRtt7BYHCx
	07VMC7L2Bdxi+B/frhCzXhF0vhrZc+FWfhA6n7KCtGAYqNWi8D7Oa+a7C46DdY9LU/NxrEgo8duvo
	mY/fspexAt1X3AgPWjfY3XNOqk2MX5+/bMGdGpoHjMIlQXnKebUG0WMwBHGMaGnVZOXiJ8P5ZTDLb
	GT40qq7NVLvfqB0MLPjR+84C4WNb5J7BVnATtqEWY2DY9SzCtVFLIe6PdHXV6MbKcejMLPRQVJleD
	Q+iYppzRekSf+b/Q2DEa/GPpnYKUr7FdbMrgeiRrqWSIdYEiMUpv3i7LtvPtadokNyB08x3sofJ/q
	9hUQoNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GPp-008Z2U-3S; Mon, 05 Dec 2022 18:42:09 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GPm-008Yu7-MV
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 18:42:08 +0000
Received: by mail-pj1-f50.google.com with SMTP id q15so11059302pja.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 10:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyzTPV6X9xNiTCbyGstKIWGMGMo8e5LT5ChhPCYnMlc=;
        b=QiB1vO+LE9Qca4lFjVNLaYYnBZ4P3/Nvte16AUvxichWojDubLwtZx0TAxNiOT7CK4
         3V+99wPYxSd+iR+9wcE1QhU8OSXATDJ8T+jUvHBKKHecIaBWGIAwhH+EVeodry0JNzCD
         Ir8zlufQRDOYbqSVLg4Gh08mYnw9zgtDaK52U4078jkSj8WtfvjrWwoJ/YcDKM4HsH2W
         K+D3ICytzyDPwJDMA8dLmqgMVi2DG74ddN4grjVti0vYj5ZHiI0pk1WK8LI/V23QoJPI
         xvC7CDCxrxFadNCOb3mzzeQOhca2bdyrjOXhjVtEPuMvAY+t09xdbpRsX5M30jtu/TLq
         mflw==
X-Gm-Message-State: ANoB5pnj07KWWNMLAVhqLDeeS4dWEJfk5P2JbgFg8gCBfF/7uZI/NpqI
	P3YozpKCpfwWHMWXJKwDJ6g=
X-Google-Smtp-Source: AA0mqf7YcuHB/+S/cPgfuJ0vxZsTspMf7KptxrrWaSD1oWJBYRYRq9ExUjSUrPOI7HRt0+It34rSpQ==
X-Received: by 2002:a17:902:b608:b0:189:7a8b:537d with SMTP id b8-20020a170902b60800b001897a8b537dmr44459287pls.95.1670265723486;
        Mon, 05 Dec 2022 10:42:03 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:c22a:d200:1ba3:dcca? ([2620:15c:211:201:c22a:d200:1ba3:dcca])
        by smtp.gmail.com with ESMTPSA id h15-20020a056a00000f00b00574d38f4d37sm10244237pfk.45.2022.12.05.10.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 10:42:02 -0800 (PST)
Message-ID: <6785696a-cb52-5934-dbd6-28472b4cd7c6@acm.org>
Date: Mon, 5 Dec 2022 10:41:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3] ufs: core: wlun suspend SSU/enter hibern8 fail
 recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20221202073532.7884-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221202073532.7884-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_104206_762389_01ECD115 
X-CRM114-Status: GOOD (  17.88  )
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

On 12/1/22 23:35, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When SSU/enter hibern8 fail in wlun suspend flow, trigger error
> handler and return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..a0dbf2c410b1 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -9049,6 +9049,19 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   
>   		if (!hba->dev_info.b_rpm_dev_flush_capable) {
>   			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> +			if (ret && (pm_op != UFS_SHUTDOWN_PM)) {
> +				/*
> +				 * If return err in suspend flow, IO will hang.
> +				 * Trigger error handler and break suspend for
> +				 * error recovery.
> +				 */
> +				spin_lock_irq(hba->host->host_lock);
> +				hba->force_reset = true;
> +				ufshcd_schedule_eh_work(hba);
> +				spin_unlock_irq(hba->host->host_lock);
> +
> +				ret = -EBUSY;
> +			}
>   			if (ret)
>   				goto enable_scaling;
>   		}
> @@ -9060,6 +9073,19 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   	 */
>   	check_for_bkops = !ufshcd_is_ufs_dev_deepsleep(hba);
>   	ret = ufshcd_link_state_transition(hba, req_link_state, check_for_bkops);
> +	if ((ret) && (pm_op != UFS_SHUTDOWN_PM)) {
> +		/*
> +		 * If return err in suspend flow, IO will hang.
> +		 * Trigger error handler and break suspend for
> +		 * error recovery.
> +		 */
> +		spin_lock_irq(hba->host->host_lock);
> +		hba->force_reset = true;
> +		ufshcd_schedule_eh_work(hba);
> +		spin_unlock_irq(hba->host->host_lock);
> +
> +		ret = -EBUSY;
> +	}
>   	if (ret)
>   		goto set_dev_active;
>   

Please follow the coding style that is used elsewhere in the kernel and
remove the superfluous parentheses from this patch. "if (ret && (pm_op !=
UFS_SHUTDOWN_PM)) {" can be changed into "if (ret && pm_op !=
UFS_SHUTDOWN_PM) {" and "if ((ret) && (pm_op != UFS_SHUTDOWN_PM)) {" can be
changed into "if ((ret) && (pm_op != UFS_SHUTDOWN_PM)) {".

Otherwise this patch looks good to me.

Thanks,

Bart.

