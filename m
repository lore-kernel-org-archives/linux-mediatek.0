Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F1AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjyC8bmPSX7kFavHx9EtQMG5NNReDABS2O5ESB6ekwI=; b=3EzZfBSIAqnFsO
	XiNRMnY2LKw4waDkM/vTf7ZK2ZBx7G4g6FQC19Lx/gl/EdRqwuzizxzIKVSbmUYQF0uAAzI4le3Lb
	mII2AGcOILQmz58vLCfy6fuyvki/Vas2i4XArIBHazizxq8IsGLHnazy8yC6vxNxNCXjJXce3pVX6
	CmupuDTjT/PmTWWSq+OEHjtaLEHMKBulpn1cYhIkbzSxhegu3kCRUzhdPbzVEY/7V55zTaAmMkfgc
	uP7VoXSn7uWkPFy0ZQtKpYQhgQMdEDxjWGzaV2X6nKnR5i1c3iVD0lV0UyYHVGmHPXAeJn6u+E9Fl
	pQXcXIS5OsiLBObKDr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyXK-009S41-V1; Thu, 12 May 2022 02:26:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyTQ-009Pt4-Ik; Thu, 12 May 2022 02:22:42 +0000
X-UUID: f5000986db3745c3ae8f3d63889df507-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:91ca2ded-3107-4d40-97ef-6a4adcbf8570, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:aa3b4125-b432-452e-9e03-2bf3148aed85,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f5000986db3745c3ae8f3d63889df507-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1410525802; Wed, 11 May 2022 19:22:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:17:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 12 May 2022 10:17:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:17:17 +0800
Message-ID: <fa24a94aaab6f7d38585b454f9f05171873672a3.camel@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, xinlei.lee
 <xinlei.lee@mediatek.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 12 May 2022 10:17:17 +0800
In-Reply-To: <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
 <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
 <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_192240_663192_A1E02CE7 
X-CRM114-Status: GOOD (  18.16  )
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

On Wed, 2022-05-11 at 09:36 -0500, Rob Herring wrote:
> On Wed, May 11, 2022 at 2:24 AM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
> > >  .../display/mediatek/mediatek,dsi.yaml        | 115
> > > ++++++++++++++++++
> > >  2 files changed, 115 insertions(+), 62 deletions(-)
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > > xt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > > aml
> 
> [...]
> 
> > Hello Rob and Krzysztof,
> > 
> > Can you give us some suggestions for this conversion patch?
> > Thanks!
> 
> You can check status for yourself by looking at PW[1] where you will
> see the review queue is currently ~120 patches and goes back to 5/3.
> If it is in the queue, I will get to it.
> 
> Rob
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

Hello Rob,

Got it.
Thanks for your effort.
I will look at this next time before I send remind mail.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
