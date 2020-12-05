Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989F9C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 12:11:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F1F23107
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 12:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46F1F23107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FQxOwhLlZLqaXmqNlWNE22dbaEykU3vcdMjV6f2R9js=; b=jzRBRLx1Crq/+sIlQgaXhmQJr
	dWavm7zINN45zCNN5mpqqgk3CxrCkCYmcSk0ZKsfK7DPeieUR/OisVD7vMxgSQaIYlrBvbC32r6Rx
	8j78/jA8LtzJK+nl2mY8LdJnzVgAU9npySjaOcaCFjERO+bHSkYj4lsxAeKmTteJepYcIBV6r6rg9
	0kt6iT8IqBKyQCD9dL7KSA230fh4YySx3nk9/T8gde7r6l63Fnj0mXIlQQYJZTBabrmjmbclLPE9h
	u+QjBE+8cqmhvwspGkqrTbGlN8dQnBL3O6vYRAZfR7glr9dABP9xORdxqD/EZIjcI6sGY6R7XrDbq
	LJVROMWJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klWP2-0002ef-8k; Sat, 05 Dec 2020 12:11:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klWOu-0002dD-Sp; Sat, 05 Dec 2020 12:10:59 +0000
X-UUID: a3a2b9f781244c8b99e478e521639f2e-20201205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o7tcBlyzTyhpZnUiHSLLH3393lSKUvrpmJLHh8Jr7u0=; 
 b=JHxiAY9WXqmvApl74X+Vw1hvzZWWsQbNyhFGxqNKMeS4cQ07AKtQSO50hMuOALnhkO79Fswuvc+91L08ykH0auFv4VhYU65odCCDqs+QkkQze6vi0k+DMdQ+dGLh3iwMZUDt1ZEb1c6OHu5rl5l+hFgL6QPJkWWVNwnpFtm2uA8=;
X-UUID: a3a2b9f781244c8b99e478e521639f2e-20201205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1505028284; Sat, 05 Dec 2020 04:10:49 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 04:07:34 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 20:07:32 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Dec 2020 20:07:32 +0800
Message-ID: <1607170053.3580.2.camel@mtkswgap22>
Subject: RE: [PATCH v4 0/8] Refine error history and introduce event_notify vop
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Sat, 5 Dec 2020 20:07:33 +0800
In-Reply-To: <DM6PR04MB657567F698B1EEA7D848FE45FCF00@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201205023938.13848-1-stanley.chu@mediatek.com>
 <DM6PR04MB65758A2779FD814F52E137BAFCF00@DM6PR04MB6575.namprd04.prod.outlook.com>
 <DM6PR04MB657567F698B1EEA7D848FE45FCF00@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_071057_587154_CCF3C277 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Alice Chao =?UTF-8?Q?=28=3Fw=3F=3F=E5=9D=87=29?= <Alice.Chao@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 Huadian Liu =?UTF-8?Q?=28=E5=88=98=E5=8D=8E=E5=85=B8=29?=
 <huadian.liu@mediatek.com>, Andy
 Teng =?UTF-8?Q?=28=3F=3F=E5=A6=82=E5=AE=8F=29?= <Andy.Teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=3FE=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=3F=3F=3F=3F=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 CC Chou =?UTF-8?Q?=28=E5=91=A8=E5=BF=97=E6=9D=B0=29?= <cc.chou@mediatek.com>,
 Jiajie
 Hao =?UTF-8?Q?=28=E9=83=9D=E5=8A=A0=E8=8A=82=29?= <jiajie.hao@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Peter
 Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?= <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sat, 2020-12-05 at 16:05 +0800, Avri Altman wrote:
> > 
> > Hi Stanley,
> > Will you split this series to 3 separate series:
> > Phy initialization cleanup, Error history, and event notification?
> > As those 3 aren't really connected?
> > 
> > Please maintain Can's reviewed-by tag for the error history patches,
> > And add mine for the phy initialization, so Martin can pick those.
> And for the new event notification vop of course.  Sorry.

Thanks for the review!

Sure I would separate it to 2 series
1. Cleanup phy_initialization
2. Error history and event notification since these patches are strongly
related

Please review my new posted series and feel free to provide any further
suggestion.

Thanks,
Stanley Chu 

> 
> Thanks,
> Avri
> 
> > 
> > Thanks,
> > Avri
> > 
> > >
> > > Hi,
> > > This series refines error history functions, do vop cleanups and introduce a
> > > new event_notify vop to allow vendor to get notification of important
> > > events.
> > >
> > > Changes since v3:
> > >   - Fix build warning in patch [8/8]
> > >
> > > Changes since v2:
> > >   - Add patches for vop cleanups
> > >   - Introduce phy_initialization helper and replace direct invoking in ufs-cdns
> > > and ufs-dwc by the helper
> > >   - Introduce event_notify vop implemntation in ufs-mediatek
> > >
> > > Changes since v1:
> > >   - Change notify_event() to event_notify() to follow vop naming covention
> > >
> > > Stanley Chu (8):
> > >   scsi: ufs: Remove unused setup_regulators variant function
> > >   scsi: ufs: Introduce phy_initialization helper
> > >   scsi: ufs-cdns: Use phy_initialization helper
> > >   scsi: ufs-dwc: Use phy_initialization helper
> > >   scsi: ufs: Add error history for abort event in UFS Device W-LUN
> > >   scsi: ufs: Refine error history functions
> > >   scsi: ufs: Introduce event_notify variant function
> > >   scsi: ufs-mediatek: Introduce event_notify implementation
> > >
> > >  drivers/scsi/ufs/cdns-pltfrm.c        |   3 +-
> > >  drivers/scsi/ufs/ufs-mediatek-trace.h |  37 ++++++++
> > >  drivers/scsi/ufs/ufs-mediatek.c       |  12 +++
> > >  drivers/scsi/ufs/ufshcd-dwc.c         |  11 +--
> > >  drivers/scsi/ufs/ufshcd.c             | 132 ++++++++++++++------------
> > >  drivers/scsi/ufs/ufshcd.h             | 100 +++++++++----------
> > >  6 files changed, 175 insertions(+), 120 deletions(-)
> > >  create mode 100644 drivers/scsi/ufs/ufs-mediatek-trace.h
> > >
> > > --
> > > 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
