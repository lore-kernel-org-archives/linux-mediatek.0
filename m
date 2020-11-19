Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69976C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE926246B8
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bNNpuwdR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="XeD0fqFJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE926246B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=drWKhWNviKQlnupM+zofoij/6YzoOLyY/dwYIrdLv38=; b=bNNpuwdRhA7R6NECWjp28/MM9
	sKXeJI9inUUXSH9oVHt+xh1aRLpm3o+bGY40swJv6nXudcx66Ya2JyrBLlivQyMhy8EGuA6UXvVaQ
	mSCcZF/5kXHOw4sKob+32I43IEdjRZ96TP0yneJoYDMGQd6eS7eZXFqkYVm4XsFBn1PBHsVoPaXZU
	jHBgO6tGslgDjlJL6fYEV4zu5q3V+TWPl+UsF6IC0thVaYa86ESIP9QfxfE0Js2/9P0Q+4i5hbPkY
	P6BU2vJFbDI108lY5xGRSuTCqdWTU93+AsahgtjbN1b65k9Rw3+aOWbhJmEhdzgh96p/9l9NRXcrO
	UwJxZVxPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfe9N-000639-Jm; Thu, 19 Nov 2020 07:14:37 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfe9I-0005zl-2j
 for linux-mediatek@lists.infradead.org; Thu, 19 Nov 2020 07:14:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605770073; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XXv1sghWHsOtozF9TjpzQ8BZgyE+fxP4S3fS/+0JJH0=;
 b=XeD0fqFJb0kfRo3fwtlg5yjXJJyi/BV+qZs+lO5PffAoI7fjYagYp9NhZZUAVXTKPKiu0G/7
 /8Zg1yCNugYDxJmmrlQcTT1kVVQprWyZXG51LOgbQyOVOOTOYjM5UMcTSa40vjUTUS1Rl5H9
 RFSryTi/X9a6wQrKgCx3Be4m9vs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fb61b4f7ef0a8d8437b5e23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 07:14:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1BD3EC4346E; Thu, 19 Nov 2020 07:14:23 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25A96C4346B;
 Thu, 19 Nov 2020 07:14:20 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 15:14:19 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs: Fix race between shutdown and runtime
 resume flow
In-Reply-To: <20201119062916.12931-1-stanley.chu@mediatek.com>
References: <20201119062916.12931-1-stanley.chu@mediatek.com>
Message-ID: <26585f80038d25fc6ee9dddf07e66b93@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_021433_543379_11AEC514 
X-CRM114-Status: GOOD (  18.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-19 14:29, Stanley Chu wrote:
> If UFS host device is in runtime-suspended state while
> UFS shutdown callback is invoked, UFS device shall be
> resumed for register accesses. Currently only UFS local
> runtime resume function will be invoked to wake up the host.
> This is not enough because if someone triggers runtime
> resume from block layer, then race may happen between
> shutdown and runtime resume flow, and finally lead to
> unlocked register access.
> 
> To fix this kind of issues, in ufshcd_shutdown(), use
> pm_runtime_get_sync() instead of resuming UFS device by
> ufshcd_runtime_resume() "internally" to let runtime PM
> framework manage the whole resume flow.
> 
> Fixes: 57d104c153d3 ("ufs: add UFS power management support")
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufshcd.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 80cbce414678..bb16cc04f106 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -8941,11 +8941,7 @@ int ufshcd_shutdown(struct ufs_hba *hba)
>  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
>  		goto out;
> 
> -	if (pm_runtime_suspended(hba->dev)) {
> -		ret = ufshcd_runtime_resume(hba);
> -		if (ret)
> -			goto out;
> -	}
> +	pm_runtime_get_sync(hba->dev);
> 
>  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
>  out:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
