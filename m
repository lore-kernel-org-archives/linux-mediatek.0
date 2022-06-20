Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2618C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ1/D7tQLhmKKWxfRucj4OgiI0sWU7ZOwNoymLxwOgc=; b=nwSCUZ1dbhoHekyp9wOH0s9I/u
	7o7W1hsPwFDPaBiYaTcbTz+m01XlCbSUeFsCE6hbQpAzhxV1yN64vZShITY5MmHiwmyjALnEBMdCp
	aKPVR1oj0j881RbWjSQVeiHiCaEhAeWXfYMiVxH5jX5lBNSIPdInBDl31PbOkfXdScdVgcdCtaVRn
	ZrC5ae5PZOS++JcobVjU4plmwphDhEuU1W8Rb7E/D+msjMWPL7CW+bO47TKRCeHWIPUWpBXanJxKt
	O635m752Ek7vcToI2JHxcDB54nBkYbez0sYr3svJGtUCiNgPuL3W4w1gokQOGvrj8kE3hWiSCKEX2
	jo92dQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JgL-001KEd-Vj; Mon, 20 Jun 2022 15:51:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Jg7-001KBR-V6; Mon, 20 Jun 2022 15:51:08 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C35EC660165B;
	Mon, 20 Jun 2022 16:51:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655740262;
	bh=xtLnKklg/MlE16Bqr85fsT1msWuj2OVeDhX3/82puAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMkloYSoN+eMinuLu9z1P4c1sFbmyPaRSvPeLU+GgdTOd89ZsWwIxdLDAV4SuLYHw
	 8TPbIB8nBiPU7e4hWURCQemaM0YDOER207ElJEJXCWjZ+gs4ClaZcpofTKHnkPlr3a
	 vd+/9z0sx1MU0dEN9LSbwKyExl2El6etfmXt+tRXjqTY/deP8dfF5SBYsyRI8ZwmIt
	 5pnI4IX9ZV+wL5s7et9bZ4oIRTy6hQHXCVXFPmgn9EPt7y1u5m7+hZi4emQClfrrIw
	 gAga4B6apK7loOu889pugEQJ+65Qwh0nfjp7IeWXfPCo3sRg3d7HVU0fGQnXViOZMK
	 +cMFVPHI0exew==
Date: Mon, 20 Jun 2022 11:50:57 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Message-ID: <20220620155057.a6qilnhm7snzhapa@notapiano>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
 <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
 <af50210b95d0cd8b2e3103b3d4a9702aeeba9452.camel@mediatek.com>
 <a24c24e6-fdee-df79-fd2f-6a71540bd9b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a24c24e6-fdee-df79-fd2f-6a71540bd9b3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_085104_324858_5824D318 
X-CRM114-Status: GOOD (  33.49  )
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

On Mon, Jun 20, 2022 at 10:50:57AM +0200, Krzysztof Kozlowski wrote:
> On 20/06/2022 08:59, Chunfeng Yun wrote:
> > On Sun, 2022-06-19 at 14:05 +0200, Krzysztof Kozlowski wrote:
> >> On 19/06/2022 09:46, Chunfeng Yun wrote:
> >>> On Fri, 2022-06-17 at 18:25 -0700, Krzysztof Kozlowski wrote:
> >>>> On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
> >>>>> The current clock list in the binding doesn't allow for one of
> >>>>> the
> >>>>> optional clocks to be missing and a subsequent clock to be
> >>>>> present.
> >>>>> An
> >>>>> example where this is an issue is in mt8192.dtsi, which has
> >>>>> "sys_ck",
> >>>>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
> >>>>>
> >>>>> Change the clock list in a way that allows the middle optional
> >>>>> clocks to
> >>>>> be missing, while still guaranteeing a fixed order. The
> >>>>> "ref_ck" is
> >>>>> kept
> >>>>> as a const even though it is optional for simplicity, since it
> >>>>> is
> >>>>> present in all current dts files.
> >>>>>
> >>>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> >>>>> ---
> >>>>>
> >>>>>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9
> >>>>> +++++++--
> >>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git
> >>>>> a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> >>>>> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> >>>>> xhci.yaml
> >>>>> index 63cbc2b62d18..99a1b233ec90 100644
> >>>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> >>>>> xhci.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> >>>>> xhci.yaml
> >>>>> @@ -80,8 +80,13 @@ properties:
> >>>>>      items:
> >>>>>        - const: sys_ck  # required, the following ones are
> >>>>> optional
> >>>>>        - const: ref_ck
> >>>>> -      - const: mcu_ck
> >>>>> -      - const: dma_ck
> >>>>> +      - enum:
> >>>>> +          - mcu_ck
> >>>>> +          - dma_ck
> >>>>> +          - xhci_ck
> >>>>> +      - enum:
> >>>>> +          - dma_ck
> >>>>> +          - xhci_ck
> >>>>>        - const: xhci_ck
> >>>>
> >>>> You allow now almost any order here, including incorrect like
> >>>> sys,ref,xhci,xhci,xhci.
> >>>>
> >>>> The order of clocks has to be fixed and we cannot allow
> >>>> flexibility.
> >>>> Are
> >>>> you sure that these clocks are actually optional (not wired to
> >>>> the
> >>>> device)?
> >>>
> >>> In fact, these optional clocks are fixed, due to no gates are
> >>> provided,
> >>> SW can't control them by CCF;
> >>> In this case, I usually use a fixed clock, or ignore it.
> >>
> >> But in some versions these clocks are controllable or not?
> > Some SoCs are controllable, some ones are not (fixed clock).
> 
> Thanks for confirming. Then I would prefer to make these clocks required
> (not optional) and always provide them - via common clock framework or
> fixed-clock.

Hi Krzysztof and Chunfeng,

thank you both for the feedback.

Since the solution I proposed in this patch is not acceptable I see two options:
1. Split the clocks in several if blocks matched by compatibles
2. Make the clocks required and use fixed-clock nodes for the missing clocks in
   the DT

My understanding is that 1 is the desirable solution if the clock is really
missing in some hardware variants, while 2 is desirable if all hardware variants
really receive all the clocks, only that on some variants they're fixed and not
controlable by SW.

From what I'm reading of this discussion it seems that the latter is the case
here and thus we should go for 2. Is this correct?

Also Chunfeng, do you have information on whether the same is true for the MMC
HW block? I recently submitted some changes to that binding [1] but I followed
approach 1 there instead. However if all the clocks are present in the HW level
there as well it would make more sense for me to change it to follow approach 2.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220617230114.2438875-1-nfraprado@collabora.com

