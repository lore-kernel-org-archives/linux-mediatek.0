Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDB2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:52:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE186229CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE186229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CkA4X7qSYtShlzC3ux2cusDRiYAoO9JV4lvcxEv+nqI=; b=S6nMVcoJDhp8E43uCEzzJi3il
	pC1IFsUJabbiZdCk5sRYCPCxGmYymnFBfl3augnljxCRWldDJTnFX0hZTtLS10oOBUNfNzXtGQFIm
	Pj0R5GeILetwPdai0QhQwDOGjkeSaZupam/9OnslTwA4LgvWcxVBB9O67yM9drEs+Gdg45Bm/rWeL
	BPPdIv4h7B9K2odqd9hws6ET7j0E/0Jobi5PbL/BAzjXnVkBufboMXiZNoO89lgnSOcTuMe7tfwm2
	AhIZpI6ZAa27XhphTfNqxAUCRsOGDZEprnb0BiEftubLdI184uQuGLEkTrdDEbEKDZ5AzGGlfvRAn
	mrQRsvpLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksLQI-0008DE-EX; Thu, 24 Dec 2020 07:52:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksLQE-0008C5-3B; Thu, 24 Dec 2020 07:52:31 +0000
X-UUID: 6b7cfc9ee124433db4426604c1a6b44a-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XmcSpbFGGIQovKKVx+1iNvbAzcfgsju0da6genKEjcw=; 
 b=Ac2qCZCTzAid56KxvYXxirdl7V7zuVAd9tk6CWLDBSLtRYwcHhCX6fJuuKY1VW+cu3ajvJYXYGSo1gigKVD4D/vdmQfYQKlA1+0B8tMod56mf98DaAFKEkN3fxy7oapCOtPoQcRwaYzOMgusmKlchmHcn2dXoAFnk35sFxbcgwM=;
X-UUID: 6b7cfc9ee124433db4426604c1a6b44a-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1768758165; Wed, 23 Dec 2020 23:52:23 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 23:52:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 15:52:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 15:52:12 +0800
Message-ID: <1608796334.14045.21.camel@mtkswgap22>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Thu, 24 Dec 2020 15:52:14 +0800
In-Reply-To: <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 52901DF40C6C4DF0EE1861A72B69F2667DA4021F0F14BFD2EE91E6118E1973B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_025230_357224_9AD45391 
X-CRM114-Status: GOOD (  22.33  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Thu, 2020-12-24 at 10:21 +0800, Can Guo wrote:
> On 2020-12-23 12:41, Can Guo wrote:
> > On 2020-12-23 12:19, Stanley Chu wrote:
> >> Hi Can,
> >> 
> >> On Tue, 2020-12-22 at 19:34 +0800, Can Guo wrote:
> >>> On 2020-12-22 15:29, Stanley Chu wrote:
> >>> > Flush during hibern8 is sufficient on MediaTek platforms, thus
> >>> > enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip enabling
> >>> > fWriteBoosterBufferFlush during WriteBooster initialization.
> >>> >
> >>> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> >>> > ---
> >>> >  drivers/scsi/ufs/ufs-mediatek.c | 1 +
> >>> >  1 file changed, 1 insertion(+)
> >>> >
> >>> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
> >>> > b/drivers/scsi/ufs/ufs-mediatek.c
> >>> > index 80618af7c872..c55202b92a43 100644
> >>> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> >>> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> >>> > @@ -661,6 +661,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
> >>> >
> >>> >  	/* Enable WriteBooster */
> >>> >  	hba->caps |= UFSHCD_CAP_WB_EN;
> >>> > +	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
> >>> >  	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
> >>> >
> >>> >  	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
> >>> 
> >>> I guess we need it too...
> >> 
> >> AHHA, if you decide to add this in your platform too later, maybe we
> >> could change the way it does: Keep manual flush disabled by default 
> >> and
> >> remove this quirk.
> >> 
> > 
> > Yeah... I will get back with an answer later.
> 
> Hi Stanley,
> 
> Do you see any substantial benefit of having fWriteBoosterBufferFlushEn 
> disabled?

1. The definition of fWriteBoosterBufferFlushEn is that host allows
device to do flush in anytime after fWriteBoosterBufferFlushEn is set as
on. This is not what we want.

Just Like BKOP, We do not want flush happening beyond host's expected
timing that device performance may be "randomly" dropped.

2. Another related concern is that currently fWriteBoosterBufferFlushEn
may keep on while device is not in Active Power Mode during suspend
period. I am not sure if such configuration would confuse the device.

Thanks,
Stanley Chu

> 
> Thanks,
> Can Guo.
> 
> > 
> > Thanks,
> > 
> > Can Guo.
> > 
> >> Thanks,
> >> Stanley Chu
> >>> 
> >>> Change LGTM.
> >>> 
> >>> Regards,
> >>> 
> >>> Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
