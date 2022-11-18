Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7256CC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+xwnrsoUobmreQpAn1cmLZ/77U1MlbEyuwhh2UKlVo=; b=WdSn0VFaURxsfDlmVV0IO165J0
	eu0sQiWQcOiX7jaPIZfscUT1Z6WTfqovRtoX99Wp75toWkCcuidAeO/u0J0Ws+YjDb1CrR/wL0E9b
	A0eVdWuFlDVHLm1C8s+mAxemwQh/2dxneEbVLl0pTTs6FTUamTmCR8qUpKASVsG8sxDOvNNV/mHlx
	enUsAVdPpcp3JHspAnFtqWnX4l7EF2hbiCpusrteteuDd4fF6V/CbfS3LLXKQzDeAIcSbQZW8O3eT
	c66+/FnADfGOhH9vxGZ2OvIaXkkvFZeWJ8JPMtw72V0YGdTR7zqusRvqMne3+fVuJhk05UHvgVAEF
	8bKhSpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow95w-008GVk-Qy; Fri, 18 Nov 2022 21:40:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow95i-008GPe-FF; Fri, 18 Nov 2022 21:40:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BA2DDCE2285;
	Fri, 18 Nov 2022 21:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04117C433D7;
	Fri, 18 Nov 2022 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668807603;
	bh=YKUHTSPq5IDGNDGLjf/sjbiqE0AZozBsTwTI13qMcZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KDveWRKNOZyZVU+/76UW6M5Q/08kv/yJiaBcxH6kTaAvK0EC/0oB/lPwlzQXRfmt6
	 Zm/6M8sSh3ksyjPfsLmQgNXmslxy66uL5hS1qxIj6follviijaqOxF2Ylk8xrW33Tq
	 tROHgNpz9156QXsea3C6WmNgnCpvTK33f5e0Kl8qKFQujqsYAELF2CIoRERiHLZSQS
	 RWX1QktikpkEd0k51tItGSYnnudBdJPC0ZiXCrXF9/tj55S2jo8fCS6mpcV6k2X5mq
	 2BxJRJFcUCadrZkCMXM/Y8JSeEMHRoKa07VJ9fAMRabmA+AXFrZYTMVzJX+sgyxq1O
	 erfDoFG1bweNQ==
Received: by mail-lf1-f54.google.com with SMTP id d6so10277989lfs.10;
        Fri, 18 Nov 2022 13:40:02 -0800 (PST)
X-Gm-Message-State: ANoB5pnLbasRjOwdtlIR849AC7+M2c552AtEJMuWAxTp0D1tYUJ7nqqx
	yJq3+15J7saEFncPSOOhwqcDKRd6ulumWt29sQ==
X-Google-Smtp-Source: AA0mqf4W7viCQPe0UTFofFT1SvVUt8YX11fzG82T1MZfAN+7A17E35zovc3VtyGLwVD/L6iRCqAuOeEDvppeVb0p8zA=
X-Received: by 2002:a05:6512:b97:b0:4a4:6ee3:f57b with SMTP id
 b23-20020a0565120b9700b004a46ee3f57bmr2843395lfv.17.1668807600996; Fri, 18
 Nov 2022 13:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20221118190126.100895-1-linux@fw-web.de> <20221118190126.100895-12-linux@fw-web.de>
In-Reply-To: <20221118190126.100895-12-linux@fw-web.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 18 Nov 2022 15:39:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
Message-ID: <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_134006_910784_3B0AAE2A 
X-CRM114-Status: GOOD (  20.28  )
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

On Fri, Nov 18, 2022 at 1:01 PM Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add devicetree overlays for using nand and nor on BPI-R3.

Can you not tell at runtime which one you booted from? If not, how
does one choose which overlay to apply? If you can, why not populate
both nodes and enable the right one? IMO, if all h/w is present, it
should all be in the DT. Selecting what h/w to use is a separate
problem and overlays aren't a great solution for that.


> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> maybe rename to dtso?
>
> "kbuild: Allow DTB overlays to built from .dtso named source files"
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2
>
> more comments about the dt overlay-support:
>
> https://patchwork.kernel.org/comment/25092116/
> https://patchwork.kernel.org/comment/25085681/
> ---
> v4:
> - drop compile-comment from overlays
> - add author-information to dt-overlays
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts | 55 +++++++++++++++
>  .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  | 69 +++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index e8902f2cc58f..d42208c4090d 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo

These need rules to apply them to the base dtb(s). You just need:

full.dtb := base.dtb overlay.dtb
dtb-y += full.dtb

Rob

