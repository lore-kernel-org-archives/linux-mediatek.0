Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAC7C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 06:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5825E206F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 06:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1d8rALku"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5825E206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0CRw6WLNC3rkpRLL2kzENWoxNzRqQXxr+FOdWT+gGYE=; b=1d8rALkuIP0YD5sZSbnin8+Yj
	BBddEhAN7sEegkdKDVsC5TSg5WrtQHU+7yCV2zf1OQ4/yGcyItKmCJM19nPGZH4RInxr+/gBMr4Za
	IwfWqpaXuhelsIBUlfgRHa52Q+RDVxm4o8kVKFx65c9ZoS//MnsMqKiF3VbvUR6pWTyDcG1ch6V70
	W2fGPPFgHhw/ndKeE6XhKeK9wTD2iLa3za7pLVuG3hrtwhnCiEZr8VduMCw4uk4x7eZQZ/dDETBOi
	kdnuspj7sOBX0OgUppw/QTOx6vCpyHUqxtyp9oh4IZkhSQNLWThLumCxnMSu5LSZ490/djqfu7bhP
	WsLu9KZzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khoKt-0001si-TM; Wed, 25 Nov 2020 06:31:27 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khoKr-0001rz-DQ; Wed, 25 Nov 2020 06:31:26 +0000
Received: from [10.130.0.80] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL9Mz+r1fSWkWAA--.45318S3; 
 Wed, 25 Nov 2020 14:31:16 +0800 (CST)
Subject: Re: [PATCH] phy/mediatek: Make PHY_MTK_XSPHY depend on HAS_IOMEM and
 OF_ADDRESS to fix build errors
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <1606211233-7425-1-git-send-email-yangtiezhu@loongson.cn>
 <1606271044.32484.20.camel@mhfsdcap03>
 <d3cee8b0-b699-a51a-ff33-568e10cb2df7@infradead.org>
 <1606285623.7284.8.camel@mhfsdcap03>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a11b628a-ee7d-e1f0-2d5f-3ff4ff45d9ec@loongson.cn>
Date: Wed, 25 Nov 2020 14:31:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1606285623.7284.8.camel@mhfsdcap03>
X-CM-TRANSID: AQAAf9DxL9Mz+r1fSWkWAA--.45318S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4fWw47WF1kAw1DWr45Wrg_yoW8tr13pr
 ZxtF4jkF1DJryDGFWIqa4DWF1aya93try7Wrn3G3sxZrn0yry7Awn8ta429FWDZrs7uw10
 qry0ga43W3WUA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUjkpnJUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_013126_064707_5A8D2BE8 
X-CRM114-Status: GOOD (  18.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/25/2020 02:27 PM, Chunfeng Yun wrote:
> On Tue, 2020-11-24 at 19:31 -0800, Randy Dunlap wrote:
>> On 11/24/20 6:24 PM, Chunfeng Yun wrote:
>>> Hi Tiezhu,
>>>
>>> On Tue, 2020-11-24 at 17:47 +0800, Tiezhu Yang wrote:
>>>> devm_ioremap_resource() will be not built in lib/devres.c if
>>>> CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
>>>> not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
>>>> set, and then there exists two build errors about undefined
>>>> reference to "devm_ioremap_resource" and "of_address_to_resource"
>>>> in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
>>>> make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> ---
>>>>   drivers/phy/mediatek/Kconfig | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
>>>> index 50c5e93..66df045 100644
>>>> --- a/drivers/phy/mediatek/Kconfig
>>>> +++ b/drivers/phy/mediatek/Kconfig
>>>> @@ -30,6 +30,8 @@ config PHY_MTK_XSPHY
>>>>   	tristate "MediaTek XS-PHY Driver"
>>>>   	depends on ARCH_MEDIATEK || COMPILE_TEST
>>>>   	depends on OF
> Hi Tiezhu,
>
> Would you please help to put OF and OF_ADDRESS into one line as
> following:
> depends on OF && OF_ADDRESS.
>
> Also please help to add them for PHY_MTK_TPHY.
> And change the tile 'phy/mediatek: ...' as 'phy: mediatek: ...'

OK, no problem, I will do it.

Thanks,
Tiezhu

>
> Thank you
>
>
>>>> +	depends on HAS_IOMEM
>>>> +	depends on OF_ADDRESS
>>> Why not add them into deconfig but here? In fact I don't know which way
>>> is better and follow the kernel rule.
>>>
>>> Vinod and Kishon, do you have any suggestion about this?
>> Putting them into a defconfig won't prevent random build errors
>> while putting them here will (or at least should).
> hi Randy,
>
> Got it, thank you
>
>>>>   	select GENERIC_PHY
>>>>   	help
>>>>   	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
>> The patch LGTM.
>>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>>
>> thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
