Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B9AC531EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Feb 2026 00:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4mPm+ZoP8DxO5yOKQMVe/JsfKSmfmW2/A8ErJD8Mio=; b=IZrWbFTE1nOAgQlZ2sxqWcAwyU
	0sKTjAGcyg4L4ryuXKgki4Cdgd7pCIQ6bEOSDLEMcANyBJS55SiYEV2lNPz3xCk6J54OvvTBcZkgz
	GiLB32gLJrzNpXVjwD7M8fU9iqWr9OwCbYNJv8rdSaO6uougHY/YhKoMcV+jb81Y6yGozMpkC5TCu
	TbWw3lrWZRI7eYDQYfNUAj++wzDSjwb8CFc5ySRplPEn/cMahyPRWTBp/TZho2iq3xreegX9LPRZb
	zHUpyv+9NKEFMcYENlgNmpoT0XrtynbLfSBr/FeXDjDFaTRaVXYpsbNJlNpGJ1mozBtutvedSsp9l
	A2CXMLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtE5B-0000000CgeZ-1g7s;
	Fri, 20 Feb 2026 00:09:21 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtE57-0000000Cgdl-25Uq
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Feb 2026 00:09:20 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so879705fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 16:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771546156; x=1772150956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4mPm+ZoP8DxO5yOKQMVe/JsfKSmfmW2/A8ErJD8Mio=;
        b=eKjICPHaImCLz2OOiqUrObRrVAG1U/2tMCOkDI3ua1PcpmwdNimYfistcFV7niRkuM
         oeTZcONzJxYZpCOWe7dZZWtVukmqZbxsh5oGp7VbDvI0ze3YXO7kwDokP/NEN6PSapHw
         cKhbeVw3XXVq8FTD9IFPALkRPW3lmQfRTN5PMZEt16Q0G1kTwtzJbvkAwxGOtLuhjWIU
         QLucVg2Nqd2MqZIipXQaxyjCasElQOzEUk1r90k10m87V+JCjNjLKsSp5IekDNjWksfa
         KTuQKJ+i2RmSXh3FO9qetruf4lPs8cXPRolh1uPb7WdvUAFpB/wsEbnBSP4Nu9pF/OBJ
         /+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771546156; x=1772150956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4mPm+ZoP8DxO5yOKQMVe/JsfKSmfmW2/A8ErJD8Mio=;
        b=Jo6oG+MvaqW+BIvBgSeeMW6bHgkIF5F51CVEQYisAgF8QfxFt+di6YlT1QmQQAKWk2
         SOVmm+2faAyxM0Gn9ZCVnJbFeogBislt61a0L6GRXM/xA/QgoHA8uz7vA8Lo4BUiI/Un
         7FFreVBUNB1SlRWz1DH9Tm6qt0bEaXjQqYEmnIDFokXvhUeoEIv9X4NT7ZrQ05C89HwV
         O6HCthtpwAredvQF8HLvnyUbFAdoYFYj/FWhrF/obxTDEQPESbtp1D5OMd3CYmk1Wvdz
         nJhaLoun4AyrSAr09BWwfIHXqXee0UfUyJOvrBUFDuX2kDAfci8vnYpG6W0w9OE/0OXW
         jlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXldKzjUDaf+GCki7T44HGS4VeJZhoYSbIRb1Uzzc6ocAOkMm4y59gIb4BVt3HeDBlsmf+DW+lDt0+fPdDy1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Qp/88qwAYGV2XgQzQdJXDUIIeCI1tNkbLgJhbISeRJoTl7SH
	Zr1qr/cNpleJC8eb1RlxWp2qqlQdV50VUfgm2OKBOutlCSeZB0WcF1uAB+BNzInsV8Q=
X-Gm-Gg: AZuq6aJB8EyDocy4YoBFPHRQztzxx+Wp9PcAQZtKQ78odDoIJ2NacNpWThft3G/bOX3
	hbfkPd9kp2UvIjjI0XGXLqWneydVhfmxgALVLcPBBqSl2Uul+y+BiB6fE8hOqJP790L0l1abvmR
	k2JjeAhUGHUFR/5PM/k5Mt6IKK6RkPqXvvUspeEkisKEgRnbbrak7IhybfFOluOei+w98lxpJcS
	W/ZdiugXSG6rw1/5tg38Mk6XwnfMOLAHCDi0kEb4oml7d/v9CjKKWpuGbDwLvawjNqb4f97cc3g
	RMcik/UzgFJ0GV5UnJ1Kjwb8aKSzp9vN1lPJM/mnsRJq9MJhRaGoxmLGPplsrvM0RM5/hL7oWaO
	hiQHOOJspy4nQ1BrZbBZJ32k2J2grqsoDfdbETZpU+1DrWE1nMkmOQ1XtxB7OjxSrOLBL5B8JJu
	qo9G1wgOkQSPZcVXH+Bp/qitilJLcNOmHq/QPjduOnhDOCu7oUNSQDUYpzm18M5oRGYbG0SrX3U
	OiA6FBd
X-Received: by 2002:a05:6871:eb01:b0:409:7c0b:6aff with SMTP id 586e51a60fabf-4152917bfc6mr3628005fac.43.1771546156112;
        Thu, 19 Feb 2026 16:09:16 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaeeab492sm25902271fac.5.2026.02.19.16.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 16:09:15 -0800 (PST)
Message-ID: <23778b52-9aa2-49fc-946b-e858b99fc3c9@baylibre.com>
Date: Thu, 19 Feb 2026 18:09:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_160917_805979_D03872C8 
X-CRM114-Status: GOOD (  18.17  )
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

On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
> Add support for MediaTek MT8189 SoC and its variants, and a device-tree
> for the basic hardware enablement of the Genio 720-EVK board, based on
> MT8391 SoC.
> 
> MT8391 SoC is a variant of MT8189 SoC with a difference for the Arm
> Cortex-A78 CPU core maximum frequency (2.6 Ghz for MT8391, 3 Ghz for
> MT8189). MT8391 hardware register maps are identical to MT8189.
> 
> The Genio 720-EVK board has following features:
>   - MT8391 SoC
>   - MT6365 PMIC

Is MT6365 PMIC ...

> diff --git a/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..744641916952111a4b389cf6adbd27c429b6eff2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> @@ -0,0 +1,555 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include "mt6359.dtsi"

... really 100% identical to MT6359 PMIC?

Asking because I'm working on this in U-Boot and would be helpful
to know that this is correct. Would probably be a good idea to mention
it in the commit message too to show this is intentional.


And I wonder if it would be a good idea to add a compatible with fallback
just to be sure.

&pmic {
	compatible = "mediatek,mt6365", "mediatek,mt6359";
};


