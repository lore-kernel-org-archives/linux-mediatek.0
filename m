Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EA4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCNi/1Rh86k+5y/2zc9AxL5fxVTCZdKmYe/9i35yDuM=; b=BTQi6ph3wI8272
	+t5GsKSY99+RYLYxu8mat+QYcOS+ND8rDeXEuY/zUMgvPRZApTnLlR9VI+2ROviO5c+1X81nw7vgo
	Us8U1MLJvFC4zmThYoIgfVmEroZi6qvH5995HsZFLrguddr3bWObDdGVq2rBoWESzJMZDXtLtu6Ry
	37jEnEwnKq0F97cx9pldIMwVHscChFLhRNORg85DCNbHM2PpQjN1O5sixoT9wuC1o6FqsxCOg0Xzg
	jMztfA5uTdik+kXUh8adoaiBma9dEoD85Bf/qLa0s3BZNfGUZ7BycHyUOaNVdB40L1PF7BwSmhGpT
	74OiJMqChdgfjre+aLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9kkU-000tcg-Fu; Tue, 18 Jan 2022 09:25:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9kkP-000taJ-LN; Tue, 18 Jan 2022 09:25:52 +0000
X-UUID: 2c91aef4e179466dabaa03a35201a581-20220118
X-UUID: 2c91aef4e179466dabaa03a35201a581-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1357388764; Tue, 18 Jan 2022 02:25:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 01:25:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 18 Jan 2022 17:25:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 17:25:25 +0800
Message-ID: <544f5085fc8597ce9ce3eb7dc1b5d08fb1ac8755.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] soc: mediatek: pwrap: add pwrap driver for
 MT8186 SoC
From: Johnson Wang <johnson.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <angelogioacchino.delregno@collabora.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 18 Jan 2022 17:25:25 +0800
In-Reply-To: <9949a1f7-1ed5-a137-c7b9-2ef8d8e1caf8@gmail.com>
References: <20220107104633.7500-1-johnson.wang@mediatek.com>
 <20220107104633.7500-2-johnson.wang@mediatek.com>
 <9949a1f7-1ed5-a137-c7b9-2ef8d8e1caf8@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_012549_772665_F8916CCA 
X-CRM114-Status: GOOD (  25.44  )
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

Hi Matthias,

On Fri, 2022-01-14 at 16:46 +0100, Matthias Brugger wrote:
> 
> On 07/01/2022 11:46, Johnson Wang wrote:
> > MT8186 are highly integrated SoC and use PMIC_MT6366 for
> > power management. This patch adds pwrap master driver to
> > access PMIC_MT6366.
> > 
> 
> It seems this new arbiter is significantly different from the version
> 1. Please 
> explain that in the commit message.
> 
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-pmic-wrap.c | 72
> > ++++++++++++++++++++++++++++
> >   1 file changed, 72 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > index 952bc554f443..78866ebf7f04 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -30,6 +30,7 @@
> >   #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) &
> > 0x00000001)
> >   #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
> >   #define PWRAP_STATE_INIT_DONE0		BIT(21)
> > +#define PWRAP_STATE_INIT_DONE0_V2	BIT(22)
> 
> That's a strange name, does it come from the datasheet description?

Thanks for your review.

No, there is only PWRAP_STATE_INIT_DONE0 in MT8186 datasheet.
However, it's the 22nd bit in MT8186 and the 21st bit in other SoCs.
So we changed its name to avoid redefinition of PWRAP_STATE_INIT_DONE0.

Could you give us some suggestion on proper definition naming?
Do you think PWRAP_STATE_INIT_DONE0_MT8186 will be a better choice?

> 
> >   #define PWRAP_STATE_INIT_DONE1		BIT(15)
> >   
> >   /* macro for WACS FSM */
> > @@ -77,6 +78,8 @@
> >   #define PWRAP_CAP_INT1_EN	BIT(3)
> >   #define PWRAP_CAP_WDT_SRC1	BIT(4)
> >   #define PWRAP_CAP_ARB		BIT(5)
> > +#define PWRAP_CAP_MONITOR_V2	BIT(6)
> 
> Not used capability, please delete.
> 
> 
> Regards,
> Matthias

PWRAP_CAP_MONITOR_V2 is not used right now.
We can remove it in next version.
But this capability will be added when we need it.

Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
