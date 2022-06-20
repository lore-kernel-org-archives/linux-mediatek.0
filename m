Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686B6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 06:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyRdkqEtBdMFu5dmjx0PacN2tWJ1iUD+F44uHQqTTg0=; b=pyBG8BQJBw9DVwgL+N3tv9J+QY
	qmpJ0O/Ahn4bzgLAAiPB+956lEfHCGvdX6y7VDyDCCPcP0EvEPVCa0zxOn5Ae5AoQJcJ/6NSUBuqY
	EuTRoubNAixdehvO9Jh/F4CtjT1SUvZaUbxEK9ueK26H5ogIxmmgYlk5uXxpNkZySXCUo66q+MZ91
	z19AhYLeReScFuPoGAVzKooAgtdNeoUp651rt/zLBnF/5UJjU3UZgQXlwhOw4fomZeGyJ4wen++UZ
	7SPRTFoz9Gzg0XzGif+Spc7FsesV/RqNCW07a6rxe3YLa+k0umuDj5f2ZD0U9WTL4MhPc+OWXi10q
	0AyFlFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3B9b-00GTma-Tk; Mon, 20 Jun 2022 06:44:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3B9W-00GTl1-H7; Mon, 20 Jun 2022 06:44:54 +0000
X-UUID: fb692da7e7e74c3ca92a641a1d212b7f-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:32d67ad5-aeb5-4aab-b959-c2f5f90f6c29,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:f529832d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fb692da7e7e74c3ca92a641a1d212b7f-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1273844429; Sun, 19 Jun 2022 23:44:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 23:40:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 14:40:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 14:40:55 +0800
Message-ID: <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
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
Date: Mon, 20 Jun 2022 14:40:55 +0800
In-Reply-To: <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
	 <20220616073042.13229-2-tinghan.shen@mediatek.com>
	 <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_234450_605742_10E5FD24 
X-CRM114-Status: GOOD (  17.64  )
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

On Thu, 2022-06-16 at 06:55 -0700, Krzysztof Kozlowski wrote:
> On 16/06/2022 00:30, Tinghan Shen wrote:
> > Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > index b7e68b0dfa13..ca8d8661f872 100644
> > --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > @@ -50,13 +50,13 @@ properties:
> >  
> >    mboxes:
> >      items:
> > -      - description: ipc reply between host and audio DSP.
> > -      - description: ipc request between host and audio DSP.
> > +      - description: mailbox for receiving audio DSP requests.
> > +      - description: mailbox for transmitting requests to audio DSP.
> >  
> >    mbox-names:
> >      items:
> > -      - const: mbox0
> > -      - const: mbox1
> > +      - const: rx
> > +      - const: tx
> >  
> 
> Commit msg lacks important piece - do you break any users with this? Do
> you have any users of this binding?
> 
> 
> Best regards,
> Krzysztof

The 8195 dsp node, which uses this binding, has not yet been added to the 8195 devicetree.


Thanks,
TingHan


