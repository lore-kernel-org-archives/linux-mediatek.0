Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4722EC00144
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 03:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbB+leZjncQIBZHrZwmCVUAlke6bbLFo7XixY7OompE=; b=kBglFLCzmWWQxJ/64fpVgdpVMp
	+vlTB4ApYdp9ExhIoSh1BXe3enW734SqDvXniqGaFIsISxexJoBaF04zyQCYDORvQWkV+ixUaZrpu
	x2UsDbYRSDhbi7xchUpCl23tTWz/jvNy+cAN6St1dQ0Ge4h+az/mo/Gjxrta47Q9ExgHn0CxpN5n3
	4cEyE3vWJ5plxxvkwI4cFpntDXc5YdBztwAXjsv8OJ0Npg/pfbiNoD3ZVu/6GJLERNexPUTI4FmQX
	0tS1EMUNErhtlHKxpTLxYi/gEjLg69I5lBAXyAngD/dTfqUBxu3cr+kGud0ON8R3qzjao07yJ1XJL
	89VYYshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIiXT-00A3Jn-QB; Tue, 02 Aug 2022 03:25:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIiXQ-00A3IQ-CA
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 03:25:46 +0000
X-UUID: 323dc55fd7e64868a29b95efabccef06-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e4658cfc-d879-4398-9ae9-d9c2e4a0e283,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:660b06d0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 323dc55fd7e64868a29b95efabccef06-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 728102552; Mon, 01 Aug 2022 20:25:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 11:25:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 11:25:01 +0800
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
To: Christoph Hellwig <hch@infradead.org>, Bart Van Assche
	<bvanassche@acm.org>
CC: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>, <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <YugT7jfkMGGvH7hO@infradead.org>
 <ffa00837-5e3f-24fa-ac2c-7d4a505c848b@acm.org>
 <YugX+ZlD6cHC0+Kz@infradead.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <794f7107-1249-34d7-1b4f-db8dce1aaffb@mediatek.com>
Date: Tue, 2 Aug 2022 11:25:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YugX+ZlD6cHC0+Kz@infradead.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_202544_433100_85556A16 
X-CRM114-Status: GOOD (  10.11  )
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

On 8/2/22 2:14 AM, Christoph Hellwig wrote:
> On Mon, Aug 01, 2022 at 11:12:17AM -0700, Bart Van Assche wrote:
>> Agreed that the description should become more clear. I think Peter wanted
>> to refer to the "vendor driver" where he wrote "vendor".
> vendor driver makes just as little sense.  hardware interfaces do not
> map to vendors in any sensible way.

Hi Christoph,

Will change commit message.

Thanks

Peter


