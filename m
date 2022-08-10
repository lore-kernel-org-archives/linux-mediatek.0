Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F4CC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 22:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxZ1NGAiSTP73cSUEoGkOx6aRZyABhhViwltGrYhe9E=; b=pWUmVRqfpYzgoYD6BsMKYLvR7P
	l0yPWs82CVrsm4XPVJGe0/E/vqxGsimBv3qNjs5mEePvr5niVFCvsWjqSCBw4tW8W/9SYeDVrQF3c
	5FoVosq1myEZSp+/2lfHf/CnY600wjvwKulQ/c7UKcVtUQB8W1m+tIcb8j/ldR5Y+yvaPn+WlDnyK
	Ha3JLZil27UsThZmhlzR+pgy6IQ6kzHYFc4IBTx50gh+a61Kemfg4aF1kI8+UB8CghxrnR5NoPeBd
	gWevwqdSsOryaG0eBL07EJ/ENepnnz5ve9O8E/N72i9sTS4Ty+Yabva1dtre/KJiEmGt4cTfKZAZk
	K6bJrg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLuae-00GBdy-1s; Wed, 10 Aug 2022 22:54:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLuaR-00GBNG-ID; Wed, 10 Aug 2022 22:54:05 +0000
Received: by mail-pj1-x1036.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so3621983pjm.3;
        Wed, 10 Aug 2022 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=lxZ1NGAiSTP73cSUEoGkOx6aRZyABhhViwltGrYhe9E=;
        b=owAIw5XnlxRKipTQS/kUnxW97nZAbohYpcMbsOvQ0alvR4Z4RdrlUkYJTbOKg5WGwx
         RVXF+rno6+iqBd8fyOnwS2HCzho8dxvBSLnKRvaEtfiGga3U7txf8Fgn8VhXsZcDGbZP
         ktk8jidhPs6f9y6OX7qJwsdcVIavhVqVrPf88aLWG94V/3ZuwdAFlMvowiC8EMqUmS6N
         vIjz85SXIyYc+43lzj27PBWORfff48Arq+B7/gFrTyw/awy9s96IXQ5CP5pUBf90yEZu
         5Ev1mWx5E3h6U6qAMJaKcu2DwcDNxepV980jobU6q+lvquYLPZ7tB1mXb7yogRKiunOk
         Xkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=lxZ1NGAiSTP73cSUEoGkOx6aRZyABhhViwltGrYhe9E=;
        b=0g7b1b2B3peqHM/FzVmZf4sE/GMHYVZmyW+Wprsb7ItHIHi61WLbVgT2LeZfGezaIC
         epGRGVYxsPVKAG2BooHGIHDIsUoAFgHf5yp28tKq5jl9cC6hJwrrUOXDEa8RcT0ZamgV
         PEaSkIaHRG/tPW9b02g/OmLcoK9/XJnADmG/MEopHZyesGll1Du/xBASTHJEOwLBNu71
         nEfBunVCibcDLDyS6thK2m8QpbVNXen032gNd7QQAbP3IIbCYJeWe7XGdFwbQRICSji8
         70nN6DFsqRNhn0SL2qe067MM5cS/GwqMG0tdzzm4h+caVtZXlBa0BuJHmYqE2DjsUvZe
         CEkg==
X-Gm-Message-State: ACgBeo3NppwmV31DEpkBcbGwqvvwiRRv3bTkAGn1x0vPGN0CsiTbGhui
	CQf5VqsxxQ0Vn2RfZ9wQSzcIrZ00gJU=
X-Google-Smtp-Source: AA6agR7JEoiU8e8aUzYwboJBL1uZG9zUuw7r3JBfVIeLgtMOh8tPNt6wxTuTAo7vqrkXvDiyS4PepA==
X-Received: by 2002:a17:90b:17c9:b0:1f3:3a7c:a3a7 with SMTP id me9-20020a17090b17c900b001f33a7ca3a7mr6041466pjb.76.1660172039748;
        Wed, 10 Aug 2022 15:53:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a3c8:d6b9:a5c2:1eca])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902e88300b0016be96e07d1sm13584240plg.121.2022.08.10.15.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:53:58 -0700 (PDT)
Date: Wed, 10 Aug 2022 15:53:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Fabien Parent <parent.f@gmail.com>
Subject: Re: [PATCH v2 0/7] Input: mt6779-keypad - double keys support
Message-ID: <YvQ3A2/Pop4YzzQ8@google.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_155403_722683_5305E8F8 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, Jul 26, 2022 at 02:56:05PM +0200, Mattijs Korpershoek wrote:
> The MediaTek keypad controller has multiple operating modes:
> * single key detection (currently implemented)
> * double key detection
> 
> With double key detection, each (row,column) is a group that can detect
> two keys in the key matrix.
> This minimizes the overall pin counts for cost reduction.
> However, pressing multiple keys in the same group will not be
> detected properly.
> 
> On some boards, like mt8183-pumpkin, double key detection is used.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Applied patches 1 through 5 (leaving dts patches out), thank you.

> 
> ---
> Changes in v2:
> - bindings: add matrix-keymap justification in commit message (Krzysztof)
> - bindings: switch from double-keys(boolean) to keys-per-group(uint32) (Krzysztof)
> - driver: add a function pointer for row/column calculation (Angelo)
> - Link to v1: https://lore.kernel.org/r/20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com
> 
> ---
> Fabien Parent (2):
>       arm64: dts: mediatek: mt8183: add keyboard node
>       arm64: dts: mediatek: mt8183-pumpkin: add keypad support
> 
> Mattijs Korpershoek (5):
>       MAINTAINERS: input: add mattijs for mt6779-keypad
>       dt-bindings: mediatek,mt6779-keypad: use unevaluatedProperties
>       dt-bindings: mediatek,mt6779-keypad: add mediatek,keys-per-group
>       Input: mt6779-keypad - prepare double keys support with calc_row_col
>       Input: mt6779-keypad - support double keys matrix
> 
>  .../bindings/input/mediatek,mt6779-keypad.yaml     |  8 ++++-
>  MAINTAINERS                                        |  6 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    | 21 +++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  9 +++++
>  drivers/input/keyboard/mt6779-keypad.c             | 41 ++++++++++++++++++++--
>  5 files changed, 82 insertions(+), 3 deletions(-)
> ---
> base-commit: 668af1b6548837b44a2bfe65dcbae6b250adbf63
> change-id: 20220720-mt8183-keypad-20aa77106ff0
> 
> Best regards,
> -- 
> Mattijs Korpershoek <mkorpershoek@baylibre.com>

-- 
Dmitry

