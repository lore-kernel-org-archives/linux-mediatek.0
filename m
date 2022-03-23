Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6788DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TzuaKfPSEfg5pLhvZbYHX91G1shFUlztIsraHC4DAY=; b=S/64YB1uvddjuk
	WxmjBLY5AzRUER8/XcuvgkhGoyPPaZEjfi64tmrkUb3r+ylDZKkSH7s4FoDc1vc2RtoHo6hQU6tbf
	f6HQMfueCdr/C1GWbYpKKeqFzTGbRLU448Sue6DsYS2BTj+R0RKGm0L2kpgY11iF3tO+VGaRc2/bI
	DSz3UA6ZjaD1CCEOVA31gN0QbSnMefRdW9al+aDv0RjfeezTHgaXfqNCHgjLVY8Sd2AFjjsOwWgdE
	3v6xmUdc9728XpBdz687sBI9cXWwrg3wXJRR8e+lllaJb7zO2G93Z6eWQ+lHgAZ2tEO6/Pf3CDXw7
	LChkzWJy35Y7ZQV/ev9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWvPO-00CzaX-TW; Wed, 23 Mar 2022 07:27:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWvPM-00CzYm-AP; Wed, 23 Mar 2022 07:27:53 +0000
X-UUID: 2abdf6cce87a45fdaada446204a555dd-20220323
X-UUID: 2abdf6cce87a45fdaada446204a555dd-20220323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1990736411; Wed, 23 Mar 2022 00:27:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 00:27:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Mar 2022 15:27:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 15:27:38 +0800
Message-ID: <f7fa502776ce2d28553238fb10289f07de0a1d77.camel@mediatek.com>
Subject: Re: [PATCH v3 3/6] ASoC: dt-bindings: mediatek: mt8195: merge
 mt8195 machine yaml
From: Trevor Wu <trevor.wu@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <aaronyu@google.com>, <alsa-devel@alsa-project.org>,
 <angelogioacchino.delregno@collabora.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <tiwai@suse.com>,
 <tzungbi@google.com>, <yc.hung@mediatek.com>
Date: Wed, 23 Mar 2022 15:27:39 +0800
In-Reply-To: <20220321233045.22156-1-miles.chen@mediatek.com>
References: <20220321072312.14972-4-trevor.wu@mediatek.com>
 <20220321233045.22156-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_002752_372541_30203134 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, 2022-03-22 at 07:30 +0800, Miles Chen wrote:
> Hi Trevor,
> 
> >  
> > -title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound
> > card driver
> > +title: Mediatek MT8195 ASoC sound card driver
> 
> s/Mediatek/MediaTek/
> 
> Thanks,
> Miles

OK. I will update it in v4.

Thanks,
Trevor

> >  
> >  maintainers:
> >    - Trevor Wu <trevor.wu@mediatek.com>
> > @@ -14,7 +14,9 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    const: mediatek,mt8195_mt6359_rt1019_rt5682
> > +    enum:
> > +      - mediatek,mt8195_mt6359_rt1019_rt5682
> > +      - mediatek,mt8195_mt6359_rt1011_rt5682
> >  
> >    model:
> >      $ref: /schemas/types.yaml#/definitions/string


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
