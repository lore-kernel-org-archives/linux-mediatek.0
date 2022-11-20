Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A1AC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiLwBmMHV1A6Z4C0RQN7TsMa3l3kHluwKps8vWmowhY=; b=A9w6fYzrdqPATWPd+j4meyvjzh
	x/ZpHbbIR5pYc60OJl2iAoR5+PFTPCLEfbZSxtyuv1nKFJsV/CK0TgTj6izqMKC2a02uC4MhCtkTB
	xcAjjDhKStdp2l9id0ZJjQkHQUCXcdDAlHUyenpMIRUaY3Q75ccmIRRWKvR9bS5QNOqPFsBmtjmHT
	JaFLzih6Nid/Abfp71d/betSuN1710HWxqWZX4ejaQ2/ZZ0dRcQkL2ltje4YNU0eBYdqAzm+d7AQr
	I1Wrei8FOCjSlJ7Zt/iN2WkjsV2LkEU9q/mReHQ6pO4JlcAjas77JeDOqx46Ko3uPVQ0aPx5T7w6s
	O973CliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmwI-005Xit-EQ; Sun, 20 Nov 2022 16:13:02 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmwF-005Xi1-Rj; Sun, 20 Nov 2022 16:13:01 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1322d768ba7so11299521fac.5;
        Sun, 20 Nov 2022 08:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiLwBmMHV1A6Z4C0RQN7TsMa3l3kHluwKps8vWmowhY=;
        b=0+BjqeTLifoXv9LjyxJlqT0BK1NoF4NDcSd0oIJqg0Npr5WfgKVD6lKKTDi8HGUdX8
         seujgdkxR5zddhwQYZKRZl550LxyWHge1RdMb4bGGl2Q1aE7OpiX3vXNj43OUJdCALOJ
         FK0r/GYYeb3LYhnoxc15SW69dc8AuCBzeDHTlB3C9csKYFiQ/CY2AZKybJI3O/emOJP/
         DMdfL5PsLVEP3bEvQa7j7qJICl/w711yXzn9s2i0wvzfBMur9OfD/HU8EqAbh8+2S8Sm
         VwY12yrd9RStcAzL+SLuGcgiqA7j5z8zNxAouIK3bJxS2H0PKZQv9idsTLRSU7h2ssDJ
         eovQ==
X-Gm-Message-State: ANoB5pmAtjjj2OQeBkHf/TjIi1idk8DZnB6MJrKr158Q/WFfbICQ3qWX
	J1Z0FXy1jHiWjBv0Dy9Zmw==
X-Google-Smtp-Source: AA0mqf6ZbXDYehIdfhDzXQQ1LP/V2dpERMTijOuj5pa1lBMe4ljmr5JO1MZblW1kwPOdHYFxj4miUQ==
X-Received: by 2002:a05:6870:670a:b0:131:3a84:1326 with SMTP id gb10-20020a056870670a00b001313a841326mr11334462oab.128.1668960777844;
        Sun, 20 Nov 2022 08:12:57 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f6:1a48:29f6:113d:266f:a78e])
        by smtp.gmail.com with ESMTPSA id i11-20020a9d53cb000000b00667ff6b7e9esm3960911oth.40.2022.11.20.08.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 08:12:57 -0800 (PST)
Received: (nullmailer pid 3145083 invoked by uid 1000);
	Sun, 20 Nov 2022 16:12:51 -0000
Date: Sun, 20 Nov 2022 10:12:51 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
Message-ID: <20221120161251.GA3133853-robh@kernel.org>
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-12-linux@fw-web.de>
 <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
 <99114D73-22EF-43CD-848E-88A37B29B953@public-files.de>
 <CAL_JsqKz1qQFZnStLnApraJvp=-cQoW6x5=p7-GBcftYKVMErg@mail.gmail.com>
 <192D4414-DC88-4321-BB2A-4345C48E3C12@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <192D4414-DC88-4321-BB2A-4345C48E3C12@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_081259_938202_1A619EEF 
X-CRM114-Status: GOOD (  43.48  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 19, 2022 at 08:19:52AM +0100, Frank Wunderlich wrote:
> Am 8. November 2022 15:45:49 MEZ schrieb Rob Herring <robh+dt@kernel.org>:
> >On Fri, Nov 18, 2022 at 4:05 PM Frank Wunderlich
> ><frank-w@public-files.de> wrote:
> >>
> >> Am 18. November 2022 22:39:52 MEZ schrieb Rob Herring <robh+dt@kernel.org>:
> >> >On Fri, Nov 18, 2022 at 1:01 PM Frank Wunderlich <linux@fw-web.de> wrote:
> >> >>
> >> >> From: Frank Wunderlich <frank-w@public-files.de>
> >> >>
> >> >> Add devicetree overlays for using nand and nor on BPI-R3.
> >> >
> >> >Can you not tell at runtime which one you booted from? If not, how
> >> >does one choose which overlay to apply? If you can, why not populate
> >> >both nodes and enable the right one? IMO, if all h/w is present, it
> >> >should all be in the DT. Selecting what h/w to use is a separate
> >> >problem and overlays aren't a great solution for that.
> >>
> >> It is not the decision about bootdevice,more available devices.
> >>
> >> Only 1 spi device (nand OR nor) is available
> >> at boottime as they share same spi bus and
> >> chipselect is set via hw jumper.
> >> Both nodes have reg 0,which is imho not
> >> supported in linux.
> >
> >As long as one is set to disabled, it should be fine.
> >
> >
> >> I choosed overlays to add the right spi
> >> device on the right mmc device where
> >> similar selection happens (see patch 10).
> >> Either sd OR emmc can be used (1 mmc
> >> controller,first 4bits from bus switched by
> >> hardware jumper).But for mmc i use it as
> >> base fdt because i see mmc as primary
> >> device which holds rootfs too. Nand/nor is
> >> imho helping device for accessing emmc or
> >> like rescue system (only uboot).
> >
> >No way to read the jumper state or know what you booted from I gues?
> >
> >> I probe in uboot if emmc is available (mmc
> >>  partconf) and choose emmc else sd. For
> >>  spi i try with sf command to check for nor,if
> >>  this does not work i apply nand overlay.
> >
> >Instead of applying overlays, wouldn't just changing 'status' be easier?
> 
> It will be easier,but requires dts for all
>  combinations,we have have sd/emmc
>  combination twice (once for nand
>  enabling,once for nor) and we have then 4
>  full dts instead of smaller overlays in fit.

No, I mean can't you have 1 dtb with everything, but nand, nor, emmc, 
and sd are all disabled. Then at boot change 'status' for what's 
enabled.


> So i should add spi subnodes both disabled
>  in base dtsi and create 4 dts (sd-nand,sd-nor,emmc-nand,emmc-nor) with
>  mmc node and enabling the right spi node?
> >>
> >> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> >> ---
> >> >> maybe rename to dtso?
> >> >>
> >> >> "kbuild: Allow DTB overlays to built from .dtso named source files"
> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2
> >>
> >> Should i do this?
> >
> >Yes. .dts -> .dtbo is going to be removed.
> 
> Do this if still using overlays,will test new way.
> 
> Maybe we can apply parts 1-9 first?

Sure.

> 
> >> >> more comments about the dt overlay-support:
> >> >>
> >> >> https://patchwork.kernel.org/comment/25092116/
> >> >> https://patchwork.kernel.org/comment/25085681/
> >>
> >> Daniel suggest define sd/emmc as overlay too...with way you mention below we could create 4 full fdt without applying overlays in uboot.
> >
> >Yes, but if you are going to do that, then you can just do all this
> >with includes.
> 
> This is a third way if i understand correctly
> 
> Make all of them as overlay (dtso?) but
>  build dtb by combining them in makefile.
> 
> This looks the best way because it avoids
>  redundand code for mmc node and allows
>  my current spi config (not the status way
>  which may break due to same unit address).
> 
> I guess my base dtsi is then a dts too?

Yes, it can be.

> 
> Or should these overlays only duplicated and either include sd dts or emmc dts (but this creates again redundant code)?
> >> >> --- a/arch/arm64/boot/dts/mediatek/Makefile
> >> >> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> >> >> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> >> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> >> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> >> >
> >> >These need rules to apply them to the base dtb(s). You just need:
> >> >
> >> >full.dtb := base.dtb overlay.dtb
> >> >dtb-y += full.dtb
> >>
> >> I would prefer to do this in bootloader to allow all 4 possible configurations:
> >>
> >> Sd+nand
> >> Sd+nor
> >> Emmc+nand
> >> Emmc+nor
> >
> >That's fine. The purpose here is to document what the overlays apply
> >to, check that they actually apply, and validate them when applied
> >(unless someone wants to figure out all the issues with validating
> >just an overlay and make that work). You for example have an
> >undocumented compatible in yours (denx,fit).
> 
> Oh,need to check,copied partitions from my
>  uboot dts...maybe there is a linux version
>  for marking it as fit partition,else i drop
>  completely.

You just need to document it. But the first thing I'm going to say, is 
'u-boot' is the vendor, not 'denx'. So 'u-boot,fit'.

Rob

