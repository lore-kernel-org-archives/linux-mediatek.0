Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E5ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJjAcM3GmyI6PjX3K2R26l59/UA4pSwDavyDI8Mg5+w=; b=hfJYA5rA8LiJ/m1uutYCR4IJ4U
	lspOhW4bTLB64fbJ1QCGvn8EFljQjGFqVtM/JQAIhM9QYIwfTNs5Y0vq/OjDv88bKWt44Wm9Jnr6S
	ht2p6vdA2M581KUl2TwuY2Te/yEvEdiBD2Vekhp6Fx58wz6AraYHnB8INebRfY7uDx9JHbCL52zZT
	WBBFcPWP75oSxffS7jWuHm1eqh4dtnCFr2JoOu2nAzvxMkIctJM6z4kiESidvDJ04Sz0xQKoiCoCk
	fNgdks00LJx5deQeD074BByPexHgnQ0hOnx/mFwtViBIIaSfBooUGGQqgIgH9k1Msf57q43Qjjd+7
	HtpcuG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxKA-00HKjm-0A; Fri, 02 Sep 2022 03:26:30 +0000
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxK7-00HKiG-2d; Fri, 02 Sep 2022 03:26:27 +0000
Message-ID: <a8ac77b7-60a9-3e62-0d07-fa03c5600740@infradead.org>
Date: Thu, 1 Sep 2022 20:26:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: linux-next: Tree for Sep 1 (Kconfig for VIDEO_MEDIATEK_VPU)
Content-Language: en-US
To: moudy ho <moudy.ho@mediatek.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220901171832.78d88aed@canb.auug.org.au>
 <f19684d4-9ef0-6308-8245-73c9a4511e67@infradead.org>
 <e213e9d8ef900db665fee08b484181e1d47c5171.camel@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e213e9d8ef900db665fee08b484181e1d47c5171.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/1/22 19:55, moudy ho wrote:
> Hi Randy,
> 
> Thanks for your efforts on this matter, the warning is due to not
> setting V4L_MEM2MEM_DRIVERS on defconfig which the VIDEO_MEDIATEK_VPU
> depends.
> Could I send a patch to add a V4L_MEM2MEM_DRIVERS selection in MDP3
> Kconfig to avoid this warning?
> 
> Regards,
> Moudy

Hi,
That sounds good to me.

Thanks.

> 
> On Thu, 2022-09-01 at 13:38 -0700, Randy Dunlap wrote:
>>
>> On 9/1/22 00:18, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> News: there will be no linux-next releases tomorrow or on Monday.
>>>
>>> Changes since 20220831:
>>>
>>
>> on i386 or x86_64:
>>
>> WARNING: unmet direct dependencies detected for VIDEO_MEDIATEK_VPU
>>   Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y]
>> && MEDIA_PLATFORM_DRIVERS [=y] && V4L_MEM2MEM_DRIVERS [=n] &&
>> VIDEO_DEV [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])
>>   Selected by [y]:
>>   - VIDEO_MEDIATEK_MDP3 [=y] && MEDIA_SUPPORT [=y] &&
>> MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] &&
>> (MTK_IOMMU [=n] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] &&
>> (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_DMA [=y] && REMOTEPROC
>> [=y]
>>
>>
>>
>> Full x86_64 randconfig file is attached.
>>
> 

-- 
~Randy

