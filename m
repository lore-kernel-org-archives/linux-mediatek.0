Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B039EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:14:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 289B864F04
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 289B864F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zj6aiKTEsrtULSCYQx+Gpl15xWtfHpXs9lVKwoIa2oI=; b=byMZ+MmDEwC+pQDbgqTgnXJGv
	/bxivGtiNL5teNj5LZi3q+UfwME3dO9DaicvG4AEaBP++upRZj03cpB/WcIaauIgkMmbIEGrzd8CA
	eJXI05p/vZh6xNkXqkul57f1c176gB5BAj8QKIvyX+utgLpZlZwMIf8LQFnBfpy0tbgB+U3uOOMqb
	IYCVKnNhmQzV9/NALGOHKhar0gy/Bv564iQ70dwhXz43ynWZ/+uQBI+G4ekEYNlBKU5ngZiwGWDn8
	c4RoOEx5Goy61uY65u881EfFpbI2gsjVYegt9z5HHKWIvesPTp6NN3MVZPjd0knbYAmUYLttAP8k1
	1YD31LpJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlv8-004bDc-TH; Thu, 18 Mar 2021 06:14:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMluv-004bB9-Ql; Thu, 18 Mar 2021 06:14:01 +0000
X-UUID: 8d34ea7ba67d441a86c09c60755925da-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OEFsZyvsUcsDp4NLQV01Fsmg/mqaIcF23ounLLTiW+k=; 
 b=LxRBFpHS7lqraZtqD9LDHRbugEXcYsvjKm+Ot/8CqiV7XCsLiiJfByUhLG5TMiqWMSL4vksywe3G0yvUe26lpZM2cvyWLMq45MbtFNYe4bHf9zVAzF77Byu46tsxewXpSnJIXJdD6wtUa4OcIT1V640AP72udvLKaHzIaEhDwb0=;
X-UUID: 8d34ea7ba67d441a86c09c60755925da-20210317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1119952141; Wed, 17 Mar 2021 22:13:46 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 23:04:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 14:04:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 14:04:27 +0800
Message-ID: <1616047467.29855.4.camel@mtksdccf07>
Subject: Re: [PATCH 08/10] dt-bindings: phy: Add compatible for Mediatek MT8195
From: Seiya Wang <seiya.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Thu, 18 Mar 2021 14:04:27 +0800
In-Reply-To: <1616033945.25733.7.camel@mhfsdcap03>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-9-seiya.wang@mediatek.com>
 <1616033945.25733.7.camel@mhfsdcap03>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FEA5D4ADAF4C0F5C88C06D981522F13AB43C7BC46D58BACB42096B1411175DE72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_061358_622756_241641EE 
X-CRM114-Status: GOOD (  20.21  )
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

On Thu, 2021-03-18 at 10:19 +0800, Chunfeng Yun wrote:
> On Tue, 2021-03-16 at 19:14 +0800, Seiya Wang wrote:
> > This commit adds dt-binding documentation of UFS M-Phy for Mediatek MT8195 SoC
> > Platform.
> > 
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> > index 3a9be82e7f13..5235b1a0d188 100644
> > --- a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> > @@ -22,6 +22,7 @@ properties:
> >      pattern: "^ufs-phy@[0-9a-f]+$"
> >  
> >    compatible:
> > +    enum: mediatek,mt8195-ufsphy
> >      const: mediatek,mt8183-ufsphy
> >  
> There is warning when I make dt_binding_check, if mt8195 is compatible
> with mt8183, will add it as following:
> 
>     oneOf:
>       - items:
>           - enum:
>               - mediatek,mt8195-ufsphy
>           - const: mediatek,mt8183-ufsphy
>       - const: mediatek,mt8183-ufsphy
> 
> Due to Vinod already apply this patch, I'll send out a fix patch later
> 
> Thanks

I will update the patch after a new linux-next tag available.
Thank you very much.

> >    reg:
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
