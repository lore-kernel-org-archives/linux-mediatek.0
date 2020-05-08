Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED36C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 07:52:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254F7207DD
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 07:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EyqFpGJ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dy6FG3Qt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254F7207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1E8IUHb1rOMbKDW9CADxit4wAa3bmddtjOX7lN1MNO4=; b=EyqFpGJ3I611k5
	nwxuucZLeItxyhh9VM9wHe+l5X9cZ+gJAasm6lkw1KW6SwPkErtVN3DIEvlVrCe2NQVch59kNWjlG
	il4/uk8scW0zCaGYaCCLKX5KBoCst1YaBCJ9t9uIniHVHyoq7eRTZMHhQBXLPkq0e1w/MUauP813F
	H1NzyawNBL1pcNHCT8WZy7gbU8GvzusiCmz5FbUcwMBcDQlQdxvrRpQx8qqy3wxY8u7fMV6GeelOQ
	n/ja1lZMURpyFSwFMN9I+XymoPMbVkwxjaNEj8v5EtzuYRHkvze1u73LPQ/kTgKoPBpqadW6JHxWF
	GAxuETNB0YOB9t+TJnvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxnf-0001jQ-2g; Fri, 08 May 2020 07:52:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxnX-0001cL-F0; Fri, 08 May 2020 07:51:56 +0000
X-UUID: 599fdd48b3644391b4ad832610efac0a-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VH3FkscophLr2VZ9hGJSs8XypZWlJDmz13jJccd0dz0=; 
 b=dy6FG3Qt1M9MzeAdMdIy5SqfZd6yrN5zXBGsh657YUwsitPbXJHWi64XpMW83GXZOwYJFWbjaIsdBT85ffQqYxc/OBuRLu7AuKN5UuoAwvuXDAlqRS0ADZPuDw5YPcb6nFL8fXKJ95dfTU4Dxml+XepmrkfMn/Y88aqR84V2d9A=;
X-UUID: 599fdd48b3644391b4ad832610efac0a-20200507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 894468058; Thu, 07 May 2020 23:51:48 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 00:46:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 15:46:47 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 May 2020 15:46:47 +0800
Message-ID: <1588924008.3197.44.camel@mtkswgap22>
Subject: RE: [PATCH v7 3/8] scsi: ufs: export ufs_fixup_device_setup() function
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Fri, 8 May 2020 15:46:48 +0800
In-Reply-To: <SN6PR04MB4640777E2AEF4A77A642B81BFCA20@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200508022141.10783-1-stanley.chu@mediatek.com>
 <20200508022141.10783-4-stanley.chu@mediatek.com>
 <SN6PR04MB4640777E2AEF4A77A642B81BFCA20@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_005155_505846_BBBE9B80 
X-CRM114-Status: UNSURE (   6.93  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Fri, 2020-05-08 at 07:42 +0000, Avri Altman wrote:
> > 
> > -static void ufshcd_fixup_dev_quirks(struct ufs_hba *hba)
> > +void ufshcd_fixup_dev_quirks(struct ufs_hba *hba, struct ufs_dev_fix
> > *fixups)
> >  {
> >         struct ufs_dev_fix *f;
> >         struct ufs_dev_info *dev_info = &hba->dev_info;
> Now that you are exporting it, maybe return if (!fixups)?
> 

Good idea, I will add it in next version.

Thanks,
Stanley Chu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
