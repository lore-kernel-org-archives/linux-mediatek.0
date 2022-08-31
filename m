Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE6FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 03:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEdXpcWRw+A+QutbjbtjgcTym0ecB1EdaaG/G32Mcxo=; b=FbXcBY0yKrqUUliS0PKxnjAKzi
	0VHX674GRmCQ4YFdRrLRmFumtq7fla5EdxKvWxfLtV+qyFhVtp/3ZaZw5a3oSdwWKLu0o717DU4yU
	tBCLuT2tgQ3hGaT99lB9f1FdH/WOk6wp9PmPu2UiU7WKiO6FCaa/Lq/1YkL9HnD2JEKwWgXTomJHF
	2Fb+BO50lKM85YtFSDbIJF7rbc+5wzEFY07ObqJnn5NOaCzVKSeO6KUaAPkhdoMIIuKBoD2ah+Z7K
	oh8iu0m65ZWzQ9Y9Ny/xeiCO3xeunMFlq+QnX+nqfKnol+WNydCGGAh8i5iMkUA0TZMArJckaTv+U
	SBcf58HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTEPN-003Vio-Mb; Wed, 31 Aug 2022 03:28:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTEPL-003Vfq-1g; Wed, 31 Aug 2022 03:28:52 +0000
X-UUID: 8f6d24c6ffdf4b5a8bf2262da995ea0d-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PEdXpcWRw+A+QutbjbtjgcTym0ecB1EdaaG/G32Mcxo=;
	b=TH3sLwgr5c0CDrxgk3cXvX1HgaEUoB3T6eC5cq41TkDKvg+lmFvRodZ4JW/tkQdgUAvvZOuz2EqQrAY8UUgYd03LxUQPvVM6v21BIapLtpa7C42kmThRXzRNgYT3rBBkv79ttXF1sML0Zvhw66b6lNEyEQc1gQ/OL/YzoqVBo9I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:6f6a4a45-0a2e-4d7c-823d-4ab8a95ed2d8,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:213b21d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8f6d24c6ffdf4b5a8bf2262da995ea0d-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 702631071; Tue, 30 Aug 2022 20:24:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 11:03:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Aug 2022 11:03:40 +0800
Message-ID: <b77553ac2c9c934abcf3b5e5b5083ad695584c42.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] dt-binding: serial: mediatek,uart: update
 bingding for MT8188
From: Kewei Xu <kewei.xu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <gregkh@linuxfoundation.org>,
	<robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <david-yh.chiu@mediatek.com>
Date: Wed, 31 Aug 2022 11:03:37 +0800
In-Reply-To: <f8a391de-dd47-1eb9-0e15-e6a651517a6f@gmail.com>
References: <20220809084457.31381-1-kewei.xu@mediatek.com>
	 <f8a391de-dd47-1eb9-0e15-e6a651517a6f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_202851_126670_0D876A13 
X-CRM114-Status: GOOD (  17.04  )
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

On Wed, 2022-08-24 at 15:59 +0200, Matthias Brugger wrote:
> 
> On 09/08/2022 10:44, kewei.xu@mediatek.com wrote:
> > From: Kewei Xu <kewei.xu@mediatek.com>
> > 
> > Add a DT binding documentation for the MT8188 soc.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> > ---
> > v2: Resumbit the patch based on the linux-next branch.
> > ---
> >   Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > index 4ff27d6d4d5b..fe098d98af6e 100644
> > --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > @@ -42,6 +42,7 @@ properties:
> >                 - mediatek,mt8173-uart
> >                 - mediatek,mt8183-uart
> >                 - mediatek,mt8186-uart
> > +              - mediatek,mt8188-uart
> >                 - mediatek,mt8192-uart
> >                 - mediatek,mt8195-uart
> >                 - mediatek,mt8516-uart

Hi gregkh,

Just a gentle ping on this.
Could you please give me some suggestion on this patch?

Thank you very much~

BRs,
Kewei Xu



