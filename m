Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96870C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Nov 2022 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ov0YYXmwqRVPJ8mk/jWh4VlTvRDF8RS9SB8/7u28NwE=; b=onuKGNgEjF0pm5YU11ub+nRblD
	zoHuUBEV41DytzAU5HjbKnmHi/rwkZxV3vJ8MHh8GCMdRQPOGLQnPaQmeHebAORDQBdEO2U1bu7pW
	V+m/0mEjSwdYNjBiYQrMTEs71ob/zHj8Lfecp0k1zisQcd1S+i65uibk+tJx9wVXtgCCgraRedVRp
	k5sxji8pTYUzEjVRGUr5bobsJTb3ub26PC3eGZL0vsIH9jtDCiZD9tYXZWk0rw4R23+dfPpBlsMBO
	xTzM9ipkPONnKZqwplMqCw7TgJi9N42IOXYhpB+KPsHfpuF2n8fZ/dXjJ3cjiMMNa1RUq/eUDF2FT
	+8TP54rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owI9A-00C146-8z; Sat, 19 Nov 2022 07:20:16 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owI8v-00C12P-Mi; Sat, 19 Nov 2022 07:20:05 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id DD8B562608;
	Sat, 19 Nov 2022 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668842396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ov0YYXmwqRVPJ8mk/jWh4VlTvRDF8RS9SB8/7u28NwE=;
	b=LRCeCOrA6CSrOStxeGORqIrn0AjDw/k9ShF4O9sMHRnqkKk5OQtv62vv6wA/ucBL6JncGh
	3myF4/S+2aEFiKopUC4Bq0fOWRi8IMO0K1t+/nTgaXH0g6dr1mqZD/K8D4qtWI+CssdiXr
	QmMxwGHHrY88p7IJ1BbKM4VYHRLOxxI=
Received: from [127.0.0.1] (fttx-pool-80.245.75.145.bambit.de [80.245.75.145])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 88C511000CA;
	Sat, 19 Nov 2022 07:19:54 +0000 (UTC)
Date: Sat, 19 Nov 2022 08:19:52 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh+dt@kernel.org>, frank-w@public-files.de
CC: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_JsqKz1qQFZnStLnApraJvp=-cQoW6x5=p7-GBcftYKVMErg@mail.gmail.com>
References: <20221118190126.100895-1-linux@fw-web.de> <20221118190126.100895-12-linux@fw-web.de> <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com> <99114D73-22EF-43CD-848E-88A37B29B953@public-files.de> <CAL_JsqKz1qQFZnStLnApraJvp=-cQoW6x5=p7-GBcftYKVMErg@mail.gmail.com>
Message-ID: <192D4414-DC88-4321-BB2A-4345C48E3C12@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 0ca9227a-4531-4695-b383-da3c235452f3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_232003_202372_C6E08F08 
X-CRM114-Status: GOOD (  26.74  )
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

Am 8=2E November 2022 15:45:49 MEZ schrieb Rob Herring <robh+dt@kernel=2Eor=
g>:
>On Fri, Nov 18, 2022 at 4:05 PM Frank Wunderlich
><frank-w@public-files=2Ede> wrote:
>>
>> Am 18=2E November 2022 22:39:52 MEZ schrieb Rob Herring <robh+dt@kernel=
=2Eorg>:
>> >On Fri, Nov 18, 2022 at 1:01 PM Frank Wunderlich <linux@fw-web=2Ede> w=
rote:
>> >>
>> >> From: Frank Wunderlich <frank-w@public-files=2Ede>
>> >>
>> >> Add devicetree overlays for using nand and nor on BPI-R3=2E
>> >
>> >Can you not tell at runtime which one you booted from? If not, how
>> >does one choose which overlay to apply? If you can, why not populate
>> >both nodes and enable the right one? IMO, if all h/w is present, it
>> >should all be in the DT=2E Selecting what h/w to use is a separate
>> >problem and overlays aren't a great solution for that=2E
>>
>> It is not the decision about bootdevice,more available devices=2E
>>
>> Only 1 spi device (nand OR nor) is available
>> at boottime as they share same spi bus and
>> chipselect is set via hw jumper=2E
>> Both nodes have reg 0,which is imho not
>> supported in linux=2E
>
>As long as one is set to disabled, it should be fine=2E
>
>
>> I choosed overlays to add the right spi
>> device on the right mmc device where
>> similar selection happens (see patch 10)=2E
>> Either sd OR emmc can be used (1 mmc
>> controller,first 4bits from bus switched by
>> hardware jumper)=2EBut for mmc i use it as
>> base fdt because i see mmc as primary
>> device which holds rootfs too=2E Nand/nor is
>> imho helping device for accessing emmc or
>> like rescue system (only uboot)=2E
>
>No way to read the jumper state or know what you booted from I gues?
>
>> I probe in uboot if emmc is available (mmc
>>  partconf) and choose emmc else sd=2E For
>>  spi i try with sf command to check for nor,if
>>  this does not work i apply nand overlay=2E
>
>Instead of applying overlays, wouldn't just changing 'status' be easier?

It will be easier,but requires dts for all
 combinations,we have have sd/emmc
 combination twice (once for nand
 enabling,once for nor) and we have then 4
 full dts instead of smaller overlays in fit=2E

So i should add spi subnodes both disabled
 in base dtsi and create 4 dts (sd-nand,sd-nor,emmc-nand,emmc-nor) with
 mmc node and enabling the right spi node?
>>
>> >> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> >> ---
>> >> maybe rename to dtso?
>> >>
>> >> "kbuild: Allow DTB overlays to built from =2Edtso named source files=
"
>> >> https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/robh/linux=2Egit=
/commit/?h=3Ddt/next&id=3D363547d2191cbc32ca954ba75d72908712398ff2
>>
>> Should i do this?
>
>Yes=2E =2Edts -> =2Edtbo is going to be removed=2E

Do this if still using overlays,will test new way=2E

Maybe we can apply parts 1-9 first?

>> >> more comments about the dt overlay-support:
>> >>
>> >> https://patchwork=2Ekernel=2Eorg/comment/25092116/
>> >> https://patchwork=2Ekernel=2Eorg/comment/25085681/
>>
>> Daniel suggest define sd/emmc as overlay too=2E=2E=2Ewith way you menti=
on below we could create 4 full fdt without applying overlays in uboot=2E
>
>Yes, but if you are going to do that, then you can just do all this
>with includes=2E

This is a third way if i understand correctly

Make all of them as overlay (dtso?) but
 build dtb by combining them in makefile=2E

This looks the best way because it avoids
 redundand code for mmc node and allows
 my current spi config (not the status way
 which may break due to same unit address)=2E

I guess my base dtsi is then a dts too?

Or should these overlays only duplicated and either include sd dts or emmc=
 dts (but this creates again redundant code)?
>> >> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> >> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> >> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev=2Edt=
b
>> >>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1=2Edtb
>> >>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64=2Edtb
>> >>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc=2Edtb
>> >> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtb=
o
>> >> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>> >
>> >These need rules to apply them to the base dtb(s)=2E You just need:
>> >
>> >full=2Edtb :=3D base=2Edtb overlay=2Edtb
>> >dtb-y +=3D full=2Edtb
>>
>> I would prefer to do this in bootloader to allow all 4 possible configu=
rations:
>>
>> Sd+nand
>> Sd+nor
>> Emmc+nand
>> Emmc+nor
>
>That's fine=2E The purpose here is to document what the overlays apply
>to, check that they actually apply, and validate them when applied
>(unless someone wants to figure out all the issues with validating
>just an overlay and make that work)=2E You for example have an
>undocumented compatible in yours (denx,fit)=2E

Oh,need to check,copied partitions from my
 uboot dts=2E=2E=2Emaybe there is a linux version
 for marking it as fit partition,else i drop
 completely=2E

So i i stay with current way i have to rename
 overlays to dtso and add info about base
 dtb (bpi-r3-sd/emmc) to commit message
 or into the overlay itself?

>Rob


regards Frank

