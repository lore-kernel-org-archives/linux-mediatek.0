Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80740C00140
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 02:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bImqjXCRrIZ9uji6OdOn56lxmOaj2dxqie1+K4HSR9c=; b=TM0ecPN1pW0dBjRfaClierFCop
	T/Od+E1NB2DRooSxOvvinskEfsdZxGOY9Cl4IhDgJvg1yCvulr+S/CoezcOCXf35vF0UmhCJjFcF5
	cvWYY41/pKi58xgKT/JU90rH5LU2jWp1MWM9UTtkNcBFdqm0kBqTHQtiZ4I56eNOVdckPsWdhF7A1
	7HiFKWDVjtfX3gjYU3uU50VSKrCz62GMdzOJn/I6COe7Lm61UIZp5W5Zzx+r/WqcXOP6b04TXPSdJ
	H6g/rn/Q6MSoixf0P+sSJ5di8BvW5jqI29eTolzcjhWsaQTvbkd/ucOzTxQJ3pt/QQ3ZJghVN9Of3
	8T6gck4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ4Lh-001jNQ-1z; Wed, 03 Aug 2022 02:43:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ4Lc-001jKW-Cg
	for linux-mediatek@lists.infradead.org; Wed, 03 Aug 2022 02:43:03 +0000
X-UUID: c1357d2be0f84e31a34c52e2e4438bec-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:75deff44-450a-4c2a-b6bd-af73c554c1fd,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:b6dd10d1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c1357d2be0f84e31a34c52e2e4438bec-20220802
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1000959627; Tue, 02 Aug 2022 19:42:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Aug 2022 10:42:36 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Aug 2022 10:42:36 +0800
Subject: Re: [PATCH v3 2/2] ufs: host: support wb toggle with clock scaling
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220802143223.1276-1-peter.wang@mediatek.com>
 <20220802143223.1276-3-peter.wang@mediatek.com>
 <517895b7-95ed-5e83-fb6d-98e155b896d4@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <39d082c1-88fe-3feb-0654-9ea562b542ac@mediatek.com>
Date: Wed, 3 Aug 2022 10:42:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <517895b7-95ed-5e83-fb6d-98e155b896d4@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_194300_480641_9AF0BDE3 
X-CRM114-Status: GOOD (  18.31  )
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


On 8/3/22 2:46 AM, Bart Van Assche wrote:
> On 8/2/22 07:32, peter.wang@mediatek.com wrote:
>> From: Peter Wang <peter.wang@mediatek.com>
>>
>> Set UFSHCD_CAP_WB_WITH_CLK_SCALING for qcom to compatible legacy design.
>>
>> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
>> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index f10d4668814c..f8c9a78e7776 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -869,7 +869,7 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>         hba->caps |= UFSHCD_CAP_CLK_GATING | 
>> UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> -    hba->caps |= UFSHCD_CAP_CLK_SCALING;
>> +    hba->caps |= UFSHCD_CAP_CLK_SCALING | 
>> UFSHCD_CAP_WB_WITH_CLK_SCALING;
>>       hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>>       hba->caps |= UFSHCD_CAP_WB_EN;
>>       hba->caps |= UFSHCD_CAP_CRYPTO;
>
> A patch series should be bisectable. Without this patch the previous 
> patch in this series introduces a regression for Qualcomm controllers. 
> So I think that the two patches should be combined into a single patch.
>
> Thanks,
>
> Bart.

Hi Bart,

Will combine into a single patch next version.

Thanks.
Peter




