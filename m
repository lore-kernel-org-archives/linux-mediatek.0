Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B135C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 02:04:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C6C61375
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 02:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C6C61375
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ff6FjyhZp7EtP5vLRxdzCY8MK476Z4rYcGvh8mfbjNs=; b=mptsWCeGR+dZTZtof8N+eKzWpD
	knIglp1KZ+GcHkYoFnaxImPA1f3hAeg+8dF44F0ydyQAvxxi/H1zTMCJWMTAPkuM37oypqmk4vEjV
	kJMgGuBuaLfK/9lDXEDFZVxtzwyKWuuHAvT8sMYJMBV6YGmhj5QjcA1nFFRgyedJECCfizHD4uSMW
	yOsxVNvS/VIBSTjkY+4bLx9uhCEshPT6Issw/tP9eLXk53D8tFU1dFTIx/EuAzhowZKZ3Gg/wcQM0
	zQpTWHcAdFvik+mvc7/huPlKiZa3jj45sdHt4hm1cunOOZ2dRbjwPcGv+iQ5U/OCNRgXMA2IWY3D4
	fydldkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvsFy-0090MH-Hc; Wed, 23 Jun 2021 02:04:46 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvsFv-0090Ll-CG
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 02:04:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624413883; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BWE4cJP9A5iMFs64pOQ4hiJd/MsZBADGs5e5FvhncRA=;
 b=ZJKPv3zaGRcMNX2Vb12T0DamNIQ0UBcOLUfsOHJulQ584zvWqWbmi3Xx1Pqp72Zht+NGPEME
 iL4D0D2ItcAQ2sgtVRZVqxsPKyTB5fSgDtNamP1DCH3k/HvJv3AA0CGCA7CVOWoBysO0dJJA
 EqxIq0+mwYu7/xpuAxh5tydUSEw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60d296b95e3e57240bd6c143 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 02:04:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 527AFC43145; Wed, 23 Jun 2021 02:04:40 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1753FC4338A;
 Wed, 23 Jun 2021 02:04:39 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Jun 2021 10:04:39 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, Stanley Chu
 <stanley.chu@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
In-Reply-To: <a29164e1-ab7d-6dbc-0fb9-029f203de735@acm.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <a29164e1-ab7d-6dbc-0fb9-029f203de735@acm.org>
Message-ID: <e8de57b920c9246f5a41aa44c5a4fc36@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_190443_643879_C7EDA221 
X-CRM114-Status: GOOD (  25.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On 2021-06-17 10:49, Bart Van Assche wrote:
> On 5/24/21 1:36 AM, Can Guo wrote:
>> @@ -2688,6 +2705,43 @@ static int ufshcd_queuecommand(struct Scsi_Host 
>> *host, struct scsi_cmnd *cmd)
>> +	case UFSHCD_STATE_EH_SCHEDULED_FATAL:
>> +		/*
>> +		 * pm_runtime_get_sync() is used at error handling preparation
>> +		 * stage. If a scsi cmd, e.g. the SSU cmd, is sent from hba's
>> +		 * PM ops, it can never be finished if we let SCSI layer keep
>> +		 * retrying it, which gets err handler stuck forever. Neither
>> +		 * can we let the scsi cmd pass through, because UFS is in bad
>> +		 * state, the scsi cmd may eventually time out, which will get
>> +		 * err handler blocked for too long. So, just fail the scsi cmd
>> +		 * sent from PM ops, err handler can recover PM error anyways.
>> +		 */
>> +		if (hba->pm_op_in_progress) {
>> +			hba->force_reset = true;
>> +			set_host_byte(cmd, DID_BAD_TARGET);
>> +			cmd->scsi_done(cmd);
>> +			goto out;
>> +		}
>> +		fallthrough;
> 
> Hi Can,
> 
> I know that this patch only moves the above code and that the above 
> code
> has not been introduced by this patch. Anyway, is my understanding
> correct that ufshcd_err_handler() can change the host controller state
> from UFSHCD_STATE_EH_SCHEDULED_FATAL into UFSHCD_STATE_RESET and next
> into UFSHCD_STATE_OPERATIONAL? If so, if the above code completes a 
> READ
> with status DID_BAD_TARGET and if recovery by the error handler
> succeeds, will that cause the filesystem above the UFS driver to change
> into read-only mode? If the above code completes a WRITE with status
> DID_BAD_TARGET, will that cause data corruption? Is there any other
> solution to prevent data corruption than merging the
> UFSHCD_STATE_EH_SCHEDULED_FATAL and UFSHCD_STATE_EH_SCHEDULED_NON_FATAL
> back into a single state and changing the ufshcd_rpm_get_sync(hba) call
> in ufshcd_err_handling_prepare() into a pm_runtime_get_noresume() call?
> 

Here, when hba->pm_op_in_progress is true, there cannot be READ or WRITE
command since hba is resuming or suspending. When fatal erorr happens, 
the
DID_BAD_TARGET above is intend to let the SSU (or whatever PM requests
blocking suspend/resume) fail fast (neither returning HOST_BUSY nor 
letting
the cmd pass through can achieve such purpose), so that error handling 
prepare
won't get stuck [1] when it calls

lock_system_sleep()
runtime_pm_get_sync()

The reason why I split UFSHCD_STATE_EH_SCHEDULED to 
UFSHCD_STATE_EH_SCHEDULED_FATAL
and UFSHCD_STATE_EH_SCHEDULED_NON_FATAL is that

1. For non-fatal errors, HW can recover by itself, so when host state is
UFSHCD_STATE_EH_SCHEDULED_NON_FATAL, cmd can still passthrough.

2. When non-fatal error (LINE-RESET for example) happens, error handler 
only
needs to do a power mode transition without a full reset. If we only 
have one
state, returning HOST_BUSY will get error handling prepare stuck [1], 
while
fast failing SSU cmds shall make error handler do a full reset (which 
goes
too far for non-fatal errors).

Thanks,

Can Guo.

> Thanks,
> 
> Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
