Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 06:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xf2djGzWtE1GNy151H8K9ch1Rx73KsMSk0lwYurU/Ew=; b=nv8KVWugIWUuMR
	YAkZArvNqptYKvnht5PjOdLwKOeLZIoK58cbVrVlYCvJBKR49O68ssrhvcVFbRkhICvRhcgpRzuoY
	A3DAVrjxprI7UKUdNbTTMU2yCS51gYqtmDUY/9Rl3rX02qDABCn76uVk3HmBib/xmXT5GkPA6dQe+
	a9WWDDyk7gnP5g27vnsIpIXoRrN1dYPKAkZrQLRNanqjDe3WherdxgSsmaZkkakmtrjiot69VmQAs
	L3RQva60KcJxDzqbCVnjClZ6t91GHTDh2DteVIJb+/8sKTqfE7IC6NAKAW5hlmG2Tvp86N/mqeRt/
	j5AJk6E7jZSzfLKAci4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNTvQ-003ShZ-9o; Fri, 25 Feb 2022 06:17:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNTvA-003SfE-6z; Fri, 25 Feb 2022 06:17:43 +0000
X-UUID: 28aa6e20a6664ab9ad799ab819ac6c07-20220224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nTk4dsjtOgRj3+zm14MnmjoeHC5JRcfKVY11Wm5fLRs=; 
 b=l5gSGyyd1Q9Y4qA+N4Pny7Hlcc2Rs5W+s2IKRXMQExNDDieqo5Uwxuds6EpSFcUZ2LDa5rg6L1529Lc/yLVHCWtHCLd6H8ZzQ9I3ZcF28ZaO+ANBqhiOA5YxfAJy9ML0BeDkcZ12MRlB3wBlJ9niaTUMiri4IvqIHgneNgrA9pU=;
X-UUID: 28aa6e20a6664ab9ad799ab819ac6c07-20220224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1244375118; Thu, 24 Feb 2022 23:17:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 22:17:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 14:17:28 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Feb 2022 14:17:27 +0800
Message-ID: <acc635f9e6d4f6f278ac334b13e96ce30c8c8b1d.camel@mediatek.com>
Subject: Re: [v2,4/4] dt-bindings: pwm: Add compatible for MediaTek MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Date: Fri, 25 Feb 2022 14:17:41 +0800
In-Reply-To: <Yhf2a/h6H1/9sN6b@robh.at.kernel.org>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
 <Yhf2a/h6H1/9sN6b@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_221741_706008_FE23F115 
X-CRM114-Status: GOOD (  18.68  )
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

On Thu, 2022-02-24 at 15:19 -0600, Rob Herring wrote:
> On Wed, Feb 16, 2022 at 05:32:51PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > 
> > Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> > 
> > Signed-off-by: Xinlei Lee <
> > xinlei.lee@mediatek.corp-partner.google.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > index 768ab04d3764..1f45b1b8c3d4 100755
> > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -17,6 +17,7 @@ properties:
> >        - mediatek,mt6595-disp-pwm
> >        - mediatek,mt8173-disp-pwm
> >        - mediatek,mt8183-disp-pwm
> > +      - mediatek,mt8186-disp-pwm
> >        - mediatek,mt8192-disp-pwm
> >        - mediatek,mt8195-disp-pwm
> 
> It seems unlikely that every SoC has a different version of h/w for 
> something as simple as a PWM. There's not an appropriate fallback?
> The 
> first version from an SoC that has all the features and would work
> with 
> existing driver unchanged?
> 
> Rob

Hi Rob:

Thanks for your suggestion,I agree with your point of view.
If I want to show that different socs are using this disp_pwm, can I
use oneOf with items to achieve this, and reuse the compatiable that is
currently included in the pwm_mtk_disp.c file.
E.g:
- items:
       - enum:
           -mediatek,mt8186-disp-pwm
       - enum:
           -mediatek,mt8183-disp-pwm
What's your suggestion for this program?

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
