Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B87C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Co8LbnWic/s/VV3WfTkUyMetLAIR9PBbh8Zif5dbxk0=; b=JJa8rlHvIzBshU
	3HijNeXqjlHoH7TlDVl94L/akUdgT+sIRdeg0nxaxYsRTsahC8DSdPd7er+cXxvmBG4yMWqBEJixA
	Tr2iNUzTMgf/3EfcV1izEbVEdfyzwPF/Ft0MU+3KJNf7gIf96UoFbFlIKsh0eTGAiFBC+nLnFwrah
	KNEAgGTa2GYTEQqU+e+cRP7KTV+ywM+whmIhdlJOv1k/EkfX5kJxx1v1zFImJ7hacysKzaYZo14KG
	d4AxKag9Kl2Bnd0ZbGtKREIHU2ukLsozGaBb7XFEZpg+8RaWiO0u207+9hVk8gsWtWC7euN2BocK5
	RTt40bQVJivhLEQeO1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJlM-009fiQ-61; Fri, 29 Apr 2022 06:05:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJlA-009fgF-9O; Fri, 29 Apr 2022 06:05:46 +0000
X-UUID: 5c0e2f6f41ba42c08cd6157f9cc297f8-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0e78a026-b33f-4348-8970-07dbf68a3edd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:de0b242f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5c0e2f6f41ba42c08cd6157f9cc297f8-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 750613079; Thu, 28 Apr 2022 23:05:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 22:59:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 13:59:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 13:59:45 +0800
Message-ID: <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
From: YC Hung <yc.hung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
CC: <robh+dt@kernel.org>, <broonie@kernel.org>, <daniel.baluta@nxp.com>,
 <trevor.wu@mediatek.com>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <cezary.rojewski@intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>
Date: Fri, 29 Apr 2022 13:59:46 +0800
In-Reply-To: <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
 <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_230544_362219_9EADF2BC 
X-CRM114-Status: GOOD (  18.22  )
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

Hi Mattias/Rob,

Sorry I miss this mail.
Could you please help to check this patch? Thanks.

On Fri, 2022-01-14 at 13:56 +0100, Matthias Brugger wrote:
> 
> On 12/01/2022 02:43, Rob Herring wrote:
> > On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
> > > From: "YC Hung" <yc.hung@mediatek.com>
> > > 
> > > This patch adds mt8195 dsp document. The dsp is used for Sound
> > > Open
> > > Firmware driver node. It includes registers,  clocks, memory
> > > regions,
> > > and mailbox for dsp.
> > > 
> > > Signed-off-by: yc.hung <yc.hung@mediatek.com>
> > > ---
> > > Changes since v3:
> > >    Fix patch v3 error : v3 only provide difference between v3 and
> > > v2.
> > > 
> > > Changes since v2:
> > >    Remove useless watchdog interrupt.
> > >    Add commit message more detail description.
> > > 
> > > Changes since v1:
> > >    Rename yaml file name as mediatek,mt8195-dsp.yaml
> > >    Refine descriptions for mailbox, memory-region and drop unused
> > > labels
> > >    in examples.
> > > ---
> > >   .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105
> > > ++++++++++++++++++
> > >   1 file changed, 105 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > 
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> 
> Rob, it seems we don't have a maintainer for this bindings. Shall I
> as MediaTek 
> SoC maintainer take them through my branch?
> 
> Regards,
> Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
