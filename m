Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2097BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPpkpQAAbBhAhEmIHzYzONdtlBlOKrtI8LIqwfxcui4=; b=zygw1edl1J4+0S
	fnYrYrNRKtiaDHtGSl15cEN+H3ivJr9AHps/RgR2dsvkQpTEb9lyCEmR8n0q+UMcnCyROnqDfzsT6
	oZ9Nr3u8EPRiJlV+JEbc/X9NAytsBNAhVNE5Vc2FrSh+IhBXEzgRwSJlUY0J9qjCyKthZuE0PVWhO
	deapZDOWw7KnK3YDJA8mJr2HjARkE6INhiC2vwRNFTNFDwzF3YoBwn2qtqsVjg4LOC2GlwOSXLwC9
	JNJCEDKPB12on2BXYAGLp3S3d7U7W0mQ/35y8vlAjFqXm04CNsFSbqLgyWT1A2ltd10T500mQET3Q
	hhCrdQ7GtmQtddIWWvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGcW-007WHk-8j; Mon, 21 Mar 2022 11:54:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGcT-007WFZ-3N; Mon, 21 Mar 2022 11:54:42 +0000
X-UUID: 3f676ed01dcc4703ba9c6a6cf2e07dfa-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wBZ0qYu+mkECpK0J2wk0YxEDb52TU4U0zJd7YLj8pkc=; 
 b=u8FvI//f8A24xp8c/JItuQZTsK5SQTFUSJEO/fUja3q0vDXlJ/ZdYj1G10K5VndIJlkRA3FEHAZlrEDw3rppXIrJe9GJOEi5DVwwZ3Ld2+6QdV0NN5lhCY/uTkJ8eZm2cJEkNao/CTNQttQRkuFEkFJd1EJ5g88d5p/EvkBm/Tk=;
X-UUID: 3f676ed01dcc4703ba9c6a6cf2e07dfa-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2108165061; Mon, 21 Mar 2022 04:54:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 04:54:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Mar 2022 19:54:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 19:54:31 +0800
Message-ID: <b71b2496a19745648d6b1a9788f35b0371b45847.camel@mediatek.com>
Subject: Re: [RESEND v7 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Tian Tao <tiantao6@hisilicon.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yue Hu <huyue2@yulong.com>, <linux-arm-kernel@lists.infradead.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Jeffery <andrew@aj.id.au>, 
 <angelogioacchino.delregno@collabora.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, "Eric
 Biggers" <ebiggers@google.com>, Satya Tangirala <satyat@google.com>, "Stephen
 Boyd" <swboyd@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, <linux-mediatek@lists.infradead.org>, Lucas Stach
 <dev@lynxeye.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "Kiwoong
 Kim" <kwmad.kim@samsung.com>
Date: Mon, 21 Mar 2022 19:54:31 +0800
In-Reply-To: <1647742413.962309.2990518.nullmailer@robh.at.kernel.org>
References: <20220317101215.24985-1-axe.yang@mediatek.com>
 <20220317101215.24985-2-axe.yang@mediatek.com>
 <1647742413.962309.2990518.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045441_200176_9A722A2B 
X-CRM114-Status: GOOD (  23.42  )
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

Hi Rob,

Thanks for your review.

On Sat, 2022-03-19 at 20:13 -0600, Rob Herring wrote:
> On Thu, 17 Mar 2022 18:12:13 +0800, Axe Yang wrote:
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to
> > host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24
> > ++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/mmc/mtk-sd.yaml:
> properties:pinctrl-names: {'description': 'Should at least contain
> default and state_uhs. To support SDIO in-band wakeup, dat1 pin will
> be switched between GPIO mode and SDIO DAT1 mode, state_eint and
> state_dat1 are mandatory in this scenarios.', 'minItems': 2,
> 'maxItems': 4, 'items': [{'const': 'default'}, {'const':
> 'state_uhs'}, {'const': 'state_eint'}, {'const': 'state_dat1'}]}
> should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: ignoring,
> error in schema: properties: pinctrl-names
> Documentation/devicetree/bindings/mmc/mtk-sd.example.dt.yaml:0:0: 
> /example-0/mmc@11230000: failed to match any schema with compatible:
> ['mediatek,mt8173-mmc']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1606491
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.


I reproduced the error and already fix it in v8.

Regards,
Axe
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
