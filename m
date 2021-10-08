Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7810C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 06:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7662160F5B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 06:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7662160F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+J2QO7XVZ8HCUW8p7IfkFxMVSTn/K7ASQ7jv4ixLRQ=; b=2Wg4kCInywb79s
	nS/ErT9+jX/v998y8VzQGKhUkhlt1SO6qd+SdGZfD/BweQdxS0phrwZt5DVxY7kAqtMwiiBGF5XWb
	/DETZUgYm/nR459WR001LdJzwmGi2VDymQX1autRp1YeQaumS+gbxDKdq9m9NrVyt1F5RZgUd9eC5
	tMl0DSfJ+DTw//LYLajPoZzaz3Zaxfff8c/xt2XMZhN64lW9H9/dBunEVm6voxtDhWZ1jq4FjHd90
	KtzWNbSWFoM64qSRz4juUsknr6/b8YTouqBkquYW8HDPKyYAXpnj6tS+fRpHnbSCwKfES0fR/Cntj
	06oyepsdhqiiI/2kT5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYjEG-001gsr-8B; Fri, 08 Oct 2021 06:19:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYjE3-001grt-OG; Fri, 08 Oct 2021 06:19:25 +0000
X-UUID: 19b36eece01c46aa8b97011949810c77-20211007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DXaYlcXovTi8AVzeCqHB6o3jCTRK2bXcD3iWckAtv/E=; 
 b=FFXNRkuW2sVUU64o/3ccYTYeEgQVly/HNW/PlfPmgPDAi51jX3BxSGIhLiwCJx9oaHf5/zQDS5I/OqbUbK1DcoSjHGiSwPcNssnVm9u4RrP4JEZL7fdKHlKgg9xeSxI8TwLdye5x+Lfo1gYZadb2yFuIeQxMfZJ7ZQHcVYyciCI=;
X-UUID: 19b36eece01c46aa8b97011949810c77-20211007
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2068906278; Thu, 07 Oct 2021 23:19:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 23:19:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 14:19:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 14:19:14 +0800
Message-ID: <72d26b0622538bdfda4e64519d34088e8c21656a.camel@mediatek.com>
Subject: Re: [PATCH v7 2/7] i2c: mediatek: Reset the handshake signal
 between i2c and dma
From: Kewei Xu <kewei.xu@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>
Date: Fri, 8 Oct 2021 14:19:17 +0800
In-Reply-To: <YVf8jQPHoQtbCfth@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-3-kewei.xu@mediatek.com> <YVf8jQPHoQtbCfth@kunai>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_231923_836725_ED49D997 
X-CRM114-Status: GOOD (  11.22  )
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

On Sat, 2021-10-02 at 08:30 +0200, Wolfram Sang wrote:
> > +#define I2C_CLR_DEBUGCTR		0x0000
> 
> Hmm, I don't think that a macro to clear a register helps
> readability...
> 
> > +		mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR,
> > OFFSET_DEBUGCTRL);
> 
> ..
> 
>  +		mtk_i2c_writew(i2c, 0, OFFSET_DEBUGCTRL);
> 
> looks good to me. Anyhow, it is not a big issue. Let me know if you
> want
> to change it or keep it.
> 
OK, I will use 0x00 instead of macro on V8 version,Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
