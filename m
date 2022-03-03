Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B44C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 02:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oT4DEv1HtKgHBn32iTjIsl3U7nMDpHkoiV5LuwkpvtE=; b=w8L6SnuXQablzb
	2fYb9eAQ8llXDerrQSBpEcr3zUuqX+7h/SDFO03aXdnhqUBkcuNLXe/Dlbk96ogZuSajRfr2vWvVK
	N709JRzCW8pfLKo+HgGREFi53/kSPcrfOKsFgW5LwEHFwICk2CFybfEiaPG4RbZemTjYqBSnRgVJM
	fOOLF2aYXH5oNfLhcS4GdTXy2Lwvep0cFWXBh8377fO871409fYNDmtElhJRAhGdQHfMZfJ38VRmc
	JV4Phjch3uwmmYpTFcreqMLWSMtExfzDg9/KXqcm4hRWWnnBOJycsHX3mS9TkdDzV+xjKQvnmZqzl
	UP4i4ki4HcHqThez5CZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPayD-004zAD-RN; Thu, 03 Mar 2022 02:13:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPay0-004z7x-TD; Thu, 03 Mar 2022 02:13:22 +0000
X-UUID: 5e16d88113404a53aa4ec2fe511215bc-20220302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZIttS1quiV+wg/DVKuuhuxaysYsNDagoZk0Vr1Bcvpo=; 
 b=tfE9hwAhfoLZKl2B3ur2zffQN6yy9h28+nv4SrIxJvndLrt1G9/MSG/lmwEN0ROpnygPHrqw/Jw1tx3yrzdo9UppgBlHB8NBYKv2KKw+bI98lv2xkcwDgquSTZOIIX4cj6Y9WWvlQ+1rfzoIvwFGz8C1TZgHhzp7U5LEzcq8DH0=;
X-UUID: 5e16d88113404a53aa4ec2fe511215bc-20220302
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2084707429; Wed, 02 Mar 2022 19:13:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 18:13:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 3 Mar 2022 10:13:06 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 10:13:05 +0800
Message-ID: <e044c7f184b3a7c0957a78ec38e3776609366a02.camel@mediatek.com>
Subject: Re: [PATCH v3,6/6] dt-bindings: pwm: Add compatible for MediaTek
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>
Date: Thu, 3 Mar 2022 10:13:20 +0800
In-Reply-To: <b5d3d996-9c4c-b245-ad59-4fb2218dac1f@collabora.com>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-7-git-send-email-xinlei.lee@mediatek.com>
 <b5d3d996-9c4c-b245-ad59-4fb2218dac1f@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_181320_977748_74515B29 
X-CRM114-Status: GOOD (  18.18  )
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

On Wed, 2022-03-02 at 15:14 +0100, AngeloGioacchino Del Regno wrote:
> Il 02/03/22 06:31, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3
> > +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > index 3a5d1cfed94d..053805846cfe 100644
> > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -21,6 +21,9 @@ properties:
> >             - mediatek,mt6595-disp-pwm
> >             - mediatek,mt8173-disp-pwm
> >             - mediatek,mt8183-disp-pwm
> > +      - items:
> > +          - const: mediatek,mt8186-disp-pwm
> > +          - const: mediatek,mt8183-disp-pwm
> >         - items:
> >             - const: mediatek,mt8192-disp-pwm
> >             - const: mediatek,mt8183-disp-pwm
> > 
> 
> 
> Hello Xinlei,
> 
> even though repeating these items may not give you errors, this is
> not really
> the best way to do this.
> I've done something similar here:
> 
https://lore.kernel.org/linux-arm-kernel/20220217095242.13761-1-angelogioacchino.delregno@collabora.com/
> 
> So, for the compatibles needing mediatek,mt8183-disp-pwm it should be
> looking
> similar to this:
> 
> - items:
>      - enum:
>          - mediatek,mt8186-disp-pwm
>          - mediatek,mt8192-disp-pwm
>          - mediatek,mt8195-disp-pwm
>      - const: mediatek,mt8183-disp-pwm
> 
> Regards,
> Angelo

Hi Angelo:

Thanks for your review, it's a great suggestion.
I will revise it as you suggested in the next commit.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
