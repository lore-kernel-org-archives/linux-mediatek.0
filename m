Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4843BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 10:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D978610D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 10:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D978610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUbkC7wKFDwbvyWLoNGRKpwnNYr8WGr5MR+To6XB2xY=; b=WK1icx/U2dlTJO
	oysTdg4p8NMEN8betXXi48ocqBhTls1/MXcvUgFU8foK+3u9p9ezq96JPvQcSqbGsUh2Z8oLPxI9G
	S7XIUKWuAuAJy95mRn2FLw4EsQobjidqjHgBZxPpxr+lnC+yEHOjTVgALX4JmLzR3y4BbdFpuag8x
	FG5p2j4/mPf7Nv6ctJE5epvBZZvKeHwcYlugAQTP2P1pzEQS1GOefbi0omLXoRO44bJDiKIU7BrBH
	LOtWlH1Oc32BNFjgteiu4QiU6x2YcmsVCJZB1yM2K2PANz3Ct4cF10BDDiwXZC1sLkLlFmOtMdy8h
	/jsDZEXTLuMtKkqYgdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdrYJ-00AV65-1O; Fri, 22 Oct 2021 10:13:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdrYG-00AV5i-Cl; Fri, 22 Oct 2021 10:13:29 +0000
X-UUID: 239a0d4836e446a1a58226d303dfa3e8-20211022
X-UUID: 239a0d4836e446a1a58226d303dfa3e8-20211022
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 448506753; Fri, 22 Oct 2021 03:13:25 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 03:13:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 18:13:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 18:13:22 +0800
Message-ID: <29992126d39a7f381a516fdb9cd6e39f1e51afdb.camel@mediatek.com>
Subject: Re: [PATCH v11 09/16] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Yongqiang
 Niu" <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Fri, 22 Oct 2021 18:13:22 +0800
In-Reply-To: <8b509551-7cfa-f55c-fc0f-db7d0a3886eb@collabora.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-10-jason-jh.lin@mediatek.com>
 <8b509551-7cfa-f55c-fc0f-db7d0a3886eb@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_031328_491774_1B8A6B0C 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Angelo,

Thanks for the reviews.


On Thu, 2021-10-14 at 16:05 +0200, AngeloGioacchino Del Regno wrote:
> > Add mt8195 vdosys0 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 

[snip]

> >  
> > ---
> 
> Hello Jason,
> thanks for the patch! However, there are a few things to improve:
> 

[snip]

> > +#define MT8195_VDO0_SEL_IN					0xf34
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 <<
> > 0)
> 
> Bitshifting 0 by 0 bits == 0, so this is simply 0.
> 
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 <<
> > 0)
> 
> I would write 0x1 here
> 
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 <<
> > 0)
> 
> ....and 0x2 here: bitshifting of 0 bits makes little sense.
> 
> > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		
> > (0 << 4)
> 
> Bitshifting 0 by 4 bits is still 0, so this is again 0.
> This is repeated too many times, so I will not list it for all of the
> occurrences.
> 
> > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 <<
> > 4)
> 
> This is BIT(4).
> 
> > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		
> > (0 << 5) > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE	
> > 	(1 << 5)
> 
> ...and this is BIT(5)
> 
> > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 <<
> > 8)
> > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		
> > (1 << 8)
> 
> BIT(8)
> 
> > +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		
> > (0 << 9)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 <<
> > 12)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			
> > (1 << 12)
> 
> BIT(12)
> 
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 <<
> > 12)
> 
> BIT(13)
> 
> ... and please, use the BIT(nr) macro for all these bit definitions,
> it's way more
> readable like that.
> 
> Regards,
> - Angelo

Because the HW register design of MT8195_VDO0_SEL_IN 0xf34 is like
this:

bit[1:0] as MT8195_SEL_IN_VPP_MERGE and
  value: 0 as MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
  value: 1 as MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1
  value: 2 as MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
bit[4:4] as MT8195_SEL_IN_DSC_WRAP0_IN and
  value 0 as MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
  value 1 as MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE
bit[5:5] as MT8195_SEL_IN_DSC_WRAP1_IN and
  value 0 as
MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
  value 1 as
MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
and so on...

I think using BIT(nr) macro directly is not easy to debug.


Is it better to define another MACRO like this?

#define BIT_VAL(val, bit)  ((val) << (bit))
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0  BIT_VAL(0, 4)
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE  BIT_VAL(1, 4)
...

or

#define MT8195_SEL_IN_DSC_WRAP0_IN (4)
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0  (0
<< MT8195_SEL_IN_DSC_WRAP0_IN)
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE  (1 <<
MT8195_SEL_IN_DSC_WRAP0_IN)
...

What do you think?


Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
