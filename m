Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC07CC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K2YGtvwVLUt3NyZzp6ZM+EFkm3QGWO/awwb1AQkpzo=; b=neGcBx5XJArCuG92LLcPifsSkX
	yavpXTnoaux1EOmHmkgV5ixlLGJthdFtLYlv3LJrXN4VZ042xZHEEiiC9Xsa1qLvB/hb7p725bOi9
	vlGgvu+ubjYCe7L+pakONER9nmpeq/Lq3kXurxUSQLomE+ixRo0EOXezg0aogu3MScH1kkhXxY26P
	/52C7E1HAALvtt/XeicHepXqKSNENmgANolGzvhwDxbw/b76YP8htABJ28XUa1gs6xyCqToDa9kjO
	JCcGpp4yENE3VjtStP8ab7IquQm3UAA74i576zVghphdKPlgo3S1ClISxeXfm2mp3rjiS6yyv1h5d
	mg5CVcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWuH-007I4v-6m; Mon, 01 Aug 2022 15:00:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIWuD-007I3a-PK
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 15:00:31 +0000
X-UUID: 75818e3bf1d74230969fc915560e9ee3-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a18dd067-7fc3-4131-91a1-841aa61c54db,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:c22bfacf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 75818e3bf1d74230969fc915560e9ee3-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 274993131; Mon, 01 Aug 2022 08:00:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 22:30:20 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 22:30:20 +0800
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <ca760b93-e6e9-abea-f2b2-dbb0c592690b@mediatek.com>
Date: Mon, 1 Aug 2022 22:30:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_080029_855959_51B27709 
X-CRM114-Status: GOOD (  16.09  )
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


On 7/29/22 5:09 AM, Bart Van Assche wrote:
> On 7/28/22 00:16, peter.wang@mediatek.com wrote:
>> Mediatek ufs do not want to toggle write booster when clock scaling.
>> This patch set allow vendor disable wb toggle in clock scaling.
>
> I don't like this approach. Whether or not to toggle the write booster 
> when scaling the clock is not dependent on the host controller and 
> hence should not depend on the host controller driver.
>
> Has it been considered to add a sysfs attribute in the UFS driver core 
> to control this behavior?
>
> Thanks,
>
> Bart.

Hi Bart,

Write booster binding with clock scaling is not make sense.
Clock scaling should always do clock scaling related things, and write 
bootster is not related to clock, right?
So Mediatek don't want to toggle wb with clock scaling.
Consider legacy design is binding, so we provide a flag to decouple them 
instead remove ufshcd_wb_toggle directly.
Or, do you think we can direct remove ufshcd_wb_toggle in clock scaling 
and only let sysfs to control wb behavior?

Thanks.
Peter



