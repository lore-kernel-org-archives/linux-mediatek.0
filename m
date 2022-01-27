Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D724C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 01:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RS6PX08rYHebAibHLD9qlB/ohSd3uEzLSVCXifpinis=; b=bUQTb1TvVDWnJA
	3rDIcUwjW/5wKBoJkos5nnyad0GggyGOC6VRVvMrPBkpDRDFd19M666UTC5bU+Y00iDHrqjFHrUBE
	tNCMwy7zwcVcy1MISmSo8B7sLVaoEUvtdWau6MqO9hr5aMq47PWbCUB3QGHoc4wNVBlxMbpOkCvlw
	DEU+iy9SnH582KemU/ieHKlTFmJX+oOnDIG/BHMirPX2SQT/2KyOI8gxBYqHNCZybp4W5D6pj9hfW
	EFKBiO7Xfrf3f8UkwdEHuL1Cmr3QZWaYPTlQYI/6YlthNC9gnF3+bkpjiRIhr79I/9MSfsNcs8BDE
	r/M53EyvJrEDGl2StbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCtVc-00DyYk-TQ; Thu, 27 Jan 2022 01:23:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCtVR-00DyWq-2t; Thu, 27 Jan 2022 01:23:22 +0000
X-UUID: 88a449b0afd0456f876c2ac815924060-20220126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NtUeAWs7FtuG0J7Ohu5Tt4pkOLG1kEu3QNmyT7pDfVM=; 
 b=b8MKlM4MaNOSzeDw3RBberlZnZUBHFrIecK/epAYJLQLl9zz2DojQY1cw2adKOF4IbonCtSJJcpEEPSwIQTpcmTK4eCBn0q8AwsVDdq7jcgeksbSriazCeI1io9c+N2sq8X701H4G6aRxNh1AjYAICkAnFXuv3OJapTSf+CRhOU=;
X-UUID: 88a449b0afd0456f876c2ac815924060-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 679781685; Wed, 26 Jan 2022 18:23:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 17:13:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 27 Jan 2022 09:13:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 09:13:13 +0800
Message-ID: <07089392136a4a0790dd1fe73443db7e47700077.camel@mediatek.com>
Subject: Re: [PATCH net-next v1 4/9] dt-bindings: net: mtk-star-emac: add
 support for MT8365
From: Biao Huang <biao.huang@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, Felix
 Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Yinghua Pan
 <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Date: Thu, 27 Jan 2022 09:13:13 +0800
In-Reply-To: <CAMRc=MdVKdXcK0gdBSpaaSm5fx1o5Sy_0-JJBPK0=Xp7UmQnqQ@mail.gmail.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-5-biao.huang@mediatek.com>
 <CAMRc=MdVKdXcK0gdBSpaaSm5fx1o5Sy_0-JJBPK0=Xp7UmQnqQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_172321_154625_E83919D1 
X-CRM114-Status: GOOD (  14.92  )
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

Dear Bartosz,
	Thanks for your comments~

On Tue, 2022-01-25 at 11:23 +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > Add binding document for Ethernet on MT8365.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/net/mediatek,star-emac.yaml | 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek,star-
> > emac.yaml b/Documentation/devicetree/bindings/net/mediatek,star-
> > emac.yaml
> > index e6a5ff208253..87a8b25b03a6 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> > @@ -23,6 +23,7 @@ properties:
> >        - mediatek,mt8516-eth
> >        - mediatek,mt8518-eth
> >        - mediatek,mt8175-eth
> > +      - mediatek,mt8365-eth
> > 
> >    reg:
> >      maxItems: 1
> > --
> > 2.25.1
> > 
> 
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
I'll add revieed-by in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
