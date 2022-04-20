Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC0AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 02:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5Mzfi8575aPDFGBqdxpfkahalSKmP9lrcmGKZTpqw4=; b=ohuIAhaakExMRd
	0XItXFMYu57olw/JNw99rCyuZTCJtP6HTprvzHIp6SAn9MBUpMsn4uj81H6RaKAbKKFAuc98kIBF+
	N9yQeJk52eGi4+uLZ5sLAqm5pq+eUQr2JAzOnzu+XQOp3Esj+Oa82VVSsI/k3vbRKAOTxclxba+eq
	FBwGnqWpf0eirLy8YYnt3KMczoIRcFXxIFmXzvUXXnF5inY+A32sRGsH0mTmGDNm2Anqvi9VkMirO
	JBN4fiQfaSLN0DxeibJRT5uSREyfCDQp5+9b5QbWSt4auVHPoWv2r1rAZj6UJy8sihriwe+g4gigo
	rNlhv3kNGOFgs+ghkFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh03b-006x9o-T1; Wed, 20 Apr 2022 02:27:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh03Z-006x9A-OO; Wed, 20 Apr 2022 02:27:02 +0000
X-UUID: 5bf45db49ad642a4bf392a896c690d28-20220419
X-UUID: 5bf45db49ad642a4bf392a896c690d28-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1277444694; Tue, 19 Apr 2022 19:26:53 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 19:16:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 10:16:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 10:16:50 +0800
Message-ID: <dd069ad818e13ab30847d5da93ca4a9ef7c13bf9.camel@mediatek.com>
Subject: Re: [PATCH 4/7] clk: mediatek: reset: Add reset.h
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <yong.liang@mediatek.com>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 20 Apr 2022 10:16:50 +0800
In-Reply-To: <20eaaba7-19cb-8f1d-ecf4-bfac14d50f67@collabora.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-5-rex-bc.chen@mediatek.com>
 <20eaaba7-19cb-8f1d-ecf4-bfac14d50f67@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_192701_828802_671CC239 
X-CRM114-Status: GOOD (  16.65  )
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

On Tue, 2022-04-19 at 12:46 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/04/22 15:21, Rex-BC Chen ha scritto:
> > Add a new file "reset.h" to place some definitions for clock reset.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/clk-mtk.h | 10 +---------
> >   drivers/clk/mediatek/reset.h   | 20 ++++++++++++++++++++
> >   2 files changed, 21 insertions(+), 9 deletions(-)
> >   create mode 100644 drivers/clk/mediatek/reset.h
> > 
> > diff --git a/drivers/clk/mediatek/clk-mtk.h
> > b/drivers/clk/mediatek/clk-mtk.h
> > index dafdf30fe94e..dfb0549ceb6c 100644
> > --- a/drivers/clk/mediatek/clk-mtk.h
> > +++ b/drivers/clk/mediatek/clk-mtk.h
> > @@ -12,6 +12,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/types.h>
> > +#include <reset.h>
> 
> This should be
> 
> #include "reset.h"
> 
> ...since the header is in the same directory.
> 
> 
Hello Angelo,

I will fix this in next version.
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
