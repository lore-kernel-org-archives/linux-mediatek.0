Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359C8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 02:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03B5610A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 02:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E03B5610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiZSlV6rPaFqY7duGb//VEdps1ODjFtbcnF4d0HuRik=; b=ALneoieK45keo1
	vbo09Vf/RVKx4d/hcqawcCBVLaBksMY0JfFFhKCIffrB4HOWUQ7boiB9i70+giz7nHFFoLZb97Og3
	Q2uYj6zivBY+ozR+kdlXAYg+3n0ZYbU0YJsEcZ2nVk1i0n+9smU5VlhxjGDYu1queyTu7EFuaFS7R
	mQ9dovfAF2YU4TDpSBp/fhG/ANQhl9c7b+NjpMNU3UhdjRA8XbKFU1KDH4RgSXbcFBWhvuJrFR4Sp
	FV9jDw5mp75Tqsu15ERUOzlQKXn8+XxHYKLSsS94bO0rtMmFNvCAMXJn9C2Y8QVmvdyAp36mcsi0k
	qG2iFXYQApq6qc0Niuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmRhk-00EGuK-H6; Mon, 15 Nov 2021 02:26:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmRhh-00EGtq-KE
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 02:26:43 +0000
X-UUID: c9c5ca2cae524c219a7e6273f8582dba-20211114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5y56Ocv7/pMcHbGFDHQNbV0IpsKwkRaAUiAaJr9x37A=; 
 b=F0Pzf3373x4oj77rTH5ZvKGENFCo15mJD6VOdb1vcoYgmTWoFCwIe7wXTxJu44FINne8HxKZsGvlmZMdp5xLQU04gY1DSukYwFICkEymxds/wEzrqwBX+mrw4TmNsyxf38iuz5O3kbUFOUjZ3IH9DPFjp8sQAcmoDGW4d24mKjQ=;
X-UUID: c9c5ca2cae524c219a7e6273f8582dba-20211114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1558407418; Sun, 14 Nov 2021 19:26:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Nov 2021 18:21:39 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 15 Nov 2021 10:21:38 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 15 Nov 2021 10:21:37 +0800
Message-ID: <8310771bb4e794edf53f45a3c0ddde54ac1c194a.camel@mediatek.com>
Subject: Re: [PATCH v2 04/11] mt76: mt7915: add firmware support for mt7916
From: bo.jiao <bo.jiao@mediatek.com>
To: Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Mon, 15 Nov 2021 10:21:37 +0800
In-Reply-To: <78e7e6ba-6e70-872f-89e9-2d3d095b145f@candelatech.com>
References: <cover.1636105953.git.Bo.Jiao@mediatek.com>
 <694291893593fce99a3ba485fe691e49bd7cf4a7.1636105953.git.Bo.Jiao@mediatek.com>
 <78e7e6ba-6e70-872f-89e9-2d3d095b145f@candelatech.com>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_182641_695124_83DA4EAA 
X-CRM114-Status: GOOD (  22.48  )
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

On Fri, 2021-11-12 at 14:30 -0800, Ben Greear wrote:
> On 11/5/21 3:02 AM, Bo Jiao wrote:
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
> >   .../net/wireless/mediatek/mt76/mt7915/init.c  |  6 --
> >   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 78
> > +++++++++++++++----
> >   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
> >   .../net/wireless/mediatek/mt76/mt7915/pci.c   |  3 +
> >   .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 +-
> >   5 files changed, 72 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > index f455c12..a4e2d85 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > @@ -567,12 +567,6 @@ static int mt7915_init_hardware(struct
> > mt7915_dev *dev)
> >   
> >   	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
> >   
> > -	/*
> > -	 * force firmware operation mode into normal state,
> > -	 * which should be set before firmware download stage.
> > -	 */
> > -	mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
> > -
> >   	ret = mt7915_mcu_init(dev);
> >   	if (ret) {
> >   		/* Reset and try again */
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > index ee9952d..43ddbc1 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > @@ -2713,16 +2713,20 @@ static int mt7915_mcu_start_patch(struct
> > mt7915_dev *dev)
> >   				 sizeof(req), true);
> >   }
> >   
> > -static int mt7915_driver_own(struct mt7915_dev *dev)
> > +static int mt7915_driver_own(struct mt7915_dev *dev, u8 band)
> >   {
> > -	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND0,
> > MT_TOP_LPCR_HOST_DRV_OWN);
> > -	if (!mt76_poll_msec(dev, MT_TOP_LPCR_HOST_BAND0,
> > +	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND(band),
> > MT_TOP_LPCR_HOST_DRV_OWN);
> > +	if (!mt76_poll_msec(dev, MT_TOP_LPCR_HOST_BAND(band),
> >   			    MT_TOP_LPCR_HOST_FW_OWN_STAT,
> 
> I think that MT_TOP_LPCR_HOST_FW_OWN_STAT is not defined in the
> upstream kernel...
> 
> Maybe a patch from owrt was not added to upstream yet?
> 
> Thanks,
> Ben
> 
> 
> 
This definition is available on the latest mt76 version
#define MT_TOP_LPCR_HOST_FW_OWN_STAT	BIT(2)

thanks
Bo Jiao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
