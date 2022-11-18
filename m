Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2F1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 21:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReZ67yUXBh/SVI44mRQjAhG9xv1rCnEve2160ce0les=; b=n2W8ohMXMuf30ePKpUYSjjBVu3
	8w3bNWt3TARWcN0PuNjxvg2+iB94VzJpPUTp2dhzxDdsh9EU6Q0Gi0QRGtf19FKl3BLAo0FqfFpkd
	t4MjI9IsSeMs8wC6JRfnOizJn+qbbRqV5SoLNGcqiyELuSFVdB3sm3pGTUtf5pQq46EXEoy2cao/H
	hhd7io/5w9pWCe/SJjLm62CpWWYvZ3mMLzPckbvlJnRa7vcAAtRnEtPRWTz2wwIdPwlq6+hHuZ+Jo
	6XYIZN/8IFoSgQJeWlsiXyLNY26ekIsPoBWGdqeiBdvH9YBsP81QaPMBPp+2jbQ2qgTHJOd03p1/x
	P71H71og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9Bl-008PLj-P0; Fri, 18 Nov 2022 21:46:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9BW-008PDu-Fz; Fri, 18 Nov 2022 21:46:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D463C627A2;
	Fri, 18 Nov 2022 21:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F01EC43148;
	Fri, 18 Nov 2022 21:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668807964;
	bh=RNBGyT8pOapfGmKmgkwMpgie8elalZGmmgERqozynsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PMorCDQIGJ64l2Kqj3yXz+JZWMspa46YvciYFDwUiWbmVAGPwa63kOqwfs+MpBvq+
	 3FmCyGXkMptzQm+Wb3NQrjkH/ffkrqp6QSSK6LLVEdBZ7dYuXHks82Nw7cj8ZlarPM
	 FUmht1b2FmkX+myZzfjf0o+bVip8Y8f1pypP/V/0dui7hHR+ONuPfHvQf7/mhLqfLQ
	 U8mgnOud2jNBdYwwnYUmHdm+kQTvD3Wp7OBqwRjFPl/yt4EcPphXJZtUkS4FE9iH1G
	 lMGDQgS9Cj9fLNqq5ZSu2WZBW2Avbnrf0H7iI1916iMQrq5v0RD/i3NaS/2Df7RZWj
	 /ySe9OFXuw4IQ==
Received: by mail-lf1-f49.google.com with SMTP id p8so10280027lfu.11;
        Fri, 18 Nov 2022 13:46:04 -0800 (PST)
X-Gm-Message-State: ANoB5pkg/Xth0Qtimzkvkr5iicpE70DiBcub6Qi8nXxDPC+4yvELNnTs
	omG4llsz5W2cu5MxuRuyde6VcCooie3+zO/dpg==
X-Google-Smtp-Source: AA0mqf450V8MLhrSk+aZ9ENb/BJGi+0rLQx57RrQjhp4T28QJaf+DVYt15IhGTYuJbXF1stCgsvLBKHTzVMBV+osv2w=
X-Received: by 2002:a05:6512:1291:b0:4af:eabf:3c57 with SMTP id
 u17-20020a056512129100b004afeabf3c57mr2788378lfs.449.1668807962519; Fri, 18
 Nov 2022 13:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20221118190126.100895-1-linux@fw-web.de> <20221118190126.100895-12-linux@fw-web.de>
 <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
In-Reply-To: <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 18 Nov 2022 15:45:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLdfWaP7aX8xmB56PTFzupb45ttwQex34eGmYw3gYEA6g@mail.gmail.com>
Message-ID: <CAL_JsqLdfWaP7aX8xmB56PTFzupb45ttwQex34eGmYw3gYEA6g@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_134606_635207_7AE7B56D 
X-CRM114-Status: GOOD (  23.55  )
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

On Fri, Nov 18, 2022 at 3:39 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Nov 18, 2022 at 1:01 PM Frank Wunderlich <linux@fw-web.de> wrote:
> >
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add devicetree overlays for using nand and nor on BPI-R3.
>
> Can you not tell at runtime which one you booted from? If not, how
> does one choose which overlay to apply? If you can, why not populate
> both nodes and enable the right one? IMO, if all h/w is present, it
> should all be in the DT. Selecting what h/w to use is a separate
> problem and overlays aren't a great solution for that.
>
>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > maybe rename to dtso?
> >
> > "kbuild: Allow DTB overlays to built from .dtso named source files"
> > https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2
> >
> > more comments about the dt overlay-support:
> >
> > https://patchwork.kernel.org/comment/25092116/
> > https://patchwork.kernel.org/comment/25085681/
> > ---
> > v4:
> > - drop compile-comment from overlays
> > - add author-information to dt-overlays
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
> >  .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts | 55 +++++++++++++++
> >  .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  | 69 +++++++++++++++++++
> >  3 files changed, 126 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index e8902f2cc58f..d42208c4090d 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
>
> These need rules to apply them to the base dtb(s). You just need:
>
> full.dtb := base.dtb overlay.dtb

Oops, that should be:

full-dtbs := base.dtb overlay.dtb
dtb-y += full.dtb

Just like multiple objs in a module.

Rob

