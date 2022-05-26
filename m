Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 06:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vE6CkVzECEb7/R6mDYT0QnWw+71sjGRYGARsj8MGP/4=; b=FiC6JE5rfJLbY8
	p5WXaOGGfsMgy0R9mgkKOmQ2zm8hma8s8eh7XAOpt5dbx59fYM0I5qsyPjbWfN4m8UXu53mqVj3Cx
	rZjvl0WvH4uuGYMDvxKqoIABvGKVuLXfZXz+ljCWF4BOGNn844TevzY7RDb6jV9N6I97mncNeZa4L
	OaZFHelw0rGs8KmB9k7QfDCfuHCSbZYpVVtd3eI/EURmLgHmjjd0Zc+imwu2j27g3HPtRso5Ta5Dm
	zlpMlnbOl6eA0M9wkkoq4nI652qqFg26yFQdtHfbGEz9i++ZPjbG6901Z7OvxuvHy1V8FHxvWpcAv
	lk94sI+AiPE8H7XjpiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6Zu-00Da34-7W; Thu, 26 May 2022 06:02:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6Za-00DZxN-2e; Thu, 26 May 2022 06:02:16 +0000
X-UUID: f1543c9becb246c09a1f1fe533189345-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:56a834d7-9abe-4201-a13a-c598a26b5bf7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:05f18947-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: f1543c9becb246c09a1f1fe533189345-20220525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 651136604; Wed, 25 May 2022 23:02:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 22:54:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 26 May 2022 13:54:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 13:54:44 +0800
Message-ID: <36568582407c2513028bdd6669b9a6147ebd6132.camel@mediatek.com>
Subject: Re: [PATCH v3 4/4] soc: mediatek: svs: add support for mt8195
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
	<roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Thu, 26 May 2022 13:54:44 +0800
In-Reply-To: <d9563b65-2391-d32c-8a07-ca7a13cae7c7@collabora.com>
References: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
	 <20220523084034.26802-5-jia-wei.chang@mediatek.com>
	 <d9563b65-2391-d32c-8a07-ca7a13cae7c7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_230214_170907_866D1BC5 
X-CRM114-Status: GOOD (  16.77  )
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

On Mon, 2022-05-23 at 11:38 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 10:40, Tim Chang ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > To support svs on MT8195, add corresponding bank information,
> > platform
> > data, probe and parsing function.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> 
> 
> > ---
> >   drivers/soc/mediatek/mtk-svs.c | 151
> > +++++++++++++++++++++++++++++++++
> >   1 file changed, 151 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-svs.c
> > b/drivers/soc/mediatek/mtk-svs.c
> > index 656d0361ff7d..bb5021648143 100644
> > --- a/drivers/soc/mediatek/mtk-svs.c
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> > @@ -1680,6 +1680,89 @@ static int svs_bank_resource_setup(struct
> > svs_platform *svsp)
> 
> ..snip..
> 
> > @@ -2559,6 +2697,16 @@ static struct svs_bank svs_mt8183_banks[] =
> > {
> >   	},
> >   };
> >   
> > +static const struct svs_platform_data svs_mt8195_platform_data = {
> > +	.name = "mt8195-svs",
> > +	.banks = svs_mt8195_banks,
> > +	.efuse_parsing = svs_mt8195_efuse_parsing,
> > +	.probe = svs_mt8192_platform_probe,
> > +	.irqflags = IRQF_TRIGGER_HIGH,
> 
> Interrupt flags are specified in devicetree; avoid declaring
> irqflags.
> 
> After that:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hi Angelo,

Sure, I will remove it in the next version.
Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
