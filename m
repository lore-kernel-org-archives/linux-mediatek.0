Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC32C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 03:25:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CCAB61404
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 03:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CCAB61404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=81QBA2L+42fMnUVftIcEeks2LMd5h7f7yiSjbUou1oY=; b=VbTBZ0SV+kztJ7+rf2e062Zgi
	oejWLTnWJZMBatneW3mMkgfFLZ0AMMJ4BGvqUwkVCa0b9dO5Ug+mCeWGX8q/aIODHi53gfbGDmyYa
	JMK1ExLwD4Odi/2Kbw7AgvS5s6r91CD4rxyvqyEDlKHCuNHQBZVSJVd2wMeYljV2BYL+/hAMuCQmI
	kXyRR2X2CXk15ROiJlTOowM5qP5WDhpaRpLak2FU4anaN41iPZz1rEpUXq9O+VndL/p2fxvoUx4q3
	oR3Xv2YMcqQOP0hRfka/koRmyxLkknlXFH5295rKZlG6jZHZrrZhHUGg+JK9Y0I99vtNWap4JysYj
	r+bmkNL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llNh7-00380Z-9P; Tue, 25 May 2021 03:25:25 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llM3o-002n1P-Lw
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 01:40:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621906847; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=s8u2/Kix6jXxz+HUY/6HOx+UcJEOLKMF3abFsbJQwRc=;
 b=HroFercVUUgTwUc8eKfMJ7vHtvrI9ooRY7JTHY9pdmNObEK3FbLU/C/Nw32oB9GtLYEY5Ryg
 gHfBA1IGK3RZdkYfpgoD+Rx+9Xe01f0QIrCdkdIwaCxVqWQCbCVvkzA+yLyATHdH4G1TfbLy
 EQpDWhHxBkVYwmYioD9em5LzgGc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ac5584ceebd0e932c7a780 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 01:40:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DA7E2C4338A; Tue, 25 May 2021 01:40:19 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D2500C433F1;
 Tue, 25 May 2021 01:40:18 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 May 2021 09:40:18 +0800
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
In-Reply-To: <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
Message-ID: <0cfbf580e340073ff972be493a59dbe7@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_184047_687348_6B58CA97 
X-CRM114-Status: GOOD (  20.62  )
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


On 2021-05-25 04:10, Bart Van Assche wrote:
> On 5/24/21 1:36 AM, Can Guo wrote:
>> Current UFS IRQ handler is completely wrapped by host lock, and 
>> because
>> ufshcd_send_command() is also protected by host lock, when IRQ handler
>> fires, not only the CPU running the IRQ handler cannot send new 
>> requests,
>> the rest CPUs can neither. Move the host lock wrapping the IRQ handler 
>> into
>> specific branches, i.e., ufshcd_uic_cmd_compl(), 
>> ufshcd_check_errors(),
>> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to 
>> further
>> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host 
>> lock is
>> no longer required to call __ufshcd_transfer_req_compl(). As per test, 
>> the
>> optimization can bring considerable gain to random read/write 
>> performance.
> 
> Hi Can,
> 
> Using the host lock to serialize the completion path against the
> submission path was a common practice 11 years ago, before the host 
> lock
> push-down (see also
> https://linux-scsi.vger.kernel.narkive.com/UEmGgwAc/rfc-patch-scsi-host-lock-push-down).
> Modern SCSI LLDs should not use the SCSI host lock. Please consider
> introducing one or more new synchronization objects in struct ufs_hba
> and to use these instead of the SCSI host lock. That will save multiple
> pointer dereferences in the hot path since hba->host->host_lock will
> become hba->new_spin_lock.
> 
> An additional question is whether it is necessary for v3.0 UFS devices
> to serialize the submission path against the completion path? Multiple
> high-performance SCSI LLDs support hardware with separate submission 
> and
> completion queues and hence do not need any serialization between the
> submission and the completion path. I'm asking this because it is 
> likely
> that sooner or later multiqueue support will be added in the UFS
> specification. Benefiting from multiqueue support will require to 
> rework
> locking in the UFS driver anyway.
> 

Hi Bart,

Agree with all above, and what you ask is right what we are doing in the
3rd change - get rid of host lock on dispatch and completion paths.

I agree with using dedicated spin locks for dedicated purposes in UFS 
driver,
e.g., clk gating has its own gating_lock and clk scaling has its own 
scaling_lock.
But this specific series is only for improving performance. We will take 
your
comments into consideration and address it in future.

Thanks,

Can Guo.

> Thanks,
> 
> Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
