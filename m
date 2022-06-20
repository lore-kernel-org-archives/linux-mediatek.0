Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA88CCA47E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOeLG9LgYpPmwNiOrX1z9/pngcSumwDuwracB+4lOOs=; b=Pypm1Reb2F4qk3K5WqMZxFypJs
	E/+nWrtsfaDi5d6VfHo21VyOjj4/u0frr6o3c0nl/351vYW2QIHr9U2KIows/6q0/0wRHj8Hp/hEd
	3PjNGOC/JlOJJANTlNuP0k/1peK+AI8wzzVLuCc0FyOQ158pFwdz0n8zAfisulZnyHXLpxohbr7Pv
	D6f4XxvCpRgrA/5+jiN8tMHwadhByZK+8vexaADKALUPlEMndLDnhnX9XoLg4+XWNMLgU5DKKWAgQ
	NUzd7/V3wbG18QfnE0a2lnM/Ln3a5bIN54q+qFwtI+P8iE7pipfmYlluNb5ufqWGmKka593xD22Sm
	DOPp4Ehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3DaH-00H7Pj-3D; Mon, 20 Jun 2022 09:20:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3DZP-00H6v7-Bb; Mon, 20 Jun 2022 09:19:45 +0000
X-UUID: 76ead133c1284dba8367adc0832c24ab-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:97aedb5d-eeb8-4bfe-bf60-3a52ebadc8c9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:ff93ffe9-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 76ead133c1284dba8367adc0832c24ab-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1808312587; Mon, 20 Jun 2022 02:19:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 02:16:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 17:16:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 17:16:41 +0800
Message-ID: <485c9b07fb2a60635e7cd52e710af872733fcff9.camel@mediatek.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, YC Hung <yc.hung@mediatek.com>, Curtis Malainey
	<cujomalainey@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 20 Jun 2022 17:16:41 +0800
In-Reply-To: <3830efc5-298d-7887-5718-2cb2a7ad4895@linaro.org>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
	 <20220616073042.13229-2-tinghan.shen@mediatek.com>
	 <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
	 <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
	 <3830efc5-298d-7887-5718-2cb2a7ad4895@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_021943_437775_A63EEFB4 
X-CRM114-Status: GOOD (  22.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Mon, 2022-06-20 at 10:51 +0200, Krzysztof Kozlowski wrote:
> On 20/06/2022 08:40, Tinghan Shen wrote:
> > Hi Krzysztof,
> > 
> > On Thu, 2022-06-16 at 06:55 -0700, Krzysztof Kozlowski wrote:
> > > On 16/06/2022 00:30, Tinghan Shen wrote:
> > > > Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
> > > > 
> > > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > index b7e68b0dfa13..ca8d8661f872 100644
> > > > --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > @@ -50,13 +50,13 @@ properties:
> > > >  
> > > >    mboxes:
> > > >      items:
> > > > -      - description: ipc reply between host and audio DSP.
> > > > -      - description: ipc request between host and audio DSP.
> > > > +      - description: mailbox for receiving audio DSP requests.
> > > > +      - description: mailbox for transmitting requests to audio DSP.
> > > >  
> > > >    mbox-names:
> > > >      items:
> > > > -      - const: mbox0
> > > > -      - const: mbox1
> > > > +      - const: rx
> > > > +      - const: tx
> > > >  
> > > 
> > > Commit msg lacks important piece - do you break any users with this? Do
> > > you have any users of this binding?
> > > 
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > The 8195 dsp node, which uses this binding, has not yet been added to the 8195 devicetree.
> 
> Could you mention it in the commit msg? Such one sentence is enough.
> 
> With commit msg extended:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof

No problem. I'll udpate commit message at next version.


Thanks,
TingHan




