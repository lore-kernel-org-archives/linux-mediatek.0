Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B79BCF9C72
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 04:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhUlNSypZsjISyjSJbKAwiwST2xLdo0AkzrMaosZ+hw=; b=T6FcMG1hPAP8xpRKQso1+oZgNs
	mhFWb/ZzjnVWyo8DGCdQ8rq2Zc1A5T9U8K5d3CPQs3RaZI+jMkGdLo25x4nNG8h7t0upjqvG6+zXW
	OpJgP5e/hQ1HV1tT8mMuK5Sg/9BSlbdPyB75v4hWcUf1tQ+wRAMrepGuX7Z0zIGC+AjtE2gvchx/Z
	QcFqJeXzJxiskBvvfSBzsk+eGhMUzpH/WkWBNscnw4ja2lEQ9vEasA8QmiubbdluX+UTcp07Q5q5m
	z45DwV+jSs4CEc7lVXL7AUNNMctiylH/PUImQHy2RMCKdb8VunLjyO9gHFoOhTj3wo+jHqK7taM/u
	j7BLkX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sswre-0000000139K-0ulC;
	Tue, 24 Sep 2024 04:09:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sswqU-000000012ya-0fGx;
	Tue, 24 Sep 2024 04:08:15 +0000
X-UUID: 9bc14cb67a2a11efb3adad29d29602c1-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=lhUlNSypZsjISyjSJbKAwiwST2xLdo0AkzrMaosZ+hw=;
	b=SnivXRzQZDfgxzfNDJRYLh3r62m/7G9YGNiVgpAxNubVPECQH4wmKoKZ82ldWRUJf31gDkW3ItX0JOacl6RpHOD/qrmmHRt9Zdqu4H3nQjnV0921gLDqH6SylPUw/OOOe3yXYVEbIyr+/iejOsx7kWfBuUqy+EWiqtz8QUe/T2c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6d0e7feb-794b-4fc6-9df7-5d17ae8ca11c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b3a4a9d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9bc14cb67a2a11efb3adad29d29602c1-20240923
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 660638242; Mon, 23 Sep 2024 21:08:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Sep 2024 12:08:06 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 24 Sep 2024 12:08:05 +0800
Message-ID: <0748868d-4789-fcaa-e70f-6a4508411b36@mediatek.com>
Date: Tue, 24 Sep 2024 12:08:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 2/3] rtc: mt6359: Add RTC hardware range and add
 support for start-year
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<lee@kernel.org>, <ZhanZhan.ge@mediatek.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <eddie.huang@mediatek.com>,
	<sean.wang@mediatek.com>, <alexandre.belloni@bootlin.com>,
	<sen.chu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<kernel@collabora.com>, <yong.mao@mediatek.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_210814_251055_7DE24F8B 
X-CRM114-Status: GOOD (  21.80  )
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


On 9/23/24 18:00, AngeloGioacchino Del Regno wrote:
> Add the RTC hardware range parameters to enable the possibility
> of using the `start-year` devicetree property which, if present,
> will set the start_secs parameter by overriding the defaults
> that this driver is setting;
> 
> To keep compatibility with (hence have the same date/time reading
> as) the old behavior, set:
>   - range_min to 1900-01-01 00:00:00
>   - range_max to 2027-12-31 23:59:59 (HW year max range is 0-127)
>   - start_secs defaulting to 1968-01-02 00:00:00
> 
> Please note that the oddness of starting from January 2nd is not
> a hardware quirk and it's done only to get the same date/time
> reading as an RTC which time was set before this commit.
> 
> Also remove the RTC_MIN_YEAR_OFFSET addition and subtraction in
> callbacks set_time() and read_time() respectively, as now this
> is already done by the API.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/rtc/rtc-mt6397.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

[snip]

Thanks for helping add new patch fix for RTC.

> @@ -302,6 +293,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	device_init_wakeup(&pdev->dev, 1);
>   
>   	rtc->rtc_dev->ops = &mtk_rtc_ops;
> +	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
> +	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
> +	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
> +	rtc->rtc_dev->set_start_time = true;
>   
>   	return devm_rtc_register_device(rtc->rtc_dev);
>   }

Dear @Zhanhan, Please help to leave comment if you think there is 
something need to be clarify. For example, I've found some relate origin 
defines
in "include/linux/mfd/mt6397/rtc.h"
#define RTC_MIN_YEAR	1968
#define RTC_BASE_YEAR	1900
#define RTC_NUM_YEAR	128
#define RTC_MIN_YEAR_OFFSET	(RTC_MIN_YEAR - RTC_BASE_YEAR)

Should MediaTek remove RTC_MIN_YEAR and RTC_BASE_YEAR in next patch?
And since there may not exist any smartphone/tablet/TV using mt6397
RTC earlier than 2010? Is it possible to change
RTC_TIMESTAMP_BEGIN_1900 to RTC_TIMESTAMP_BEGIN_2000 without breaking
compatibility for these devices?

Thanks
Macpaul Lin

