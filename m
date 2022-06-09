Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1793EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 03:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+fIdAu9Ek/FOCqh5cb2HpJrRMMHTloZG4j6nXlKTJI=; b=YFdECBmkPYnkrz
	cqc7NtxaiEtlC7FeqRxEY300ic2QAKZvql0nCDP+59VYRg7erH4R5PYWK6qjNk9xd5uIAJ81EsIqZ
	qF1ovdzNOEhGJT23Cdq5WDO1mpJjadAsY4Jkfk5pTw4xWaDqyJ2f673fT4D7qczWRpX57Tpay5ZfK
	yWcTqQfkf1edH5IHGCQIRv8+2bACoJThwPM0/AGIfKFn9utzjiElrMDnVHMddtPrO2BHIeFKXyBXq
	eY5G7FJUmT8yswTzB8n/LJoB7xE7Cq83He8vqxOBd4fFKfbJx1QwU0m0NRBTHJvLSiBwe5xHQ4VJ6
	TuS1wZX5gZaG+528IgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz8Tp-00Fozu-Ra; Thu, 09 Jun 2022 03:05:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz8Tm-00Foyy-Ro; Thu, 09 Jun 2022 03:05:04 +0000
X-UUID: 5e49a64ef5a6476fa2ad6fb76a7f85f8-20220608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=s7K2qemJe7f4eRHsdX0icqSRDYLlxTAQomJS4QN/1N8=;
	b=W76bWPdbw6Akll5sE3qxT560xhM2YpbWAnWyZk9wjGyeNXXXRtwR9Usmq+Q3TsRCjYulVO+WnkCS2naNpALLISY0K21E/a0FjSFTbWGx/2iCSBNcdZb1N3VsWT7U1gBUKrfntFJdkea9WK4jGHUC1Ll53SrIJ9q2PsHKhGiiIgs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:bcca3df5-5287-4e38-891d-3cc3c0fb11fc,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:310fb97e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 5e49a64ef5a6476fa2ad6fb76a7f85f8-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 667442104; Wed, 08 Jun 2022 20:04:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 19:58:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Jun 2022 10:58:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jun 2022 10:58:42 +0800
Message-ID: <b3ab001a4a28767cf4f8a5b330b11ead80c5d48e.camel@mediatek.com>
Subject: Re: [PATCH v6 2/8] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>,
	<aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
	<tzungbi@google.com>, <julianbraha@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 9 Jun 2022 10:58:42 +0800
In-Reply-To: <YqCG+9YkuXsDeh/I@sirena.org.uk>
References: <20220607142046.28060-1-jiaxin.yu@mediatek.com>
	 <20220607142046.28060-3-jiaxin.yu@mediatek.com>
	 <YqCG+9YkuXsDeh/I@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_200502_952351_44198BE5 
X-CRM114-Status: GOOD (  13.82  )
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

On Wed, 2022-06-08 at 12:24 +0100, Mark Brown wrote:
> On Tue, Jun 07, 2022 at 10:20:40PM +0800, Jiaxin Yu wrote:
> 
> > +obj-$(CONFIG_SND_SOC_MT8186) += snd-soc-mt8186-afe.o
> > +obj-$(CONFIG_SND_SOC_MT8186_MT6366_DA7219_MAX98357) += mt8186-
> > mt6366-da7219-max98357.o
> > +obj-$(CONFIG_SND_SOC_MT8186_MT6366_RT1019_RT5682S) += mt8186-
> > mt6366-rt1019-rt5682s.o
> 
> This breaks bisection - these drivers are being added to the build
> here
> but the relevant source files aren't added until later on in the
> series
> so the commits in between won't build when the relevant Kconfig
> options
> are selected.  The Makefile and Kconfig updates should be moved into
> the
> driver patches.

I see, this is to ensure the independence of each patch. I will move
the Kconfig and Makefile changes related to the machine driver to the
corresponding patch.

Thanks,
Jiaxin.Yu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
