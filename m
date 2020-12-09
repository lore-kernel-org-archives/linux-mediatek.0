Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382C6C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:49:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F008C2054F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F008C2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qi0l6tuHXlNhRdIBDTOwiitEzG1KRtSVatwzw+9HAnA=; b=bWCmuKwaSdcgFuFGCf+6m0Fkx
	EJQwGggTxgzLRm8Pwvka7Ky63M1IjfUvBz69L4KN4HBJbCIu0UuMRAiZ18dBlEjJqsIVVJ8ki36T4
	j2ILiiXF00WPIxMx6MTC3Q0Uf5PR2QK0nkh++fLYJDrgR///yy1eEh1pEpn0us0J2bBXaPy1uWJpS
	4jRwExHtoGdAYgvMcsCopFHt3Fdf4wIWvtew4X82u75rIckU3UAGT2bUEF22GWzwRZ1kzDhF2m+1O
	X1KNK1VTquzcJfVLH7GXKEIhCitBdFwRX+VNy0jYkkl7adXgd+yA40ZE3A9+8z3OzbJY3zNkswtcD
	s1pA6KIvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxxq-0001ms-DZ; Wed, 09 Dec 2020 11:48:58 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxxm-0001kB-Ix
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 11:48:55 +0000
Received: by mail-io1-xd42.google.com with SMTP id t8so1329129iov.8
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 03:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HvHOHaWkWz9f5uu3P40vdNt+6mzTeQgyoxLze+Dl0g=;
 b=I1eki8GcBzKwc6xYmgWPjUTM/SWL2w2UhFFkCM1ywq45hiSOF27YK1Ttq2UCWWlLep
 WRiFmxJ7zST0ftQ+RvwBCKJr3+2kGLcCqq/lUtKokZ4wtM7hXm0kZze+MnsOEHvSPRaY
 sCrSFQ24hoHl0uVoCY+9dL+jB5aamzpjmWOdcE//9+6iVXt3rndDMtB+ppknznc9pCK5
 NAn0kgH1hLrm+h/aElA7Tc/co6LaYTiBSqO3zAZdFZXofejG/GjjFNWUjDDK00Q//m0k
 yBHxuH2/vFrcU637DPm7wjocdhyLrINFue9373MoeDs2rcfCryJSZJQ8jcluQxsFR6OU
 cAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HvHOHaWkWz9f5uu3P40vdNt+6mzTeQgyoxLze+Dl0g=;
 b=oH+RnrUU8b8gBQz4mozYCipTN6Im2++Yyc5wGGZ9/Fu+xU84kOJDgHK9RtVeWUda4E
 RyNtaSVwxD5ZxQBUYZGbJHzIQJcKtuM5iZvBDN9xBjrexGXYohkz4Wcb9CNUKMAyGHpI
 QGOwHWboudm+GvMb+rZK9M3nTIz2vcH1ewTUxSdRoZdc60/A0caedzYgTiN8r7vmluQk
 V/oyXXGrW8fHEZO2TBTb5kJco7ewYWow+HRnaRUXiHWjcq8Fe5i8f0n15EjcC5ig+Gis
 S1rch4BsSpEZQkkysz7xZabFZkqZM+yye55cbaSBMDrn7t5bnAiT1SsMnKAA99YmYHzN
 0kfQ==
X-Gm-Message-State: AOAM53273yTT21xWSQOy54Y7xy5XK96VRmjCPD6Qdvma+W9A+8bTnF9y
 UfuZUqUpaVmO0TJAvO4t+2YSIToam6QvV1BbrbzW8g==
X-Google-Smtp-Source: ABdhPJzDuGvTStBIZ/1Plqa1/cjaQJaRQHy1Es4XzEExZpLWTqkchkuQiCQdQ3DGAuzdUI1gqcAhktveSbV1z55+Bs0=
X-Received: by 2002:a05:6602:13c5:: with SMTP id
 o5mr2294111iov.46.1607514533155; 
 Wed, 09 Dec 2020 03:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20201209114440.62950-1-fparent@baylibre.com>
 <20201209114440.62950-2-fparent@baylibre.com>
In-Reply-To: <20201209114440.62950-2-fparent@baylibre.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 9 Dec 2020 12:48:42 +0100
Message-ID: <CAOwMV_yFukOeH9k3DDWJv3RWYV3-VEgQR=xS7art2VR421Ynjw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_2=2F2=5D_=F0=9F=93=A4_arm64=3A_dts=3A_mediatek=3A_mt8516?=
 =?UTF-8?Q?=3A_add_support_for_APDMA?=
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_064854_840456_229781B0 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry, resending without the unicode symbol in the title

On Wed, Dec 9, 2020 at 12:44 PM Fabien Parent <fparent@baylibre.com> wrote:
>
> Add support the APDMA IP on MT8516. APDMA is a DMA controller
> for UARTs.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>
> V2: Add missing dma-names properties on uart nodes
>
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index e6e4d9d60094..b80e95574bef 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -276,6 +276,27 @@ gic: interrupt-controller@10310000 {
>                                 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
> +               apdma: dma-controller@11000480 {
> +                       compatible = "mediatek,mt8516-uart-dma",
> +                                    "mediatek,mt6577-uart-dma";
> +                       reg = <0 0x11000480 0 0x80>,
> +                             <0 0x11000500 0 0x80>,
> +                             <0 0x11000580 0 0x80>,
> +                             <0 0x11000600 0 0x80>,
> +                             <0 0x11000980 0 0x80>,
> +                             <0 0x11000a00 0 0x80>;
> +                       interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>;
> +                       dma-requests = <6>;
> +                       clocks = <&topckgen CLK_TOP_APDMA>;
> +                       clock-names = "apdma";
> +                       #dma-cells = <1>;
> +               };
> +
>                 uart0: serial@11005000 {
>                         compatible = "mediatek,mt8516-uart",
>                                      "mediatek,mt6577-uart";
> @@ -284,6 +305,9 @@ uart0: serial@11005000 {
>                         clocks = <&topckgen CLK_TOP_UART0_SEL>,
>                                  <&topckgen CLK_TOP_UART0>;
>                         clock-names = "baud", "bus";
> +                       dmas = <&apdma 0
> +                               &apdma 1>;
> +                       dma-names = "tx", "rx";
>                         status = "disabled";
>                 };
>
> @@ -295,6 +319,9 @@ uart1: serial@11006000 {
>                         clocks = <&topckgen CLK_TOP_UART1_SEL>,
>                                  <&topckgen CLK_TOP_UART1>;
>                         clock-names = "baud", "bus";
> +                       dmas = <&apdma 2
> +                               &apdma 3>;
> +                       dma-names = "tx", "rx";
>                         status = "disabled";
>                 };
>
> @@ -306,6 +333,9 @@ uart2: serial@11007000 {
>                         clocks = <&topckgen CLK_TOP_UART2_SEL>,
>                                  <&topckgen CLK_TOP_UART2>;
>                         clock-names = "baud", "bus";
> +                       dmas = <&apdma 4
> +                               &apdma 5>;
> +                       dma-names = "tx", "rx";
>                         status = "disabled";
>                 };
>
> --
> 2.29.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
