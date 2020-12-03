Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697FBC63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 07:48:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E521520B80
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 07:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E521520B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BDK0GbgMmn/cL/yakUSN8bVkUGBifjhmWRn6FfJj52w=; b=hH9d5s1bWqC9LVXp0Z8/FvE8u
	87RQuz71Q+UOjtuXSooGsI1vXFrrrojuXc+v+zi6CiZrYT+kK+2IxDYd0tqfesxkRDNZrj6fH4NO9
	gUBSwW2hHBC73pTEvAIHStTG4+E/ihp5WxKy2yM12s86v9OIYcjTG9oC+AzuzeN7bu/dkTn3tiNmH
	UluKuDoYMP54AV7JD5JNbZERT6tkP8qpG7Fe+hJ6EIm7mBiQ6pdBblNKlay1zbY112SqEqOKBFwQD
	F3Odv7IdxO4Om8Gq5H8BILsS51pja76NC0GtcVXrd06v0TXEb5EOIHr/TKUCijwLvsBcHsjRKcmz+
	abPaVHFaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkjLh-0007W4-GJ; Thu, 03 Dec 2020 07:48:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkjLd-0007Uw-Q6; Thu, 03 Dec 2020 07:48:18 +0000
X-UUID: d4d9cb15d2fb4a4d8336f3cf67b565e4-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rzi9oQI6tScslmje3vMx5/Cqw4zbjOHI0dWzgqggHTM=; 
 b=udyhhfLthonQraPQpiv7XEdALMs/EiSDIxP1rqJYSU4jdFzr7jBb1Ixic1G9cipsFmfD/MzjbkVzdUdHlExLHt+lj/cVtSP++1QYuxTeIkAhSRvD+Pr/7HpQk3kA93DaSFuKbNZpnhGvXHwP0ZmV2o2CTPsaTpXqPG3n26WhQ6U=;
X-UUID: d4d9cb15d2fb4a4d8336f3cf67b565e4-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1570270642; Wed, 02 Dec 2020 23:48:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 23:48:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 15:48:05 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Dec 2020 15:48:05 +0800
Message-ID: <1606981686.23925.62.camel@mtkswgap22>
Subject: RE: [PATCH v2 3/3] scsi: ufs: Introduce event_notify variant function
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Thu, 3 Dec 2020 15:48:06 +0800
In-Reply-To: <DM6PR04MB6575600BD1D02C7B447948E3FCF20@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201203072443.6663-1-stanley.chu@mediatek.com>
 <20201203072443.6663-4-stanley.chu@mediatek.com>
 <DM6PR04MB6575600BD1D02C7B447948E3FCF20@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_024818_067483_DC8DB1F8 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "huadian.liu@mediatek.com" <huadian.liu@mediatek.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Thu, 2020-12-03 at 07:32 +0000, Avri Altman wrote:
> > 
> > Introduce event_notify variant function to allow
> > vendor to get notification of important events and connect
> > to vendor-specific debugging facilities.
> You need to add an implementation of this vop,
> otherwise it's just dead code.

Sure, I will post it by new version.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
