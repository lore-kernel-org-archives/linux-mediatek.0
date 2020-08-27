Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07294C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:30:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA79C22BF3
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jz08DyAy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fKkwMSCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA79C22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WVLi6rQDGLON5UH2FDffh2OGILF4zyg4ItPwWw1KpUE=; b=Jz08DyAy19kcG6MxzRXNMGi2B
	e+AEbD3a21/PdfvlFxgDjG0CzL/QWCen3v6E62xGGMDstaKEEMoG2c0WIOnwi+STU+5Q0WvXmflWp
	r7YVzjEgpIkBZQsdCV27H7lDvH0/znZwMSzqDPq+m4TK/dzHVliLNP9sJ5iVgvdLsVt1lavErbEpM
	OHLh7MOoTg0/v9hPZtpU5zJr1GO39rucYczrI4u8zqeojW6WDjw0Ww5duAtyTwOVqCzEcyulyw6su
	0Zhs+GpxMICg4oif9XKzy8zB1cDgQhyv7jxYky328x7Zgq0JUuzY54zpOX+3+DnPe1kq0Muw/7u/d
	YzWFP5Svw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBFAK-0006j4-DN; Thu, 27 Aug 2020 10:29:56 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBFAF-0006iB-V8
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 10:29:53 +0000
Received: by mail-oi1-x242.google.com with SMTP id j21so4161381oii.10
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VqVqosFrIbjcMckf+U3+gM0HZKqC0WuU3mUX+w73JZU=;
 b=fKkwMSCT3+pj22gsTIywq7R4LB1He2LTSACwbCTdIGXidzMgQfHh+U6FSnM8xecppd
 QbXBqCxhAsd24Zw+4HglaCDRXu6RFTP2NAQgwkA/Ipe/S4qcfzbCDRpQJMhf3j420AC1
 7T9kCyCWVet5iClQ592TiqqC6sAFi5/3YYlm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VqVqosFrIbjcMckf+U3+gM0HZKqC0WuU3mUX+w73JZU=;
 b=f4RzsGniYyvJW9i4jHN50z489AXMlw1IV+p1Mpg/tCD3gph+fvfA5fiYBbTo9wW3QA
 Nm8pCJzzNvhqh7oHrtnUYxUDDj9/4Eb+yXW2RQ5G+rW85HxBBFuccu2NdqRUV+SwEMSZ
 4uICHS0mrj9SaaxDtJTSD6WU51RD3yTfVIDd6iCjm1+lkhT0oAtBedfks7sYEIRnBSxU
 hTtOhCxNZMDjaX9QtHCKfrQrHQnsrNyOpUQfy7miwlBo5ERsd6crgrKY8aKV32tlKC8J
 QxMAeQapBqRlzfg6ZOal4H6BapFDk/z7eTHg/23A1z57DBJlQCPaD2ZUMs93cFFALHf7
 KPfQ==
X-Gm-Message-State: AOAM532GmGXJMyDWz3yrSOdPfmV07600UYPqsGMst0mzOYMx8e8+Xlo1
 XBLVnzT+dEtMo6PgSDq3EiDl4F2nBkE4UQ==
X-Google-Smtp-Source: ABdhPJxPMLaOwNHkbPbk+VRquNWnrX7WuBNANG6w5HNdWx8Cj3PT9kLEOgadrs+xtdQBPJXZpBBN7w==
X-Received: by 2002:aca:b48b:: with SMTP id d133mr3777634oif.47.1598524189508; 
 Thu, 27 Aug 2020 03:29:49 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
 [209.85.210.43])
 by smtp.gmail.com with ESMTPSA id j66sm360946otc.74.2020.08.27.03.29.48
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 03:29:48 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id f42so3949191otf.13
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 03:29:48 -0700 (PDT)
X-Received: by 2002:a9d:5f0c:: with SMTP id f12mr12086496oti.141.1598524187719; 
 Thu, 27 Aug 2020 03:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org>
 <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
 <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
 <184d895c-239e-3f23-970e-6a9563235cd9@gmail.com>
In-Reply-To: <184d895c-239e-3f23-970e-6a9563235cd9@gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 27 Aug 2020 19:29:35 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXrUNqWr=3KBPbJkXGmz=gL0aq_QuUQ5u_crR3yyDBvpw@mail.gmail.com>
Message-ID: <CAPBb6MXrUNqWr=3KBPbJkXGmz=gL0aq_QuUQ5u_crR3yyDBvpw@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_062952_079093_B639923A 
X-CRM114-Status: GOOD (  31.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On Thu, Aug 27, 2020 at 7:23 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Alexandre,
>
> On 27/08/2020 12:10, Alexandre Courbot wrote:
> > On Thu, Aug 27, 2020 at 7:03 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>
> >>
> >>
> >> On 21/08/2020 12:36, Alexandre Courbot wrote:
> >>> Now that the MT8183 encoder driver is ready, add its DT node. Also pull
> >>> the iommu and scp ones, which the encoder depends upon.
> >>
> >> Please don't do that. Instead of pulling in other DT nodes, it would be handy to
> >> get a reference of the series this is based on.
> >>
> >> Let me try to hunt them down now :)
> >
> > Sorry, I'm not sure to understand - do you mean each node should come
> > with its own patch? Or that all the code should be merged before
> > sending these nodes? The rest of this series should land into the
> > media tree soon, if you prefer I can resend this patch separately once
> > that happens.
> >
>
> What I'm talking about is the case when you send a series that's based on
> another one and the latter is not yet accepted in Torvalds tree. In that case it
> helps to point to the series you expect to be included as well.
>
> In this case the SCP series was merged long time ago, but I missed the DTS
> change. It would have been good if you would have added that information in your
> series, instead of directly pulling in the SCP node.

Sorry about that, actually I was not even aware of this patch (or
maybe I just forgot about it due to its date).

>
> For the iommu node: I understand that there was never a patch adding the node
> (at least I wasn't able to find one). So I'd prefer to have it send as a
> separate patch of this series.
>
> Regarding this series now. If you want just resend the two DTS patches (iommu
> and vcodec_enc) once the rest of this series got accpeted. If for any other
> reason you have to send a v5, then feel free to include both in v5.

Absolutely. I will wait until the patches land into the media tree and
send you two DT-only patches.

Thanks for the explanation!

>
> Hope I explained myself now :)
>
> Regards,
> Matthias
>
> >>
> >> Regards,
> >> Matthias
> >>
> >>>
> >>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >>> ---
> >>>    arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
> >>>    .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
> >>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
> >>>    3 files changed, 58 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> >>> index ae405bd8f06b..9e77b420eee8 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> >>> @@ -25,6 +25,16 @@ memory@40000000 {
> >>>        chosen {
> >>>                stdout-path = "serial0:921600n8";
> >>>        };
> >>> +     reserved-memory {
> >>> +             #address-cells = <2>;
> >>> +             #size-cells = <2>;
> >>> +             ranges;
> >>> +             scp_mem_reserved: scp_mem_region {
> >>> +                     compatible = "shared-dma-pool";
> >>> +                     reg = <0 0x50000000 0 0x2900000>;
> >>> +                     no-map;
> >>> +             };
> >>> +     };
> >>>    };
> >>>
> >>>    &auxadc {
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> index f0a070535b34..3c763be658da 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
> >>>                regulator-max-microvolt = <3300000>;
> >>>        };
> >>>
> >>> +     reserved_memory: reserved-memory {
> >>> +             #address-cells = <2>;
> >>> +             #size-cells = <2>;
> >>> +             ranges;
> >>> +
> >>> +             scp_mem_reserved: scp_mem_region {
> >>> +                     compatible = "shared-dma-pool";
> >>> +                     reg = <0 0x50000000 0 0x2900000>;
> >>> +                     no-map;
> >>> +             };
> >>> +     };
> >>> +
> >>>        max98357a: codec0 {
> >>>                compatible = "maxim,max98357a";
> >>>                sdmode-gpios = <&pio 175 0>;
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>> index 102105871db2..8f77eea6df27 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>> @@ -8,6 +8,7 @@
> >>>    #include <dt-bindings/clock/mt8183-clk.h>
> >>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +#include <dt-bindings/memory/mt8183-larb-port.h>
> >>>    #include <dt-bindings/reset-controller/mt8183-resets.h>
> >>>    #include <dt-bindings/phy/phy.h>
> >>>    #include "mt8183-pinfunc.h"
> >>> @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
> >>>                        clock-names = "spi", "wrap";
> >>>                };
> >>>
> >>> +             iommu: iommu@10205000 {
> >>> +                     compatible = "mediatek,mt8183-m4u";
> >>> +                     reg = <0 0x10205000 0 0x1000>;
> >>> +                     interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
> >>> +                     #iommu-cells = <1>;
> >>> +             };
> >>> +
> >>> +             scp: scp@10500000 {
> >>> +                     compatible = "mediatek,mt8183-scp";
> >>> +                     reg = <0 0x10500000 0 0x80000>,
> >>> +                           <0 0x105c0000 0 0x19080>;
> >>> +                     reg-names = "sram", "cfg";
> >>> +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >>> +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
> >>> +                     clock-names = "main";
> >>> +                     memory-region = <&scp_mem_reserved>;
> >>> +                     status = "disabled";
> >>> +             };
> >>> +
> >>>                systimer: timer@10017000 {
> >>>                        compatible = "mediatek,mt8183-timer",
> >>>                                     "mediatek,mt6765-timer";
> >>> @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
> >>>                        #clock-cells = <1>;
> >>>                };
> >>>
> >>> +             vcodec_enc: vcodec@17020000 {
> >>> +                     compatible = "mediatek,mt8183-vcodec-enc";
> >>> +                     reg = <0 0x17020000 0 0x1000>;
> >>> +                     interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
> >>> +                     iommus = <&iommu M4U_PORT_VENC_REC>,
> >>> +                              <&iommu M4U_PORT_VENC_BSDMA>,
> >>> +                              <&iommu M4U_PORT_VENC_RD_COMV>,
> >>> +                              <&iommu M4U_PORT_VENC_CUR_LUMA>,
> >>> +                              <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> >>> +                              <&iommu M4U_PORT_VENC_REF_LUMA>,
> >>> +                              <&iommu M4U_PORT_VENC_REF_CHROMA>;
> >>> +                     mediatek,scp = <&scp>;
> >>> +                     clocks = <&vencsys CLK_VENC_VENC>;
> >>> +                     clock-names = "MT_CG_VENC";
> >>> +             };
> >>> +
> >>>                ipu_conn: syscon@19000000 {
> >>>                        compatible = "mediatek,mt8183-ipu_conn", "syscon";
> >>>                        reg = <0 0x19000000 0 0x1000>;
> >>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
