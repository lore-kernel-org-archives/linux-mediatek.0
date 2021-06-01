Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD1C4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 06:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE5461263
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 06:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE5461263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaiyOsjkSztgh307EiGWWTU54XqVBaZh6jy/1/YOuhA=; b=jzbrzw6rzXtNg1
	IIMW4FnLhNZmlUPzpp05v0FyR746ECAm8eHA9STNJL9Tex3DLOcuNQ0VfTUaWNnhOZfLwqpEvIhnB
	UVh+aKF18D8O8Nztq14ldlBhKzjGMtsCO7dpcouTRqHG3h6+kbDB0wh4n/3aaQCDZnSdCV6U9g8Jy
	KSNHLCKrqySBWa4Hnxf13WukasVQyRLtbofs7DS0N41eK5kr+O7F2SzFzeTaDKY1lm0VRgfqHMtqq
	O/4gszOiZEdbJUa1gGkkz5OhOl6mafyzPo4HU7bxpk+Czah2YA9T4u4b48O1zGzKWmcPfSzB3c9RY
	SddIy8HgasQHW38p7yWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnxZW-00EriO-UO; Tue, 01 Jun 2021 06:08:14 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnxZU-00Erf4-4C
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 06:08:13 +0000
Received: by mail-lj1-x232.google.com with SMTP id e11so17602621ljn.13
 for <linux-mediatek@lists.infradead.org>; Mon, 31 May 2021 23:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+RBOKgFnHiqXpmMdbi5LttMi0EzDR2w4eBfSKrv8y8=;
 b=SSwG5kX9a/nZQ9+jle/gxa5cH3fac2/SAeuL8qINJ7JVa65PDXIGvQnqzPNvEzMlWl
 MRF2k/IQtRD/uROXpHtWpAxQ8cdA0fiNevDJT1lMFbidcMjCdqPcNFWUEeuVk6RZtuvJ
 NyaB9pANmXh6vNrXka9tRgd2Vh5Sevelfqj9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+RBOKgFnHiqXpmMdbi5LttMi0EzDR2w4eBfSKrv8y8=;
 b=TiHtlMxmP8yPg20jc7b85L7iA9jMNIWR+0Hj8vgpOnNBhXAegcaSqIEvdinp4CCJYx
 Iv1c5lK8/H48mqb/7Gwt7lePja8Ghlb2U5S44K80dRm8q8QeE69/XlNXXbuXuDFQUxL1
 SJiWc2x6QTOEAWu4tf3NjewAnqUbTrIGN4/rAlCeb1JvUVRpPhZOL7TRgXSmWdSKgWzB
 HYXcm41+DoNTXNbakYt7xbpM6qY1ekG7gc1MtBXRvY6viOlzHv2+4ewsRZFV9pQhyQ2H
 ovSPD+NKl3av+paSk/C6QFefqog11Gb9+kJTjH69N2qNvDQax5Oo3yerIbat6QAcdpe9
 Rhvw==
X-Gm-Message-State: AOAM531xZvfXkJMysJOpBj0wE7+EtlHgVPYMr6VYtgkRJGLeHiCY1QdX
 F8b/F3/WEFKykI3irX1Bwg9oJJQ5nuCFMSqhZevV2A==
X-Google-Smtp-Source: ABdhPJzW/hjUiIdkPBnpEbbE0N6TlJBMpXZ3PlMLAYbKsG/XyVjMrRGKJ6tW4F+n/kslAcDQyCFCsOslxF/0r2JcLHo=
X-Received: by 2002:a2e:a554:: with SMTP id e20mr19052884ljn.23.1622527689964; 
 Mon, 31 May 2021 23:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
 <20210601024408.24485-2-jianjun.wang@mediatek.com>
 <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
 <1622526594.9054.6.camel@mhfsdcap03>
In-Reply-To: <1622526594.9054.6.camel@mhfsdcap03>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Jun 2021 14:07:58 +0800
Message-ID: <CAGXv+5GMTbC5TTgURhPAvxBEY18S6-T-BZ9CpXsO91Trim7TXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8195
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Randy Wu <Randy.Wu@mediatek.com>, youlin.pei@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_230812_220276_E18887EE 
X-CRM114-Status: GOOD (  33.61  )
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

Hi,

On Tue, Jun 1, 2021 at 1:50 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> On Tue, 2021-06-01 at 11:53 +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Tue, Jun 1, 2021 at 10:50 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > >
> > > MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
> >
> > Based on what I'm seeing internally, there seems to be some inconsistency
> > across the MediaTek platform on whether new compatible strings should be
> > introduced for "fully compatible" IP blocks.
> >
> > If this hardware block in MT8195 is "the same" as the one in MT8192, do we
> > really need the new compatible string? Are there any concerns?
>
> Hi Chen-Yu,
>
> It's ok to reuse the compatible string with MT8192, but I think this
> will be easier to find which platforms this driver is compatible with,
> especially when we have more and more platforms in the future.

If it's just for informational purposes, then having the MT8192 compatible
as a fallback would work, and we wouldn't need to make changes to the driver.
This works better especially if we have to support multiple operating systems
that use device tree.

So we would want

    "mediatek,mt8195-pcie", "mediatek,mt8192-pcie"

and

    "mediatek,mt8192-pcie"

be the valid options.

Personally I'm not seeing enough value to justify adding the compatible string
just for informational purposes though. One could easily discern which hardware
is used by looking at the device tree.


Regards
ChenYu


> Thanks.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > > index e7b1f9892da4..d5e4a3e63d97 100644
> > > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > > @@ -48,7 +48,9 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: mediatek,mt8192-pcie
> > > +    oneOf:
> > > +      - const: mediatek,mt8192-pcie
> > > +      - const: mediatek,mt8195-pcie
> > >
> > >    reg:
> > >      maxItems: 1
> > > --
> > > 2.18.0
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
