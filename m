Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vhIOOqQNzKQwPQTtWl17viF0UiEdulxpiLqsRIF7uw=; b=LKZlTe2dcUcWfgoyKKgP6yoZy0
	FaGasQFRrtjiQ1b64upIOqoDVavYbD7bRDd5RCh0R2EqzuFIiaTGowVLWlfIOtZhuYUYF278FNkYv
	L7OLiPrCUgdlB7vFXAuLFKxGUH0gcAdWiy73V1CB4+DsKfSmriNa29rHqL/ZLUZCYRI/Gb+Z82Jht
	gU/6+dtFNV53cYi/I3P83Ka/NNhap90kqyzWGswexGjH74iMDxxgmJkEakJ2ic1D9TzriuBdO/JIP
	MrtzxhxWfMxgVJjzVVDXGyW0RFHfPFL+4j0bdDxwN28+MsnG52ms8Am7tgUetm/sKNd3qzqb3O+9x
	oyvJCNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofNSd-006Tpo-Tk; Mon, 03 Oct 2022 15:34:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofNST-006Tmx-42; Mon, 03 Oct 2022 15:34:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE241B8117E;
	Mon,  3 Oct 2022 15:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0971C433B5;
	Mon,  3 Oct 2022 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664811253;
	bh=M5rK9JeEdAPZUW077j6m2FsoSTU3aiXVy6fJVfF+n08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JB00gpG/jxWtyXAQeF6Wqm+2YMVCMIeOMtH3D3j+zVMgsTKwg9X3eWXh2IftWF94d
	 gw6M4HfsUtxE40BnhX7u78XHMbiERtoJYCaqwGUkuMeHAjxrBtoWsyU2b8rdoKQAIg
	 c2GPvQZULrTyQnPKw0v3r2EZNglInQJofry6B6fGEsktFRWi3jUPwLHlYDXQdG6+XH
	 gqujZiU51IRbjAyVTZffB4PVnOct2fSVsyctJEyefvsTJ7bw2rBl+/rAwgcy91DkRK
	 MzRS+SaHyT/HvKZTpjgEpq0qL/bj0VLc7p5imRPGsf53m0fyuXwhe0a+Ny/upXe83f
	 BNbbW8q5Vjr4g==
Received: by mail-ua1-f46.google.com with SMTP id e3so4261434uax.4;
        Mon, 03 Oct 2022 08:34:13 -0700 (PDT)
X-Gm-Message-State: ACrzQf0xOA4r6C1At4+Ocp6GL1oKvaRNC3jb6O7gev+JZ3A+GN79Igf1
	VctlehQ5u5P6p86OsV9lsPI/97J0kZbhORtk/w==
X-Google-Smtp-Source: AMsMyM5DBBVN3TggQcCyQRXdPbWl3J1CRWQWF3vq1uFNYZGTqs+7Y11WnvBixBWk9gQY9wmYo5yA1LcGFHjWhvIMbiU=
X-Received: by 2002:ab0:70c8:0:b0:39f:7528:6289 with SMTP id
 r8-20020ab070c8000000b0039f75286289mr9473759ual.36.1664811252539; Mon, 03 Oct
 2022 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
In-Reply-To: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 3 Oct 2022 10:34:01 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
Message-ID: <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, matthias.bgg@gmail.com, 
	sre@kernel.org, chiaen_wu@richtek.com, cy_huang@richtek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_083417_346199_6C82BF4B 
X-CRM114-Status: GOOD (  14.10  )
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

On Mon, Oct 3, 2022 at 4:05 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Fix the interrupt order of the charger in the binding example.
>
> Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> v2
> - Revise the commit syntax.
>
> v1
> - Due to this patch modifiacation
>   (https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),
>   there will get some warnings in linux-next when compiling the dts.

This doesn't fix all the warnings. These still remain:

/home/rob/proj/linux-dt/.build-arm64/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
pmic@34: indicator: 'color' is a required property
        From schema:
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/home/rob/proj/linux-dt/.build-arm64/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
indicator: $nodename:0: 'indicator' does not match
'^multi-led(@[0-9a-f])?$'
        From schema:
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

