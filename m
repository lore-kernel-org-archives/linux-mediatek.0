Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5A5C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 15:57:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0284207EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 15:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="az7VzyM5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VLaaxBL3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0284207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OvEKdKS0/wdZ+fMLlKg//8byrZTnrCOFIY+1RZPYLcU=; b=az7VzyM5R9Lp1LC92ZtuGAyYJ
	a0IEM4NKfsLfnYds6w3SZlb8vEOOvzSkTo1H+Zyps2MkT+JCEKboU33W9/lSKRY+i/CiapEsmO475
	aVRPYqd8YTn9MLJYqAS0uYZ88DWnytHhB+q0Rgowe1HQ22SQwSaNNQ9xz4u7GAbGs9PcUy+g+kucR
	uNvnm6SKme9zZBW0kytbHhVrUtfK9zt1cyEUw5Vc1k3ZqXCkegV5e/b/JcZetpFC0eCiebToP3zYD
	ucDn8B6zAiIw9y/7L936deKq8B5bxLc1/Gbrtoi1hqodGjhyiUKIouVpARjC7RPqwxs9dXpwUqhqg
	hDc3bl1HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDTwi-0008Pi-3W; Wed, 02 Sep 2020 14:41:08 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDTwe-0008P4-Tr
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 14:41:06 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b16so2674125vsl.6
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/zlgCI9QrJNPU4JJlp1UP/IMi9j+4O0vRWsFWmv0KI=;
 b=VLaaxBL3UFPDYVUJ5u3qnhXXYiWouCcUpbGhcl8mkRK7KVGFsfz0SiYYjhEZeqM6ev
 kLwMmuI2R1ybRDGdb62aq4/OF0wCpEegWeULD0pDxvQvQOYdsqWMqsQeAS2Reo9i5x5/
 q3Pj+eXZKms7JnqjKxS3W+KSojCcZudHAlWt9N4kJIusQD/NA3fN6BjnG+ZzVxveCxP0
 fjiTplf6t9cfgtQFRLmsTZPxJBxWO0rDplJuR+eYWn/uJvMpbzs4bqoGe1znbGzedqNS
 6Div+I9dOBnHLRefDLL+pXF2AJyMinxm8k5BWY7L7wyVghBHL/1XrzKok+a9FLkC8/x9
 EIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/zlgCI9QrJNPU4JJlp1UP/IMi9j+4O0vRWsFWmv0KI=;
 b=mUQuDFsuAKUbN01EWaWfHNMzJwDhePicQrVg4D9niab3nPyWlMufCwcaN6+XK2MBgx
 yD93LZJo3SphH27rkGjmvA1AIcHyuLhGGXwvCB7vP5nGnKnQCF99hwneNcaTAWZMIW2r
 ufG7SKw67OY4AqSUU1GBJXJT/4uJybGdVbSCzXQ1GdPNoE/Vc6spAsSV8jkgRuGGES9N
 3jWp2cljEmZLOnMGP9ZskCnIxopwTZysLdY1OIxMoIbu+yBsAUlo98HQ/hNNsqxy158K
 3AK3ftR5RmMgx7zBxARWhNdoH/Ln0dL6zika4QfRGhB24HaQsz3QP9qM6Bo6GOTui4zG
 CkxA==
X-Gm-Message-State: AOAM530o427eOLttN5WCkHasesgzdgEWqiz2nqfZ4WJcPibxqlee47UY
 zCifvICsPs3viwI0i12ULAXEQ3LqWqER410Zyt/Kuw==
X-Google-Smtp-Source: ABdhPJzlxTPaTI8JwFZQXPJBSSUSFEsHPrWt06u3qPZOY9J3wJyukGwQHEqGAZWmHxk7I65dz6qnkslKhZ6rX4tFp/8=
X-Received: by 2002:a67:e9d4:: with SMTP id q20mr5209551vso.83.1599057661252; 
 Wed, 02 Sep 2020 07:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
In-Reply-To: <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Sep 2020 20:10:49 +0530
Message-ID: <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_104105_228091_EA953626 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> > From: Eddie Huang <eddie.huang@mediatek.com>
> >
> > Add scp node to mt8183 and mt8183-evb
> >
> > Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>
> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
>
> Bjorn, do I understand correctly that you don't send emails to the list
> informing of the inclusion of a patch/series in your tree?
>
> Anyway applied now to v5.9-next/dts64 :)

arm64 build dtbs failed on linux next 20200902.

mt8183.dtsi:342.21-352.5: ERROR (phandle_references):
/soc/scp@10500000: Reference to non-existent node or label
"scp_mem_reserved"

build log,

make -sk KBUILD_BUILD_USER=TuxBuild -C/linux ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=gcc CC="sccache
aarch64-linux-gnu-gcc" O=build dtbs
#
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #address-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #size-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #address-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #size-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #address-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #size-cells (1) differs from / (2)
../arch/arm64/boot/dts/mediatek/mt8183.dtsi:342.21-352.5: ERROR
(phandle_references): /soc/scp@10500000: Reference to non-existent
node or label "scp_mem_reserved"


>
> Thanks!
>
> > ---
> > Changes from v20 ... v14:
> >   - No change.
> >
> > Changes from v13:
> >   - Change the size of the cfg register region.
> >
> > Changes from v12 ... v10:
> >   - No change.
> >
> > Changes from v9:
> >   - Remove extra reserve-memory-vpu_share node.
> >
> > Changes from v8:
> >   - New patch.
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 +++++++++++
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 12 ++++++++++++
> >   2 files changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > index 1fb195c683c3..ddb7a7ac9655 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > @@ -24,6 +24,17 @@ memory@40000000 {
> >       chosen {
> >               stdout-path = "serial0:921600n8";
> >       };
> > +
> > +     reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             scp_mem_reserved: scp_mem_region {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0 0x50000000 0 0x2900000>;
> > +                     no-map;
> > +             };
> > +     };
> >   };
> >
> >   &auxadc {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 10b32471bc7b..e582f5e6691d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -269,6 +269,18 @@ pwrap: pwrap@1000d000 {
> >                       clock-names = "spi", "wrap";
> >               };
> >
> > +             scp: scp@10500000 {
> > +                     compatible = "mediatek,mt8183-scp";
> > +                     reg = <0 0x10500000 0 0x80000>,
> > +                           <0 0x105c0000 0 0x19080>;
> > +                     reg-names = "sram", "cfg";
> > +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
> > +                     clock-names = "main";
> > +                     memory-region = <&scp_mem_reserved>;
> > +                     status = "disabled";
> > +             };
> > +
> >               systimer: timer@10017000 {
> >                       compatible = "mediatek,mt8183-timer",
> >                                    "mediatek,mt6765-timer";
> >

full build log,
https://builds.tuxbuild.com/_IfeLhOWMWxIkRkmAtAwOQ/build.log


-- 
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
