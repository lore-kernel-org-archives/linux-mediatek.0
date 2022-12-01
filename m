Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716DBC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLQnlIqZMqnslRXpJFqXkXCTO3+9It8vDqxfladdyF0=; b=jsd6qkvyoLln2HCVJJVN5F3Gv2
	4OySN78ZIh0AZWDK9iJinpl3j5FM9MJaULbRYiiJdGzvStv65dFkXZR1+CPfKrE43mYNjeCcHtjsX
	57IHL0znotB1kyqNTvT8/RMOAnvDzcl9uFlzeoFGXWX6ocaGUmj/+A1mpSBZvi7Pbs+yrV1CLxbPW
	u5Gl4/t8Z6H8j+Pap4gx9tPJ2ula5MYdI1k/A93egRqocbrBI072u9HZ4y/2d0uFsvJ0Pkgwk6A0p
	tu8d3VmbI4k+dtAHhq2+xeS3HheqMY7+8ea3ngN8pUDzJn4/s0+36RHuhjDdHdty7GmI9UMb/PHsm
	8TU6JCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0odb-009p06-2g; Thu, 01 Dec 2022 18:50:23 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0oXv-009mFs-Lj
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 18:44:33 +0000
Received: by mail-pj1-f42.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so3006155pjb.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 10:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLQnlIqZMqnslRXpJFqXkXCTO3+9It8vDqxfladdyF0=;
        b=PhLHZsOcY28lA3nki8QgKBcgHge6p7RmqxtXhWMcdBbKyYzWf8J1+BePN4xjKS8Ber
         q5ym2ccs4xvgA/ZMuRytl1AfIN4rjqzh39sKdFV6X4S+wyIupP/qVCTGhjEKC/hrnBHY
         nenDKPrmhlPEIW5qzbKHY7V5YHYV1s52xvlmWbgwMBq4DmVGFEzGqaUV8xgYqWRi/Aze
         HyMkckUNjbG80z8O0Yropr0QjqOkO0bTfU1X46LiyaRs6O7NHl8Ttzw1ZMH3FXKVC9mK
         uEMvC96wCfapHepHpx85CrevDzx2onPAvNyBId/SlLVKMA0qPHwR3RIhObmgTidzArBK
         ZAfQ==
X-Gm-Message-State: ANoB5pk4zMjWP9QF8ksuAOqhUcPqRkK2zZi90qPx8fdydGAz8WJriPCj
	UvIGdeKYtWMYMyTAa0UtAaY=
X-Google-Smtp-Source: AA0mqf5tpYt6FUVPOIYtEE84v6UUP4dv3cX8/v0ZiDJbM2u1up2UZoQaZ5RzgrzxXCHKem//7OIH1g==
X-Received: by 2002:a17:902:8c97:b0:189:13df:9dac with SMTP id t23-20020a1709028c9700b0018913df9dacmr47502011plo.34.1669920269371;
        Thu, 01 Dec 2022 10:44:29 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:e25f:2653:dbae:e657? ([2620:15c:211:201:e25f:2653:dbae:e657])
        by smtp.gmail.com with ESMTPSA id u9-20020a63d349000000b0046feb2754e5sm2828954pgi.28.2022.12.01.10.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 10:44:27 -0800 (PST)
Message-ID: <c9a68946-1015-9b9c-1023-94919d001ece@acm.org>
Date: Thu, 1 Dec 2022 10:44:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] ufs: core: wlun suspend SSU/enter hibern8 fail
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
References: <20221201094358.20700-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221201094358.20700-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_104431_775025_9504117D 
X-CRM114-Status: GOOD (  10.71  )
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

On 12/1/22 01:43, peter.wang@mediatek.com wrote:
> @@ -9049,6 +9050,20 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   
>   		if (!hba->dev_info.b_rpm_dev_flush_capable) {
>   			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> +			if ((ret) && (pm_op != UFS_SHUTDOWN_PM)) {

Please remove the superfluous parentheses from the above statement.

> +				/*
> +				 * If return err in suspend flow, IO will hang.
> +				 * Trigger error handler and break suspend for
> +				 * error recovery.
> +				 */
> +				spin_lock_irqsave(hba->host->host_lock, flags);

__ufshcd_wl_suspend() is allowed to sleep. Please change 
spin_lock_irqsave() into spin_lock_irq().

> +				hba->force_reset = true;
> +				ufshcd_schedule_eh_work(hba);
> +				spin_unlock_irqrestore(hba->host->host_lock,
> +					flags);
> +
> +				ret = -EBUSY;

Why is the value of 'ret' changed into -EBUSY? Can the above code be 
left out?

> @@ -9060,6 +9075,20 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   	 */
>   	check_for_bkops = !ufshcd_is_ufs_dev_deepsleep(hba);
>   	ret = ufshcd_link_state_transition(hba, req_link_state, check_for_bkops);
> +	if ((ret) && (pm_op != UFS_SHUTDOWN_PM)) {
> +		/*
> +		 * If return err in suspend flow, IO will hang.
> +		 * Trigger error handler and break suspend for
> +		 * error recovery.
> +		 */
> +		spin_lock_irqsave(hba->host->host_lock, flags);
> +		hba->force_reset = true;
> +		ufshcd_schedule_eh_work(hba);
> +		spin_unlock_irqrestore(hba->host->host_lock,
> +			flags);
> +
> +		ret = -EBUSY;
> +	}

Same comments as above for this code block.

Thanks,

Bart.


