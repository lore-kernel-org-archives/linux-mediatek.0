Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B845C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 23:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4810218AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 23:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cBuJqy6G";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="FHHYBsNl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4810218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocvtGqakPQGtMR9/D9o/zWf81rlQsFqIXWKbGyr1PI4=; b=cBuJqy6GKvmYu1dBtD2QWfmRa
	djSOsXNdEwJgu9ac6e8yKZdXcc1LySwzlsyR+t87Dffvuj+pA7hm1Mp7rNBT3FK0aSwoUpcz1H2xL
	vR+HBqVVyZ61eYVhdG7JCSgL/0GDtOXOLNYu+l8TNnZYDHC8dGDdFF4K0KrkTrvukddmrYJHPfDPi
	6e+ZKFYrpYPf4GJGeySWMuhAfVHGUW2Mhz/Zlcrg9Qccg8kIGoj6HgGJqZ0tTXN1byll2TXTh5TBO
	Tem56cxCHwsAf0JfkBmUx5a5Cmtx/lxLy3NqhYW7VFg1DPwH5en463k+EeWcQuzUYFDpozAbLV5NW
	Q9MsWTS6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihiss-0007ub-GW; Wed, 18 Dec 2019 23:37:38 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihisp-0007kM-JK
 for linux-mediatek@lists.infradead.org; Wed, 18 Dec 2019 23:37:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576712254; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aOyF/9vjrq0zND57ZRP80ePOcz7ZOQqlqlcaCLPEKJg=;
 b=FHHYBsNl6KiAbD48i5Ym8puVZsO4vUVXS65okw4lPTIcgk0CnA68/SBB2nhDQUD9bSpUmp7z
 KP/Lshn39Wrq7GQRYsf3y8/m8tUOhyku2FzB1A9Aktjy46WzKmw4uWUcoSHneWRfKVsItOiW
 i6162NrlKfuikBJWwuYzfkU0fA8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfab839.7f5e987217d8-smtp-out-n01;
 Wed, 18 Dec 2019 23:37:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CFD12C43383; Wed, 18 Dec 2019 23:37:29 +0000 (UTC)
Received: from [10.46.161.159] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 016A9C4479C;
 Wed, 18 Dec 2019 23:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 016A9C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 2/2] scsi: ufs: disable interrupt during clock-gating
To: Stanley Chu <stanley.chu@mediatek.com>
References: <1575721321-8071-1-git-send-email-stanley.chu@mediatek.com>
 <1575721321-8071-3-git-send-email-stanley.chu@mediatek.com>
 <a36d111e-ef7f-9f9b-6f6a-692a9980103a@codeaurora.org>
 <1576641171.13056.16.camel@mtkswgap22>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <7756630e-adf2-47e9-4815-ba2306a9dd16@codeaurora.org>
Date: Wed, 18 Dec 2019 15:37:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576641171.13056.16.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_153735_715709_E0ED904A 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, pedrom.sousa@synopsys.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/17/2019 7:52 PM, Stanley Chu wrote:
> Hi Asutosh,
> 
> On Tue, 2019-12-17 at 15:25 -0800, Asutosh Das (asd) wrote:
>>>
>>
>> Hi,
>> Does this save significant power? I see that gate/ungate of clocks
>> happen far too frequently than suspend/resume.
>>
>> Have you considered how much latency this would add to the
>> gating/ungating path?
>>
>> -asd
>>
> 
> Yes, we have measured 200 times clk-gating/clk-ungating and latency data
> is showed as below,
> 
> For clk-gating with interrupt disabling toggled,
> 
> 	Average latency of each clk-gating: 55.117 us
> 	Average latency of irq-disabling during clk-gating: 4.2 us
> 
> For clk-ungating with interrupt enabling toggled,
> 	Average latency of each clk-ungating: 118.324 us
> 	Average latency of irq-enabling during clk-ungating: 2.9 us
> 
> The evaluation here is based on below Can's patch therefore the
> interrupt control (enable_irq/disable_irq) latency is much shorter than
> before (request_irq/free_irq).
> 
> scsi: ufs: Do not free irq in suspend
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/scsi/ufs/ufshcd.c?id=8709c1f68536e256668812788af5b2bb027f49c3
> 
> BTW, the main purpose of this patch is aimed to protect ufshcd register
> from accessing while host clocks are disabled to fix potential system
> hang issue. The possible scenario is mentioned in commit message of
> patch "scsi: ufs: disable irq before disabling clocks" in the same
> series.
> 
> Thanks
> Stanley
> 

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

Thanks for the data.
It'd be interesting to know more on the - misrouted interrupt recovery 
feature though.

-
Thanks
Asutosh

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
