Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F8EC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 01:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ToYIKzK/0XFTjMzqpW8L8dXEwc4yK3h/C+m7UDdixo=; b=a5LMqMRhSiPlR2UTSr9Up0R0Ty
	GSo7hgZFdrffwII2FJaGFQLs7ttd35xBFEq1uMmtuFaeNOb06rgtQ0SyuxelBTXCQFc8akafwOiz0
	rFQJj1KuE81+O1pF8kWk/l5jpawnQDPHTj1UDFIIsJMWcxtdLZdQScGeCKNlaBWo2BnJB8UPx/Fbl
	pt9Z40xLHNQGJsJpvdXSt5nv1FC56M8B03HE6hjXywtgjk6/qEPl7AHsn99KUUefMT+ViWcB3idg2
	SBgBuaFmVMaL0/800GL1Sfjb2uJeKj5Zl2fVpkLZQDkRjloiGxqQf1Sj63tMfCcialw2V94W0qCYf
	0Ln5sUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBRQe-00GTJa-FG; Wed, 13 Jul 2022 01:44:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBRQR-00GT3c-Kw; Wed, 13 Jul 2022 01:44:29 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjL0s3cYyzVfc3;
	Wed, 13 Jul 2022 09:40:29 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 09:44:11 +0800
Received: from [127.0.0.1] (10.67.111.83) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Jul
 2022 09:44:10 +0800
Message-ID: <df9909dc-3303-808e-575a-47190f636279@huawei.com>
Date: Wed, 13 Jul 2022 09:44:10 +0800
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
	<linux-arm-kernel@lists.infradead.org>
References: <20220704025632.235968-1-renzhijie2@huawei.com>
 <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
From: Ren Zhijie <renzhijie2@huawei.com>
In-Reply-To: <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_184427_902649_E8F977D1 
X-CRM114-Status: UNSURE (   9.65  )
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

在 2022/7/12 16:27, Arnd Bergmann 写道:
> On Mon, Jul 4, 2022 at 4:56 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
>> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
>> index c958279bdd8f..e006c2528a3a 100644
>> --- a/drivers/ufs/host/ufs-mediatek.c
>> +++ b/drivers/ufs/host/ufs-mediatek.c
>> @@ -1427,6 +1427,7 @@ static int ufs_mtk_system_resume(struct device *dev)
>>   }
>>   #endif
>>
>> +#ifdef CONFIG_PM
>>   static int ufs_mtk_runtime_suspend(struct device *dev)
>>   {
>>          struct ufs_hba *hba = dev_get_drvdata(dev);
>> @@ -1449,6 +1450,7 @@ static int ufs_mtk_runtime_resume(struct device *dev)
>>
>>          return ufshcd_runtime_resume(dev);
>>   }
>> +#endif
>>
>>   static const struct dev_pm_ops ufs_mtk_pm_ops = {
>>          SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,
> This change works, but it's not great. It's better to change the
> SET_SYSTEM_SLEEP_PM_OPS() to the new SYSTEM_SLEEP_PM_OPS()
> that works without the #ifdef.
>
>           Arnd

Hi Arnd,

Thanks for your suggestion.

How does it to fix the implicit-function-declaration error?

Thanks,

Ren Zhijie

> .


