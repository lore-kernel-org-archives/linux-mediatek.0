Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsHGbGRizEakhaEJfeuamwGJefoDocx0JjkU7o87GRs=; b=2favpEfoaUmjVk
	UhDzc8b4BBKAOk0hW1ezyoVv64ZJC3ClHI0mW2+MiwNSM7zsuT11g1T9uCPa9ZmWvXwy0ZtVIxbRW
	jYbM3857te17DPIZ8f/jXXxmqB00jrU0vSF1KEdwGpE9mvXIRbeCxMPbClatuWWVgqaAbIqv+YWvQ
	WUJOJ7GSjcb3wKhwTiW3yZAP8OqYK1u0ODFY28uKCKJr9ZtEru95YP1SsGWNnin86ggVJGj9qCoMt
	axprB55cu1fJN/PiIgDJ2cSh9HHb1ZsdZhoeV/mjYail6NluG4gt8X8VkEYd298Of9AgSucCXU9W5
	h5+we55S0u01F4pwbBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNUwW-003ZtQ-3X; Fri, 25 Feb 2022 07:23:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNUwH-003Zqc-SP; Fri, 25 Feb 2022 07:22:55 +0000
X-UUID: 7ba1713205c442738f5cbc9db5b73b7e-20220225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7fviBjuh9hvRrzKD9poWxcCaySjR1/2zCdUL68aq0Fw=; 
 b=dy8wxTLfAmrOLDswXD06+qDgwkHqn+2MUK0XHGsyCD1RSX5YfVf87M2V/ZuYpjDAX2LpwPN+krbWxB61JrVTRvUOntvyeueanHNWoi+GlNcRb2tzFlYBvvsYrgA7+K5/c8vEcqLe3Gpq9ePCw1cx7ee0/VljrKOXvieFyYg7afM=;
X-UUID: 7ba1713205c442738f5cbc9db5b73b7e-20220225
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 189108577; Fri, 25 Feb 2022 00:22:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 23:22:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 15:22:46 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Feb 2022 15:22:45 +0800
Message-ID: <18366a6dfb36b26ea321f4aa2327750c590e1769.camel@mediatek.com>
Subject: Re: [v2,4/4] dt-bindings: pwm: Add compatible for MediaTek MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Date: Fri, 25 Feb 2022 15:22:58 +0800
In-Reply-To: <CAGXv+5GWJOFjePKJ5ABnYP2eXeU0PM6Yo3b3vYmErUnDY4=ZQQ@mail.gmail.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
 <Yhf2a/h6H1/9sN6b@robh.at.kernel.org>
 <acc635f9e6d4f6f278ac334b13e96ce30c8c8b1d.camel@mediatek.com>
 <CAGXv+5GWJOFjePKJ5ABnYP2eXeU0PM6Yo3b3vYmErUnDY4=ZQQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_232253_954845_CD1ABC7C 
X-CRM114-Status: GOOD (  30.94  )
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

On Fri, 2022-02-25 at 14:26 +0800, Chen-Yu Tsai wrote:
> On Fri, Feb 25, 2022 at 2:18 PM xinlei.lee <xinlei.lee@mediatek.com>
> wrote:
> > 
> > On Thu, 2022-02-24 at 15:19 -0600, Rob Herring wrote:
> > > On Wed, Feb 16, 2022 at 05:32:51PM +0800, xinlei.lee@mediatek.com
> > > wrote:
> > > > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > > > 
> > > > Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> > > > 
> > > > Signed-off-by: Xinlei Lee <
> > > > xinlei.lee@mediatek.corp-partner.google.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml |
> > > > 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > > disp.yaml
> > > > index 768ab04d3764..1f45b1b8c3d4 100755
> > > > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > > disp.yaml
> > > > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > > > disp.yaml
> > > > @@ -17,6 +17,7 @@ properties:
> > > >        - mediatek,mt6595-disp-pwm
> > > >        - mediatek,mt8173-disp-pwm
> > > >        - mediatek,mt8183-disp-pwm
> > > > +      - mediatek,mt8186-disp-pwm
> > > >        - mediatek,mt8192-disp-pwm
> > > >        - mediatek,mt8195-disp-pwm
> > > 
> > > It seems unlikely that every SoC has a different version of h/w
> > > for
> > > something as simple as a PWM. There's not an appropriate
> > > fallback?
> > > The
> > > first version from an SoC that has all the features and would
> > > work
> > > with
> > > existing driver unchanged?
> > > 
> > > Rob
> > 
> > Hi Rob:
> > 
> > Thanks for your suggestion,I agree with your point of view.
> > If I want to show that different socs are using this disp_pwm, can
> > I
> > use oneOf with items to achieve this, and reuse the compatiable
> > that is
> > currently included in the pwm_mtk_disp.c file.
> > E.g:
> > - items:
> >        - enum:
> >            -mediatek,mt8186-disp-pwm
> >        - enum:
> >            -mediatek,mt8183-disp-pwm
> > What's your suggestion for this program?
> 
> Using Documentation/devicetree/bindings/mmc/mtk-sd.yaml as a
> reference,
> you would have:
>   compatible:
>     oneOf:
>       - enum:
>         - mediatek,mt6595-disp-pwm
>         - mediatek,mt8173-disp-pwm
>         - mediatek,mt8183-disp-pwm
>       - items:
>         - const: mediatek,mt8186-disp-pwm
>         - const: mediatek,mt8183-disp-pwm
>       ...
> 
> ChenYu
> 
> 
> > Best Regards!
> > xinlei
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

Hi chenyu:

Thanks for your suggestion!
I will refer to this file to reuse the already defined disp_pwm.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
