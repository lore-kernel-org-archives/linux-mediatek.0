Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ADEC55179
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 12:09:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26AE420825
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 12:09:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WwJuwbwJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flwJaH75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26AE420825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1il9PNk3t6P5YeTXzxgicwQTjlUUqXlMHj1/CpmMzGs=; b=WwJuwbwJnPFBKFNoEyPlcpw6s
	XKQUvBaRc848Ma6iBRmkRVuhPq94ZnxzOiCrHMkRLpN54xD3u2Y6avfekAOFdnAtjYUYY8g7uMcBB
	s5Q1whyoNoJn5eL8fce2edMFgueIrc0x0hk8zPj3YJXAY6RwH1hz/KqB6r6xJOO1vwSTInju3hLI3
	oid7nIAAi99wliPgXxoEs1xbvFYMLsgfRQyb9Rnel8rXnYDWCcenW8qA8eSpGy+OZbqGvTUZI959q
	ZgetMvwE5CQCZwoTbSJZU36FBb3LQA9MDnC4vYjWC8SDzeZ4cJEOf7vxUXuoMRi93U8cZDQ8T8Gew
	gaL+hV5eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6jw-0000Rb-QE; Thu, 29 Oct 2020 12:09:12 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6jt-0000PU-AR
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 12:09:11 +0000
Received: by mail-vs1-xe44.google.com with SMTP id y78so1356894vsy.6
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Oct 2020 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XOPDCJxGnjWbK/1ZDXPLwtwqPWavp4ha998oEkxsn8Q=;
 b=flwJaH75+OYPqFvGJJOTCOx1TZi8IkdOeBuVeZ6SvXSpLNyp9g4K0i2zUPy8ZpviIZ
 FXyorcgcn82PvQNIjdD8/qBH6bdqD7hVT1Yh1PeaKDstjGkUg4413rA6i5+2/J9Hozsj
 XVZCH+AhVY9J4KolXVf3c9ZHtCXIN8FxYc7c0VrIwzuCJ0Xu8krbL3Bcd8Nk4qGdp/Vu
 yuCc1wHdv6sPHUDSaO0/XKxsZ7AcOyXZUaFxHg8VF2p0pieU+79NaJ9CtD7ybcNsmchJ
 jE7NNTaQcZmyho4l9WKNWBAPtIORLfwANGO0BXp5CZXGHA1Gr8qQImK3EbS2Nku/dNGV
 ZgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XOPDCJxGnjWbK/1ZDXPLwtwqPWavp4ha998oEkxsn8Q=;
 b=RjgeAaJGJUfgTyIq17z/0bJEkPNIgAu5R4rbAUZi177Eot94l59WLy8RCj3BC48Bs9
 JZL3Z+eOKg29NE7axIFz5eYwhYeVeg6J8/Up0cyP9E2PpOTUZa4ZSS73loVlA2p8URil
 /+071UssE/YMXhrvGlDfbLbwyYa6VGhUiXKpzxjq/HNSZd1QrvHnitPTilBvZRMmgqcG
 xm9C7htV5Pj3VhRoABgsdaWe7d9YkCQRDDR0Lktxe23P131QPqaIVQpbewKuqZjx+W6T
 dFTyyLZNtWaa2EzOfCkhT7gTk16fo3/rDdYpVlUbnZt/1ef1nj0PPzAsVgr/0ti/B43T
 I4dg==
X-Gm-Message-State: AOAM533aSG/OCSlqXAw3m6MpjTd1Fpqlnk+zJhL69eTJ6s+czxfMyXqP
 bEbMHObYo7bjd4jPaotinwLdNXlgnBpuyTBm5/pnMg==
X-Google-Smtp-Source: ABdhPJx6Q9DF7vcO6aVmXdxaszAIPS70N4/DVXoQj6nfMycE8SxJR1X9NIaonbsZ7yKYflfVuVmupOxqyzRK8kMeNLY=
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr2466385vsp.34.1603973346162; 
 Thu, 29 Oct 2020 05:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201014030846.12428-1-wenbin.mei@mediatek.com>
In-Reply-To: <20201014030846.12428-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 29 Oct 2020 13:08:29 +0100
Message-ID: <CAPDyKFo+sLQEWdDGkgDKp56a0Cua9nSGTqMUvdtEzUQx9RQt6Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add mmc support for MT8192 SoC
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_080909_482722_FB143BAB 
X-CRM114-Status: GOOD (  20.37  )
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 at 05:08, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> Change in v7:
> 1)add "unevaluatedProperties" in mtk-sd.yaml
> 2)add Reviewed-by tag
>
> Change in v6:
> 1)use devm_clk_get function for required clocks
>
> Change in v5:
> 1)remove Reviewed-by tag
> 2)use devm_clk_bulk_get_optional instead of devm_clk_get_optional
>   for bulk clks
>
> Change in v4:
> 1)drop "vmmc" and "vqmmc" desciption in mtk-sd.yaml
> 2)add vmmq/vqmmc supplies and the pinctrls to required properties
> 3)change dbg level and exit this function
> 4)use devm_clk_get_optional instead of devm_clk_get function
> 5)remove else branch for sys_clk_cg
>
> Change in v3:
> 1)change maintainers name in mtk-sd.yaml
> 2)change "compatible" properties to enum type and sort it
> 3)drop these properties: "reg" and "interrupts"
> 4)add "maxItems" constraints on these properties: "vmmc-supply", "vqmmc-supply",
>   "assigned-clocks", "assigned-clock-parents"
> 5)add "minimum" and "maximum" constraints on these properties: "mediatek,hs400-cmd-int-delay",
>   "mediatek,latch-ck", "hs400-ds-delay", "mediatek,hs200-cmd-int-delay"
>
> Change in v2:
> Convert mtk-sd to json-schema
>
> Wenbin Mei (4):
>   dt-bindings: mmc: Convert mtk-sd to json-schema
>   mmc: dt-bindings: add support for MT8192 SoC
>   arm64: dts: mt8192: add mmc device node
>   mmc: mediatek: Add subsys clock control for MT8192 msdc
> ---
> This patch depends on
> [v4,1/3] arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile
> [v3,1/9] dt-bindings: ARM: Mediatek: Document bindings for MT8192 BSP
> [v3,6/9] clk: mediatek: Add dt-bindings for MT8192 clocks
> [v3,9/9] clk: mediatek: Add MT8192 clock support
> [v3,1/3] dt-bindings: pinctrl: mt8192: add pinctrl file
> [v3,2/3] dt-bindings: pinctrl: mt8192: add binding document
> [v3,3/3] pinctrl: add pinctrl driver on mt8192
> [v2,1/4] soc: mediatek: pwrap: use BIT() macro
> [v2,2/4] soc: mediatek: pwrap: add arbiter capability
> [v2,3/4] dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
> [v2,4/4] soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs
> [2/8] dt-bindings: mfd: Add compatible for the MediaTek MT6359 PMIC
> [3/8] dt-bindings: regulator: Add document for MT6359 regulator
> [4/8] mfd: Add support for the MediaTek MT6359 PMIC
> [5/8] regulator: mt6359: Add support for MT6359 regulator
> [7/8] regulator: mt6359: Add support for MT6359P regulator
> [8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes
>
> Please also accept this patch together with [1][2][3][4][5]
> to avoid build and dt binding check error.
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=332621
> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=342593
> [3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=330017
> [4] https://patchwork.kernel.org/project/linux-mediatek/list/?series=322937
> [5] https://patchwork.kernel.org/project/linux-mediatek/list/?series=323171
> ---
>  .../devicetree/bindings/mmc/mtk-sd.txt        |  75 --------
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 176 ++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |  89 +++++++++
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  34 ++++
>  drivers/mmc/host/mtk-sd.c                     |  74 ++++++--
>  5 files changed, 355 insertions(+), 93 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>
> --
> 2.18.0
>

Applied for next, except patch 3 as needs to go via arm-soc, thanks!

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
