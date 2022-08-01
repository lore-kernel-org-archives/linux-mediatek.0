Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A723C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/7EkdJ25piYhSCCH9snV61LLSuXZm3ViCBfjM8Y6vs=; b=FDUIwVI2FOJVxTVOUKLGSkwsAx
	QEx+pLCKdixKKzd5kMj2XJUKimZVujvrNibrtdA/C/TeHPHZHL4Yhve8PVJGXpRKVni16AtJyAqBi
	3HFeZAN4IODZf53B4oaijss9SSVmao+CwR7iIhOph2/q0WwDCM4fc0lNACyPYXLLbPxgcd4b6UbsP
	2EiLRmPY6UvXcqnIg+O9GArfPX+g18re1ODORc30CnzICvFlmvFQgx2wmKBg+a39Z6EWTdM9/vT+B
	ao0bHhJlR48b3XrLO2lGVphgG7Ij9muZgud4y6JURXVe3QEDAcz6x75dbkSVvNasYj4V9HN78Y3up
	BG7KSzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWeb-007AVE-1z; Mon, 01 Aug 2022 14:44:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWd0-0079HD-NY
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 14:42:46 +0000
X-UUID: fdbf13bce397452182beb12d7883153e-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1edae8f3-d028-432b-b160-1a9bf36a427d,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:02f4f9cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fdbf13bce397452182beb12d7883153e-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1210084930; Mon, 01 Aug 2022 07:42:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 1 Aug 2022 22:32:32 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 22:32:32 +0800
Subject: Re: [PATCH v1 2/2] ufs: host: support wb toggle with clock scaling
To: Bean Huo <huobean@gmail.com>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <20220728071637.22364-3-peter.wang@mediatek.com>
 <ea3b173cb2575dbb81cb416469880c50dd536bd0.camel@gmail.com>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <df7e2f8a-4f49-d1fa-7090-18b4f086b608@mediatek.com>
Date: Mon, 1 Aug 2022 22:32:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea3b173cb2575dbb81cb416469880c50dd536bd0.camel@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_074242_811709_74FEFA2E 
X-CRM114-Status: GOOD (  20.44  )
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


On 7/29/22 5:57 AM, Bean Huo wrote:
> On Thu, 2022-07-28 at 15:16 +0800, peter.wang@mediatek.com wrote:
>> From: Peter Wang <peter.wang@mediatek.com>
>>
>> Set UFSHCD_CAP_WB_WITH_CLK_SCALING for qcom to compatible legacy
>> design.
>>
>> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-
>> qcom.c
>> index f10d4668814c..f8c9a78e7776 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -869,7 +869,7 @@ static void ufs_qcom_set_caps(struct ufs_hba
>> *hba)
>>          struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>   
>>          hba->caps |= UFSHCD_CAP_CLK_GATING |
>> UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> -       hba->caps |= UFSHCD_CAP_CLK_SCALING;
>> +       hba->caps |= UFSHCD_CAP_CLK_SCALING |
>> UFSHCD_CAP_WB_WITH_CLK_SCALING;
>>          hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>>          hba->caps |= UFSHCD_CAP_WB_EN;
>>          hba->caps |= UFSHCD_CAP_CRYPTO;
> Hi peter,
>
> If WB is on/off based on clk scaling up/down is legacy design, maybe
> you have a more advanced design. It is true there is an issue since we
> didn't differentiate the read or write. WB is only for write. How to
> know this time clk scaling is for write from driver level, not possible
> now.
>
> Kind regards,
> Bean

Hi Bean,

Yes, we don't know if clock scaling up/down is for write or read.
But we want to keep WB always on even clock scaling down.
This is why we need this patch, let different host can choose toggle wb 
or not.

Thanks.
Peter








