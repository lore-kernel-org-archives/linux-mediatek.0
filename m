Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 01:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BySaaP6Eu24aVQhRuc4NGb0jRPdhccSdjtObvAC3w6s=; b=sLoqczOA1wdBUFt8mmNDfgrcR4
	MQ4hzIsqOmQqQN/4FFF6RTiddlDb0AjeJd6mjUTL8BG5D+wfao6I4J2V60zTEYu/PZdFX05QzEE6s
	jjAzT7qhA5PQsEXjXRKiZxxstXG0J7EyKdwsmaMuISN1pOpO8VYeG6bdKkckBd5wJTbl0c+OBIS2l
	cnoL2iAmXw+ciB+bkTBs6Ey9TpqnZr/m0cZva+l95Qw5q5jDsOIe71dtE7tADuhF4hwPxM/w7K/M/
	TOUJkkQjMglY/E+KgDd2I3kOitt03G6tcOSvQi9ieF6nM67Z/HS2+CGtk6l1QhPcnCTDpT+xKo9Os
	38B07GmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAi9d-00Eyda-Uf; Mon, 11 Jul 2022 01:24:05 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAi9S-00EyYp-PE; Mon, 11 Jul 2022 01:23:57 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Lh5gT6Jy9z1L8vj;
	Mon, 11 Jul 2022 09:21:09 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 09:23:41 +0800
Received: from [127.0.0.1] (10.67.111.83) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Jul
 2022 09:23:41 +0800
Message-ID: <d1474fc0-3eba-f1c3-6e63-0db8ce4ab07f@huawei.com>
Date: Mon, 11 Jul 2022 09:23:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
To: <stanley.chu@mediatek.com>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <matthias.bgg@gmail.com>, <bvanassche@acm.org>
CC: <linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20220704025632.235968-1-renzhijie2@huawei.com>
From: Ren Zhijie <renzhijie2@huawei.com>
In-Reply-To: <20220704025632.235968-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_182355_172482_EA7CB256 
X-CRM114-Status: GOOD (  12.60  )
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

Just friendly ping...

在 2022/7/4 10:56, Ren Zhijie 写道:
> If CONFIG_PM is not set,
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-, will be failed, like this:
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_suspend’:
> drivers/ufs/host/ufs-mediatek.c:1435:8: error: implicit declaration of function ‘ufshcd_runtime_suspend’; did you mean ‘ufs_mtk_runtime_suspend’? [-Werror=implicit-function-declaration]
>    ret = ufshcd_runtime_suspend(dev);
>          ^~~~~~~~~~~~~~~~~~~~~~
>          ufs_mtk_runtime_suspend
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_resume’:
> drivers/ufs/host/ufs-mediatek.c:1450:9: error: implicit declaration of function ‘ufshcd_runtime_resume’; did you mean ‘ufs_mtk_runtime_resume’? [-Werror=implicit-function-declaration]
>    return ufshcd_runtime_resume(dev);
>           ^~~~~~~~~~~~~~~~~~~~~
>           ufs_mtk_runtime_resume
> At top level:
> drivers/ufs/host/ufs-mediatek.c:1444:12: error: ‘ufs_mtk_runtime_resume’ defined but not used [-Werror=unused-function]
>   static int ufs_mtk_runtime_resume(struct device *dev)
>              ^~~~~~~~~~~~~~~~~~~~~~
> drivers/ufs/host/ufs-mediatek.c:1430:12: error: ‘ufs_mtk_runtime_suspend’ defined but not used [-Werror=unused-function]
>   static int ufs_mtk_runtime_suspend(struct device *dev)
>              ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> The declarations of func "ufshcd_runtime_suspend()" and "ufshcd_runtime_resume()" depended on CONFIG_PM, so the function wrappers "ufs_mtk_runtime_suspend()" and "ufs_mtk_runtime_resume()"  both should warpped by CONFIG_PM too.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: e7bf1d50063c ("scsi: ufs: ufs-mediatek: Fix build warnings")
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
> ---
>   drivers/ufs/host/ufs-mediatek.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index c958279bdd8f..e006c2528a3a 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -1427,6 +1427,7 @@ static int ufs_mtk_system_resume(struct device *dev)
>   }
>   #endif
>   
> +#ifdef CONFIG_PM
>   static int ufs_mtk_runtime_suspend(struct device *dev)
>   {
>   	struct ufs_hba *hba = dev_get_drvdata(dev);
> @@ -1449,6 +1450,7 @@ static int ufs_mtk_runtime_resume(struct device *dev)
>   
>   	return ufshcd_runtime_resume(dev);
>   }
> +#endif
>   
>   static const struct dev_pm_ops ufs_mtk_pm_ops = {
>   	SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,


