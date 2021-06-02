Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8408C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 02:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C94160200
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 02:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C94160200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv4KhRDAFveDA+0MdQAbhKjYEBGzb+IHtSrhWgmcg+w=; b=u/ufdqaAu1Jq3HXrvsu5IihZTy
	ULwNV9ge1+7knflbDcXoGAmP37j71HxBeAnSixD5cNxe8aeMqnrfemaMtdqLuy5P+wHZV5xQZTzIq
	HEPD5mhL2EBfLWbEXuC8vmidx0pSRxWvZF/Wj/PVWr6mIqS8LaQNsFDyO4lwdx3Zmr5g8uhftyVHq
	Xwla7bCZt7yF4MYo5IEIPN0kIlUa3xHyPpRJLrfild29WzUXd7r4EiziJNKo+MlnON73u4Ub7Q7+K
	RqVm39DjcY3RPKsTGIwfqoz/zs6jRr2GDHT9rDcrPIQmBo1evY9RQb5viLG1JLf8acpl0SD92lgST
	kwueT+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loGPG-001ag2-Qc; Wed, 02 Jun 2021 02:14:54 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loGPD-001aev-My
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 02:14:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622600092; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iOQwgqabrc1MbfT07CPHtQODLtRaNjncaWi9mJJSGlQ=;
 b=URCfpVGJI87WjSBCAX7UDefzxgz74TsCzA3SNlZdu+VVwS6izFU2P2+6vZwwzHRSdq8HIBy3
 /9rf3WhTzcwDwV2FqdGtY0VtVUbmARu8pncsfcL4vZwM5dFq99rIYOjW6eIDc9KzebPpfQNr
 ur8IVtNOHGezjmj9Qe7xcY7h/Ok=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60b6e992e27c0cc77ffc365b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 02:14:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6AC1AC4323A; Wed,  2 Jun 2021 02:14:41 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61B2DC433F1;
 Wed,  2 Jun 2021 02:14:39 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 02 Jun 2021 10:14:39 +0800
From: Can Guo <cang@codeaurora.org>
To: Bean Huo <huobean@gmail.com>
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
In-Reply-To: <6d6d296a84f1e62f65fda4d172a85bb35d9a3684.camel@gmail.com>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <6d6d296a84f1e62f65fda4d172a85bb35d9a3684.camel@gmail.com>
Message-ID: <adc85803e27226bc8d24c53061e39214@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_191452_271791_B7DDCFDA 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Bean,

On 2021-06-01 00:04, Bean Huo wrote:
> On Mon, 2021-05-24 at 01:36 -0700, Can Guo wrote:
>> Current UFS IRQ handler is completely wrapped by host lock, and
>> because
>> 
>> ufshcd_send_command() is also protected by host lock, when IRQ
>> handler
>> 
>> fires, not only the CPU running the IRQ handler cannot send new
>> requests,
>> 
>> the rest CPUs can neither. Move the host lock wrapping the IRQ
>> handler into
>> 
>> specific branches, i.e., ufshcd_uic_cmd_compl(),
>> ufshcd_check_errors(),
>> 
>> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to
>> further
>> 
>> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host
>> lock is
>> 
>> no longer required to call __ufshcd_transfer_req_compl(). As per
>> test, the
>> 
>> optimization can bring considerable gain to random read/write
>> performance.
>> 
>> 
>> 
>> Cc: Stanley Chu <stanley.chu@mediatek.com>
>> 
>> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
>> 
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
> 
> Can,
> The patch looks good to me.
> I did a UFS queue limitation test before, observed that once the queue
> is full, then the active task number in the queue will get down. For
> the Nvme, the scenario is the same. You can refer to the slide 23, and
> slide 24 in the pdf:
> https://elinux.org/images/6/6c/Linux_Storage_System_Bottleneck_Exploration_V0.3.pdf
> I don't know if your patch can fix this
> issue.

I've studied these slides made by you many times, it is really good.
I will do some study later on this. Thanks for the slides.

> 
> Unfortunately, I cannot verify UTRLCNR usage flow since my platform is
> v2.1. But at least my test can prove that the patch doesn't impact the
> legacy(UFSHCI is less than v3.0) doorbell usage flow.
> 

Thanks for your time :).

Regards,
Can Guo.

> Reviewed-by: Bean Huo <beanhuo@micron.com>
> 
> 
> Bean

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
