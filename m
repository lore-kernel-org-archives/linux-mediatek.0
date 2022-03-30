Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE3DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 03:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsq7rPEtyvONMOuuQhcdkUE1ZleMG8L0GCac0WpyIP0=; b=FNh/IjzypNmc8h
	gwLejC05x2qxy37ZYXE9/xr7Hkx4HUH82/rRya2vNaRHH5oTOEHzrwreS2u2H/xiVRDDAk1R9QOj6
	2mUzgsBSNE1ulKvS3R5WtB1lnvtkoeGoQh8cEZv5+lfH7w9TZ53V/GsA9jhPqU8PJ6Of+tgnxkY/W
	/L/Nry8pLRpadg8PKJM1WlrZ6W7niLWZEU9/LK5v41zoZoWpzjzkQKZRIaiJsKXf3yX0MY4iPNRiQ
	E8nzChvh78jzKr1Z7b4cEkMACIcVIR2HWA4CKqJRGLIEslD5ilEfnoOEZbFi4WRC1j4eH8SSkLHKD
	Nd5Iw0kgL9aelY3K9g9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZP6O-00E7oQ-GP; Wed, 30 Mar 2022 03:34:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZP6C-00E7ln-Ib; Wed, 30 Mar 2022 03:34:22 +0000
X-UUID: 23232a0aa4cc429a87a00a392957ca63-20220329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TRvJSTfkGgaBl1GK1h0CQ0zet5TSSnUBGvtKpIqcfJ0=; 
 b=Cizqwk4m4f5D07l5e5z2Q+2apUxZEkgy+wWEdPJoqeohQo6GRfAcgv/ukqg/0tMAw6XxhQleyuzcKiA29AkA7KJjwEHQRglCa4JiwbLoxskwRXrIcxPmK5wFLQ7eskGp+e5HO0uDxRCl732aaNfgQ00xf+M/bvjwXTg5hIOgQKU=;
X-UUID: 23232a0aa4cc429a87a00a392957ca63-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 684787388; Tue, 29 Mar 2022 20:34:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 20:24:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 30 Mar 2022 11:24:12 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 11:24:11 +0800
Message-ID: <936d646da8a2ebaf72989027696bb66680517a6e.camel@mediatek.com>
Subject: Re: [PATCH v4,1/6] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek,pwm-disp.yaml format
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <devicetree@vger.kernel.org>,
 <jitao.shi@mediatek.com>, <lee.jones@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
Date: Wed, 30 Mar 2022 11:24:36 +0800
In-Reply-To: <20220324234843.20641-1-miles.chen@mediatek.com>
References: <1648101804-3584-2-git-send-email-xinlei.lee@mediatek.com>
 <20220324234843.20641-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_203420_641635_41569EB6 
X-CRM114-Status: GOOD (  15.61  )
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
> > Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> > suggested by maintainer
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/pwm/mediatek,pwm-disp.yaml       | 65
> > +++++++++++++++++++
> >  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 -------------
> >  2 files changed, 65 insertions(+), 44 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > disp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > new file mode 100644
> > index 000000000000..f844695d605a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek DISP_PWM Controller Device Tree Bindings
> 
> s/Mediatek/MediaTek/
> 
> Thanks,
> Miles
> > +
> > +maintainers:
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +allOf:

Hi Miles:

Thanks for your suggestion.
I will fix it in the next version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
