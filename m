Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207B9C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:35:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD692225B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zeKg6687"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD692225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LTDwtriV4qifsNmFH8mQZuCBDuoVHELJTHv36eKFi1k=; b=zeKg6687SN9wKZnutGcUqxJy6
	o/oJso10bHHduVEjD0ejhfSu3hKdI9BDP9QTqgXzl3weagZuVVwvi4mjFs+ctO0qWcmU7u3l6uesu
	k3oPbV4ErEGu33J6G85Dfjr5W+Pli2sFTC1O5GY4uS8Sn+yASWbf1dOdROiFlU/ws2YCY0o3PooHs
	Dp7sYtLAYcW3t/ARFNo33hurxdgAlv+tebtDVpmcsVMSuv58vG0pKxK+0A5PBslTojO7Bu6NVktsw
	onEv3qIP5swGDMPgS7wNlOk29W7rf7bxvDy2mslDqRemkZ/UVy80v3wmFFPpGZJZRxq+7VhULWWzS
	essfM4mTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg9Nf-0003Ge-Tj; Fri, 20 Nov 2020 16:35:28 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg9Nd-0003Fj-DZ
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 16:35:26 +0000
Received: (qmail 620760 invoked by uid 1000); 20 Nov 2020 11:35:24 -0500
Date: Fri, 20 Nov 2020 11:35:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Can Guo <cang@codeaurora.org>
Subject: Re: [PATCH RFC v2 1/1] scsi: pm: Leave runtime PM status alone
 during system resume/thaw/restore
Message-ID: <20201120163524.GB619708@rowland.harvard.edu>
References: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_113525_547404_A0BAD1FA 
X-CRM114-Status: GOOD (  21.50  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 12:37:22AM -0800, Can Guo wrote:
> Runtime resume is handled by runtime PM framework, no need to forcibly
> set runtime PM status to RPM_ACTIVE during system resume/thaw/restore.

Sorry, I don't understand this explanation at all.

Sure, runtime resume is handled by the runtime PM framework.  But this 
patch changes the code for system resume, which is completely different.

Following a system resume, the hardware will be at full power.  We don't 
want the kernel to think that the device is still in runtime suspend; 
otherwise is would never put the device back into low-power mode.

Alan Stern

> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
> 
> Changes since v1:
> - Incorporated Bart's comments
> 
> ---
>  drivers/scsi/scsi_pm.c | 24 +-----------------------
>  1 file changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
> index 3717eea..908f27f 100644
> --- a/drivers/scsi/scsi_pm.c
> +++ b/drivers/scsi/scsi_pm.c
> @@ -79,25 +79,6 @@ static int scsi_dev_type_resume(struct device *dev,
>  	scsi_device_resume(to_scsi_device(dev));
>  	dev_dbg(dev, "scsi resume: %d\n", err);
>  
> -	if (err == 0) {
> -		pm_runtime_disable(dev);
> -		err = pm_runtime_set_active(dev);
> -		pm_runtime_enable(dev);
> -
> -		/*
> -		 * Forcibly set runtime PM status of request queue to "active"
> -		 * to make sure we can again get requests from the queue
> -		 * (see also blk_pm_peek_request()).
> -		 *
> -		 * The resume hook will correct runtime PM status of the disk.
> -		 */
> -		if (!err && scsi_is_sdev_device(dev)) {
> -			struct scsi_device *sdev = to_scsi_device(dev);
> -
> -			blk_set_runtime_active(sdev->request_queue);
> -		}
> -	}
> -
>  	return err;
>  }
>  
> @@ -165,11 +146,8 @@ static int scsi_bus_resume_common(struct device *dev,
>  		 */
>  		if (strncmp(scsi_scan_type, "async", 5) != 0)
>  			async_synchronize_full_domain(&scsi_sd_pm_domain);
> -	} else {
> -		pm_runtime_disable(dev);
> -		pm_runtime_set_active(dev);
> -		pm_runtime_enable(dev);
>  	}
> +
>  	return 0;
>  }
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
