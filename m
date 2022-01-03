Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A4DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9PRY6jogenJ4L3TxAS469rYIcCGPe9PZLP9tM2IXFA=; b=PcjBIm+C8IzcWf
	tlO16nMQ1t9ON0AbkLPNrFlLtlKknGLEGPXwmXTffGFOonh1Djys3J/AqCoOgYceeZdGT5mz2rASL
	QZ6fQRyw1xlpO7HCIIiFywvhuFAeDVJ5A4sfqMySnWRvB6KXNcW8J8RYir+m2UEyu+PufGmDhe7cJ
	XsWIMPIFOIZM4tfEkMJR04By3jFnpN2IfXk7F0r//eYlPwJB0ZLPb/QKqNJOlKETjnspbEURyvTN7
	DLugzJ3Mnvbt5KFhL11BpDxUWksYQ8Ro53HG40lQ6d9D/qRSd6rzdvyItNXeqYEWRp0hWd0E6DDej
	K/j+v7K6/n44xr/yJg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4I2F-008V4Q-Q8; Mon, 03 Jan 2022 07:45:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4I24-008V1J-2f; Mon, 03 Jan 2022 07:45:29 +0000
X-UUID: d0751a3161ee45d19b652f900d7663b2-20220103
X-UUID: d0751a3161ee45d19b652f900d7663b2-20220103
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 776081160; Mon, 03 Jan 2022 00:45:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 23:45:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Jan 2022 15:45:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 15:45:16 +0800
Message-ID: <28bc9c8ba962e09e321db3149c1196edefe4e856.camel@mediatek.com>
Subject: Re: [PATCH v20 5/7] dt-bindings: soc: mediatek: add mt8192 svs
 dt-bindings
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Mon, 3 Jan 2022 15:45:17 +0800
In-Reply-To: <98efb356-dc0d-fa7e-5579-7984f2bb3e84@gmail.com>
References: <20210721070904.15636-1-roger.lu@mediatek.com>
 <20210721070904.15636-6-roger.lu@mediatek.com>
 <98efb356-dc0d-fa7e-5579-7984f2bb3e84@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_234528_162976_E429AB46 
X-CRM114-Status: GOOD (  14.95  )
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


On Thu, 2021-12-30 at 16:30 +0100, Matthias Brugger wrote:
> Please add a commit message.

Sure, I'll add it in the next version. Thanks.

> 
> Regards,
> Matthias
> 
> On 21/07/2021 09:09, Roger Lu wrote:
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >   .../devicetree/bindings/soc/mediatek/mtk-svs.yaml         | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> > b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> > index a855ced410f8..59342e627b67 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> > @@ -22,6 +22,7 @@ properties:
> >     compatible:
> >       enum:
> >         - mediatek,mt8183-svs
> > +      - mediatek,mt8192-svs
> >   
> >     reg:
> >       maxItems: 1
> > @@ -51,6 +52,13 @@ properties:
> >         - const: svs-calibration-data
> >         - const: t-calibration-data
> >   
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: svs_rst
> > +
> >   required:
> >     - compatible
> >     - reg
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
