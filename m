Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4807CCA479
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 00:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEM4s0Mrx3+YaI+qPUH+HVBLnDrzIWKTOXBQ2cSEkrE=; b=yV8YvhIhNuMQn4P46duEq+kRgC
	bzJfdyUlCQW+yeRav9DhHv3aV7NC+5NzQ6+EJuA7uNE6ajHsx9vbjaGnfe8zvCgMyJb8oGuVX26VA
	aOTpDgLlTOmaZNVKgak/MMXEWpv9hFd6eqoxKN+VpCmVVH3CXf55meQH8xmrw9hGbzlDCnpY7Zs6P
	oajoPguck0wJRTtdsV1llkHCCBLufBmSejx2ne+PV/VYSSCSZv4vCmHMN1Ew+5BCIgXPkv184s3GC
	i596V+3vX8iAsqBlDuz7U98obUUSHp03c0ln7Sery8726L0ciOHc9hL99q3ytX+FxX5KRnqXyHGJP
	d55poNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Ax6-00CcUo-3w; Thu, 23 Jun 2022 00:44:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Awu-00CcRw-P8; Thu, 23 Jun 2022 00:43:58 +0000
X-UUID: cced1b55f96d4f5991ea62c809f94f30-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d5a74a67-64a0-457c-b3c2-dcab18cf93a8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:5c38ca2d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: cced1b55f96d4f5991ea62c809f94f30-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 454118656; Wed, 22 Jun 2022 17:43:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 17:33:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 08:33:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 23 Jun 2022 08:33:46 +0800
Message-ID: <66d3a7719eb7797acfe3ccfd8ed0f710ea384023.camel@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mutex: add suffix 0 to
 DDP_COMPONENT_DITHER for mt8395
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Fabien Parent <fparent@baylibre.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 23 Jun 2022 08:33:45 +0800
In-Reply-To: <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
References: <20220622131952.29583-1-jason-jh.lin@mediatek.com>
	 <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_174356_890151_434AD255 
X-CRM114-Status: GOOD (  22.79  )
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

Hi Angelo,

Yes, I missed that!
So just forget about this patch and use yours.

Thanks for your help :)

Regard,
Jason-JH.Lin

On Wed, 2022-06-22 at 15:31 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/06/22 15:19, Jason-JH.Lin ha scritto:
> > Add suffix 0 to DDP_COMPONENT_DITHER for mt8395.
> > 
> > Fixes: 141311b856d8 ("soc: mediatek: mutex: add MT8365 support")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
> 
> Hello Jason-JH,
> 
> you must've missed my commit, sent two days ago, which is doing the
> same:
> 
> 
https://lore.kernel.org/lkml/20220620102454.131417-1-angelogioacchino.delregno@collabora.com/T/#u
> 
> Anyway, I have avoided to rename the definition, as from what I
> understand
> MT8365 has only one dither mod and that's called "DITHER", not
> "DITHER0"...
> ...but I've added the suffix to the array assignment, as that's what
> we have
> in the enumeration.
> 
> I think that #define MT8365_MUTEX_MOD_DISP_DITHER should be kept as-
> is.
> 
> Also... this commit is not fixing anything, as it was already working
> before,
> so the Fixes tag shouldn't be present.
> 
> Regards,
> Angelo
> 
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index fa8e0ba38803..3b25fd6b91aa 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -130,7 +130,7 @@
> >   #define MT8365_MUTEX_MOD_DISP_CCORR		13
> >   #define MT8365_MUTEX_MOD_DISP_AAL		14
> >   #define MT8365_MUTEX_MOD_DISP_GAMMA		15
> > -#define MT8365_MUTEX_MOD_DISP_DITHER		16
> > +#define MT8365_MUTEX_MOD_DISP_DITHER0		16
> >   #define MT8365_MUTEX_MOD_DISP_DSI0		17
> >   #define MT8365_MUTEX_MOD_DISP_PWM0		20
> >   #define MT8365_MUTEX_MOD_DISP_DPI0		22
> > @@ -358,7 +358,7 @@ static const unsigned int
> > mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >   	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
> >   	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
> >   	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
> > -	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
> > +	[DDP_COMPONENT_DITHER0] = MT8365_MUTEX_MOD_DISP_DITHER0,
> >   	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
> >   	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
> >   	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


