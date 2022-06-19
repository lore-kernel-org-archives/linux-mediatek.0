Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE34AC43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA+7COREAB6bATPrfYdSbfqsNjqeTmXkIAoOlMRruwI=; b=EH0SfStB/LeKImxM+tVLwhXEF9
	nxTOmmk1/8CNTXP2iTk3l5qUxE9qDMO5wOuVCklCsS0mvPTxCFRVfYZ97d20DCXZwN1hwWKn1w2GW
	ksXSnkU/vVORLdOro99p3ob+megDU0GAbrFTUFOe77/WX7o7KUWsnEXbNOcY9ZrkWUDSJ/jeqhGFF
	RuMzc8bttfw7ztEuD3Z4bW4ln1E1fArRx2tQVYH3SqHgP3ClDGkWQJ717MwqsMlBBIAB3Hp3RNIo3
	Ts8R576IVqcsRqazAKLoPICjPtEmps5IiKZfFcyTTYz/tVNMKDgNOzQj7Di4XfI3enC607im0Zns3
	S18+OLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2veS-00EMOS-FX; Sun, 19 Jun 2022 14:11:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2veO-00EMNF-Co; Sun, 19 Jun 2022 14:11:43 +0000
X-UUID: 99e6cace09f34c2b956839c2a1761724-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:782e8f91-a097-4ceb-a963-f5735f2a883a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:44491249-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 99e6cace09f34c2b956839c2a1761724-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <stanley.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1482383552; Sun, 19 Jun 2022 07:11:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 07:11:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 19 Jun 2022 22:11:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sun, 19 Jun 2022 22:11:27 +0800
Message-ID: <54053ba2b6ca09658a9c360397593a286446c06f.camel@mediatek.com>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error and type
 unmatch
From: Stanley Chu <stanley.chu@mediatek.com>
To: Ren Zhijie <renzhijie2@huawei.com>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <matthias.bgg@gmail.com>,
	<powen.kao@mediatek.com>
CC: <linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Sun, 19 Jun 2022 22:11:27 +0800
In-Reply-To: <20220619115432.205504-1-renzhijie2@huawei.com>
References: <20220619115432.205504-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_071140_478603_AD952B6C 
X-CRM114-Status: GOOD (  13.68  )
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

On Sun, 2022-06-19 at 19:54 +0800, Ren Zhijie wrote:
> If CONFIG_PM_SLEEP is not set.
> 
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-, will be failed,
> like this:
> 
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_vreg_fix_vcc’:
> drivers/ufs/host/ufs-mediatek.c:688:46: warning: format ‘%u’ expects
> argument of type ‘unsigned int’, but argument 4 has type ‘long
> unsigned int’ [-Wformat=]
>     snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%u", res.a1);
>                                              ~^   ~~~~~~
>                                              %lu
> drivers/ufs/host/ufs-mediatek.c: In function
> ‘ufs_mtk_system_suspend’:
> drivers/ufs/host/ufs-mediatek.c:1371:8: error: implicit declaration
> of function ‘ufshcd_system_suspend’; did you mean
> ‘ufs_mtk_system_suspend’? [-Werror=implicit-function-declaration]
>   ret = ufshcd_system_suspend(dev);
>         ^~~~~~~~~~~~~~~~~~~~~
>         ufs_mtk_system_suspend
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_system_resume’:
> drivers/ufs/host/ufs-mediatek.c:1386:9: error: implicit declaration
> of function ‘ufshcd_system_resume’; did you mean
> ‘ufs_mtk_system_resume’? [-Werror=implicit-function-declaration]
>   return ufshcd_system_resume(dev);
>          ^~~~~~~~~~~~~~~~~~~~
>          ufs_mtk_system_resume
> cc1: some warnings being treated as errors
> 
> The declaration of func "ufshcd_system_suspend()" is depended on
> CONFIG_PM_SLEEP, so the function wrapper "ufs_mtk_system_suspend()"
> should warpped by CONFIG_PM_SLEEP too.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 3fd23b8dfb54("scsi: ufs: ufs-mediatek: Fix the timing of
> configuring device regulators")
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>

Thanks for the fix!

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>



