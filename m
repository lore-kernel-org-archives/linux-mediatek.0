Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDCEC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 02:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0AE600CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 02:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA0AE600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEZEsP7G46gd14RAJSBG7LeBCeGblktTr7G06BC5Npw=; b=4Trs0rOkQ26Vyz
	HLWTU/8qS/Be8BS/5V1WAELoLyFB5hrzMPqb1i1wSYdIXSqDkp6/nc6SCbKXME+Lw+fMgM2nU/nVN
	XOAGg3kbNuN55P7DVDrdno7uqf/wyaccOeVHOHfhKk1rtXb162q/tstkRoZVqiKZfifOaXxfROuaP
	NZSYa6EDd/P6mTGMkD8+WNQgnJk3LvFMAxnbnBIHX7D9vdTF8wKsMmGcM+fIp1limV4oa2qSRJdzm
	fVknoEo6+s7Bva5YSw4fWeTP7z+ngEITj7JqR4zJ6fvPJ27VDq8NAmjBqVlTmIJXca44nmvylPGmC
	d4oWMOJdAZQIw/igOsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLG0A-003bDE-3y; Wed, 01 Sep 2021 02:29:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLG04-003bCi-O1
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 02:29:20 +0000
X-UUID: 58aeafd88e2146ff85972538c2f23478-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FW9zAYggfX8dinlAz5bx5Xo0bXQQW3EZJdhhHJPgEpI=; 
 b=M2CrBQxr1uW2I8sVBbvkXyJyxcayavmxaTVBinKaj2RNMQoRCKoADn09KmydNGDuruhEJ1UmVHeBZh96A+3bdRqmK5TO3sf/UrOWym3BN2AjyBIKkpbxINWPC3eSry1xRZwP+7sZXUOkEVPhGzvXl0uXL1rfbHsvBScePcjIoM8=;
X-UUID: 58aeafd88e2146ff85972538c2f23478-20210831
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1897768684; Tue, 31 Aug 2021 19:29:13 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 19:29:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 10:29:10 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 10:29:10 +0800
Message-ID: <da0ebaf6bb6e556eeb2f6fe4037d891bafc79ecd.camel@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs: ufs-mediatek: Change dbg select by check
 hw version
From: Peter Wang <peter.wang@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
 <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
 <jonathan.hsu@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Date: Wed, 1 Sep 2021 10:29:09 +0800
In-Reply-To: <dda8eb67-fe56-8bc0-5ce8-a62bd4e6b995@acm.org>
References: <1630325486-11741-1-git-send-email-peter.wang@mediatek.com>
 <dda8eb67-fe56-8bc0-5ce8-a62bd4e6b995@acm.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_192916_829857_7EB7A55B 
X-CRM114-Status: GOOD (  14.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

REG_UFS_MTK_HW_VER is a read only mediatek dedicated register.
So, hw_ver will get a const value for mediatek to decide how to use
debug select. It only need read once, no need multi-threads protected.

Thanks
Peter


On Mon, 2021-08-30 at 19:47 -0700, Bart Van Assche wrote:
> On 8/30/21 05:11, peter.wang@mediatek.com wrote:
> > +static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
> > +{
> > +	static u32 hw_ver;
> > +
> > +	if (!hw_ver)
> > +		hw_ver = ufshcd_readl(hba, REG_UFS_MTK_HW_VER);
> > +
> > +	if (((hw_ver >> 16) & 0xFF) >= 0x36) {
> > +		ufshcd_writel(hba, 0x820820, REG_UFS_DEBUG_SEL);
> > +		ufshcd_writel(hba, 0x0, REG_UFS_DEBUG_SEL_B0);
> > +		ufshcd_writel(hba, 0x55555555, REG_UFS_DEBUG_SEL_B1);
> > +		ufshcd_writel(hba, 0xaaaaaaaa, REG_UFS_DEBUG_SEL_B2);
> > +		ufshcd_writel(hba, 0xffffffff, REG_UFS_DEBUG_SEL_B3);
> > +	} else {
> > +		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
> > +	}
> > +}
> 
> Can ufs_mtk_dbg_sel() be called from multiple threads at the same
> time? 
> Does the 'hw_ver' variable need to be protected against concurrent
> writes?
> 
> Thanks,
> 
> Bart.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
