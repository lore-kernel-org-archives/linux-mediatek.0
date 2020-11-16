Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC597C56202
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 01:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3A122265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 01:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kuYgMG5i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="mtNDOu09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3A122265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nNYAxlaxf471A9WhChxi5P+Q5G8nREbPzoORA1bchVs=; b=kuYgMG5io4QVVzEwZvMQ+Rg3w
	po1H8XSf+pUqF3j4sT32qATqdESCPAWFNn9PtE1qxXDH79EVyv96rBTaprodoJ4VyEB8M6XDuxlCz
	UcVLJXtLbuv4US2mMXfQYrk+HJL/lquAvbn7kLCmBIBzo9qvfePniPw+ejAg9b/ebvLQYFXT8G1x2
	z5AtX+wMk93ve7qAlX+4V67Mk0raHDB0NGbhSir2oLNmwn3HqU/QBQBFG5alrgTZ+75bggqxXDbD2
	cLaF7aQ3Cp9LaZ8z7qKVUpDgK53YmtjdnOpR2QFtRX+lwZvxZCss0RbTMewtZ5hHC/4Xg2P7vCCmz
	3r3hlswDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keTXA-0004Sn-Tw; Mon, 16 Nov 2020 01:42:20 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keTX6-0004QO-TU
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 01:42:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605490938; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oELFfS+JC43077ioQij5MVO6J/XlCo1j3sRES4I9xYI=;
 b=mtNDOu09qpVDHc87VLa9yPYe57vVeaBV7POpDaa31zkc0elWocZ7dmF/aJjVZ7RYPmxMEC7o
 xizY9zSoUaMNxDoyIr9ucbn7Ule/cRT6efsC09zV4BNeJ1HuTwfKiPvUn+OoOHS2mKmZMacD
 XkpOdLnRE62HFB8gXSkxmP5zdYg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fb1d8f624ba9b3b02f34bb6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 01:42:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 61312C43462; Mon, 16 Nov 2020 01:42:14 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 96DA3C433ED;
 Mon, 16 Nov 2020 01:42:13 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 16 Nov 2020 09:42:13 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH RFC v1 1/1] scsi: pm: Leave runtime resume along if block
 layer PM is enabled
In-Reply-To: <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
References: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
 <1605249009-13752-2-git-send-email-cang@codeaurora.org>
 <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
Message-ID: <20f447a438aa98afb18be4642c8888b3@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_204219_150651_BCF7AF4D 
X-CRM114-Status: GOOD (  21.32  )
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
 ziqichen@codeaurora.org, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

Resent, typo fixed.

On 2020-11-15 04:57, Bart Van Assche wrote:
> On 11/12/20 10:30 PM, Can Guo wrote:
>> If block layer runtime PM is enabled for one SCSI device, then there 
>> is
>> no need to forcibly change the SCSI device and its request queue's 
>> runtime
>> PM status to active in scsi_dev_type_resume(), since block layer PM 
>> shall
>> resume the SCSI device on the demand of bios.
> 
> Please change "along" into "alone" in the subject of this patch (if 
> that
> is what you meant).
> 

Aha, sorry, a typo here.

>> +	if (scsi_is_sdev_device(dev)) {
>> +		struct scsi_device *sdev;
>> 
>> +		sdev = to_scsi_device(dev);
> 
> A minor comment: I think that "struct scsi_device *sdev =
> to_scsi_device(dev);" fits on a single line.
> 

Sure.

>> +		 * If block layer runtime PM is enabled for the SCSI device,
>> +		 * let block layer PM handle its runtime PM routines.
> 
> Please change "its runtime PM routines" into "runtime resume" or
> similar. I think that will make the comment more clear.
> 

Yes, thanks.

>> +		if (sdev->request_queue->dev)
>> +			return err;
>> +	}
> 
> The 'dev' member only exists in struct request_queue if CONFIG_PM=y so
> the above won't compile if CONFIG_PM=n. How about adding a function in
> include/linux/blk-pm.h to check whether or not runtime PM has been 
> enabled?
> 

You are right.

> Otherwise this patch looks good to me.
> 

Actually, I am thinking about removing all the pm_runtime_set_active()
codes in both scsi_bus_resume_common() and scsi_dev_type_resume() - we
don't need to forcibly set the runtime PM status to RPM_ACTIVE for 
either
SCSI host/target or SCSI devices.

Whenever we access one SCSI device, either block layer or somewhere in
the path (e.g. throgh sg IOCTL, sg_open() calls 
scsi_autopm_get_device())
should runtime resume the device first, and the runtime PM framework 
makes
sure device's parent (and its parent's parent and so on)gets resumed as 
well.
Thus, the pm_runtime_set_active() seems redundant. What do you think?

Thanks,

Can Guo.

> Thanks,
> 
> Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
