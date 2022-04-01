Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D294CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 02:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MX3YeOB2K9jdcI6NUyoP9Z7+Ss+Bi95pzDze6awq3g=; b=k7e13GaUrqiua+
	EYhZP4LzvbedWTpIs1C74XXSERBxWM2ATNSvoS1jL1enD2EGwqqVt2XOTnmC+VhXPGZY0mrAV3EVT
	loGzRFNI+FnLfiOWhkcyb413zxFtsOJB94RFRr2GEnEs/zyOrKtqT9TyVfGYotf9pmxXl7GU3ENBx
	MYQcGlAuN3XnjJ1HAKmPdYzlY/PBF6mYyWQMrVvhtBzwrZ4e8yJKl70pp4FWcmCWVjuyLqTCqkAa/
	vUACXyqTo8kDmv0RbUADt0CdMIpDDXrlIOvE5YtIxpyenrprVEWkxSg93RM6ON5jc+kxAgLPbjMXP
	exFDbyAGG7JJ+7wmFE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na6rz-004FpI-67; Fri, 01 Apr 2022 02:18:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na6rm-004Fme-P9; Fri, 01 Apr 2022 02:18:24 +0000
X-UUID: f0f6e3ae685e42edb0f2d77874d0dc72-20220331
X-UUID: f0f6e3ae685e42edb0f2d77874d0dc72-20220331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 114760172; Thu, 31 Mar 2022 19:18:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 19:18:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 1 Apr 2022 10:18:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 10:18:08 +0800
Message-ID: <53cb53b8614aa39e0785b99f46b708ad201c3dd8.camel@mediatek.com>
Subject: Re: [PATCH v13 1/2] dt-bindings: mmc: mtk-sd: increase reg items
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>
Date: Fri, 1 Apr 2022 10:18:08 +0800
In-Reply-To: <aebbb5c8-1d27-5e66-e18a-e2b647bc8cb4@gmail.com>
References: <20220330094532.21721-1-tinghan.shen@mediatek.com>
 <20220330094532.21721-2-tinghan.shen@mediatek.com>
 <aebbb5c8-1d27-5e66-e18a-e2b647bc8cb4@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_191822_870706_FE03D83E 
X-CRM114-Status: GOOD (  20.90  )
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

Hi Matthias,

On Thu, 2022-03-31 at 12:54 +0200, Matthias Brugger wrote:
> 
> On 30/03/2022 11:45, Tinghan Shen wrote:
> > MediaTek has a new version of mmc IP since mt8183. Some IO registers
> > are moved to top to improve hardware design and named as "host top
> > registers".
> > 
> > Add host top register in the reg binding description for mt8183 and
> > successors.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 ++++++++++++++-
> >   1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 297ada03e3de..2a2e9fa8c188 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -40,7 +40,10 @@ properties:
> >             - const: mediatek,mt8183-mmc
> >   
> >     reg:
> > -    maxItems: 1
> > +    minItems: 1
> 
>  From my understanding adding minItems is correct, but you need to add also 
> maxItems: 2 as there can't be more then two register entries.
> 
> Regards,
> Matthias
> 

After add "maxItems: 2", I get following message when doing dt_binding_check.
from this message, it looks like that maxItems is not necessary.

/proj/mtk15399/2cros/src/third_party/kernel/v5.10/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: 
properties:reg: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'base register
(required).'}, {'description': 'top base register (required for MT8183).'}]} should not be valid
under {'required': ['maxItems']}
        hint: "maxItems" is not needed with an "items" list
        from schema $id: http://devicetree.org/meta-schemas/items.yaml#
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json

Best regards,
Tinghan

> > +    items:
> > +      - description: base register (required).
> > +      - description: top base register (required for MT8183).
> >   
> >     clocks:
> >       description:
> > @@ -168,6 +171,16 @@ required:
> >     - vmmc-supply
> >     - vqmmc-supply
> >   
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: mediatek,mt8183-mmc
> > +then:
> > +  properties:
> > +    reg:
> > +      minItems: 2
> > +
> >   unevaluatedProperties: false
> >   
> >   examples:


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
