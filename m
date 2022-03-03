Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB908C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 02:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rvq2oDqY8IHOSlUHRZfOpFNGXcQ6PICwYmQmYYa8osU=; b=sNRGGKl3SQFs3z
	PCwoYF9RLUF6nWqbaH5kVuQ2VKO6g5mj0IWta3IHYGulm/hgzIYcXTPQtFTovn7QYS112esnSGy5p
	rOl5nEpwzuJOzd4X1anLgEm2rhfGCZP2eJOkQPvo1CzAVH1Gru3EegPaPXYRG56dVKAUuocAjbxZW
	VJ6TfxHdqvGzx4aygPtUCqtOWpEyXWYOA6nCGqG11x34OCwRM3+xfYd8x5gDBx2HcOspoe5/uH4Un
	QGhLDMi6pv0EKpKnRs4OdJMif5cl+rdoc9XiLCRHxEI3ukRz2gbfXRXhTFNeKKcgM3cRLzlgQsOy2
	8+mAdADpyZAyvVqrqfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPaqJ-004yGk-Fm; Thu, 03 Mar 2022 02:05:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPaqH-004yFd-3o; Thu, 03 Mar 2022 02:05:22 +0000
X-UUID: e31dc60734d34a989e7ded247f52a5e2-20220302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aTQvHwZCNRGh8CX2S149jbnaDjhhKZNi+rbkW7fryYA=; 
 b=Yir34tnTwEeYJ4YQpRJuAQ+pNRnCHHToiahzUorIJyJSwlH0M4SzSQngXojEsE2XmXnD62boNdjCtNthNEz6+vU/xobzsHKRP5LK8XS0k0z3G9OzrqjR2UldDi/B0Fj6k5P/t7cv/7A00kFIlms8oORIBQ3olQmg+z8dl7TVwPs=;
X-UUID: e31dc60734d34a989e7ded247f52a5e2-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1679068037; Wed, 02 Mar 2022 19:05:12 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 17:59:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 09:59:30 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 09:59:30 +0800
Message-ID: <1c89fc68ea38355fc111dd4e68bb648bfd20b762.camel@mediatek.com>
Subject: Re: [PATCH v3, 2/6] dt-bindings: pwm: Remove compatible for
 MediaTek MT8167
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <matthias.bgg@gmail.com>,
 <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>
Date: Thu, 3 Mar 2022 09:59:44 +0800
In-Reply-To: <Yh+v4vjevi4/cwHY@robh.at.kernel.org>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-3-git-send-email-xinlei.lee@mediatek.com>
 <Yh+v4vjevi4/cwHY@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_180521_187833_02714E00 
X-CRM114-Status: GOOD (  17.88  )
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

On Wed, 2022-03-02 at 11:56 -0600, Rob Herring wrote:
> On Wed, Mar 02, 2022 at 01:31:42PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Remove dt-binding documentation of pwm for MediaTek MT8167 SoC.
> 
> Why?
> 
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3
> > ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > index f844695d605a..f18e8bbd13d2 100644
> > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -20,9 +20,6 @@ properties:
> >            - mediatek,mt2701-disp-pwm
> >            - mediatek,mt6595-disp-pwm
> >            - mediatek,mt8173-disp-pwm
> > -      - items:
> > -          - const: mediatek,mt8167-disp-pwm
> > -          - const: mediatek,mt8173-disp-pwm
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Hi Rob:

Thanks for your review. Because I did not find the compatiable
corresponding to mt8167 in the latest version of the pwm-mtk-disp.c
driver file.
My understanding is that it may be disabled but not updated to the
dt_binding file. If I have misunderstood, please let me know if this
modification is still required. 
Looking forward to your feedback.

Best Regards!
Thanks!
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
