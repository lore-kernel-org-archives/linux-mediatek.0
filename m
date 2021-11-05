Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 04:12:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E99126120D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 04:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E99126120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8mgfGCqccdac6YO+aErwWaj0h7li8aoPQM/21gZrjg=; b=mP2bnL82hNUr3P
	pMwBpVtQcIA8i3hgKFhdLBZKN1/uXtGtWMNt0F/xT5lE/gRLcl7XEY7DCiDxniHkfl+TQIdwfQdBq
	GAHghSryJc89J9eM6SnKFLemNbqJgdQO2QdRO/yfG9Y9HJglYuDRuUHZHafyhDbt9QgtalGKFt2mj
	maMU6I6RwIxXvP/o6BJcPWrlBuvQsmzUZQNdliyG5HhyP+mykraPWXt1T5gedZyi1F3AOxJ2Xvwe7
	lbNlCtgSHIsFJreZaRQu6BC89JS6RjMS3XbobIkwFN1kzfikcqClY1IZxZxeL0pC0XoQSIQ5Q/WWo
	2LjfHEvX7TmpA4dBNY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miqaX-00AYzo-TD; Fri, 05 Nov 2021 04:12:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miqaI-00AYvO-OC; Fri, 05 Nov 2021 04:12:13 +0000
X-UUID: bc17709e0bd14bc9bcb20d785e60e043-20211104
X-UUID: bc17709e0bd14bc9bcb20d785e60e043-20211104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 868305624; Thu, 04 Nov 2021 21:12:05 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 21:12:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 12:11:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Nov 2021 12:11:55 +0800
Message-ID: <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>
Date: Fri, 5 Nov 2021 12:11:55 +0800
In-Reply-To: <YYP+l7tMofYoB+aC@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_211210_831342_F00D86EC 
X-CRM114-Status: GOOD (  15.83  )
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

On Thu, 2021-11-04 at 15:39 +0000, Mark Brown wrote:
> On Wed, Nov 03, 2021 at 06:00:39PM +0800, Trevor Wu wrote:
> > Because we will add DSP support, an new machine driver for the same
> > board is required. BE and codec configuration will use the same
> > code
> > when machine driver is designed for the same board.
> 
> I don't follow why the DSP support requires a new driver?  Shouldn't
> all
> systems with the DSP present be using it?

We need to keep the solution without DSP, so we can replace DSP
solution with non-DSP when it's required. But when we introduce SOF for
DSP control, there will be more routes in machine driver and device
tree usage is different from the original. So it's hard to share the
same driver for these two solutions.

Thanks,
Trevor

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
