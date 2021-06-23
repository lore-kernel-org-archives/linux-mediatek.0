Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B62C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 09:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5F760698
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 09:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5F760698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPMD8MYTsgSAufaI0f+QSxVA49qu1n1I+r951SwGD0M=; b=uQGzXfUD8vMQ9U
	BiAqQnok+jaWP30cyYlNxHLw8MWTmO488BEzucQPx8qvQtpPMUUxQYYrbeyJqgL6WduElmQ8KtjAY
	XECfq4aQC5sbkE3dokQfwO+MY4As5qbyFBb86kgihr7d4Vv2GCDndBToopjY5Gc8OKZv2WDhtFytG
	yNYt/xQBXtXFIfQfoTDhc5YPxt17enpfUgIETqu6+Ol5fiyQ9Nb4LYuU5oWTmJ30HOCEKhsfnST3I
	xuwRmoUQ7TSejYuIZts3PhWszIEVTMSSy2hxECM9U3V1dnzCgUwwv5TLdpZhb7PdmMIUV/CU94Mfq
	MJqS1Rzj2yQlWU74OA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvywS-00A3K7-Ne; Wed, 23 Jun 2021 09:13:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvywO-00A3It-88; Wed, 23 Jun 2021 09:13:03 +0000
X-UUID: dcd4016213ef4570abd5bec7112b91d3-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WHVs4dh6AbAKAbeIIKWBxdhvq+wckIntxxe4eFfwL3A=; 
 b=gZMamKoetcWP3ttbQXdOp/wfPXqx/YKRVd5BPGlaE6AvZnbVcP01sgyKX9kWl7YOtN1nwYvKaDxrnEiknpXU19V0plkvv58G+rc7peFJyMUoNamQ4PIqtgbGL73P0aOV6vv+pNfZDxQ1TslBxrqooxHsFYo+GrbwSISXdsowYT4=;
X-UUID: dcd4016213ef4570abd5bec7112b91d3-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1523586282; Wed, 23 Jun 2021 02:12:54 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 02:02:52 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Jun 2021 17:02:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 17:02:48 +0800
Message-ID: <1624438968.2701.3.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8195
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Randy Wu <Randy.Wu@mediatek.com>,
 <youlin.pei@mediatek.com>
Date: Wed, 23 Jun 2021 17:02:48 +0800
In-Reply-To: <20210622110517.GB24565@lpieralisi>
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
 <20210601024408.24485-2-jianjun.wang@mediatek.com>
 <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
 <1622526594.9054.6.camel@mhfsdcap03>
 <CAGXv+5GMTbC5TTgURhPAvxBEY18S6-T-BZ9CpXsO91Trim7TXw@mail.gmail.com>
 <db62910b-febd-6cba-8a72-2bf718f7b110@gmail.com>
 <20210622110517.GB24565@lpieralisi>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4D63936515B4AAF2E78DF35DD5D25263CB69BF69C06A8201811E5A3736340AA42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_021300_643151_FD25915D 
X-CRM114-Status: GOOD (  43.17  )
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

On Tue, 2021-06-22 at 12:05 +0100, Lorenzo Pieralisi wrote:
> On Wed, Jun 02, 2021 at 01:33:07PM +0200, Matthias Brugger wrote:
> > 
> > 
> > On 01/06/2021 08:07, Chen-Yu Tsai wrote:
> > > Hi,
> > > 
> > > On Tue, Jun 1, 2021 at 1:50 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > >>
> > >> On Tue, 2021-06-01 at 11:53 +0800, Chen-Yu Tsai wrote:
> > >>> Hi,
> > >>>
> > >>> On Tue, Jun 1, 2021 at 10:50 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > >>>>
> > >>>> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
> > >>>
> > >>> Based on what I'm seeing internally, there seems to be some inconsistency
> > >>> across the MediaTek platform on whether new compatible strings should be
> > >>> introduced for "fully compatible" IP blocks.
> > >>>
> > >>> If this hardware block in MT8195 is "the same" as the one in MT8192, do we
> > >>> really need the new compatible string? Are there any concerns?
> > >>
> > >> Hi Chen-Yu,
> > >>
> > >> It's ok to reuse the compatible string with MT8192, but I think this
> > >> will be easier to find which platforms this driver is compatible with,
> > >> especially when we have more and more platforms in the future.
> > > 
> > > If it's just for informational purposes, then having the MT8192 compatible
> > > as a fallback would work, and we wouldn't need to make changes to the driver.
> > > This works better especially if we have to support multiple operating systems
> > > that use device tree.
> > > 
> > > So we would want
> > > 
> > >     "mediatek,mt8195-pcie", "mediatek,mt8192-pcie"
> > > 
> > > and
> > > 
> > >     "mediatek,mt8192-pcie"
> > > 
> > > be the valid options.
> > > 
> > > Personally I'm not seeing enough value to justify adding the compatible string
> > > just for informational purposes though. One could easily discern which hardware
> > > is used by looking at the device tree.
> > > 
> > 
> > I agree, if no differences between the two chips are known, adding a
> > binding withe new compatible and a fallback is a good thing. If we
> > later on realize that mt8195 PCI block has differences, we can add the
> > matching to the driver.
> 
> So this series can be dropped, right ?

Yes, we will send dt-bindings with dts changes in another series,
thanks.
> 
> Thanks,
> Lorenzo
> 
> > Regards,
> > Matthias
> > 
> > > 
> > > Regards
> > > ChenYu
> > > 
> > > 
> > >> Thanks.
> > >>>
> > >>>
> > >>> Thanks
> > >>> ChenYu
> > >>>
> > >>>
> > >>>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
> > >>>>  1 file changed, 3 insertions(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > >>>> index e7b1f9892da4..d5e4a3e63d97 100644
> > >>>> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > >>>> @@ -48,7 +48,9 @@ allOf:
> > >>>>
> > >>>>  properties:
> > >>>>    compatible:
> > >>>> -    const: mediatek,mt8192-pcie
> > >>>> +    oneOf:
> > >>>> +      - const: mediatek,mt8192-pcie
> > >>>> +      - const: mediatek,mt8195-pcie
> > >>>>
> > >>>>    reg:
> > >>>>      maxItems: 1
> > >>>> --
> > >>>> 2.18.0
> > >>>> _______________________________________________
> > >>>> Linux-mediatek mailing list
> > >>>> Linux-mediatek@lists.infradead.org
> > >>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > >>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
