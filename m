Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDB9C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:43:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F541207FB
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JiLZ/rQm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IamXBlpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F541207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FcIOrHGAAZG5nrlk2v4DCqnWZCsUd0ftft9gPHwy/pE=; b=JiLZ/rQmesWc10Sgyq1ybldRO
	tK/N5OzxMT+bcQznoMfmRlKnzKnqgQHBja7kYmXbf2tXZg21CBf4zoaGqlW+Zn9697ugJb8u+yy8H
	L8s5v+9uxfDrBK/rKPVWR1SwuCEZA3xcPDthPM3MqPYiIoA9qEi79vcCIFDpHjiu5S/SCxwErxvcr
	FRNaFx5v2al7OPuCF/QD8+JdxC2Cke2iLrrPa6bDACEB/SjvQjQaNHYp+Xq2kc9T33NQNj6eKgVsk
	bg3NlfdvK0FY0gXhUOepKAlAXkqxCgZjpRCOYXJqmtyR6xBiFzcSkevcNCWTKPFL1gjwQZjuvDXvh
	awZIs3j5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2dY6-0002Q3-3l; Mon, 03 Aug 2020 16:42:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2dY4-0002Pr-NV; Mon, 03 Aug 2020 16:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=l27bIWMUAjLIRYf3UQkWtSAARt3k0/aXVbBFGT9RZYw=; b=IamXBlpFIGN1CcG8pu64PzAtXh
 MkJ3Ted2XBUxLFfGV2VWmjkUFwonmZcvADwkwVkPt+6MEkTy0WzsgeGKl0QGS4ERRGfULQy/BKgKb
 xYRQSdmK/+m1N/5REHNnUw8zixEJOwdHH6zDsg1q+kkfOrPjf6WvHBavlCkaQNKRMFd8VkYxir0v1
 Om1MM8DD4zORpurdh5DtOlHpO+/6avcA9AwTsWy44HeV+g12KUin83XzvWOxw0m+HHU+pxHTnz+6s
 MkCUmz+dun81lVgbbt3MLhUA4MCYhRSJgBlzJToc5uxUn6KEVK0kLvk6lwc1/nD/EjLRNOUtOG5AO
 906bAn4w==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2dY2-0004SM-G5; Mon, 03 Aug 2020 16:42:51 +0000
Subject: Re: [PATCH] ARM64: Setup DMA32 zone size by bootargs
From: Randy Dunlap <rdunlap@infradead.org>
To: Phil Chang <phil.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org
References: <20200803142647.16737-1-phil.chang@mediatek.com>
 <91057296-7064-282f-9345-e1d84af78eb4@infradead.org>
Message-ID: <50008dcf-61dd-ee1f-4f81-240c52650f95@infradead.org>
Date: Mon, 3 Aug 2020 09:42:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <91057296-7064-282f-9345-e1d84af78eb4@infradead.org>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alix Wu <alix.wu@mediatek.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, Steve Capper <steve.capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, YJ Chiang <yj.chiang@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/3/20 9:39 AM, Randy Dunlap wrote:
> On 8/3/20 7:26 AM, Phil Chang wrote:
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index fb95fad81c79..441ad3cb8ee8 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -956,6 +956,9 @@
>>  			The filter can be disabled or changed to another
>>  			driver later using sysfs.
>>  
>> +	dma32_zone=nn	[KMG] [KNL,BOOT]
>> +			Forces the DMA32 zone size of <nn> in mb, arm64 only.
> 
> Preferred:
> 
>> +	dma32_zone=nn	[KMG] [KNL,BOOT,ARM64]

Oh, I doubt that the "[KMG]" should be there at all.

>> +			Forces the DMA32 zone size of <nn> in MB.
> 
>> +
>>  	driver_async_probe=  [KNL]
>>  			List of driver names to be probed asynchronously.
>>  			Format: <driver_name1>,<driver_name2>...
> 
> thanks.
> 


-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
