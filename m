Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD7CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyJ15oAibILDHEzfsdwP/kvwzm5irm0bYx2msbNDhxY=; b=WBeRv2TZG79GaT
	jmFhkdKZj9gXLN8ArfmVJlezhsEE5gKDMZeg4QNzwOhQLwSK02E+XwMXvKIA+kZLdT0oxV7hQKyU5
	mZwWnvrHLqoZ7wZmiVWK8xX7u35M6qBIpXa6g/+2cOdgVV1RmoRB6UIP079Ce7VeyYFnoc+W0mm0c
	LtVLh0TM0Ajxwc2YzndZdx12/HK+uYwWKzNCiil4zomWfK0fqkx1pzw5zm2YdVDQmjXpri9fjL/NV
	ysdiLuAS7rl22pCNeDIjOVmgzuu+i/bcBriRHBvbLGBZIl4BSqObO0Y8j8yM2dSNoy2ZHWMw4lRsl
	iDdIuhcjSgyhn8iFTlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neeHm-001TIT-Ol; Wed, 13 Apr 2022 14:47:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neeHY-001TEG-G0; Wed, 13 Apr 2022 14:47:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E2C1424;
 Wed, 13 Apr 2022 07:47:41 -0700 (PDT)
Received: from [10.57.8.248] (unknown [10.57.8.248])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B88383F5A1;
 Wed, 13 Apr 2022 07:47:38 -0700 (PDT)
Message-ID: <bcbcdc45-c857-129e-814d-6f5a7b0f0259@arm.com>
Date: Wed, 13 Apr 2022 15:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND][PATCH 0/8] Introduce support for artificial Energy Model
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Pierre Gondois <Pierre.Gondois@arm.com>,
 Ionela Voinescu <ionela.voinescu@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <76230a1c-73b8-c471-c62e-3ec9b33461a6@arm.com>
 <55d4a19d-15d4-4d15-8430-8a8ed8149497@arm.com>
 <CAJZ5v0g5vcC7aS4KS-uN+fHmbrKCmA-MVbJEKOnPgEyDDfqSRw@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <CAJZ5v0g5vcC7aS4KS-uN+fHmbrKCmA-MVbJEKOnPgEyDDfqSRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_074744_627023_2CDDE171 
X-CRM114-Status: GOOD (  10.26  )
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



On 4/13/22 15:29, Rafael J. Wysocki wrote:
> Hi,
> 
> On Tue, Apr 12, 2022 at 8:53 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Rafael,
>>
>> gentle ping. If you need some help with this maintenance,
>> we can help.
> 
> Sorry for the delay.
> 
> Given the lack of objections or concerns, I've applied the whole
> series as 5.19 material.

Thank you Rafael!

> 
> Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
