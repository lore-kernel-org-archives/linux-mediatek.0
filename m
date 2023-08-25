Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3996C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw1cmJWYIKV3Il62ZPwDakHRYMtGKz5e9UMI12R/qac=; b=oYwQCCqENp1QfMKdG1SZCq+cbY
	59thuYuGzVEY1W10qFKqfY0jzZlMnc1uKlszzyh7KQFYQMD975sbPBWK087B90uuMyTEUvOO7SepJ
	WMHnm4iuVBVcXaqJybrdLDq4ujkeoZ0X6pmoJK+mXHPV2cdCCx7BHoiX/vh+8FmevWX9s+QRYmRNN
	uUjLfc/GMEVVY7ydpVH0ii/uC4k0x0n6gGcfPcToCxIGl8pKgw/npMr3VpPCIrA0UFkaL2giFgYz9
	dchv4JlBw5pNZ/6xFMnUSs8yCvw32GNmEzdutDu4K+YCOY6IyFwh97PKQqYLRfxkT3dFlTZiG2dYj
	CirfnrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZSwz-004iVr-14;
	Fri, 25 Aug 2023 09:17:53 +0000
Received: from mail-m11880.qiye.163.com ([115.236.118.80])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZSwv-004iVP-36;
	Fri, 25 Aug 2023 09:17:51 +0000
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by mail-m11880.qiye.163.com (Hmail) with ESMTPA id 1755920328;
	Fri, 25 Aug 2023 17:17:34 +0800 (CST)
Message-ID: <769a67cb-1b32-fd4f-b37e-e3ec4dab5eb9@rock-chips.com>
Date: Fri, 25 Aug 2023 17:17:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: shawn.lin@rock-chips.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 matthias.bgg@gmail.com, ulf.hansson@linaro.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Content-Language: en-GB
To: Sharp.Xia@mediatek.com
References: <c8c059ce-53a9-3627-8984-dff771dff1de@rock-chips.com>
 <20230825083918.24334-1-Sharp.Xia@mediatek.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20230825083918.24334-1-Sharp.Xia@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlLTlYfSk4dSB9CH0lMHkxVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSUxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a8a2bfc111e2eb6kusn1755920328
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6Mzo*TD1CMz8rGj8PCx5P
	CktPCwpVSlVKTUJJQk5OS05PQk1PVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlPT003Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_021750_212506_64ED9E60 
X-CRM114-Status: UNSURE (   7.84  )
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

On 2023/8/25 16:39, Sharp.Xia@mediatek.com wrote:
> On Fri, 2023-08-25 at 16:11 +0800, Shawn Lin wrote:
>>   	
>>   Hi Sharp,

...

>>> 1024
>>>
> Hi Shawn,
> 
> What is your readahead value before and after applying this patch?
> 

The original readahead is 128, and after applying the patch is 1024


cat /d/mmc0/ios
clock:          200000000 Hz
actual clock:   200000000 Hz
vdd:            18 (3.0 ~ 3.1 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400 enhanced strobe)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)

The driver I used is sdhci-of-dwcmshc.c with a KLMBG2JETDB041 eMMC chip.

