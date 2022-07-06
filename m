Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C972FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QukefwJaKKo44e1d14LzmbgMnsgci/AmGnuZWRiBhKw=; b=fj63ohNGjXslAr6OrsYBK6ZUrN
	EtIS+SUNhIxVqN6hCvshwf8evTdAwsc5/opi5cyDt8nP+g3K3CUpk9Mn/cXF8ZbuzKwPxhisSc2L8
	N7bjD+08V56KN/h727oloou5qVL1X9NSlfHQNKK2d2tvJCH8N6R6FnjhHM9i8eqH/tLGsPUOaYC2u
	IsNYvLANrJcjywG4C3twxdnC6R3uiorYDngVpz0aJK4gX0qcEDunHp6s5NRgI/iyzVC4n/pkMLN1q
	p1O5i+e6pDjsximtWoSs26kHGIfO4e5II0ycn6aju1j0AnSoJBCvVYEuxUDGZf5Oim5GzkFHg0hbT
	THtwjvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o910v-007dqP-UJ; Wed, 06 Jul 2022 09:08:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90zT-007cuY-OK; Wed, 06 Jul 2022 09:06:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A0FE15A1;
	Wed,  6 Jul 2022 02:06:35 -0700 (PDT)
Received: from [10.57.9.19] (unknown [10.57.9.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EFA43F66F;
	Wed,  6 Jul 2022 02:06:31 -0700 (PDT)
Message-ID: <51b98350-0278-8e5d-90f9-3996e378a4a9@arm.com>
Date: Wed, 6 Jul 2022 10:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] Documentation: EM: Switch to micro-Watts scale
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: amitk@kernel.org, rui.zhang@intel.com, viresh.kumar@linaro.org,
 rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <20220622145802.13032-3-lukasz.luba@arm.com>
 <be1e6e75-45e0-2c73-bace-4499b7b1af68@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <be1e6e75-45e0-2c73-bace-4499b7b1af68@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_020635_885945_5E4E7990 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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



On 7/5/22 10:10, Daniel Lezcano wrote:
> On 22/06/2022 16:58, Lukasz Luba wrote:
>> The EM now uses the micro-Watts scale for the power values. Update
>> related documentation to reflect that fact.
>>
>> Fix also a problematic sentence in the doc "to:" which triggers test
>> scripts complaining about wrong email address.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 

Thanks for the reviews!

