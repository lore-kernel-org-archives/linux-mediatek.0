Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25704C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owopXekPvARrf9JVyZ6sTUdmV+v1Ra5hBGttdVAHBg8=; b=uLYPUfFhqLXzo+HMM5/ItO3gCz
	j4Iqe30FpoGbZox1vuxMhQiEGdMYEF3NRgy5KjN+J2M/BeSlRv6LYoOT3pCLB2dQ0TUrrnt/1VlCb
	CvpgY3+QkiiZYP2h4ivwWuogYc95IG6Tnr86riD9t3Yw1Rc7F4J8KkCkal0yKXOrXAIEzX15oUzmB
	rEMTGCfqT8D1oej8DX+LxdA/W5+QwIGPY4bYToIHOPpL/F7UP+jCpm6GkRDx2Qi85TS4zpiJij414
	w6HFA4RqN4otvU3UG46j4/2+3x2qNqGz79DyD9s+zWqFf1g2xvqPS6nba/qKR6CzQhl9xXRqkgLBE
	Bp4DGmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucTX-009Ffd-GW; Tue, 07 Dec 2021 15:33:51 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucTD-009FZE-9M
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 15:33:32 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.164])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 400802A0070;
 Tue,  7 Dec 2021 15:33:28 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 77ACBB0008C; Tue,  7 Dec 2021 15:33:27 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.71.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 3DBB613C2B0;
 Tue,  7 Dec 2021 07:33:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 3DBB613C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1638891207;
 bh=YDQa2OJN7nV9hEolGlq1UYeF9tA7KtmMdZ/FpojLsso=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CYezbsUXYJ8FRrxakOwxE6mXVfrJCD6uAM+zX0IyVKa7VPs9W0yZ1vOpuzqrrQMgk
 uXxiFxxGtbKzI4kGjb8sO8EwycsnzcZfjC/wziH4ff2SsAMU3hrRr0BdMNmf6mk+QF
 WjkEc0FisZll4lEhGLjeOwAb5ZE1AcEbOZoTRBEM=
Subject: Re: [PATCH] mt76: mt7915: add mu-mimo and ofdma debugfs knobs
To: meichia chiu <meichia.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Money Wang <Money.Wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20211206141006.29632-1-MeiChia.Chiu@mediatek.com>
 <7158a937-57f3-2bd8-591e-124a18d2d8e8@candelatech.com>
 <72ca4f5fe3c351ec56dee4935b28c7b7f26188c2.camel@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <e4a8301c-53a1-9ca0-7e1d-fd235a22ccd6@candelatech.com>
Date: Tue, 7 Dec 2021 07:33:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <72ca4f5fe3c351ec56dee4935b28c7b7f26188c2.camel@mediatek.com>
Content-Language: en-MW
X-MDID: 1638891208-clVzOPXvi6wc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_073331_459975_2B3FEAA5 
X-CRM114-Status: GOOD (  22.29  )
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

On 12/6/21 11:25 PM, meichia chiu wrote:
> On Mon, 2021-12-06 at 08:43 -0800, Ben Greear wrote:
>> On 12/6/21 6:10 AM, MeiChia Chiu wrote:
>>> From: MeiChia Chiu <meichia.chiu@mediatek.com>
>>>
>>> Add mu-mimo and ofdma packet counters statistics.
>>
>> Hello,
>>
>> Are these stats clear-on-read in the firmware?  If so, then we need
>> to accumulate
>> them in the driver.
>>
>> Is there any significant downside to enabling the stats?  For
>> instance, a performance
>> degradation in the firmware/hardware?
>>
>> Thanks,
>> Ben
> 
> Hi Ben,
> 
> Yes, the current design is clear-on-read and its sole purpose is for
> debugging only. If you need statistics, this may have to be done in
> another way.

So we could poll these stats in the other logic that polls firmware stats and accumulate
them in the driver and display with debugfs and/or ethtool.  If you don't want
to do the accumulation, and lease add a comment to your patch about the
values being clear-on-read and someone else can add the accumulation logic
later.

> Yes, a performance degradation is expected since enabling this debug
> function would burden MCU with more calculation.

Have you done any testing to verify this?  If it is just bumping a few
counters, it may not matter.  But I don't know how the firmware is actually
implementing this, so maybe it is a lot more expensive than expected?

Thanks,
Ben

> 
> Thanks,
> Meichia
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
