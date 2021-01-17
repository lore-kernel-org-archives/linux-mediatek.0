Return-Path: <SRS0=p0H4=GU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D64C433E6
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 01:59:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34FF922BF3
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 01:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34FF922BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HxJb1wMSPcTfrgINVjRaZ4+JCd+ti5a7RRA5k65yGlA=; b=nlDYm+fePSGOCHYjpc+iZa5Ci
	HWiWJEoVWVB79RkMcihf0OxC+YlTDVp/kZiPhrnbstrDHTjHxa2XmCvyFVVUFcXUbReSakNgCq2h/
	kHF6vu8toGCm2p3iTYbXEAEHf0bUvscgMj75cCdqdk0i/MTNcfyA5V4nB2L4Iy47S0WbGida8A/Xf
	QinmsUanu2gh9BsbWblxF4v/iNM6BuICJk0mWkRmzG0O5PVP8A2lkvPHyBITlEp/Cikx8aOvOyNH+
	A7PVupyaeT0zi8SknJNXM5EIfC+utN20DlX5drU/2k4D8G7Q3uD3rvi6LT9u0LOW4fNje6L+lsztn
	EQoj99Wzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0xLS-00065Z-S1; Sun, 17 Jan 2021 01:59:10 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0xLN-00064E-CH
 for linux-mediatek@lists.infradead.org; Sun, 17 Jan 2021 01:59:06 +0000
Received: by mail-vs1-xe30.google.com with SMTP id r24so7255947vsg.10
 for <linux-mediatek@lists.infradead.org>; Sat, 16 Jan 2021 17:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2uAbgzuqmaaFgsco0W8wfFh6+uslGxzhS9k3Gwh6YFI=;
 b=FaYfKVQeStbG1gqWxtrRCWvSxrbDmCYERAiLUhM5XJP6pD4zbxUn3qSMfxYKLMVjz0
 kmsuhIXsqwGaS8U0MCOMPh6ThjcoSOE+0xe6x3hHLPEPFlOVZqVT0kW+gtBFZvHPOuP7
 2eDneJ00EhW6A7YBL7Zp9mPlMcBnKQmolzojs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uAbgzuqmaaFgsco0W8wfFh6+uslGxzhS9k3Gwh6YFI=;
 b=N7bjUKOEcrm3OxBuDKn6pNI4VTyblCUx5YHJhy91gvZzAtvz8wOHJPJIa3RSow3XA8
 1qXwjH5uKXp3TbIH1lI/S7zQx8J3gNaQVyEVtNpaQso52fteT2fcXL7WwXVdcviaKk6C
 l9CnxAl43IMDVuBc7pAw5Z1BAhPIHxkK/kloyCtMmMuunxlo2AEW7m13gXEuL6QVat/E
 0IJn1qPqgGejaHmBu0TTWN9xWNieL+ix2KLeBYsmYgbGgttIn/JdnrnAYhczo3XaO3MZ
 MqcfJZ/k2leYwdMksA35YLs2udNpRIrNm1Yuc1VD08LuHXDCAmL8EhT1W3YLhmqLeyky
 DvFg==
X-Gm-Message-State: AOAM533Hg+7Xv+LtDjfOYq+shts7U6OE5RtWzNktAvfV2FxTxAiWKo0V
 STn0TXAHTc+LzfqPpHtdZQh8UPT/Kh0pwRC1OguXTg==
X-Google-Smtp-Source: ABdhPJy5/LYHoUfJYfigPp7aEf81RaJx2lXHqgcnMUkYl6viFx+oN9nDTEB9raOjMFYrAG23L3VvR25Vn7ilnouI3bk=
X-Received: by 2002:a67:73c2:: with SMTP id o185mr15071090vsc.16.1610848740123; 
 Sat, 16 Jan 2021 17:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-12-chunfeng.yun@mediatek.com>
In-Reply-To: <20210116090656.11752-12-chunfeng.yun@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sun, 17 Jan 2021 09:58:49 +0800
Message-ID: <CANMq1KA63Lcifv0G80AyF9-JAdojtsnR18QtfytTMuKw7pTkPA@mail.gmail.com>
Subject: Re: [PATCH next 12/15] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_205905_490529_029186AA 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jan 16, 2021 at 5:07 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Harmonize node names, compatibles and properties.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..a69a033a68ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -865,7 +865,7 @@
>                         ranges;
>                         status = "disabled";
>
> -                       usb_host: xhci@11200000 {
> +                       usb_host: usb@11200000 {
>                                 compatible = "mediatek,mt8183-xhci",
>                                              "mediatek,mtk-xhci";
>                                 reg = <0 0x11200000 0 0x1000>;
> @@ -908,11 +908,11 @@
>                         status = "disabled";
>                 };
>
> -               mipi_tx0: mipi-dphy@11e50000 {
> +               mipi_tx0: dsi-phy@11e50000 {
>                         compatible = "mediatek,mt8183-mipi-tx";
>                         reg = <0 0x11e50000 0 0x1000>;
>                         clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
> -                       clock-names = "ref_clk";
> +                       clock-names = "ref";
>                         #clock-cells = <0>;
>                         #phy-cells = <0>;
>                         clock-output-names = "mipi_tx0_pll";

This is unrelated to USB, so this should probably be a separate patch.

> @@ -931,11 +931,10 @@
>                         };
>                 };
>
> -               u3phy: usb-phy@11f40000 {
> +               u3phy: t-phy@11f40000 {
>                         compatible = "mediatek,mt8183-tphy",
>                                      "mediatek,generic-tphy-v2";
>                         #address-cells = <1>;
> -                       #phy-cells = <1>;
>                         #size-cells = <1>;
>                         ranges = <0 0 0x11f40000 0x1000>;
>                         status = "okay";
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
