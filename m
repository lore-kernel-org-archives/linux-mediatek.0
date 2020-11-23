Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059E4C5519F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 01:24:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9102F20771
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 01:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YaBiSC5R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="p/5WHEne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9102F20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cEayyILH8l8mGT4rSm+BxJfcNlvDGUEek4/op6RYBOg=; b=YaBiSC5RcbLfy7YcE0M+hx4Xk
	UcEIbPqy4tRiPmymvNrM7Qc8sIwxKm9xT4guIheAoIM7FQYpjIMBN7dqk08R/pnkFpYz42DbOmqgx
	XbP3UGqhFVQoy1Z7WS2rgeGp5Vj45l7/G2zHxide0gck0NUz/Rg1GkzTSSCM84hI3YOd0CGxGefkO
	1TsLCWY6A31qCWzob2W93F42Z+w85vusbjggWo46HC3g22mlqY70Rslq7b+PJlWZCU9f+PnYz+Zm5
	toBc2P4StUcLlctKDp1o4c8bbekn3EffAgUNSakhoAl8NHli0VyS0C4t8ssEfFtYD82YYkNGYzJDT
	zTeJ8fNvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh0aI-0002Xu-SY; Mon, 23 Nov 2020 01:24:02 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh0aE-0002XF-Kp
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 01:24:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606094637; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WVW8SEFhmmTXHu0CNeD1oWMm387GTbxMvfMsPgLO/r4=;
 b=p/5WHEneX1chUhDx4KsuY1JpC3ZsnjXGAVQJNMQsIx7qvFTIO/FxLNjicrS9+vgXCFwGA8oD
 bi8eNpULyxeGO9u1I3iOEDjmezAMiw+pMPN+WCDulthggLaq0BoRttO+vs6dRIlBmfbfJwgB
 b0FNMHI0jTFTT3QUfbAgHof8s4k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fbb0f2c7f0cfa6a16c0e1f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 01:23:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9510DC43463; Mon, 23 Nov 2020 01:23:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 16917C433ED;
 Mon, 23 Nov 2020 01:23:54 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 09:23:53 +0800
From: Can Guo <cang@codeaurora.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RFC v2 1/1] scsi: pm: Leave runtime PM status alone during
 system resume/thaw/restore
In-Reply-To: <20201120163524.GB619708@rowland.harvard.edu>
References: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
 <20201120163524.GB619708@rowland.harvard.edu>
Message-ID: <ff2975f88cc452d134b8bf24c55bec09@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_202358_828446_AE4E17D4 
X-CRM114-Status: GOOD (  27.64  )
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
Cc: "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alan,

On 2020-11-21 00:35, Alan Stern wrote:
> On Fri, Nov 20, 2020 at 12:37:22AM -0800, Can Guo wrote:
>> Runtime resume is handled by runtime PM framework, no need to forcibly
>> set runtime PM status to RPM_ACTIVE during system resume/thaw/restore.
> 
> Sorry, I don't understand this explanation at all.
> 
> Sure, runtime resume is handled by the runtime PM framework.  But this
> patch changes the code for system resume, which is completely 
> different.
> 
> Following a system resume, the hardware will be at full power.  We 
> don't
> want the kernel to think that the device is still in runtime suspend;
> otherwise is would never put the device back into low-power mode.

How about adding below lines to the patch?

diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
index 908f27f..7ebe582 100644
--- a/drivers/scsi/scsi_pm.c
+++ b/drivers/scsi/scsi_pm.c
@@ -75,9 +75,11 @@ static int scsi_dev_type_resume(struct device *dev,
         const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : 
NULL;
         int err = 0;

-       err = cb(dev, pm);
-       scsi_device_resume(to_scsi_device(dev));
-       dev_dbg(dev, "scsi resume: %d\n", err);
+       if (pm_runtime_active(dev)) {
+               err = cb(dev, pm);
+               scsi_device_resume(to_scsi_device(dev));
+               dev_dbg(dev, "scsi resume: %d\n", err);
+       }

         return err;
  }

Whenever a device is accessed, the issuer or somewhere in the path
should do something like pm_runtime_get_sync (e.g. in sg_open()) or
pm_runtime_resume() (e.g. in blk_queue_enter()), in either sync or
async way. After the job (read/write/ioctl or whatever) is done,
either a pm_runtime_put_sync() or auto runtime suspend puts the device
back into runtime suspended/low-power mode. Since the func
scsi_bus_suspend_common() does nothing if device is already in runtime
suspended mode, scsi_dev_type_resume() should only resume the device
if it is runtime active.

Thanks,

Can Guo.

> Alan Stern
> 
>> Cc: Stanley Chu <stanley.chu@mediatek.com>
>> Cc: Bart Van Assche <bvanassche@acm.org>
>> Cc: Alan Stern <stern@rowland.harvard.edu>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>> 
>> Changes since v1:
>> - Incorporated Bart's comments
>> 
>> ---
>>  drivers/scsi/scsi_pm.c | 24 +-----------------------
>>  1 file changed, 1 insertion(+), 23 deletions(-)
>> 
>> diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
>> index 3717eea..908f27f 100644
>> --- a/drivers/scsi/scsi_pm.c
>> +++ b/drivers/scsi/scsi_pm.c
>> @@ -79,25 +79,6 @@ static int scsi_dev_type_resume(struct device *dev,
>>  	scsi_device_resume(to_scsi_device(dev));
>>  	dev_dbg(dev, "scsi resume: %d\n", err);
>> 
>> -	if (err == 0) {
>> -		pm_runtime_disable(dev);
>> -		err = pm_runtime_set_active(dev);
>> -		pm_runtime_enable(dev);
>> -
>> -		/*
>> -		 * Forcibly set runtime PM status of request queue to "active"
>> -		 * to make sure we can again get requests from the queue
>> -		 * (see also blk_pm_peek_request()).
>> -		 *
>> -		 * The resume hook will correct runtime PM status of the disk.
>> -		 */
>> -		if (!err && scsi_is_sdev_device(dev)) {
>> -			struct scsi_device *sdev = to_scsi_device(dev);
>> -
>> -			blk_set_runtime_active(sdev->request_queue);
>> -		}
>> -	}
>> -
>>  	return err;
>>  }
>> 
>> @@ -165,11 +146,8 @@ static int scsi_bus_resume_common(struct device 
>> *dev,
>>  		 */
>>  		if (strncmp(scsi_scan_type, "async", 5) != 0)
>>  			async_synchronize_full_domain(&scsi_sd_pm_domain);
>> -	} else {
>> -		pm_runtime_disable(dev);
>> -		pm_runtime_set_active(dev);
>> -		pm_runtime_enable(dev);
>>  	}
>> +
>>  	return 0;
>>  }
>> 
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
>> Linux Foundation Collaborative Project.
>> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
