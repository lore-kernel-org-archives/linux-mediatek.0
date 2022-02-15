Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F21EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOhbF0PMjxM+rdEZyTWACAVWYsr0YneN8mnpn2L5RkA=; b=ckj7V7uVQzhXCy
	PZ5mrYV2s73YIYgtsofZnunk/BpVGLeEuaxE+Hv5QOJ71QsQedO2UmFsUnfgJV6QlVFcgYL9J+dOS
	MGX4v/WCrYMywYPLKqGIHQahDzvpOxcz6ZTaZ0MwjmhiTE14+0N4eDK9AHag94cieUsWsmuuVSzVv
	f56UskKTcmcPHo+035h5MKpH+oNRiWuxxIuATScpMkJmMSXlV/mI1KcpvdI9cSMSZ/tPNN3INuGuU
	sL2rKPxxIeL/wrM1A/s30U7DipTgJabd/SArdzHMN1eV5+9hhILJNOXhxGB/jhNorgg8M4SBpVnyX
	mMOBFfzq4H8VcEmfqfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuUX-00284s-CF; Tue, 15 Feb 2022 09:51:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuUQ-00280c-N0; Tue, 15 Feb 2022 09:51:20 +0000
X-UUID: b92ad695417048ee9473d37711922861-20220215
X-UUID: b92ad695417048ee9473d37711922861-20220215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2086550935; Tue, 15 Feb 2022 02:51:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 01:51:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 17:51:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 17:51:08 +0800
Message-ID: <5add799961ff3affd766787a6ee4b87f27e1cb58.camel@mediatek.com>
Subject: Re: [PATCH v22 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
From: Roger Lu <roger.lu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, "HenryC
 Chen" <HenryC.Chen@mediatek.com>, Nishanth Menon <nm@ti.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Fan Chen
 <fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Nicolas
 Boichat <drinkcat@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, "Mark Rutland"
 <mark.rutland@arm.com>, Angus Lin <Angus.Lin@mediatek.com>
Date: Tue, 15 Feb 2022 17:51:08 +0800
In-Reply-To: <4490a88150f5aa108e1d6ff8ce55264c3b1734c2.camel@mediatek.com>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-2-roger.lu@mediatek.com>
 <YfnFBirxSnCqRDem@robh.at.kernel.org>
 <4490a88150f5aa108e1d6ff8ce55264c3b1734c2.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_015118_810539_6C2F4EFD 
X-CRM114-Status: GOOD (  22.55  )
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

On Mon, 2022-02-07 at 14:24 +0800, Roger Lu wrote:
> Hi Rob,
> 
> On Tue, 2022-02-01 at 17:40 -0600, Rob Herring wrote:
> > On Thu, 27 Jan 2022 11:39:50 +0800, Roger Lu wrote:
> > > Document the binding for enabling mtk svs on MediaTek SoC.
> > > 
> > > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > > ---
> > >  .../bindings/soc/mediatek/mtk-svs.yaml        | 83 +++++++++++++++++++
> > >  1 file changed, 83 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-
> > > svs.yaml
> > > 
> > 
> > 
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> > 
> > If a tag was not added on purpose, please state why and what changed.
> 
> Oh, this patch has error detected and shown in [1]. Therefore, I fix it and
> state the change at [2]. Thanks for the explanation and time to review the
> patch.

Excuse me, just for the double check. Since this issue [1] is fixed, could I add
your Reviewed-by tags back or just send the next version directly without adding
any tags. Thanks a lot.

> 
> [1] 
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220107095200.4389-2-roger.lu@mediatek.com/__;!!CTRNKA9wMg0ARbw!2KArHJHZu-89hcY8BqxHqe4fB0IVbahNropr5XS4dGEVniMY0xUfdoa5znw1VQFN$
>  
> [2] 
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20220127033956.24585-1-roger.lu@mediatek.com/__;!!CTRNKA9wMg0ARbw!2KArHJHZu-89hcY8BqxHqe4fB0IVbahNropr5XS4dGEVniMY0xUfdoa5zvor4e0p$
>  
> - Remove unnecessary "maxItems" from nvmem-cells in mtk-svs.yaml.
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!2KArHJHZu-89hcY8BqxHqe4fB0IVbahNropr5XS4dGEVniMY0xUfdoa5zmaupAcC$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
