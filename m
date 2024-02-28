Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C5C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 06:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlFX39e4Le6PT/fbfEe1U4Pxl4yfCvn/ID1DA6HRvSk=; b=A2bVhtUAzUrWDVO2KVu3LrNKkw
	2RAlmJvLCARLNzYIStDMj9/ScHfrYibPTjtUdrNxY5PRRF6p2bdSLemc2gheahWg1kPyuRfzosdDk
	bwjCtOXiGnK2EsDvy4Ef2RhTHKwgROLzVKqAzDgjDN0+CTZhszok1GXS1JzOu5jVeQC95xu9uqiqq
	1rOVWux4oIWsZSE4Pz9wAAMXy/+tcXgkm8IRgM8qQf7ehm0XH7FsvBFhjbnTuLm/DhdScFimvS0/m
	Wt/AzdxOu6oSi3dlVocfeDrb0Z5qv+B+/goI0TT+3bI+LRbY64N0M4EOhWCCb4Np4B7kVm6XRbsx4
	QKanW64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfD3j-000000088gC-0tRK;
	Wed, 28 Feb 2024 06:04:51 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfD3g-000000088f7-2kWT;
	Wed, 28 Feb 2024 06:04:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41S64T3S055457;
	Wed, 28 Feb 2024 00:04:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709100269;
	bh=dlFX39e4Le6PT/fbfEe1U4Pxl4yfCvn/ID1DA6HRvSk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GtWFzRk9RjdIo1EqAe+uxMjXXCgkL8SCURhE2rKK+g1fRXleQnQYwFIpfgvGQjBC7
	 E4YStneUeimUG2Z806Dq+VReRykRKQ2bCMOQyMvRzo9F9uQJnNVkunBWGjLSjWhSqf
	 XfxroEYiojgz8po2EUSuERBof8qZdyF5Fy3xBOVE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41S64Taw097518
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Feb 2024 00:04:29 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 00:04:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 00:04:28 -0600
Received: from [172.24.227.68] (dhruva.dhcp.ti.com [172.24.227.68])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41S64O8F115774;
	Wed, 28 Feb 2024 00:04:25 -0600
Message-ID: <1390e743-2216-4435-b2ef-7d92a55605b1@ti.com>
Date: Wed, 28 Feb 2024 11:34:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PM: wakeirq: fix wake irq warning in system suspend stage
To: Qingliang Li <qingliang.li@mediatek.com>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown
	<len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Johan Hovold
	<johan+linaro@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Dhruva Gole
	<d-gole@ti.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20240228020040.25815-1-qingliang.li@mediatek.com>
Content-Language: en-US
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20240228020040.25815-1-qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_220448_817965_24AED869 
X-CRM114-Status: GOOD (  19.88  )
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

Hi,

On 28/02/24 07:30, Qingliang Li wrote:
> When driver registers the wake irq with reverse enable ordering,
> the wake irq will be re-enabled when entering system suspend, triggering
> an 'Unbalanced enable for IRQ xxx' warning. The wake irq will be
> enabled in both dev_pm_enable_wake_irq_complete() and dev_pm_arm_wake_irq()
> 
> To fix this issue, complete the setting of WAKE_IRQ_DEDICATED_ENABLED flag
> in dev_pm_enable_wake_irq_complete() to avoid redundant irq enablement.


Just trying to understand, why not in dev_pm_arm_wake_irq ?
Is it cuz it's called much after dev_pm_enable_wake_irq_complete ?
Not sure what's the exact call order, but I am assuming
dev_pm_enable_wake_irq_complete is more of a runtime thing and
dev_pm_arm_wake_irq happens finally at system suspend?

> 
> Fixes: 8527beb12087 ("PM: sleep: wakeirq: fix wake irq arming")
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
> ---

$subject: Most recent convention used for this file is:
"PM: sleep: wakeirq:  ..."

>   drivers/base/power/wakeirq.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
> index 42171f766dcb..5a5a9e978e85 100644
> --- a/drivers/base/power/wakeirq.c
> +++ b/drivers/base/power/wakeirq.c
> @@ -313,8 +313,10 @@ void dev_pm_enable_wake_irq_complete(struct device *dev)
>   		return;
>   
>   	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> -	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE)
> +	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE) {
>   		enable_irq(wirq->irq);
> +		wirq->status |= WAKE_IRQ_DEDICATED_ENABLED;
> +	}

But this does make sense to make sure status is updated,
You can pick my R-by.

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Thanks and Regards,
Dhruva Gole

