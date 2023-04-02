Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9C7C7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4ZYsGAF2v6rArgOFxYS8m6zOJtKa1/HUF5Ds8WsJQA=; b=EIXUdpHgnAmqVVb2DzTnplAtpA
	DbSJ2uKja2nkL/7/yafBED0eckO1OWP3qbyYiAbCp8RKUzPjLZCxrqXH0S6oKDQfBH89gvVeFie8r
	9mRyQI6Vwu+fLLXclqyghpPvAZLHhBD+jn3NTUI3QYqJ5LdQwKdy6ygT7LIJFcxqsflTYLXQTA4QK
	xh95MrJlgiyH+PQfTHRqa15QDxqnsvZ14wlNZSkQQ04AZyrT4XB/GXhpDhJHdO+TojQvVx8Y7Ae0l
	3Nd2KRhDoErHuRbnSXDkXaIjrLqjWi9OwH9ODV9uEuTzPIVefudbTuOhDMyOhTkIcAe9eNdOpnzJx
	PZybDhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1VQ-00CvmT-0N;
	Sun, 02 Apr 2023 17:28:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1VL-00CvkE-0n;
	Sun, 02 Apr 2023 17:28:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id y14so27080640wrq.4;
        Sun, 02 Apr 2023 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680456512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4ZYsGAF2v6rArgOFxYS8m6zOJtKa1/HUF5Ds8WsJQA=;
        b=Ewg+jep6FRm0DlaKgo/IWGBJwUm5ANvLNMAHzlQ7+CvCjCyXu0bHw3Ykzs4fhc7u1N
         ret6eU+x1gBRpyxR5lvNH0tVswVaRWOHFbUy/kMTTLSwtkUGYEvzCvX5ukhvkumaedN0
         XBfOvj41gBRSZBaJgsEobkwpb8T9pilbTCQAdjzQsAJW6s8+6bRowWdlf0vUPxoqUIOs
         E6wTgQN4JqMboFdpFBPQiQBINMG5eKWnCiXT4DFOmItMOAyX8HZNfbfsfl4zUN0//kUr
         4D7E7pKgyYvJ8qsXyzOPaMfSn4WhNhKheeqpVRcBXKsO1GxxMgwsglarcmsqAsYaGJjz
         ZEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680456512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4ZYsGAF2v6rArgOFxYS8m6zOJtKa1/HUF5Ds8WsJQA=;
        b=R5hjKtWs1FceEAkQjPciEKtlNnMxMaC+8Xc1HRFrQdFXzmWHEeZtnXfI7kNRsAwu3E
         ic9/TDSKcxdUZj7KmEpYD6C7Gpndb+KwWVbEyJjaJEiLbCti7F5JuWDEU8cZmlr6RZsY
         HUxvJZqlGHZZV7oScz3Oxm4oqJqk+zHH+/OBYCI9mFg0BGW0/hN32xs1+0vDjVbxazPG
         Y7zbnGpsMbmvRXVQt9CnpwZiKHOSimIGzYhl+qYcOUHs43KJd+wIX7vp7QjxRckmkE/1
         VvlPUojnUd7cGgjbQr8tf4q6mR/CJYGT7GsCGn0WgOhehgn3BlahaXjVz6emNrqmceH/
         /xdQ==
X-Gm-Message-State: AAQBX9eJ3xoA7eXnE1r4AA8xE977uW27dD52aYmhKaLoY593Dq7Qbqz9
	ietDew5Q0S/yGNB6HXuUhQ4=
X-Google-Smtp-Source: AKy350bzUtTskD05eBCLkFuMrHjI9JJnF8Lj2hI37Eiwo8DAPrAwBTY5VygVYlSCrZo4r76FxbU/Kg==
X-Received: by 2002:a05:6000:2:b0:2cf:e3e3:5b01 with SMTP id h2-20020a056000000200b002cfe3e35b01mr22713814wrx.56.1680456512395;
        Sun, 02 Apr 2023 10:28:32 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s16-20020adfea90000000b002d21379bcabsm7644426wrm.110.2023.04.02.10.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:28:31 -0700 (PDT)
Message-ID: <aebaf1f5-1d75-4c05-f386-f90e56e48731@gmail.com>
Date: Sun, 2 Apr 2023 19:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: arm/soc: mediatek: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230322173501.3970991-1-robh@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230322173501.3970991-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_102835_286984_FFEAF2E1 
X-CRM114-Status: GOOD (  14.15  )
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



On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml   | 4 ++--
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml    | 4 ++--
>   .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml       | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt8186-clock.yaml          | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml      | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml          | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml      | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt8195-clock.yaml          | 4 ++--
>   .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml      | 4 ++--
>   .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml    | 4 ++--
>   Documentation/devicetree/bindings/soc/mediatek/devapc.yaml    | 4 ++--
>   13 files changed, 26 insertions(+), 26 deletions(-)
> 

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> index e997635e4fe4..ea98043c6ba3 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Infrastructure System Configuration Controller
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index d1410345ef18..536f5a5ebd24 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek mmsys controller
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
> index 9fbeb626ab23..d89848a8f478 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek PCIE Mirror Controller for MT7622
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> index 5c223cb063d4..efcdc4449416 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
> index 96221f51c1c3..82f64469a601 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wed-pcie.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wed-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek PCIE WED Controller for MT7986
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> index cf1002c3efa6..7cd14b163abe 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Functional Clock Controller for MT8186
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> index 661047d26e11..64c769416690 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek System Clock Controller for MT8186
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> index b57cc2e69efb..dff4c8e8fd4b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Functional Clock Controller for MT8192
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> index 27f79175c678..8d608fddf3f9 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek System Clock Controller for MT8192
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> index d62d60181147..d17164b0b13e 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Functional Clock Controller for MT8195
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> index 95b6bdf99936..066c9b3d6ac9 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek System Clock Controller for MT8195
>   
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> index ef62cbb13590..26158d0d72f3 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Peripheral Configuration Controller
>   
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index d0a4bc3b03e9..99e2caafeadf 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -2,8 +2,8 @@
>   # # Copyright 2020 MediaTek Inc.
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/soc/mediatek/devapc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/soc/mediatek/devapc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: MediaTek Device Access Permission Control driver
>   

