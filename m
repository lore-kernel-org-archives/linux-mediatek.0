Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A08C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5AS4k/g441R4tN3HdL+2kl70ngIw1y/m7bqivulJZc=; b=Djbqd93/B/yZ4fTHm0ffuetf5e
	57/KiU6uHDOwuQrl0Cl0YevAtSi8aU7o4AyU4aYyg7DktZqUYgedTDWcG5d4gj13I+rXZxeo8NuI0
	kmP3CuwdbcROQoaZZR3s9tvM4ETl8BOrlpBtj4jFgEGukN/LfakUDWOiTd80DOuILYdnTQ9yxLlUH
	mB6eAZfN9RrtucJ7jUOOzWkRPw+JOFtvy+vy1mko8mYf42uEEJPnXWm9jd7z7NjIudcoFS0K0ujmH
	oB7Fg/LEa4wJpcs6L5aHG/z8l/RB3FGOvMn/zJ7LBdwFD03hJQly+rQQSFTx1Eis0KsX5Xeec5Gmw
	pZ/BGxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUEc-007qDB-Q7; Tue, 08 Nov 2022 19:26:10 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUEa-007qCr-LQ
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 19:26:10 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.67.118])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 900AB1A008D;
	Tue,  8 Nov 2022 19:26:05 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id D93CB1C009A;
	Tue,  8 Nov 2022 19:25:59 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id EA6B913C2B0;
	Tue,  8 Nov 2022 11:25:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com EA6B913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1667935556;
	bh=IjdlIGM9PIIW1ik8V2pflGhZ/bQmruE9ZsCo9DfeLcc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=R+VuN5i2Ht/77zf5OxspSyW2o4q2lmHsqMjaoImXJvbOUzWLdo9yi5U9OtDAUsFOQ
	 xCdL9GQJ5v6QiMaA3H/7+8xqj3oXojfd5g9AoiGkpaSGcdqFv/O27VoUON710g5rqq
	 eV3FomPPaZFTpspvm4MvUXDdZ7H4B/zN8DhjYsDU=
Subject: Re: [PATCH 4/4] wifi: mt76: mt7915: enable coredump support
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 linux-wireless@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek@lists.infradead.org
References: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667929344.git.ryder.lee@mediatek.com>
 <b26b285a001be954967ec77a1772a8b51faee21a.1667929344.git.ryder.lee@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <f46cf0a9-c94f-aec4-1513-4b463107bbf1@candelatech.com>
Date: Tue, 8 Nov 2022 11:25:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b26b285a001be954967ec77a1772a8b51faee21a.1667929344.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MDID: 1667935566-osZEZ1SIQuvT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_112608_773290_4E28E3E2 
X-CRM114-Status: GOOD (  15.31  )
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

On 11/8/22 11:02 AM, Ryder Lee wrote:
> Host triggered and catastrophic event triggered firmware core dumping
> for basic firmware issues triage, including state reporting, task/irq
> info, function calltrace and MCU memory dump.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7915/Kconfig |   1 +
>   .../wireless/mediatek/mt76/mt7915/Makefile    |   3 +-
>   .../wireless/mediatek/mt76/mt7915/coredump.c  | 409 ++++++++++++++++++
>   .../wireless/mediatek/mt76/mt7915/coredump.h  | 136 ++++++
>   .../wireless/mediatek/mt76/mt7915/debugfs.c   |   4 -
>   .../net/wireless/mediatek/mt76/mt7915/init.c  |  12 +-
>   .../net/wireless/mediatek/mt76/mt7915/mac.c   |  72 ++-
>   .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  59 ++-
>   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  22 +
>   .../net/wireless/mediatek/mt76/mt7915/regs.h  |  34 +-
>   10 files changed, 740 insertions(+), 12 deletions(-)
>   create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
>   create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/coredump.h

Please add a pr_err() or similar somewhere so that it is easier to see that
firmware crashed while looking at dmesg/etc.

And maybe suggestion of where to send the dump so that someone can get some
useful data out of it.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


