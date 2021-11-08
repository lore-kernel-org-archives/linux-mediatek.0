Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 01:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B4561390
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 01:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74B4561390
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sD51NeJe1AM3FdNFlp4ujntZkvdJ7EJsbvK411xzHQ=; b=maZGId8P6UQ/Va
	xsp9NzPbEFvTl/JrtAcWSXO+CrKKhchhOdagxNlkHTrrm3sb8vqgoLXl+w85QRr6uJjSCXtyeEF+W
	Hu/R4D+psE+bxonTY3g6TKgi54fSXvJLAHaSS3ugS0WcxzcOaAC3t9ZAwCgij1UQKVYf+Si2d92Qy
	/7HisvVZ8AMbTrgo1VHZU5YdsQau26cWA/mw+foFAmBtiHQTackQ8+bGqmW/uTnzH6dSCigTdRjHp
	xmdFbCuKPua80Ce/Hg1rSLOYQJbAwDeoTbr2LwUySfjGLpHuVC0M7e+zyUPPNrDvKjFNwtb31eJt8
	y19HHS6/809wwzYGakFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjtrl-00FHWn-8w; Mon, 08 Nov 2021 01:54:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjtrW-00FHSq-P7; Mon, 08 Nov 2021 01:54:21 +0000
X-UUID: 4ef576da5a3f4c98b29b864af70d17c7-20211107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SXkG4NjbYJJgNkjrAZEd7/3hvt2eAwcw3HNQYVZE3eA=; 
 b=KxtdPx4feXr/lKem4Z2UkdgU7jSu7xMUDl375DV2zqjywon/q/X0FybMXVJHTJcUaFtA8Zas1wVG4AmMBljAOBUepLS2dFnSVxUpRl7tx5RwBFikocbe+q4kUnLkTaKIjYCMfXL8VbZmWjL9PCB22iwVnm4p2WDQAnGnxfqm/Sk=;
X-UUID: 4ef576da5a3f4c98b29b864af70d17c7-20211107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 250321373; Sun, 07 Nov 2021 18:54:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Nov 2021 17:54:11 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 09:54:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 8 Nov 2021 09:54:09 +0800
Message-ID: <ad3abc26caaa5de5cc11b06b687e3d4e2c995a07.camel@mediatek.com>
Subject: Re: [PATCH v11, 0/2] soc: mediatek: mmsys: add mt8192 mmsys support
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Date: Mon, 8 Nov 2021 09:54:09 +0800
In-Reply-To: <e3f30009-31ae-f37d-5016-bc8677d8d364@gmail.com>
References: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
 <e3f30009-31ae-f37d-5016-bc8677d8d364@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_175420_291735_EBD77719 
X-CRM114-Status: GOOD (  17.94  )
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

On Fri, 2021-10-08 at 13:37 +0200, Matthias Brugger wrote:
> 
> On 08/10/2021 04:05, Yongqiang Niu wrote:
> > base v5.15
> > 
> > Yongqiang Niu (2):
> >    soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
> >    soc: mediatek: mmsys: Add mt8192 mmsys routing table
> 
> I'm a bit puzzled that you keep on sending this series while I
> accepted an older 
> one long time ago:
> 
https://lore.kernel.org/lkml/e4afa712-9936-15fc-ad43-576948758f6c@gmail.com/
> 
> As you don't provide a changelog I'm not able to find out what has
> changed. I 
> also asked you to double check if the fixup I did was correct, but
> you never 
> answered.
> 
> If there are anything to fix for this series that's not in my tree
> yet, please 
> send a follow-up patch.
> 
> Regards,
> Matthias
> 

the fixup you have add is correct.
this version only adjust the header filer include sequence in mtk-
mmsys.c

original version

#include "mt8365-mmsys.h"
#include "mt8192-mmsys.h"

new version
#include "mt8192-mmsys.h"
#include "mt8365-mmsys.h"

> > 
> >   drivers/soc/mediatek/mt8192-mmsys.h    | 77
> > ++++++++++++++++++++++++++
> >   drivers/soc/mediatek/mtk-mmsys.c       | 11 ++++
> >   include/linux/soc/mediatek/mtk-mmsys.h |  3 +
> >   3 files changed, 91 insertions(+)
> >   create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
