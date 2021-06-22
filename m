Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8C2C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 11:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530876115A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 11:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530876115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/2AuEVoVOGQdAjb6EwwhoxA7axdLPnSRdVKty7MlR8=; b=u0YhgnwDVvqy4+
	pUJtveO7ZQsz2ruxeacL2kABMvhBOqAmDajvundCisv4uJXd9Hg3zx5+YtPbWvXtvobke+8IS70Om
	diK5jDK7pNYBdHn0VpPZAzVGOBfv7dJwJoDzM+TiNe+ZjE/Pea7OIiwhNkS4eNvHfga0NBNCGTMde
	7Qu3FmrPAArYsM96OaTF13vPGp7zkWPT6IQb7bny8G02GL52HYuXyDgQsNPTP/v4VrGicGnVwoeWN
	HsEb+/kbrAYgrVjp6ZNG2PsGH+5+f87Lo7YXfRuA0Sd9EhbW0ATrBmFSzzS+N2iJ/ap6oL+MkmJXP
	dFbuDvD5Um/31FwbHsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lveEG-006qqS-C7; Tue, 22 Jun 2021 11:06:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lveDa-006qYb-26; Tue, 22 Jun 2021 11:05:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0069231B;
 Tue, 22 Jun 2021 04:05:21 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5302E3F694;
 Tue, 22 Jun 2021 04:05:19 -0700 (PDT)
Date: Tue, 22 Jun 2021 12:05:17 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randy Wu <Randy.Wu@mediatek.com>, youlin.pei@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8195
Message-ID: <20210622110517.GB24565@lpieralisi>
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
 <20210601024408.24485-2-jianjun.wang@mediatek.com>
 <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
 <1622526594.9054.6.camel@mhfsdcap03>
 <CAGXv+5GMTbC5TTgURhPAvxBEY18S6-T-BZ9CpXsO91Trim7TXw@mail.gmail.com>
 <db62910b-febd-6cba-8a72-2bf718f7b110@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db62910b-febd-6cba-8a72-2bf718f7b110@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_040522_293054_1B4D5859 
X-CRM114-Status: GOOD (  38.58  )
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

On Wed, Jun 02, 2021 at 01:33:07PM +0200, Matthias Brugger wrote:
> 
> 
> On 01/06/2021 08:07, Chen-Yu Tsai wrote:
> > Hi,
> > 
> > On Tue, Jun 1, 2021 at 1:50 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> >>
> >> On Tue, 2021-06-01 at 11:53 +0800, Chen-Yu Tsai wrote:
> >>> Hi,
> >>>
> >>> On Tue, Jun 1, 2021 at 10:50 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> >>>>
> >>>> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.
> >>>
> >>> Based on what I'm seeing internally, there seems to be some inconsistency
> >>> across the MediaTek platform on whether new compatible strings should be
> >>> introduced for "fully compatible" IP blocks.
> >>>
> >>> If this hardware block in MT8195 is "the same" as the one in MT8192, do we
> >>> really need the new compatible string? Are there any concerns?
> >>
> >> Hi Chen-Yu,
> >>
> >> It's ok to reuse the compatible string with MT8192, but I think this
> >> will be easier to find which platforms this driver is compatible with,
> >> especially when we have more and more platforms in the future.
> > 
> > If it's just for informational purposes, then having the MT8192 compatible
> > as a fallback would work, and we wouldn't need to make changes to the driver.
> > This works better especially if we have to support multiple operating systems
> > that use device tree.
> > 
> > So we would want
> > 
> >     "mediatek,mt8195-pcie", "mediatek,mt8192-pcie"
> > 
> > and
> > 
> >     "mediatek,mt8192-pcie"
> > 
> > be the valid options.
> > 
> > Personally I'm not seeing enough value to justify adding the compatible string
> > just for informational purposes though. One could easily discern which hardware
> > is used by looking at the device tree.
> > 
> 
> I agree, if no differences between the two chips are known, adding a
> binding withe new compatible and a fallback is a good thing. If we
> later on realize that mt8195 PCI block has differences, we can add the
> matching to the driver.

So this series can be dropped, right ?

Thanks,
Lorenzo

> Regards,
> Matthias
> 
> > 
> > Regards
> > ChenYu
> > 
> > 
> >> Thanks.
> >>>
> >>>
> >>> Thanks
> >>> ChenYu
> >>>
> >>>
> >>>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
> >>>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> >>>> index e7b1f9892da4..d5e4a3e63d97 100644
> >>>> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> >>>> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> >>>> @@ -48,7 +48,9 @@ allOf:
> >>>>
> >>>>  properties:
> >>>>    compatible:
> >>>> -    const: mediatek,mt8192-pcie
> >>>> +    oneOf:
> >>>> +      - const: mediatek,mt8192-pcie
> >>>> +      - const: mediatek,mt8195-pcie
> >>>>
> >>>>    reg:
> >>>>      maxItems: 1
> >>>> --
> >>>> 2.18.0
> >>>> _______________________________________________
> >>>> Linux-mediatek mailing list
> >>>> Linux-mediatek@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> >>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
