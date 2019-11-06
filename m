Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CB2C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 08:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5AA3206A3
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 08:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAQETZPP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5AA3206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOQPRN74fmGQT7K9W5rXY7N6fhQwJc4lNa2QcqOvvWc=; b=MAQETZPPNd9sk4
	g1ACZ8x/RBrp/1K3+QS74h361Up88X+C5/HfxsI/+PF/4W9Ox21vEvm7IsGG3ZAi2xa6z7yXTP5o+
	14BBqaZyYrGbkd8CGOv4MWLx/bQdn75zTAqsf8qqmJJy6Qq9FGbCjMaftJkdxOKzYegD/wZq7cQ+j
	y1yfCENbyHxg69oLKuAxOfzsfvjSivr/zuyIi0q6Ae7PtXz0lGPBowkKBYC1BZb2/1zY23Eex7raR
	k+OHpv4u4PPQ8mPaRu5Jy3cVju6pah00SqyR/edAAHs2pOyoZGjSoKq2/447OEAAHrT+wME5i8KCt
	5+6AMXWWkUtEPHXCyfuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSGMg-0006pa-Fk; Wed, 06 Nov 2019 08:08:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSGMY-0006ik-QP; Wed, 06 Nov 2019 08:08:24 +0000
X-UUID: e51702a67b6645a7ba68980831ccbc7e-20191106
X-UUID: e51702a67b6645a7ba68980831ccbc7e-20191106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 218973715; Wed, 06 Nov 2019 00:08:06 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 00:07:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 16:07:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 6 Nov 2019 16:07:50 +0800
Message-ID: <1573027672.2646.1.camel@mtkswgap22>
Subject: Re: [PATCH 3/3] [3/3] dt-bindings: mmc: mediatek: Add document for
 mt6779
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2019 16:07:52 +0800
In-Reply-To: <20191106041708.GA26489@bogus>
References: <1572590582-11056-1-git-send-email-chun-hung.wu@mediatek.com>
 <1572590582-11056-3-git-send-email-chun-hung.wu@mediatek.com>
 <20191106041708.GA26489@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_000822_860310_62C30F77 
X-CRM114-Status: GOOD (  14.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Pan Bian <bianpan2016@163.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

  Thanks for the reply.
We will prepare another patch set to remove these tags.


On Tue, 2019-11-05 at 22:17 -0600, Rob Herring wrote:
> On Fri, Nov 01, 2019 at 02:43:02PM +0800, Chun-Hung Wu wrote:
> > Add compatible node for mt6779 mmc
> > 
> > Change-Id: Id36a136a75e892c9360ec95c7f52db06f5b308a4
> > CR-Id:
> > Feature:
> 
> Remove these tags.
> 
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > index 8a532f4..0c9cf6a 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > @@ -12,6 +12,7 @@ Required properties:
> >  	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
> >  	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
> >  	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
> > +	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
> >  	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
> >  	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
> >  	"mediatek,mt7622-mmc": for MT7622 SoC
> > -- 
> > 1.9.1
> > 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
