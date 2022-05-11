Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD9BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 02:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj8W/FKUgYD4U6xtB7FxVbJ9IkK0dRm/wGbwIQQOyUA=; b=e0rk2jg/AMnD63
	EjTPE72A0bDEE/H2DTS47Zuk9BJOuVMBrdlQSaH0f4+U/WoCoCSVOCIonIRP+9LC5OBiU2D28pnax
	BGMZYCsCY5tKIqAvfZ9ubcWZk8XPnHtuWhrL7/oJjPe+Hp5LAKbaIBnoZFUXU1WN9q4RrzOxqS02Y
	IebDVgm6Ri0Mre6X/zeIppOcHlSqPgLbSVgTSWgrDvZ53mbAfPxi0q2WJ4kKp9y+3/kcSd3TYCqIZ
	K2rGf+K5h4pN9waLFaKYF72entFv/CKXco3mCKEjWusK6KQ0VnHpr+ANUOiOq7q0nwmyZC8d+nr6K
	duQvL2NKa+WOOIOypD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noc4S-004m9Y-4I; Wed, 11 May 2022 02:27:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noc4D-004m33-P3; Wed, 11 May 2022 02:27:14 +0000
X-UUID: 47b8d37fb2e349f4bc3350782f7f5974-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1a713b1e-66c8-4233-a93b-ef8d0c4058cc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f58004e6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 47b8d37fb2e349f4bc3350782f7f5974-20220510
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2132099178; Tue, 10 May 2022 19:26:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 19:26:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 10:26:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 11 May 2022 10:26:56 +0800
Message-ID: <4d2b1c2c4ab27ba96d59b9a0e3adcdab311ec897.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chen-Yu Tsai
 <wenst@chromium.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?="
 <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Nancy Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 11 May 2022 10:26:56 +0800
In-Reply-To: <0686125d-4984-5dcd-32ca-4eeece09d7c3@linaro.org>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
 <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
 <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
 <0686125d-4984-5dcd-32ca-4eeece09d7c3@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_192709_863494_07892C44 
X-CRM114-Status: GOOD (  19.97  )
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

On Tue, 2022-05-10 at 18:57 +0800, Krzysztof Kozlowski wrote:
> On 10/05/2022 12:37, Chen-Yu Tsai wrote:
> > > Use a generic node name, as Devicetree spec asks:
> > > "The name of a node should be somewhat generic, reflecting the
> > > function
> > > of the device and not its precise programming
> > > 
> > > model. If appropriate, the name should be one of the following
> > > choices:"
> > > 
> > > I proposed dma-controller, but feel free to find better generic
> > > node name.
> > 
> > dma-controller is covered by dma-controller.yaml, which references
> > dma-common.yaml in its entirety, so I don't think that would work.
> > 
> > What about "blitter"? I think that is a generic term that is/was
> > commonly
> > used with display hardware and sort of describes the function of
> > the RDMA
> > & WDMA blocks, and if only one side is memory and the other is the
> > display
> > pipeline.
> 
> Sure, sounds fine!
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof and Chen-Yu,

Nancy thinks our IP is more like rdma.
Blitter may be somthing for reading memory and writing to another
memory, but we don't have the function of writing memory.
If we use rdma, is it ok?

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
