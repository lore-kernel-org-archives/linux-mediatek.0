Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7693C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Xgj6azihTC7ezmYKfbLEuh7QyIbfveIbIK4gzfYr1Y=; b=PgEtZZ83YJL1b/
	wn1cnxjPk27suNCETGYi54MrJB4oPL2pyIYo8DWpKMYawoB+1rnRU+Kb1KJAZk/3kSm8xYv2JxACg
	W+IGAuw4eeXp4nuDOJGy1Qd/X9dHIAQnINQH4ny7UEZoQcinxq+T0Mz1eB2db8t3hxb88+1Q7NwfK
	kvCT6YrpKNXbbsZ2ct2bFmFetNzM3oOW5+UEHsysxxWS7hQwyifvA40OSMWUXvsgIbnQDDAtCQ4sq
	ShIsgZzhEwU8HiMUmErUMnFnk9U9jvARZSuvK1/0ge1WMH0fwMMtcPfeRZdGLL6Yf9VVhADx24mED
	KOrLte3K/NNpO+HShACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNaWb-0053cM-OK; Fri, 25 Feb 2022 13:20:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNaV5-0052tf-8f; Fri, 25 Feb 2022 13:19:13 +0000
X-UUID: 784a5fecdf314b20b94715df60977b3a-20220225
X-UUID: 784a5fecdf314b20b94715df60977b3a-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1285729415; Fri, 25 Feb 2022 06:19:03 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 05:17:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Feb 2022 21:16:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Feb 2022 21:16:59 +0800
Message-ID: <055296d32d218ccc3285351516b14b4fc8aba238.camel@mediatek.com>
Subject: Re: [PATCH v17 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mtk
 adsp-mbox document
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Jassi Brar <jaswinder.singh@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Chen-Yu Tsai <wenst@chromium.org>, Kevin Hilman
 <khilman@baylibre.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>
Date: Fri, 25 Feb 2022 21:16:59 +0800
In-Reply-To: <YheugpFub9ArHDyT@robh.at.kernel.org>
References: <20220224133045.23903-1-allen-kh.cheng@mediatek.com>
 <20220224133045.23903-2-allen-kh.cheng@mediatek.com>
 <YheugpFub9ArHDyT@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_051911_364433_B13E04D5 
X-CRM114-Status: GOOD (  23.62  )
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

On Thu, 2022-02-24 at 10:12 -0600, Rob Herring wrote:
> On Thu, Feb 24, 2022 at 09:30:44PM +0800, Allen-KH Cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > This patch adds document for mediatek adsp mbox
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 52
> > +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-
> > mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-
> > mbox.yaml
> > new file mode 100644
> > index 000000000000..25756837797f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml*__;Iw!!CTRNKA9wMg0ARbw!1-w9zcYC59nNwgZh8GRqYCSfHVTtj2nHfLuwGaqiLdOeCxlBGUkwqcW50EVBYejpHXulQA$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1-w9zcYC59nNwgZh8GRqYCSfHVTtj2nHfLuwGaqiLdOeCxlBGUkwqcW50EVBYejjdYjzJw$
> >  
> > +
> > +title: Mediatek ADSP mailbox
> > +
> > +maintainers:
> > +  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > +
> > +description: |
> > +  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables
> > the SoC
> > +  to ommunicate with ADSP by passing messages through two mailbox
> > channels.
> > +  The MTK ADSP mailbox IPC also provides the ability for one
> > processor to
> > +  signal the other processor using interrupts.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-adsp-mbox
> > +
> > +  "#mbox-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    description:
> > +      Physical address base for dsp mbox registers.
> 
> That's fairly obvious. Drop.
> 
> You need to define how many: 'maxItems: 1'
> 
Hi Rob,

thanks for your suggestions and comments.

I will add the number information for reg and interrupts.

Best Regards,
Allen

> > +
> > +  interrupts:
> > +    description:
> > +      adsp mbox interrupt
> 
> Same here.
> 
> > +
> > +required:
> > +  - compatible
> > +  - "#mbox-cells"
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    adsp_mailbox0:mailbox@10816000 {
> > +        compatible = "mediatek,mt8195-adsp-mbox";
> > +        #mbox-cells = <0>;
> > +        reg = <0x10816000 0x1000>;
> > +        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
> > +    };
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
