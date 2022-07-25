Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6537CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48ik1Hl5rr5GQZuGCYDtxj0WDv/l5+I2zcMAslC813o=; b=z/IY9518BULRXgiNMZwOIB0/+P
	a/LxuKkQCH3bFJHWCPxJF3YO9RXCr3zoZnG6/mPy04zgdr3JIbqO5VeCJLo46b3kG6KbHfgzY/iCh
	VFSrxv6n7Edlx93QviuP/DIoe5923CjyeHVfVqX9FfGQ9zd1hZ/2XGPEX8orJPtvg6a5HUKjz+IbT
	qYbaaSeb8qQ5rIeX8BNeKVuzx+4oa2HcE2rmA9DYq2iM4jX7Rsl50cWJMxIpB1aRYrMdZSeBRT7QP
	D4Dj967bXyXo7nxca1SoyIyyV5t5tq1jH5YRKiwSMHQl0Tee53ACEhpadgCRPBOChJrCM5lO8CQ0L
	E/+WHm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFs5f-005oWE-Ro; Mon, 25 Jul 2022 07:01:19 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFs5T-005oJl-AA; Mon, 25 Jul 2022 07:01:09 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LrrSg5n8Hz9268;
	Mon, 25 Jul 2022 14:57:07 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 15:00:59 +0800
Received: from [127.0.0.1] (10.67.111.83) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Jul
 2022 15:00:59 +0800
Message-ID: <f565a5b5-8ba2-adbb-8093-6d60b2159222@huawei.com>
Date: Mon, 25 Jul 2022 15:00:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
To: Arnd Bergmann <arnd@arndb.de>
CC: <stanley.chu@mediatek.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Bart Van Assche <bvanassche@acm.org>, linux-scsi
	<linux-scsi@vger.kernel.org>, "moderated list:ARM/Mediatek SoC..."
	<linux-mediatek@lists.infradead.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, Paul Cercueil <paul@crapouillou.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>
References: <20220704025632.235968-1-renzhijie2@huawei.com>
 <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
 <df9909dc-3303-808e-575a-47190f636279@huawei.com>
 <CAK8P3a3SA9zvVu0i1m0kqbemLd4WfTMGfpc8VwhsmJOBgZHvsA@mail.gmail.com>
 <af043109-c101-a147-707b-82e79469ae73@huawei.com>
 <CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
From: Ren Zhijie <renzhijie2@huawei.com>
In-Reply-To: <CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_000107_727097_F629EE8D 
X-CRM114-Status: GOOD (  17.02  )
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


在 2022/7/25 14:34, Arnd Bergmann 写道:
> On Mon, Jul 25, 2022 at 5:38 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
>> 在 2022/7/13 16:48, Arnd Bergmann 写道:
>>
>> I try to use the new marcos SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS to
>> replace the old ones, and remove #ifdef around the declarations in the
>> header, my local changes attach below.
>>
>> But it seems  that doesn't work, which has ld errors:
>>
>> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
>> drivers/ufs/host/ufs-mediatek.o: In function `ufs_mtk_runtime_resume':
>> ufs-mediatek.c:(.text+0x1d0c): undefined reference to
>> `ufshcd_runtime_resume'
>> drivers/ufs/host/ufs-mediatek.o: In function `ufs_mtk_runtime_suspend':
>> ufs-mediatek.c:(.text+0x1d64): undefined reference to
>> `ufshcd_runtime_suspend'
>> Makefile:1255: recipe for target 'vmlinux' failed
>> make: *** [vmlinux] Error 1
>>
>> (CONFIG_PM and CONFIG_PM_SLEEP are both not set, and
>>
> It appears that there is a mistake in the RUNTIME_PM_OPS()
> macro definition, can you try this patch on top?

Hi Arnd,


I apply this patch and it worked.

When will this patch be merged?


Thanks,

Ren

>
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 871c9c49ec9d..84592229d754 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -334,9 +334,9 @@ struct dev_pm_ops {
>          .restore_noirq = pm_sleep_ptr(resume_fn),
>
>   #define RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) \
> -       .runtime_suspend = suspend_fn, \
> -       .runtime_resume = resume_fn, \
> -       .runtime_idle = idle_fn,
> +       .runtime_suspend = pm_ptr(suspend_fn), \
> +       .runtime_resume = pm_ptr(resume_fn), \
> +       .runtime_idle = pm_ptr(idle_fn),
>
>   #ifdef CONFIG_PM_SLEEP
>   #define SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>
> Commit 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate
> old ones") introduced all the macros with the intent of using pm_ptr()
> and pm_sleep_ptr() in them, and I think Paul accidentally forgot to add
> those in this instance.
>
>         Arnd
>
> .


