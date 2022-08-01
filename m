Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42197C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd+9j3mhIudUbFHf6FCyB5xBJQoKE9shKS5vNyrdLDA=; b=iLmKNGbNsAeIQv0QsHrMkyARlF
	7x9al48oQo41/yBON1TiJd1KkNCia7H0Y03XAFXfYGQogJjmOykIqiN5ahyOJIKCZToR3z+bKNpvZ
	eIIPAPPK8FrvkAef1WEB/kKbp3b7FchCORu1peAYoF4twV/CRQN7bePZOYI+CNzbZLyS3ovSFBJG8
	rCVUAomkcMBLtpVcIBRlGY87kGOLyh8jeYQMq9R33U1CfMj4AvlqN4Nh+ua/VvKPhYvI1vr5wMGVl
	s8TQN+P0wH73RQ21Vc10Rq2HNSO1vTVgxiRc5cj7Vp8Eneed6bHU0kcHDLpNCkDrQ4DGSX1nKmeG1
	LMfkADdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIXF6-007P2Q-LC; Mon, 01 Aug 2022 15:22:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIXEz-007P07-RH
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 15:22:00 +0000
X-UUID: 5bd9dcb29ff04d81bd54aeb396d8fb41-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1e51d8e6-14f0-4055-bba8-ed19901bab4b,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:0c0df424-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5bd9dcb29ff04d81bd54aeb396d8fb41-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 165054074; Mon, 01 Aug 2022 08:21:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 22:31:14 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 22:31:14 +0800
Subject: Re: [PATCH v1 1/2] ufs: core: interduce a choice of wb toggle in
 clock scaling
To: Bean Huo <huobean@gmail.com>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <20220728071637.22364-2-peter.wang@mediatek.com>
 <b9fab29cde42cb9573616092329089f45cd27af2.camel@gmail.com>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <e6034a5e-8bb4-564e-76bf-c822c7bb99af@mediatek.com>
Date: Mon, 1 Aug 2022 22:31:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b9fab29cde42cb9573616092329089f45cd27af2.camel@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_082157_918200_7DC295A9 
X-CRM114-Status: GOOD (  11.05  )
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


On 7/29/22 5:41 AM, Bean Huo wrote:
> On Thu, 2022-07-28 at 15:16 +0800, peter.wang@mediatek.com wrote:
>> From: Peter Wang <peter.wang@mediatek.com>
>>
>> Vendor may wan't disable/enable write booster while clock scaling.
>> Introduce a flag UFSHCD_CAP_WB_WITH_CLK_SCALING to decouple WB and
>> clock scaling.
>>
>> UFSHCD_CAP_WB_WITH_CLK_SCALING only valid when UFSHCD_CAP_CLK_SCALING
>> is set. Just like UFSHCD_CAP_HIBERN8_WITH_CLK_GATING is valid only
>> when
>> UFSHCD_CAP_CLK_GATING set.
>>
> Hi Peter,
>
> probably "interduce" is a typo in your subject?
>
> Kind regards,
> Bean


Hi Bean,

Yes, it typo.

Thanks.
Peter



