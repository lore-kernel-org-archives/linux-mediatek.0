Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D603CC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkjdxiDsb9CXu8/kQ3MrnMhTu62kerp9O9ObOXnLx8A=; b=C5bTWFzYkjwlkfvADQz8mFzv28
	p+nPcg/AVgJpnpngHJcERn0RhII8TaXeM1clqpoEVzWpm6DvpT2rmSmvOSw0tLacUmdt73CbTLb+A
	GD3zHEFX6J5VRarW+FfZ+hqq7uOo9xQ9IQJLjW4uI8aj78o40Grj751L0qMMOxtriIR+vyVaQ79Jj
	1dwkQKupoZtCtig6M3A3G8Ue8vyloZF5DyCEGrsh0O76xH+oiJQGD3mUmQ+3dSGga7oLSu1CWM19m
	Y/ihReAaj3+lEMlFd+oExcLpP05tKFKWBsSonKhg95OFqWeyCvqOCgt/LhC3Z84J06xKBUlTWYK5m
	/CSZfvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWPG-0073rb-0v; Mon, 01 Aug 2022 14:28:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWPC-0073nW-ER
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 14:28:28 +0000
X-UUID: 1a78c7786fe64d03b3cfca8e3f815846-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e849a180-10bf-4046-afa9-ec779c926289,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:315cf324-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1a78c7786fe64d03b3cfca8e3f815846-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 468895109; Mon, 01 Aug 2022 07:28:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 22:28:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 22:28:15 +0800
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
To: Avri Altman <Avri.Altman@wdc.com>, "stanley.chu@mediatek.com"
	<stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
CC: "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
	"alice.chao@mediatek.com" <alice.chao@mediatek.com>, "cc.chou@mediatek.com"
	<cc.chou@mediatek.com>, "chaotian.jing@mediatek.com"
	<chaotian.jing@mediatek.com>, "jiajie.hao@mediatek.com"
	<jiajie.hao@mediatek.com>, "powen.kao@mediatek.com" <powen.kao@mediatek.com>,
	"qilin.tan@mediatek.com" <qilin.tan@mediatek.com>, "lin.gui@mediatek.com"
	<lin.gui@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <DM6PR04MB65757F6A74AA12BD31BCAD39FC969@DM6PR04MB6575.namprd04.prod.outlook.com>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <1906f059-92ae-1b0d-8ec1-6b28180670fe@mediatek.com>
Date: Mon, 1 Aug 2022 22:28:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB65757F6A74AA12BD31BCAD39FC969@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_072826_518845_B32FA5B3 
X-CRM114-Status: GOOD (  12.28  )
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


On 7/29/22 4:43 AM, Avri Altman wrote:
>> From: Peter Wang <peter.wang@mediatek.com>
>>
>> Mediatek ufs do not want to toggle write booster when clock scaling.
>> This patch set allow vendor disable wb toggle in clock scaling.
>>
>> Peter Wang (2):
>>    ufs: core: interduce a choice of wb toggle in clock scaling
>>    ufs: host: support wb toggle with clock scaling
> It would make more sense to squash both patches and add it as #6 after -
> " Support clk-scaling to optimize power consumption" in your earlier
> " Provide features and fixes in MediaTek platforms" series.
>
> Either way, Looks good to me.
>
> Thanks,
> Avri


Hi Arvi,

Yes, it make more sense to enable clock scaling in mediatek platform first.
I will wait "Provide features and fixes in MediaTek platforms" patch set 
accepted than update this patch.

Thanks.
Peter



