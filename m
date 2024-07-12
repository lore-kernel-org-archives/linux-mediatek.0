Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6625FC3DA45
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcY7aS/6gAbWolfcseNQxvK5EoTGz5G/d07NVTpVUZc=; b=envnJRg1SElrgOUIrGaAjiyHjK
	st1WpWOYfHXTpRuo0nd3G08Wofc6Z6oUvxOyzNFWbNN+HRIb2cJTMfI88PrDPDHy1Ee/H6uYvwH1y
	Z/VEoor/av5Xc+qAkbsHse02jMXLaIewDk9+J8O+8xCCzVl15ZU5BDmqla9d+fE/8h9+rU26Owa1n
	icR8RjGD3h0MIEB6UJCBO9nLUVb75INROW5S38xTBRSnyAau/j7yq67mOt/blLaKp/wCJowETLf3/
	pcRHQ2VQM5msHTqU4jwFEE4qRItHLegUcSIJ703/tX5TX0fWSOhdm0oaDfbZytJwGP9KNNvXJL+Rm
	Maumh2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSKAV-00000000rlB-1Ndn;
	Fri, 12 Jul 2024 17:34:51 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSKAS-00000000rkS-1RZh
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 17:34:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WLJd24fv3zllBcw;
	Fri, 12 Jul 2024 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1720805680; x=1723397681; bh=IcY7aS/6gAbWolfcseNQxvK5
	EoTGz5G/d07NVTpVUZc=; b=zaELPM1febTZZlObTTPvoM5HruQwYv4MnHTZ+CqR
	FiFCVl5pTzx38l5gfKMs2HiFxT8j594YEXOj78JpKWFvpTp/ByyP2fqdXVBF+Eoc
	/g+6rLG8waSwevWuiH7/h4uUX9sRxbX13YWRDjUAA+UBdYfeAHMpmnFY/qUpNZ+l
	TwGfw6ChA8pKruY9d2I52rqJKAYYi8lPtaiHiuwHxON3yu+UezHQ5nroE1YT/cuC
	pxGaLnHkG/W91gX9kwCeORDHBDCZM3WoFmAkNSLjX/ACI2uqonJKAwKcS3O5sCbH
	762L6Cqji1aOctirEvi4U9M+PbuGIjZBpH+G9QRmG2KC1w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RXA_HOuy2F21; Fri, 12 Jul 2024 17:34:40 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WLJcn2ZqqzllBck;
	Fri, 12 Jul 2024 17:34:32 +0000 (UTC)
Message-ID: <d1d20f65-faa9-414f-b7fb-4b53794c0acb@acm.org>
Date: Fri, 12 Jul 2024 10:34:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix deadlock when rtc update
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com,
 beanhuo@micron.com, stable@vger.kernel.org
References: <20240712094355.21572-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240712094355.21572-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_103448_436458_01B838C7 
X-CRM114-Status: GOOD (  13.14  )
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

On 7/12/24 2:43 AM, peter.wang@mediatek.com wrote:
> Three have deadlock when runtime suspend wait flush rtc work,
> and rtc work call ufshcd_rpm_put_sync to wait runtime resume.

"Three have"? The above description is very hard to understand. Please
improve it.

> -	 /* Update RTC only when there are no requests in progress and UFSHCI is operational */
> -	if (!ufshcd_is_ufs_dev_busy(hba) && hba->ufshcd_state == UFSHCD_STATE_OPERATIONAL)
> +	 /*
> +	  * Update RTC only when
> +	  * 1. there are no requests in progress
> +	  * 2. UFSHCI is operational
> +	  * 3. pm operation is not in progress
> +	  */
> +	if (!ufshcd_is_ufs_dev_busy(hba) &&
> +	    hba->ufshcd_state == UFSHCD_STATE_OPERATIONAL &&
> +	    !hba->pm_op_in_progress)
>   		ufshcd_update_rtc(hba);
>   
>   	if (ufshcd_is_ufs_dev_active(hba) && hba->dev_info.rtc_update_period)

The above seems racy to me. I don't think there is any mechanism that
prevents that hba->pm_op_in_progress is set after it has been checked
and before ufshcd_update_rtc() is called. Has it been considered to add
an ufshcd_rpm_get_sync_nowait() call before the hba->pm_op_in_progress
check and a ufshcd_rpm_put_sync() call after the ufshcd_update_rtc()
call?

Thanks,

Bart.

