Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D643C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 01:20:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B04522265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 01:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GcjCf9Yw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="I6T1s1DJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B04522265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B1ig5z3l6iGV7KZz6gleJUeUNoBSESYTHLB6SMVyp58=; b=GcjCf9YwBLSnMG1/9x8rXXbbv
	1SpWG4IQ6qaY2Q3IrcQMN5ppVTQCRcOZfPqXHbq0OdsxVckWxCX00mi5MLBV4ETxMX74vqmcUvEoz
	8ZApeMoooS84AqgykwBW1sWOpheiai+/jmIoHBuNnwq9ISHJNwKeGX2UgIeodzsVtW5rd/210JDTv
	IiUUr85Msw16txlYAlVMqJfOaLWzfj2r/iz/x1TsCgC6llJTBrlaPzpUCSAbQ1hjxrjBtZoGezLXj
	w7/0vhIV0zLm7yk0gnSiuJcCAsmmUuABFPOmYMcC/C2RwX09SZwQrVTh0W9vHqNqla168IoWgXN65
	LtoW+XEAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keTBX-0003Ly-Gj; Mon, 16 Nov 2020 01:19:59 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keTBR-0003Kw-C0
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 01:19:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605489592; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v6KLhXj+620b0Cqk/wXyGVyIAZ1iI29OVn20Cf4L4r0=;
 b=I6T1s1DJpNFbHjxgo3Fjqz4JICGoLeKYr4QHV8cR4tc6mOhYBQCavnPG1+vcn/DCsSbIzDpk
 6iV1KtsiA2Ic6HPeknagNmE06KvYEyI3hDuaYxHRxm0QIkwGnsDvxjH4J1rUdD9xSvtTgTh+
 ZB/NDayEBd9AI9vKUKjfWR7Uobc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fb1d3b76c42d983b978b6b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 01:19:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C9C69C433ED; Mon, 16 Nov 2020 01:19:50 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13408C433C6;
 Mon, 16 Nov 2020 01:19:49 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 16 Nov 2020 09:19:49 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH RFC v1 1/1] scsi: pm: Leave runtime resume along if block
 layer PM is enabled
In-Reply-To: <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
References: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
 <1605249009-13752-2-git-send-email-cang@codeaurora.org>
 <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
Message-ID: <cd1ae6b2740a0211efe7e602691fd5e4@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_201953_437596_79769879 
X-CRM114-Status: GOOD (  21.29  )
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
sure device's gets resumed as well. Thus, the pm_runtime_set_active() 
seems
redundant. What do you think?

Thanks,

Can Guo.

> 
> Thanks,
> 
> Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
