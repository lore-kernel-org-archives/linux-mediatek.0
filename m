Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F560C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 01:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bauOCauHfVNbnwlsY23oQg7QT6KkZ/WzRTYZiegUi7E=; b=VXGP+ZTBr7KOs9
	TkVCrZLYdFPwcdhkgJFlIXpoNWyY7U2juozu24281TEsgvAHU3/buXOTofWVYGZ+fFfvDq1rRGEr+
	JzZV/MDXk9jG0fEkLd3u6nAgWry32WCHz3Bts7chgGBADrYca81gd2HT9byLnqG2UU/8kXQiyHWtv
	YAPOZV+bHoZO3EnihE0wYMWJn2Cspu4uipXa7MPkxrR4pL6KzvStmtizdWQuEtqMX03GRwFfmoTGa
	z09fWvARLvCB4s71CoQ3Q7riu/EpdNYICh1jcavvlqDvfhJCI9ViBmKtN25MvshA+zR9wSBxQ7uS8
	aEGEaOpLxwiCW5KUxINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW6mm-006E6P-Dx; Mon, 21 Mar 2022 01:24:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW6mY-006E4o-Oi; Mon, 21 Mar 2022 01:24:30 +0000
X-UUID: 36578523a6ce4ff7a801748d54903534-20220320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4x7oOOHtM/7OYmiKfJ5PZzTKtGzcea1/w3QyyyPOWxI=; 
 b=oz+q1+s+FkopcJHYNMk80EXueWLkjLZWTuZe7TaKOw3C1ElfCb46NPn63LQEjsUQuiZQCpy1bGstSQAXyNfGwzQe3g7xPdUlS3xipgzpIY1yadJp3P49yLMnPCXUBjXa0tJLQgafcdgRw7MJAxwSQVIWxsAAAXoKGiDZozoq8w0=;
X-UUID: 36578523a6ce4ff7a801748d54903534-20220320
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 588106020; Sun, 20 Mar 2022 18:24:20 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Mar 2022 18:24:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Mar 2022 09:24:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 09:24:10 +0800
Message-ID: <e672b7192e47e5247dc5feeaf7ecbc1bb019292e.camel@mediatek.com>
Subject: Re: [PATCH V5 1/3] spi: mediatek: add spi memory support for ipm
 design
From: Leilk Liu <leilk.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 21 Mar 2022 09:24:10 +0800
In-Reply-To: <a6844feb-98d5-4f44-f8fa-87f47aa9ec93@collabora.com>
References: <20220318025027.31281-1-leilk.liu@mediatek.com>
 <20220318025027.31281-2-leilk.liu@mediatek.com>
 <a6844feb-98d5-4f44-f8fa-87f47aa9ec93@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_182428_243433_0546865B 
X-CRM114-Status: GOOD (  16.70  )
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

On Fri, 2022-03-18 at 12:29 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/22 03:50, Leilk Liu ha scritto:
> > this patch add the support of spi-mem for ipm design.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >   drivers/spi/spi-mt65xx.c | 302
> > ++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 301 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> > index 1a0b3208dfca..ea6223259060 100644
> > --- a/drivers/spi/spi-mt65xx.c
> > +++ b/drivers/spi/spi-mt65xx.c
> 
> ...snip...
> 
> > @@ -78,8 +79,21 @@
> >   #define SPI_CMD_IPM_GET_TICKDLY_OFFSET    22
> >   
> >   #define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
> > +
> > +#define PIN_MODE_CFG(x)	((x) / 2)
> > +
> > +#define SPI_CFG3_IPM_PIN_MODE_OFFSET		0
> 
> This definition is useless, the offset is zero... and this is used
> to bitshift zero.
> 
> 
> Please remove that, after which:
OK, thanks for your comment.

> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
