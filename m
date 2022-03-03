Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 02:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVYId9l/WEDnW4cLgUP5LYvfOzMajBw6cQVsUnedh90=; b=g3bcmbvzHCUs/Y
	3Oalbk+5Zq2YPmTrICpzl5JucnbIGOgD+umBbfq722dHaDN2ueDAW/Upv6f/tL6FsBt2ze2m8MKPU
	jhsrY3HT+dXFR9/2CfHG8MihvJNWtOXQW84ngaxvfglwF5sPpXwvYtBjz5y6LHserxhrR4QCfF5ck
	zVSt69qPVYSFjsdb5fAU1oylNT+KzJoF6N0QaVRWpNpYdHGAjDeoLkrmmudoWBJyJMLznrou09zHx
	3aAve5fj8Nfi77S9FY+G+Juql5MtZY+3MDYpDyyadH7j0P7AllzxqB6Egm1EQuPr80yKPRqUefOXx
	RCa1w8+bwL8xpvayIR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPaq9-004yFH-HE; Thu, 03 Mar 2022 02:05:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPaq5-004yEp-Pv; Thu, 03 Mar 2022 02:05:12 +0000
X-UUID: 1efac27a984e4dad9e7c2470f3320e39-20220302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nC8VNG77dJbNbbg3bx/dmywqLmwRmqDYGkpH41xgI8s=; 
 b=NLRYKndUrAaSysMB7rL9wpYt0a/zWavjKbWmsqUfsfgs2uwyYUIsCWAT98MYX2/Y5BaBRiqq1aw6EqOSMGO8ffj4nhTzoEhB13Fg/g+Lbsya8ZMZtYwbyotdnS7oOoenJb6xfnjIbwSJaNGfvG2XSggIBQcJRbuR6tAHcMhQ1L4=;
X-UUID: 1efac27a984e4dad9e7c2470f3320e39-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2106502402; Wed, 02 Mar 2022 19:05:04 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 18:05:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 10:04:56 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 10:04:55 +0800
Message-ID: <2f09fbd03d26a8f3d03fdbdd99971a00afc9ede6.camel@mediatek.com>
Subject: Re: [PATCH v3,6/6] dt-bindings: pwm: Add compatible for MediaTek
 MT8186
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
Date: Thu, 3 Mar 2022 10:05:10 +0800
In-Reply-To: <Yh+vmZy8H0CClVEZ@robh.at.kernel.org>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-7-git-send-email-xinlei.lee@mediatek.com>
 <Yh+vmZy8H0CClVEZ@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_180509_874486_C54BF93B 
X-CRM114-Status: GOOD (  17.25  )
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

On Wed, 2022-03-02 at 11:55 -0600, Rob Herring wrote:
> On Wed, Mar 02, 2022 at 01:31:46PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3
> > +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > index 3a5d1cfed94d..053805846cfe 100644
> > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -21,6 +21,9 @@ properties:
> >            - mediatek,mt6595-disp-pwm
> >            - mediatek,mt8173-disp-pwm
> >            - mediatek,mt8183-disp-pwm
> > +      - items:
> > +          - const: mediatek,mt8186-disp-pwm
> > +          - const: mediatek,mt8183-disp-pwm
> 
> Combine to 1 entry:
> 
> >        - items:
> >            - const: mediatek,mt8192-disp-pwm
> 
> enum:
>   - mediatek,mt8186-disp-pwm
>   - mediatek,mt8192-disp-pwm
> 
> >            - const: mediatek,mt8183-disp-pwm
> > -- 
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Hi Rob:

Thanks for your review!
I will combine the reuse of the same driver into one entry in the next
version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
