Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D1C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGcCMGrEVXy8lJTChtmVRb2kUyHMfvDn+wJ101ODj+E=; b=gP02rnmUg81tlOgAIrcok5kqka
	Okrtsr0FdlOwyyxdQts1DcuW0wPNdHle9CWiq02xqKNCbSSybRRc8b+9sxujMvHA+yDEsdfDeVwzw
	JMdirpGNH2/tHLUt0EXoAx/FuPPDiALed2ICU2qlq+4ttcGXnMR/24y6e32sjfMihRGLR2GDpSFDm
	O1dUnI/rVq/M6ja8I95Ok6za70ugCvUZFN6VObNUJLySr/vgtfrHqij1R83lhKTYk1sRMzCKlwP/S
	Y2JV6UmaPgGJln82/dxBroT5JFGDHBDcpqWApawZATjT51UkmuWwdYlOQZPBWkW0Gb+vfBkAYoUrD
	owU9OUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UWc-00Asca-8Y; Wed, 29 Jun 2022 10:02:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UUl-00Arr0-3F; Wed, 29 Jun 2022 10:00:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27DB9152B;
	Wed, 29 Jun 2022 03:00:26 -0700 (PDT)
Received: from [10.57.9.39] (unknown [10.57.9.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1A43F792;
	Wed, 29 Jun 2022 03:00:23 -0700 (PDT)
Message-ID: <1072cb84-4097-0cbd-f980-a864ea851b0c@arm.com>
Date: Wed, 29 Jun 2022 11:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com,
 sboyd@kernel.org, sudeep.holla@arm.com, cristian.marussi@arm.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
 <20220629095302.bi3xx6yicsnjeff7@vireshk-i7>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220629095302.bi3xx6yicsnjeff7@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_030027_261014_0999BBD8 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Viresh,

On 6/29/22 10:53, Viresh Kumar wrote:
> On 29-06-22, 10:49, Lukasz Luba wrote:
>> I would like to move forward with the micro-Watts in
>> the Energy Model. We have feedback from our partners
>> that this is a limitation. Also, as you can see
>> this uW is part of the new SCMI spec, which we
>> have support on our roadmap.
> 
> Should I pick them and merge via PM tree ?
> 

Thanks for fast response. It would be great.

I have 2 ACKs from Sudeep for the SCMI part,
but I don't know the status e.g. of DTPM
current work which is using the EM milli-Watts
and does conversion to uW internally.
I hope, I won't make issues to Daniel's work with this
change.

