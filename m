Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E50C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 03:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQLWWyM7Nn9o9Y0cnjEejjeHvIjPNO3pYMSeV4dgs7k=; b=yZu7mxrmDOYhFD
	ZXUQ62mW4MMMwdKtG71i8I0LzaDzq/KuNcWZVKw40OhQH4/NUpCfIpey3r43/g4kSNLTEeCWaw9HE
	4J9zIR5vtgDMWRNKg5nQ1QzIzWB2a2B2qivJy5GtGO1hRzy8gtF+3qoijimd1HQ1arRhypuqSb25V
	UWOHFMG9WtnWlteHz2D5ZjHuFFYAGycQgiVgYEh8vrhZjQe92LXUS4qfxAWhVM2+TASJOyrWhzPpN
	MaUFwTXftPHzh9WV2zm7+tFvqwey7Lhm+LjX0XASmKfCMzEUYHCgpWf6wQoqmPr22Q7xcY4XwevMq
	f3NmqR8TjLXH1BUGSDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMLk3-007qNn-NB; Tue, 22 Feb 2022 03:21:31 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMLk0-007qM7-Bn
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 03:21:30 +0000
Received: by mail-yb1-xb33.google.com with SMTP id bt13so38291393ybb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Feb 2022 19:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZmWgceQ6d0EJDvYHIwt2SeSJZCWvvIDtaWqqmY4OMA=;
 b=DrPJ477mHkIvsVG73tpIaNLu6pLFpEIIqmAUrwV2BmcWkzPeUA+j1IusCbgfZ0t3nV
 zroHaYD7xo6WtfwZMIE85TsMJ39VJhAZQt4cXKPZjcljp1PxYz8OLCkamgJl+wJ7kREv
 SR4lEk4X+3DQyQX7tgFVZS1Pqp1kyT5uurxnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZmWgceQ6d0EJDvYHIwt2SeSJZCWvvIDtaWqqmY4OMA=;
 b=poqmaf1MBB/2RrkM6ZYEHpkpGrlbo2r4LwSxICs2en89377wIVDnHK8fxBk6qNCcrZ
 XYbRFeKZ/4DiRiDPtU6ulxR7vifo8Q3KWAVughAlUEXoDFqKIQNJffmmINCRYEQn86IC
 r5pnLuJPX71QJF6ZddOtpEZmioOrhTj+I4jxAqPDTYk1XkUDaGH3mxWHwbf3FYWSFjpW
 BOjsArO91mcUKB/eJVcvvnmXRZszcQaSNg34YAXAyOxVEjL7h5Z+2M8qggQ7k8mX9UNe
 BWGLKRu3OmRkK2mdGLkdhJlCfg5KsdIXEkbS2gHK9kNY65hF8lFioxvvFU5xN3zLYEq9
 rWDg==
X-Gm-Message-State: AOAM533auX0Gmm7oEe2f5Uh+1Od2ZEEKShEYfGokPe9fg4cP9tv+35xy
 ZCpWmjc+6nFnnOGHPW9+sSzB3UkOJf9UH/dxpDN7cw==
X-Google-Smtp-Source: ABdhPJxt7WwycTtizv9sQEejATOIAE0jfqZbArOAZiarEyoXEA95Nu+HBOjjRAGBu2adA3cQSIpv+e7ZPkkikuTfZUg=
X-Received: by 2002:a25:d314:0:b0:624:6c1a:6f2d with SMTP id
 e20-20020a25d314000000b006246c1a6f2dmr11111568ybf.189.1645500087178; Mon, 21
 Feb 2022 19:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Feb 2022 11:21:16 +0800
Message-ID: <CAGXv+5EHLi0TpZaZq3rbOZeUjiFA_0t3QwZtjSLPZEe_zFO6XA@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] Add driver nodes for MT8192 SoC
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "--to=Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_192128_478494_E0774DD7 
X-CRM114-Status: GOOD (  14.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 18, 2022 at 5:16 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> This series are based on tag: next-20220216, linux-next/master
> and apply the below patchs
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220207094024.22674-1-allen-kh.cheng@mediatek.com/

It would make things easier if you incorporated the above patch into this
series when you send v3.

ChenYu

> https://patchwork.kernel.org/project/linux-mediatek/patch/20220217135620.10559-1-allen-kh.cheng@mediatek.com/
>
> There some patches are missed in PATCH v1.
> I resend series again and also add display related nodes in PATCH v2.
>
> changes since v1:
> - add usb-phy node for xhci node
> - move infracfg_rst patch in front of PCIe patch
> - add display nodes, i2c aliases and pwm node.
>
> Allen-KH Cheng (23):
>   arm64: dts: mt8192: Add power domains controller
>   arm64: dts: mt8192: Add pwrap node
>   arm64: dts: mt8192: Add spmi node
>   arm64: dts: mt8192: Add gce node
>   arm64: dts: mt8192: Add SCP node
>   arm64: dts: mt8192: Add usb-phy node
>   arm64: dts: mt8192: Add xhci node
>   arm64: dts: mt8192: Add audio-related nodes
>   arm64: dts: mt8192: Add infracfg_rst node
>   arm64: dts: mt8192: Add PCIe node
>   arm64: dts: mt8192: Correct nor_flash status of mt8192
>   arm64: dts: mt8192: Add efuse node
>   arm64: dts: mt8192: Add mmc device nodes
>   arm64: dts: mt8192: Add mipi_tx node
>   arm64: dts: mt8192: Add m4u and smi nodes
>   arm64: dts: mt8192: Add H264 venc device node
>   arm64: dts: mt8192: Add vcodec lat and core nodes
>   arm64: dts: mt8192: Add dpi node
>   arm64: dts: mt8192: Add i2c aliases
>   arm64: dts: mt8192: Add display nodes
>   arm64: dts: mt8192: Add dsi node
>   arm64: dts: mt8192: Add gce info for display nodes
>   arm64: dts: mt8192: Add pwm node
>
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1000 +++++++++++++++++++++-
>  1 file changed, 989 insertions(+), 11 deletions(-)
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
