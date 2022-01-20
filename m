Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6971C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 21:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O30upPb/j+2O8njTI3M+Fzt0ggp12A3UmehyxxA3QQY=; b=vWBTsyh3W1CcjH
	hs1AgXfLMHGW7yuawa/DsKcmQoMFgK95K3mwE5KVMEYNCy6QKTMztFF1mYE7+v6jeWG4OOpt+U5FA
	BXMaYsl1ntZvDLWYoHD/7YRKU3bqZXI3E6+Lnvtnf/KpknW+Jwd3zozl4VId1hoMNlXWNmNffTp/z
	ZoClCBoDVLAlVIKhNl9y1UjL3fSH2BTtuuS6OsZyCkhvkvAZKSsK38maBbr6QPyeQycnnFNfxzQD4
	+MPaC6kS8pzPAocnFoiF8spKU0A/Au4PmnGrXzEHwFOu+Wgv2eMq5CklKpESH6r6S1RcMOw7moOmf
	YOvRz1sI/tde3z/5DixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAf95-00DDYg-C8; Thu, 20 Jan 2022 21:39:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAf91-00DDW9-DJ
 for linux-mediatek@lists.infradead.org; Thu, 20 Jan 2022 21:39:02 +0000
X-UUID: b4f7d115f19b499b8f743cbe8915ca74-20220120
X-UUID: b4f7d115f19b499b8f743cbe8915ca74-20220120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 927385717; Thu, 20 Jan 2022 14:38:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Jan 2022 13:38:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 21 Jan 2022 05:38:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Jan 2022 05:38:52 +0800
Message-ID: <4e35b66a36f7dc48397f0e2f8941cbd031b29bcb.camel@mediatek.com>
Subject: Re: [PATCH v4 05/12] mt76: mt7915: add firmware support for mt7916
From: Ryder Lee <ryder.lee@mediatek.com>
To: Ben Greear <greearb@candelatech.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Xing Song
 <xing.song@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Fri, 21 Jan 2022 05:38:52 +0800
In-Reply-To: <edd5b78c-5277-e192-b404-1b771e1a5242@candelatech.com>
References: <cover.1639965732.git.Bo.Jiao@mediatek.com>
 <6b2d86cbbe6426a5ed0d91b8248b95ac3390885f.1639965732.git.Bo.Jiao@mediatek.com>
 <edd5b78c-5277-e192-b404-1b771e1a5242@candelatech.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_133859_500244_2FE1BD45 
X-CRM114-Status: GOOD (  24.10  )
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

On Thu, 2022-01-20 at 13:29 -0800, Ben Greear wrote:
> On 12/19/21 6:17 PM, Bo Jiao wrote:
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > 
> > Update firmware initialization for mt7916.
> > This is an intermediate patch to add mt7916 support.
> > 
> > Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> > ---
> > v3:
> > - modify the function mt7915_wfsys_reset to support mt7916
> > ---
> >   .../net/wireless/mediatek/mt76/mt7915/init.c  | 75 ++++++++----
> > -----
> >   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 81
> > +++++++++++++++----
> >   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
> >   .../net/wireless/mediatek/mt76/mt7915/pci.c   |  3 +
> >   .../net/wireless/mediatek/mt76/mt7915/regs.h  |  6 +-
> >   5 files changed, 115 insertions(+), 54 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > index 2da342d..edf0d7e 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > @@ -511,41 +511,53 @@ static void mt7915_init_work(struct
> > work_struct *work)
> >   
> >   static void mt7915_wfsys_reset(struct mt7915_dev *dev)
> >   {
> > -	u32 val = MT_TOP_PWR_KEY | MT_TOP_PWR_SW_PWR_ON |
> > MT_TOP_PWR_PWR_ON;
> > +	u32 val;
> >   
> >   #define MT_MCU_DUMMY_RANDOM	GENMASK(15, 0)
> >   #define MT_MCU_DUMMY_DEFAULT	GENMASK(31, 16)
> > +	if (is_mt7915(&dev->mt76)) {
> > +		mt76_wr(dev, MT_MCU_WFDMA0_DUMMY_CR,
> > MT_MCU_DUMMY_RANDOM);
> > +
> > +		/* change to software control */
> > +		val |= MT_TOP_PWR_SW_RST;
> > +		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
> 
> val is not properly initialized in this path.  I also notice this is
> not the version of the patch
> that was applied to nbd's tree.  The 'else nic is 7916' clause that
> this patch creates is also different
> in nbd's tree vs this patch.
> 
He sent a follow up to fix this and had been folded into nbd's tree.

Ryder


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
