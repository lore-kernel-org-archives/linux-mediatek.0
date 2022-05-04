Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72134C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 10:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42NzkWF1+2/dgtgJXzalQj9bhqcp70Jr201ZYIiIxa8=; b=n5SEa7fo7UclJ+
	4Uzk8EPygbyZ8cAAcka4pf4hy0l68L0WD61O71iusW+T57J0dbV3XqdgV7f6+Q8oT5wXJpyInSobr
	9ZGoDyEKgPUD4q2/nDqCbSIw8Ix1Tmg0626wnvy5rixwUUBO2d80wuSj9QPu4gIgjDcJaMgoZmZZe
	5YUQjL/i3ZnT5FFVszNborQDUzIyngoNyzuZo37UPw57reW7GHk0zsas6YNbSz+toR/mqqqe2fZ+0
	QgcgOVjKBViAisLzTxWwtC7GXeGKGEy841TkspLTf+wVHCXnH6N9o15M+ojlZe2TgoRouiex8gf7T
	M+LxbLCvkc1ruGZvZ9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmCc4-00ALQa-S1; Wed, 04 May 2022 10:52:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmCc2-00ALPL-1U; Wed, 04 May 2022 10:52:07 +0000
X-UUID: d0041effcf594ebb8b39d9cf85151618-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:28e5ee82-5ca2-4d09-b795-296090de5260, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:6fc62916-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d0041effcf594ebb8b39d9cf85151618-20220504
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1639456155; Wed, 04 May 2022 03:51:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 03:51:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 18:51:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 18:51:56 +0800
Message-ID: <a70c96248f7bc22b9f7f247f59ceafed17d912e0.camel@mediatek.com>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: Add support for MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>
CC: <neal.liu@mediatek.com>, <runyang.chen@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 4 May 2022 18:51:55 +0800
In-Reply-To: <3bd77be6-82ea-8c24-242a-0ee486ce888c@collabora.com>
References: <20220429065429.7957-1-rex-bc.chen@mediatek.com>
 <20220429065429.7957-3-rex-bc.chen@mediatek.com>
 <3bd77be6-82ea-8c24-242a-0ee486ce888c@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_035206_133404_A9243054 
X-CRM114-Status: GOOD (  19.25  )
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

On Wed, 2022-05-04 at 11:34 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/04/22 08:54, Rex-BC Chen ha scritto:
> > Add devapc data and compatible to support MT8186 devapc.
> > 
> > Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-devapc.c | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c
> > b/drivers/soc/mediatek/mtk-devapc.c
> > index 7c65ad3d1f8a..762e0e4d967d 100644
> > --- a/drivers/soc/mediatek/mtk-devapc.c
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -227,10 +227,25 @@ static const struct mtk_devapc_data
> > devapc_mt6779 = {
> >   	.vio_shift_con_offset = 0xF20,
> >   };
> >   
> > +static const struct mtk_devapc_data devapc_mt8186 = {
> > +	.vio_idx_num = 519,
> > +	.vio_mask_offset = 0x0,
> > +	.vio_sta_offset = 0x400,
> > +	.vio_dbg0_offset = 0x900,
> > +	.vio_dbg1_offset = 0x904,
> > +	.apc_con_offset = 0xF00,
> > +	.vio_shift_sta_offset = 0xF10,
> > +	.vio_shift_sel_offset = 0xF14,
> > +	.vio_shift_con_offset = 0xF20,
> > +};
> 
> Hello Rex,
> since the register layout is common across a lot of MediaTek SoCs and
> basically
> only the vio_idx_num wildly varies between them, can you separate
> this parameter
> from the mtk_devapc_data struct?
> 
> I propose the following:
> 
> struct mtk_devapc_regs {
> 	/* reg offset */
> 	u32 vio_mask_offset;
> 	u32 ... etc
> };
> 
> struct mtk_devapc_data {
> 	u32 vio_idx_num;
> 	const struct mtk_devapc_regs *regs;
> };
> 
> static const struct mtk_devapc_regs devapc_regs_mt6779 = {
> 	.vio_mask_offset = 0x0,
> 	.vio...etc
> };
> 
> static const struct mtk_devapc_data devapc_mt6779 = {
> 	.vio_idx_num = 511,
> 	.regs = devapc_regs_mt6779,
> };
> 
> static const struct mtk_devapc_data devapc_mt8186 = {
> 	.vio_idx_num = 519,
> 	.regs = devapc_regs_mt6779,
> };
> 
> Regards,
> Angelo
> 

Hello Angelo,

Thanks for your advise.
I will separate vio_idx_num and register offsets in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
