Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 02:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWi6dUch6HSsKWFmiS40lQt9ebNSm0nrSSW8IY/Queo=; b=3xHDyckJdCHc4w
	2jCSS6uyHC1+pCs+0GKL5AlF1q1YstuO132FeSo2K1QO4eUtUSg2glqMLUx8una9HA1AGKq1DhJnY
	1RMaLh7pwCzt/0ck9oM+VIMUP14jcSACNqGELiEabZM6zLpjEYiRgO+xRxCKkJOW4RKnV7yx2HaG0
	9Z85IUIXawI37j9FLwi1XckAYzsH+SVmTalvxMOQ45vUk2uSe15gHbW1xQtY4+QruOCpoYKTQ9YFe
	n5Ygb6ZoGlPipx5Bo14ALA63CtGnsGPVMJ27jpnxD9ih5nxsxIjbh7ECqKvj2BXbDtV0yiQPAAgnH
	DbCkK3c1K0ZSWZ5DFmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOses-00EjvO-Ug; Tue, 01 Mar 2022 02:54:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOseh-00Ejtd-64; Tue, 01 Mar 2022 02:54:28 +0000
X-UUID: 3309b0aa45c44e14b4c2a1b4c70ee98a-20220228
X-UUID: 3309b0aa45c44e14b4c2a1b4c70ee98a-20220228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1413420191; Mon, 28 Feb 2022 19:54:13 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 18:54:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Mar 2022 10:54:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 10:54:06 +0800
Message-ID: <5f257ac1fbc46a28f220dbd0b8bb70002fb9a1cb.camel@mediatek.com>
Subject: Re: [3/4] dt-bindings: reset: mt8186: add DSI reset bit for MMSYS
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <matthias.bgg@gmail.com>, 
 <p.zabel@pengutronix.de>, <runyang.chen@mediatek.com>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 1 Mar 2022 10:54:06 +0800
In-Reply-To: <YhkDPe3KuaRW6b2Y@robh.at.kernel.org>
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-4-rex-bc.chen@mediatek.com>
 <YhkDPe3KuaRW6b2Y@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_185427_236940_9B636056 
X-CRM114-Status: GOOD (  16.59  )
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

Hello Rob,

Thanks for your review.
I will do this in next version.

BRs,
Rex

On Fri, 2022-02-25 at 10:26 -0600, Rob Herring wrote:
> On Wed, Feb 16, 2022 at 09:45:04AM +0800, Rex-BC Chen wrote:
> > Add DSI software reset bit which is controlled by MMSYS for MT8186.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  include/dt-bindings/reset/mt8186-resets.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset/mt8186-resets.h
> > b/include/dt-bindings/reset/mt8186-resets.h
> > index 36e5764e2e6c..5f850370c42c 100644
> > --- a/include/dt-bindings/reset/mt8186-resets.h
> > +++ b/include/dt-bindings/reset/mt8186-resets.h
> > @@ -30,4 +30,7 @@
> >  #define MT8186_TOPRGU_IMG2_SW_RST				22
> >  #define MT8186_TOPRGU_SW_RST_NUM				23
> >  
> > +/* MMSYS resets */
> > +#define MT8186_MMSYS_SW0_RST_B_DISP_DSI0			19
> 
> This can just be squashed into the previous patch.
> 
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8186 */
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
