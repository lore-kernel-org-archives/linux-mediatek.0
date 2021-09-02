Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0629BC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 02:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF8E610CA
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 02:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAF8E610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKmFJI+TtvLBTQtmVpbYVP0RZzgnHbv/XAWiAwr58P4=; b=owTIRn2EtGXR5d
	2GyRzf3C04kezXrcxruCXKUSxXGo+M5h0lLZZMEDupXJcOgXtvVMdmqNqMqWUE2fd9H0lYdHaaeib
	zVD6/hqnWSwRXm00tcUzWmvVKuSTzPQgmWh0IxGoosi4ILESwt3mzRgWd/yfyvBUex+x07LhoZ/QV
	86JdWYfdu6bN16P33314LbsNhAkXNOcRVhVP3RbMayntJulvmVGHxfBIGM5zuoXcM/OMAwBg0kFEB
	BStSVrVA52EC+CJ5bGKxjbdbFYUQYDYY5FLqxctMTMUp9AxSqanuK9jt53xQ+7WiDp9iQsQsiawLC
	/+L30w8udIXnnhVray0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLcDX-008B2O-DZ; Thu, 02 Sep 2021 02:12:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLcDS-008B21-Cn
 for linux-mediatek@lists.infradead.org; Thu, 02 Sep 2021 02:12:38 +0000
X-UUID: 456172215fce4624af4623ab04fd6d05-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MxPi2Z7fLFbleO5SNvI1Jw/FtsBVdHsC7at62XOVEts=; 
 b=NSTeo069d3sHNYj70549uJbA/Pzv6lExOjjs6O1NzPDG+bybe30J9KZK9E6gz/gzayQ44p/Kszx3dKtmLYSRkdSq24iPDmq8eCoYv5vtIfYlZVM66kdIFv6ZIzkdhiD2VJgiZPdPxFsxkRtJNaatGdcijE3n34DR3F3JLtEc/bE=;
X-UUID: 456172215fce4624af4623ab04fd6d05-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 371201761; Wed, 01 Sep 2021 19:12:29 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 19:12:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 10:12:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 10:12:26 +0800
Message-ID: <538eacb7818d011d707e742187a6a96868c5d474.camel@mediatek.com>
Subject: Re: [PATCH v3] scsi: ufs: ufs-mediatek: Change dbg select by check
 hw version
From: Peter Wang <peter.wang@mediatek.com>
To: Stanley Chu <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
 <jonathan.hsu@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Date: Thu, 2 Sep 2021 10:12:26 +0800
In-Reply-To: <942c222b226a5851df90bbc46bb98f1da16ac07a.camel@mediatek.com>
References: <1630476252-2031-1-git-send-email-peter.wang@mediatek.com>
 <942c222b226a5851df90bbc46bb98f1da16ac07a.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_191234_489593_79DA5FE8 
X-CRM114-Status: GOOD (  31.80  )
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

On Wed, 2021-09-01 at 15:35 +0800, Stanley Chu wrote:
> Hi Peter,
> 
> On Wed, 2021-09-01 at 14:04 +0800, peter.wang@mediatek.com wrote:
> > From: Peter Wang <peter.wang@mediatek.com>
> > 
> > Mediatek UFS dbg select setting is changed in new HW version.
> > This patch check the HW version before set dbg select.
> 
> Nits: This patch checks the HW version before setting dbg select.
> > 
> > Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c |   23 +++++++++++++++++++++--
> >  drivers/scsi/ufs/ufs-mediatek.h |    5 +++++
> >  2 files changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
> > b/drivers/scsi/ufs/ufs-
> > mediatek.c
> > index d2c2516..0050e01 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > @@ -296,6 +296,25 @@ static void
> > ufs_mtk_setup_ref_clk_wait_us(struct
> > ufs_hba *hba,
> >  	host->ref_clk_ungating_wait_us = ungating_us;
> >  }
> >  
> > +__no_kcsan
> 
> This is rarely used in mainstream kernel. According to my grep
> results,
> __no_kcsan is only used by kcsan-test itself.
> 
> Besides, dbg select configuration may not be necessary if the mode is
> already configured before? I just wonder that can we avoid setting
> these registers every query?
> 

Yes, will remove __no_kcsan and add a ip_ver in mediatek host struct
to avoid KCSAN warning.
Dbg select value will clear by hci reset. Maybe we cand add a variable
in mediatek host sruct to record if need set dbg select.

> > +static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
> > +{
> > +	static u32 hw_ver;
> > +
> > +	if (!hw_ver)
> > +		hw_ver = ufshcd_readl(hba, REG_UFS_MTK_HW_VER);
> 
> Perhaps you can keep this version in struct host->hw_ver? Maybe you
> need to add a new member in that struct, for example, ip_ver.
> 
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
> > +
> >  static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
> >  				   unsigned long max_wait_ms)
> >  {
> > @@ -305,7 +324,7 @@ static int ufs_mtk_wait_link_state(struct
> > ufs_hba
> > *hba, u32 state,
> >  	timeout = ktime_add_ms(ktime_get(), max_wait_ms);
> >  	do {
> >  		time_checked = ktime_get();
> > -		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
> > +		ufs_mtk_dbg_sel(hba);
> >  		val = ufshcd_readl(hba, REG_UFS_PROBE);
> >  		val = val >> 28;
> >  
> > @@ -1001,7 +1020,7 @@ static void ufs_mtk_dbg_register_dump(struct
> > ufs_hba *hba)
> >  			 "MPHY Ctrl ");
> >  
> >  	/* Direct debugging information to REG_MTK_PROBE */
> > -	ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
> > +	ufs_mtk_dbg_sel(hba);
> >  	ufshcd_dump_regs(hba, REG_UFS_PROBE, 0x4, "Debug Probe ");
> >  }
> >  
> > diff --git a/drivers/scsi/ufs/ufs-mediatek.h
> > b/drivers/scsi/ufs/ufs-
> > mediatek.h
> > index 3f0d3bb..fc40c05 100644
> > --- a/drivers/scsi/ufs/ufs-mediatek.h
> > +++ b/drivers/scsi/ufs/ufs-mediatek.h
> > @@ -15,9 +15,14 @@
> >  #define REG_UFS_REFCLK_CTRL         0x144
> >  #define REG_UFS_EXTREG              0x2100
> >  #define REG_UFS_MPHYCTRL            0x2200
> > +#define REG_UFS_MTK_HW_VER          0x2240
> 
> HW_VER is somehow ambiguous, for example, how about
> REG_UFS_MTK_IP_VER?
> 

Sure, could change naming for easy understand.

> >  #define REG_UFS_REJECT_MON          0x22AC
> >  #define REG_UFS_DEBUG_SEL           0x22C0
> >  #define REG_UFS_PROBE               0x22C8
> > +#define REG_UFS_DEBUG_SEL_B0        0x22D0
> > +#define REG_UFS_DEBUG_SEL_B1        0x22D4
> > +#define REG_UFS_DEBUG_SEL_B2        0x22D8
> > +#define REG_UFS_DEBUG_SEL_B3        0x22DC
> 
> Perhaps the debug select design could be simplified in the future,
> for
> example, driver can query what it wants by reading only one register
> without configuring anything first? Although this is beyond the scope
> of this patch.
> 
> Thanks,
> Stanley Chu
> 
> >  
> >  /*
> >   * Ref-clk control
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
