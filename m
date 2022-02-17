Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35DDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 01:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0Kt+LQe+X+RAqsw1UNRrCRN92trok/Rw7zNm/3Qdpw=; b=jwvnRuSEhn3A1V
	EfnxjUWNlbEeGO7knw0stYjtVGGrfMP7+69xIzBcFV+thvmYeTm1uvEOSB2t2LlMW6TVtdQeXKpl4
	ccnArTVkMruB5GFdV5xwCq0SsWlHrN4iwJvsARkIzl9CPwpqyPuStjO0f8HPAYE3qnauwMkn/SrVV
	UvPWbuJE+DVVJdmwuXUfXewL1Kj4mMJ3fYF5Xd91rxzXfYyKNqGP+hkmJ5XGmcBM1kpcnCHlb3QMY
	ML3umyVu61hrSaJvFH7vwIKxG/33kEKliYAylFMA0oCwJ4JYMSHjl7xktkxCb2Va1267XZC5ZhWs6
	MvzwLy1hb5GNaFsyc95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKVnB-008gNQ-Vo; Thu, 17 Feb 2022 01:41:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKVmy-008gMk-23; Thu, 17 Feb 2022 01:40:59 +0000
X-UUID: 832975c108aa4275839e72d2e605b0de-20220216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1p1mnHtvHQGA/AEu1pibc2h6KoRnT6AmXpOZNF+n9Wk=; 
 b=FTMsjPG74tItE3uvGXXefBPF3SgXFxbIbDg5vuXrNldtMkurofn3NLiB+qBegDha/F1md8ZUBz1wLfs8bWgoip2VlHMPuqPk9qqDdlzMpZQKrZzNa9R3Fwr/P1ORx9bkBDBtT+Ru1i51M521zugG/7vqCMDVv1OA5BVP19D4WlQ=;
X-UUID: 832975c108aa4275839e72d2e605b0de-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 581584389; Wed, 16 Feb 2022 18:40:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 17:40:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 09:40:42 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 09:40:42 +0800
Message-ID: <274b502e611038b3c718e4ae51a74694ce7b09bd.camel@mediatek.com>
Subject: Re: [v2,1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek,pwm-disp.yaml format
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>
CC: <allen-kh.cheng@mediatek.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Date: Thu, 17 Feb 2022 09:40:52 +0800
In-Reply-To: <370739d4-2da6-b620-ec79-adf8d00c8c33@canonical.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
 <370739d4-2da6-b620-ec79-adf8d00c8c33@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_174057_580073_0BB13476 
X-CRM114-Status: GOOD (  18.46  )
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

On Wed, 2022-02-16 at 11:22 +0100, Krzysztof Kozlowski wrote:
> On 16/02/2022 10:32, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > 
> > Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> > suggested by maintainer
> > 
> > Signed-off-by: Xinlei Lee <
> > xinlei.lee@mediatek.corp-partner.google.com>
> > ---
> >  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71
> > +++++++++++++++++++
> >  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
> >  2 files changed, 71 insertions(+), 44 deletions(-)
> >  create mode 100755
> > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > disp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > new file mode 100755
> > index 000000000000..edf2a2e9ea72
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek PWM Controller Device Tree Bindings
> 
> This is a Display PWM, not a generic PWM.
> 
> > +
> > +maintainers:
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> 
> My comment about pwm schema was ignored.
> 
> Please include pwm.yaml.
> 
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-disp-pwm
> > +      - mediatek,mt6595-disp-pwm
> > +      - mediatek,mt8173-disp-pwm
> > +      - mediatek,mt8183-disp-pwm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    description:
> > +      Number of cells in a PWM specifier.
> 
> Need a const. Description can be skipped, it's obvious.
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof:

Thanks for your review, I'm sorry for my previous misunderstanding.
I'll fix all the issues in the next version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
