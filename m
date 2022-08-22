Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0030AC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQD9gzPecKAX3WUKFQ5gMqHbRvP/px4o2I2t3g4HB8E=; b=FKIym5um108CXINmxv9rSzKBEW
	fVpfFo9Xox+nGhLAuvWTWg802RYh6ECXd+rH1nEJi0l/Y18mZh0pRItfJtj75JoLufpgI6ISO+oHV
	jNQ9Hvyz5pYQxcOp81Q8f//B159KrPWa4IL3wDlNSKTAGZKuS6iIIdQMHZ8ZvZjudLxNNo2iRUPR1
	hWbaMd4lbWpJMGEk066WJTFQ9ucPSFMLUMChKPkp5eh2/4BfqKRMHJVfvETXSho0rch03tel6K6mY
	aZ+PyseQiqRD/Bn0/h9e1lHJyZDMekm1Nih0wgFSiq8m41WYdJJpjAvjkuUQeUjqC8EIAYzRUf8qI
	hURT7pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7qa-00ANtt-Mk; Mon, 22 Aug 2022 13:52:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7qG-00ANeO-1h; Mon, 22 Aug 2022 13:51:49 +0000
X-UUID: 3ec0083e1fde40eeab1f84f720923287-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EQD9gzPecKAX3WUKFQ5gMqHbRvP/px4o2I2t3g4HB8E=;
	b=OiT+Txk5kdDVXfPvOyWY/X7A2D6LElJLb7v2qNUv7K4EhGZN0eDm+w/MQuVp8lnsDZyoDMQ+Ex9bS60udUrmn7VSAQ6ORCfgsa8DrlLIxrZxw5rK15GQVrIKVVUhdkkJH2vobcSF2IJnL/2aufGgMZiW0OWdut/KbJKz1kEC260=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0ff4d1c5-d46d-4c61-9d9d-9c5373f4c0c9,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:881c3ecf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3ec0083e1fde40eeab1f84f720923287-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 834819470; Mon, 22 Aug 2022 06:51:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 20:50:32 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 20:50:31 +0800
Message-ID: <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Mon, 22 Aug 2022 20:50:45 +0800
In-Reply-To: <20220819185400.aokd53xln6rmc3xk@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
	 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
	 <20220819185400.aokd53xln6rmc3xk@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_065148_118467_285A84B0 
X-CRM114-Status: GOOD (  17.84  )
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

On Fri, 2022-08-19 at 14:54 -0400, Nícolas F. R. A. Prado wrote:
> Hi Xinlei,
> 
> On Fri, Aug 05, 2022 at 05:57:40PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add mmsys func to manipulate dpi output format config for MT8186.
> 
> func -> function
> config -> configuration
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> 
> Same thing about the co-developed-by.
> 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > ---
> >  drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
> >  drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
> >  include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
> >  3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index eb1ad9c37a9c..620c062e4893 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -3,6 +3,7 @@
> >  #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> >  #define __SOC_MEDIATEK_MT8186_MMSYS_H
> >  
> > +#define MT8186_DPI_OUTPUT_FORMAT		0X400
> 
> 0x400
> 
> (lowercase "x")
> 
> >  #define MT8186_MMSYS_OVL_CON			0xF04
> >  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> >  #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 9bbf0103b225..0e71a3296046 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >  
> > +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32
> > val,
> 
> confing -> config
> 
> But I'd add something to the name to indicate it handles specifically
> the
> format:
> 
> mtk_mmsys_ddp_dpi_fmt_config
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for your careful review.
I will correct it in the next version:
1. Modify key nouns in the description;
2. Modify the label of jitao to Co-developed-by;
3. Macro definition address lowercase problem and function naming.

If there are no other questions, I will send out the second edition in
the near future.

Best Regards!
xinlei


