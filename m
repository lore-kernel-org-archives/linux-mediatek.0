Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1260C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEgOPhllf2ctvlqLgP2oZcwDhgDDAmIECdPy2q5oUFU=; b=21adBchld4g/KE
	p6aNBYkwSwnjWHr7+E1PgogbUnpRgGYXvzhcuOF9J0rwrE/+Zlse7cBqhnOhkqXoDunzsADjgZ5oc
	AaHpcri0w1Q4eVKmNdMtWyCpBalvcX68bCa4f6BtVKrre6pJ2l/Tgk8qTGBQm8MMCBbjwNVxSsbuK
	d1juH05Cnib//9uGUtyAFzGWLra+5UGxr1ferMwCfJF7J6mWHY5P7UQrh3bRv35dNMSHrST3FvjH3
	INUnnCu9XQcDuIr4uILZKMp05O56pkBAqIdnzAXqWlhdLkPHnv1COV+MatzYW26RxLrxlwjLhGN8e
	kBoEkWVQ2Yb2sozjNJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZP4H-00E7Vt-B0; Wed, 30 Mar 2022 03:32:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZP4E-00E7V6-FF; Wed, 30 Mar 2022 03:32:20 +0000
X-UUID: 4aa999ff59314580a5c9b530c559954f-20220329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IXBxAx+GNEM5p25R+Z+jnkmLPN0kv2Yk34tYh4SsueM=; 
 b=Ad9DDW6hEwDPV+aE6k9ovBomRz6ctPXtmd634f3KL3ScAQXRuJxQXO0ZuhGF8y6XAeRM6tRjjSGt5lQPFlHME+27Nx02FUsz21cJXE8JWtpS4GQtZ6rJX/vb4FitMTipP1xj2FF9tpxIRSTT0TLHCLiSXuALZPNw8jla+wRQqrw=;
X-UUID: 4aa999ff59314580a5c9b530c559954f-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1371298087; Tue, 29 Mar 2022 20:32:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 20:30:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 11:30:53 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 11:30:53 +0800
Message-ID: <2a00c025c3e0e51a455ee73b7da0ad8556b96815.camel@mediatek.com>
Subject: Re: [PATCH v4,2/6] dt-bindings: pwm: Remove compatible for MediaTek
 MT8167
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <devicetree@vger.kernel.org>,
 <jitao.shi@mediatek.com>, <lee.jones@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
Date: Wed, 30 Mar 2022 11:31:17 +0800
In-Reply-To: <20220324234824.20588-1-miles.chen@mediatek.com>
References: <1648101804-3584-3-git-send-email-xinlei.lee@mediatek.com>
 <20220324234824.20588-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_203218_587876_F8AD276F 
X-CRM114-Status: GOOD (  22.05  )
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

On Fri, 2022-03-25 at 07:48 +0800, Miles Chen wrote:
> Hi Xinlei,
> 
> > Remove dt-binding documentation of pwm for MediaTek MT8167 SoC.
> > I did not find the compatiable corresponding to mt8167 
> > in the latest version of the pwm-mtk-disp.c driver file.
> > It may be disabled but not updated to the dt_binding file.
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
> 
> I checked:
> grep -e 'mediatek,mt8167-disp-pwm' -e 'mediatek,mt8173-disp-pwm'
> drivers/ -RnH
> drivers/gpu/drm/mediatek/mtk_drm_drv.c:486:     { .compatible =
> "mediatek,mt8167-disp-pwm",
> drivers/gpu/drm/mediatek/mtk_drm_drv.c:488:     { .compatible =
> "mediatek,mt8173-disp-pwm",
> 
> mediatek,mt8167-disp-pwm and mediatek,mt8173-disp-pwm are used in
> drivers/gpu/drm/mediatek/mtk_drm_drv.c.
> (added by commit 58e4c5398200 ("drm/mediatek: Add support for main
> DDP path on MT8167"))
> 
> Is it ok to remove mediatek,mt8167-disp-pwm and mediatek,mt8173-disp-
> pwm?
> 
> Thanks,
> Miles
> >  
> >    reg:
> >      maxItems: 1

hi Miles:

Thanks for your suggestion.
Maybe I misunderstood this mt8167 driver before. It is a reused mt8173
driver and not removed. I will remove this patch from this series in
the next version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
