Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1CCC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:21:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E107E64E24
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E107E64E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a4+G8nDLrtJIpBMQYbQRnBik3u8eG356IyKd61rab8g=; b=LU7CYouMUaT3JrOtgREq4pgiH
	iPIwRkO0iQFX6R70JBB+gk58sDI20IVpbBv/O4eSUzO8v+Y+oe6c4VVJSyfCJ+YtCVI0UwPS0hJz8
	MYHri7VDHKLCO82Se04tEXEI2ybg8rmy1KbgaLCYTo92gTwfTwODOkoKGPpiYohzzG3JXQ5wSgZqt
	myo3FF//rVi9zcTG93/o/Lt/sNfdE0KjZM7vAH3HIGflzUaMmSJK9thmihAkkYK1+1seONVL1EWFo
	BTs//P9ZURvm0BxpI3flCr54rupjVERofrG7WhZiE+NCmzsW5II+ChaPoVGvUglKvd4VxA7meeuqU
	LAlJrpTog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l69r1-00034b-3T; Sun, 31 Jan 2021 10:21:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l69qy-000342-4j; Sun, 31 Jan 2021 10:21:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id g10so13372372wrx.1;
 Sun, 31 Jan 2021 02:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g8e7+IJJry5ny+3pA/iVnQ5hZYuQzqxO8UwbPl1sF6k=;
 b=uISmYW4cB2a/3p6z1TPp4zZVg4Hr//iGb00364AQPqf8jL6GkthW002NYr0AD8MsEQ
 P1Mwxq+eHWWM/UCfbNxjeRnW+yK8Cp6KjzpT66z75F6R1qlvpohUtxTZ9AdshzZOEDXy
 I0No8V52sYyHoq2dB6BfmQ5uRIXY/gQz7Ud/artaNt7ei4RX4c8xdBO8fBzyuUMN5UfE
 LLKeWiBNXovr8T9nSr6P89yC1hs3QM8AoFGu3OhHo7U1QAyJMGV6Vkma3Lz8SLpiqVbx
 fSu7rQm4I06VVMx+WgaFkol/BZT1EuZ4VwAc4FmZJVe2u2MsexmzLqm57P+4rm0A/W6M
 c5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g8e7+IJJry5ny+3pA/iVnQ5hZYuQzqxO8UwbPl1sF6k=;
 b=IZVYN1wPi5ChRlTNgml9gcasHDKZqdwAtErAR+XsBZiXnzZsk7HPEQQOA0jzO7TIdl
 NuvtcOG5fpcPelVpLHb0yvt56C9p3NCvS/pbqaZS8APqd2MpVtPA6Kb148ugr6dnn+1W
 /v37xWU61SzIBxXiby/4MzgkJZDmu0OxupGXzffSW2iNlKfSE0T55QLjTWysTsUk61gL
 5IqIZEA/52UricYjI3KUNuGj4gyU2xRMLT22kAkQmRlnxOASI0iw1q9XPiiC6N5VErCE
 4edy0gJbPG0WyAl2u8zFMDZFcVvcoSIW+DGLdJbrgJ48FxQtBH614RZ46kr+Hb4YJv4V
 0L5Q==
X-Gm-Message-State: AOAM532/HakYqNUA0jPVgVr8KT/2cavxGt44dCnxglh7WtpXR5zOd+lo
 5IsiKgcnQVCbXP2p3kNKB3Dy4s2PeY+H2A==
X-Google-Smtp-Source: ABdhPJw8AazA4dxzRWLp2hwNT9TVd86eAppyF8eO5n7HsRtja3vraobaj5/cUyeO5FbqGWkUCNktsg==
X-Received: by 2002:a5d:4f84:: with SMTP id d4mr12839163wru.374.1612088468880; 
 Sun, 31 Jan 2021 02:21:08 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id h14sm5128844wmq.39.2021.01.31.02.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 02:21:08 -0800 (PST)
Subject: Re: [PATCH v3 1/2] dt-bindings: power: Add MT8167 power domains
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20201209133238.384030-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7f6159e1-7bcb-45f4-9764-10d2cd6b4910@gmail.com>
Date: Sun, 31 Jan 2021 11:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201209133238.384030-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_052112_234338_177B12A8 
X-CRM114-Status: GOOD (  20.39  )
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
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/12/2020 14:32, Fabien Parent wrote:
> Add power domains dt-bindings for MT8167.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

Both patches applied to v5.11-next/soc

Thanks!

> ---
> This patch was made on top of https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.10-next/soc
> 
> v3:
> 	* Remove MT8167_POWER_DOMAIN_DISP since it was an alias for MT8167_POWER_DOMAIN_MM
> v2:
> 	* Implement on top of new SCPSYS PM domains driver
> 
>  .../power/mediatek,power-controller.yaml        |  2 ++
>  include/dt-bindings/power/mt8167-power.h        | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8167-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index fd12bafe3548..ad6db377f943 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -23,6 +23,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - mediatek,mt8167-power-controller
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
>        - mediatek,mt8192-power-controller
> @@ -59,6 +60,7 @@ patternProperties:
>        reg:
>          description: |
>            Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
>                "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> diff --git a/include/dt-bindings/power/mt8167-power.h b/include/dt-bindings/power/mt8167-power.h
> new file mode 100644
> index 000000000000..c8ec9983a4bc
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8167-power.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8167_POWER_H
> +#define _DT_BINDINGS_POWER_MT8167_POWER_H
> +
> +#define MT8167_POWER_DOMAIN_MM		0
> +#define MT8167_POWER_DOMAIN_VDEC	1
> +#define MT8167_POWER_DOMAIN_ISP		2
> +#define MT8167_POWER_DOMAIN_CONN	3
> +#define MT8167_POWER_DOMAIN_MFG_ASYNC	4
> +#define MT8167_POWER_DOMAIN_MFG_2D	5
> +#define MT8167_POWER_DOMAIN_MFG		6
> +
> +#endif /* _DT_BINDINGS_POWER_MT8167_POWER_H */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
