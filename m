Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A04C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97iVnfMSVX/inGOLw9vPW0sO0mNV+AhKmUNLFH//JJE=; b=DdlqEixB94vCh5IdiT4oFJYvkT
	LjFu9BIIuhXbCeDlFgkw2rWFrlxKtD6U0iWk7Te5yPWsFBwQNuerNPd/MoNiqmGy+yno6Azdw51S9
	sGaqSe4dgeYo/b5jj4EuVJGissrbpbKjAxDsPm0v81jEqCoua6Hf4I753baLncUuy6280vCbZ3LKG
	UMDRLkWz0Ko87j4rzvfpGdd3b95I293ckY0XC2tBqD/Tae14zvZp5cEHvbv+HUWE/0wfCe2FtPQ4t
	zYmTMY4G2LjaaZ93lNxWsFlx4GAF86YRNlg1TaK4l9014vD7cEziTaj5dy0YF+Ibhom6Q1aoVK6VO
	LvRYTR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQFi-009AlM-5W; Tue, 25 Jan 2022 18:09:10 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCQFf-009AkH-Dk
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 18:09:09 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.67.121])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 0CE441C0063;
 Tue, 25 Jan 2022 18:09:04 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 A83864C0096; Tue, 25 Jan 2022 18:09:01 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id B057713C2B0;
 Tue, 25 Jan 2022 10:09:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B057713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1643134141;
 bh=otoWo9j8xyBa09sRi2gr02yQo5F4EfMnx4l/bFAHyXM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fZIoQfo2714iVzfBd+ymI0HlF9mYQ8k/IgndPA1vfUMHQ1w1bil5aFzsn4XuOF92g
 Zj4kZ0LEKJVlTtoYhgDfAEQIyzEKWKQqCVLFWWd9P02EMQ8ydu/c7Dr2MNfpKiKCZI
 aTjqhpOZu+fqmY/40S+08V4hu1BrJ76YLK6CBPxM=
Subject: Re: [PATCH] mt76: mt7921e: fix possible probe failure after reboot
To: Mike Lothian <mike@fireburn.co.uk>, khalid@gonehiking.org
Cc: Deren.Wu@mediatek.com, Eddie.Chen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Eric.Liang@mediatek.com, Leon.Yen@mediatek.com,
 Mark-YW.Chen@mediatek.com, Soul.Huang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, YN.Chen@mediatek.com,
 abhishekpandit@google.com, ch.yeh@mediatek.com, frankgor@google.com,
 jemele@google.com, jenhao.yang@mediatek.com, jsiuda@google.com,
 km.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
 posh.sun@mediatek.com, robin.chiu@mediatek.com, sean.wang@mediatek.com,
 shawnku@google.com, steve.lee@mediatek.com, ted.huang@mediatek.com
References: <d291f592-d84a-2ffe-7f75-df77890efce8@gonehiking.org>
 <20220120095622.1938-1-mike@fireburn.co.uk>
 <CAHbf0-HLCcgZfbKdWQ-kX+QbRGJsEHCEDnG=NZ5QF71aTeDMGg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <9d692dc9-4b24-44b0-cbe0-dfc33f3d5f03@candelatech.com>
Date: Tue, 25 Jan 2022 10:09:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHbf0-HLCcgZfbKdWQ-kX+QbRGJsEHCEDnG=NZ5QF71aTeDMGg@mail.gmail.com>
Content-Language: en-US
X-MDID: 1643134144-oz9bPHkJQZpX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_100907_555497_2944A5B5 
X-CRM114-Status: GOOD (  18.54  )
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

On 1/25/22 6:16 AM, Mike Lothian wrote:
> On Thu, 20 Jan 2022 at 09:56, Mike Lothian <mike@fireburn.co.uk> wrote:
>>
>> Hi
>>
>> I get a BUG and the kernel resuses to boot with this patch when mt76 is compiled into the kernel
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=214557
>>
>> I don't see this issue when mt76 is compiled as a module
>>
>> My .config is at https://github.com/FireBurn/KernelStuff/blob/master/dot_config_tip
>>
>> Let me know if you'd like any more info
>>
>> Cheers
>>
>> Mike
> 
> The bug I was hitting was due to a different change introduced in rc1,
> with that reverted your patches work great

What patch did you revert?

Thanks,
Ben

> 
> Though I am seeing lots of these messages from the bluetooth device:
> 
> Bluetooth: hci0: unexpected event 0xff length: 5 > 0
> 
> I'll bisect that next
> 
> Thanks
> 
> Mike
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
