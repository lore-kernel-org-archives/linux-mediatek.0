Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EFCC4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 05:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AD26139A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 05:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83AD26139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCrfmOmpiGQYl/WkiSjQau4uLV9KgC2ZfJ981YyXsDk=; b=0ezOv6KZrmxy4n
	+MIXmpaNvOh6LW+mS6jNtw1vgQj12bOrRQMN66Cfc2MNgU+3u81v6snSIyq3R1PZxdZvdckDmO1EU
	v16x6ZhFeZa3E/XmTISg9hh9DpwN/oGGn8Oj6455HOSoanUdszrww4bzeElR1v6mr9dAut+Wzq64O
	K5CU602DjR9FbbrFWbpMTdA8jFroGde6ucOO66gMWAK3z+B4H8AKusHqoeFmFBLMEYqZ+5aP6gX0q
	opBY6+7FtSebHg3E+EptJjWSXb1NInqQ2QJirH2wAzSNc9bX6zdLZbuHi+E0rQt0mYpngrNZQL2Ag
	ssp9qxvHGE18TjnyFCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnxI1-00EopW-3o; Tue, 01 Jun 2021 05:50:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnxHw-00Eonn-3R; Tue, 01 Jun 2021 05:50:07 +0000
X-UUID: 32bdeb09b72e4ebdbc58f4c533af3246-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jiSLFkIn1fEytymJzHWtMUL+9HgJF2xAn74O+cTz5C4=; 
 b=tRm3/ronP2BskDtwbWBhHsaA4mr/GVUFdWPUyT1rt1b8kLk8JDz5LMVtiPUBMqSYsz0QbG3AmxGR5EAS4jiJlJr03hcuqEDfpnP/7VZ0uK9bPJCz+WP1m+peYoP9BBG+nTsHGEuY4YXgEYnJOUwjDGX9/XLHUvCpCpLJWAlFZ/g=;
X-UUID: 32bdeb09b72e4ebdbc58f4c533af3246-20210531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1383701657; Mon, 31 May 2021 22:50:02 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 22:50:00 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Jun 2021 13:49:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Jun 2021 13:49:54 +0800
Message-ID: <1622526594.9054.6.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8195
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Randy Wu <Randy.Wu@mediatek.com>,
 <youlin.pei@mediatek.com>
Date: Tue, 1 Jun 2021 13:49:54 +0800
In-Reply-To: <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
 <20210601024408.24485-2-jianjun.wang@mediatek.com>
 <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B186BFA5F6860A0A9441A37F5F3612750236F03574A7631EB87997CBB9D33AC02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_225004_199279_893775FF 
X-CRM114-Status: GOOD (  26.07  )
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

On Tue, 2021-06-01 at 11:53 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, Jun 1, 2021 at 10:50 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> >
> > MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
> 
> Based on what I'm seeing internally, there seems to be some inconsistency
> across the MediaTek platform on whether new compatible strings should be
> introduced for "fully compatible" IP blocks.
> 
> If this hardware block in MT8195 is "the same" as the one in MT8192, do we
> really need the new compatible string? Are there any concerns?

Hi Chen-Yu,

It's ok to reuse the compatible string with MT8192, but I think this
will be easier to find which platforms this driver is compatible with,
especially when we have more and more platforms in the future.

Thanks. 
> 
> 
> Thanks
> ChenYu
> 
> 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index e7b1f9892da4..d5e4a3e63d97 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -48,7 +48,9 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: mediatek,mt8192-pcie
> > +    oneOf:
> > +      - const: mediatek,mt8192-pcie
> > +      - const: mediatek,mt8195-pcie
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
