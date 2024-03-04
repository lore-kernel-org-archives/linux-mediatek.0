Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0626C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JX7ZKi/6MJ4lmkInr2HHAhXyQw8x5P6kwEOH5I0lD08=; b=tJzigi3PTUIA4Hd+ytH9BY+qAT
	zxuQWh+aze89ocb8EBYVppjDd9fFLQNMfER3DePz45pZUf4PYcy+bu1mI913ROPQAKrBHr69Y7SBL
	VV95uX1YApsbuxSXf+FnxIAhxT3ccWIqlKo/seDzd1Flzj9Uj2zeWJMjm1OvZdKb5+fw7Q1S8vN3O
	lijXIIpAJf0/382y4H/ReX3ttnOlzrYDHAmpJm/1aU6G6fIne4wQloWO/FitvySgX1NLSWBWY8sN7
	Cjj57rsnw1cuUd4G3sNFW4xxZHO4kJbowlgtD6Eg9HYOUYON6EJmhg6EZ2oHR0sq7wsvcAAecat5c
	EuiZT6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhCp5-0000000A93W-2WK8;
	Mon, 04 Mar 2024 18:13:59 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhCos-0000000A8yp-12wB
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Mar 2024 18:13:58 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 2565024007C;
	Mon,  4 Mar 2024 18:13:41 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 7A61913C2B0;
	Mon,  4 Mar 2024 10:13:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 7A61913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1709576020;
	bh=qrgos5/aIo//urXWtz27jcMyt/Szanc/OFJXp0pKaGY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=c2vRzQa5Wo1Z8auq4OJPZBwgfdFqmQZVx2shzhwrexZV05R8jH+XKsd75673965su
	 IgpSu41s5Q+FSkAgWnOYDmgPyuD0khyJfuw9O30NnBlVEiXzyNQK+solw/JgPsyUhY
	 b7FT/tFmax39YBV28xXbJhYAW/tXqfu0dxYTUzCY=
Message-ID: <dbf615af-4392-fa74-7b79-9fc7203eb1df@candelatech.com>
Date: Mon, 4 Mar 2024 10:13:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: ***Spam*** [PATCH 2/8] wifi: mt76: mt7996: add txpower setting
 support
Content-Language: en-US
From: Ben Greear <greearb@candelatech.com>
To: shayne.chen@mediatek.com, "nbd@nbd.name" <nbd@nbd.name>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 =?UTF-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>, Ryder Lee
 <Ryder.Lee@mediatek.com>, =?UTF-8?B?U3RhbmxleVlQIFdhbmcgKOeOi+S+kemCpik=?=
 <StanleyYP.Wang@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
 <20231102100302.22160-2-shayne.chen@mediatek.com>
 <bbf8fe7e-1098-5b33-8ed6-dee38329edf6@candelatech.com>
 <8c5fbe88bcc5b55e6d80247144e4f890fd68ef27.camel@mediatek.com>
 <487ef0bb-5930-e998-7daa-6f57d09d682c@candelatech.com>
 <64286e79-4612-9601-138d-e08aa8217857@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <64286e79-4612-9601-138d-e08aa8217857@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1709576022-BYbFFFXnHqWo
X-MDID-O: us5;ut7;1709576022;BYbFFFXnHqWo;<greearb@candelatech.com>;0a87ce8853dfc5be48bfe846d29ed5d9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101347_254048_7A08F629 
X-CRM114-Status: GOOD (  13.90  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/1/24 12:12, Ben Greear wrote:
> On 12/7/23 13:01, Ben Greear wrote:
>> On 12/7/23 09:15, shayne.chen@mediatek.com wrote:
>>> On Fri, 2023-12-01 at 15:40 -0800, Ben Greear wrote:
>>>>
>>>> External email : Please do not click links or open attachments until
>>>> you have verified the sender or the content.
>>>>   On 11/2/23 03:02, Shayne Chen wrote:
>>>>> Add support for setting txpower from upper layer and configuring
>>>> per-rate
>>>>> txpower limit table.
>>>>
>>>> Hello Shayne,
>>>
>>> Hi Ben,
>>>>
>>>>   From what I can tell, this patch causes STA vdevs to no longer send
>>>> probe
>>>> requests when trying to associate.  I bisected to this in Felix's
>>>> tree that holds
>>>> this patch.
>>>>
>>>> Tested on x86-64, mtk7996 radio.  Specifically
>>>> debugged on 2.4Ghz radio, but I think it affects 5Ghz too.
>>>>
>>> I have done some tests but didn't face this issue. Could you also use
>>> the newer firmware to test if it still happens?
> 
> Hello Shayne,
> 
> I rebased on 6.8, and started adding some debugging around this issue.

I received a patch from Chad that fixes this problem, the cmd size was wrong for one
reason or another.

Thanks,
Ben



