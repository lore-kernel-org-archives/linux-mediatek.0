Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677F1C47082
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 01:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F7A613E9
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 01:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F7A613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8VFZeVMwVBe5cfgU4mP7w//oFlWDXh4jg9BsNV8nNg=; b=FYuyq3Btaq5Y/5X80M3nFgkZgU
	QnFal5I5wKpm4VHmemqjRfXFY4/9/iX+ljj/ifN1TzZWWdQj4r7/eDs8Ttm2AFnhIN4VToA/2xHBX
	3MKO+x31sy1CtoqXujZc3pcYFWoZffUrmFJDiecHOiN5TAyPBJTKf6TtSmsl0KYrsGuqpzi3bID9H
	BRTQa5TYLygUfjzqmBvXsdASZOusD8VbQgTXT6vLzi31DJOBvY0qHy7cne+modr6v2W0CVpFCYmrF
	/oH4A8bCBFkR9Pz3mPnppcETCE3phwpCA/E7WxFpaTKQqtyLkN1L6f4UP3H0uRPj8z+M6LGFtt1zl
	xsKz42/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loyy3-00BBtj-QA; Fri, 04 Jun 2021 01:49:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loyy0-00BBsv-7A
 for linux-mediatek@lists.infradead.org; Fri, 04 Jun 2021 01:49:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622771385; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=a5B8Kb7pLfzcL8SCLP3yBfwhEg8TvVlZ4RwgFTeIKWU=;
 b=NDh7lwlLjuK/xZxCu4Icdy/gZntvKODpSIanQvOqCUzpWClyu8ulQeRE6Cspg37HTkbZQJkT
 Zj2zxQjTBu37hmic2fJR9srMUjsqd2XP/ggFaiR0GxdNDlSRmWMtY9+MX+JQv2HX04pyi4pl
 P0JzsEN6HG0q23mzccgPm++xCSY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60b986aced59bf69cc4c7079 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 01:49:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F1EADC4338A; Fri,  4 Jun 2021 01:49:31 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2E7BC433F1;
 Fri,  4 Jun 2021 01:49:28 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 04 Jun 2021 09:49:28 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bean Huo <beanhuo@micron.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Adrian
 Hunter <adrian.hunter@intel.com>, Kiwoong Kim <kwmad.kim@samsung.com>, Satya
 Tangirala <satyat@google.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
In-Reply-To: <1622688865.7096.6.camel@mtkswgap22>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <1622688865.7096.6.camel@mtkswgap22>
Message-ID: <b8c838a2213184b4f8c2f482f9a9ab08@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_184946_038572_1527C940 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Stanley,

On 2021-06-03 10:54, Stanley Chu wrote:
> Hi Can,
> 
> On Mon, 2021-05-24 at 01:36 -0700, Can Guo wrote:
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
>> 
>> Cc: Stanley Chu <stanley.chu@mediatek.com>
>> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
> 
> According to my test, the performance indeed has impressive improvement
> with this series!
> 

Thanks a lot for your time and review. :)

Regards,
Can Guo.

> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> 
> 
> 
> 
>>  #endif
>> 
>>  	bool req_abort_skip;
>> -	bool in_use;
>>  };
>> 
>>  /**

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
