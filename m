Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1461DCD4F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt+wumRZB2gedChoBVOB7eMH7Tty3yALVYH/n+qfLlg=; b=oZ1811UYjFKSyjQeYcf4rgJ5ef
	DYa3fvWIJDowOIorwI6yj8WBbhKE4eIVY97obrBDy42qBtwh25SIqnwJ8C+43quOYPo0r0BF/xziY
	FiuqFOyhGWNfcZkIMnaOVSfZjjfEJfxmPOSEdiIKpoknxyC7KWoG8FnmHA3F1qwGQYBvQpd6VsAFG
	+6hD1q7pmsKxybQKZBhixaSekANLeQ08c1uV6S19hLWVe+L0mutOuoYJpzndyMXG1uCIx/xtZuzJJ
	nyFQCeSOmej6dRVq1Lp4ZXAYKwzOuOfA3jb/s0WEKfCd0KE6b44TAHp9HRdl48TdLVFU5AAslyy+V
	IawsD6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVjV-00000005Xv5-3WRa;
	Thu, 14 May 2026 13:04:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVjU-00000005Xul-1zwN;
	Thu, 14 May 2026 13:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C529B60008;
	Thu, 14 May 2026 13:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6180C2BCB3;
	Thu, 14 May 2026 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763847;
	bh=OdGG5xXy9ZZA5TnSlthBNAmvAAymtWcgYy8s949UAxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIirzK/KhZ4BYItDppKnSzFxSZAhqdCboG4hNbblFVl+JsTC2NBysOOa8vboKgv1u
	 k0PUFjbDH36xwEjcRiNYfNuv0TRR/rekwbUgt2cylkgQmc98SrS3hUV7FjWXAPuSca
	 UUp2Uvts2+wZR8EOYKrbZjFjSj4hS38HqnohnlM6GF5R762Cj4pgxBJTqHjlNzvdLD
	 iaRfq2vPngcDLECGbYICWUnKashX99DhX+xka8e2D53Jo1C3TvXel4a4xuguOwCMs/
	 R0fTbNmJpk75qVhDppO9txBp1T+3z2NqTw6fobXk+obVDOawExCODnE8rrjQhVHql/
	 CDdd/rD9XPIEA==
Date: Thu, 14 May 2026 15:04:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 15/16] MAINTAINERS: add MediaTek mt6323 PMIC EFUSE
 driver maintainer
Message-ID: <20260514-spiritual-grouse-of-abracadabra-d91bc9@quoll>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-15-3efcba579e88@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-mt6323-v2-15-3efcba579e88@protonmail.com>
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

On Tue, May 12, 2026 at 08:18:29AM +0300, Roman Vivchar wrote:
> Add myself as MediaTek mt6323 EFUSE driver maintainer.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 52249c301633..bf2e066f377d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16342,6 +16342,11 @@ M:	Roman Vivchar <rva333@protonmail.com>
>  S:	Odd Fixes
>  F:	drivers/iio/adc/mt6323-auxadc.c
>  
> +MEDIATEK PMIC EFUSE DRIVER
> +M:	Roman Vivchar <rva333@protonmail.com>
> +S:	Odd Fixes
> +F:	drivers/nvmem/mt6323-efuse.c

I don't understand why this cannot be one maintainer entry.
Really, these are just single drivers.

> +
>  MEDIATEK PMIC LED DRIVER
>  M:	Sen Chu <sen.chu@mediatek.com>
>  M:	Sean Wang <sean.wang@mediatek.com>
> 
> -- 
> 2.54.0
> 

