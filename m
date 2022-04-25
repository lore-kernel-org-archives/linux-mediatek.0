Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A469C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 11:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWBbS/XsP+uRZY6OJWgBsTNETQd5D9w93zcgBT57yXQ=; b=ZvUZJM0rqojSky
	7/s1U961FzxVsvatE47Hu1thvZ9eYaAB/bEv7Tbw6AyHa7JxztexqtchFvl+oXqAA8GOLnIR94uaz
	nHdTbnxRv6cJNlY+h8q1O5bAALSltjlzwKCefelruItTMkLc9mznayAZfo2LG1z9GrmrxUne2M809
	a03Dp7dKBDVqyhLGFVduqZ/gL6QKtVjGrk2i+Gt15l5znKzAMhKWw0IsyMxa6O4ILmkiBeSQGTzTp
	4lNCvIxN01yUJOu2lNYw2dvVjwZODs+1pgjumcWzZ603XdVo0T2UJ2p6x4JIxoZgTjfCuaUgKYzYV
	xviM34jFsEDJ2NTKUVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nixFI-009MsD-3m; Mon, 25 Apr 2022 11:51:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nixFF-009MqJ-Gu; Mon, 25 Apr 2022 11:51:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id i5so1399715wrc.13;
 Mon, 25 Apr 2022 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9EscMvNq76GeUom/FtzlsqDl8sdOCj3rZo00CWoiuwA=;
 b=F7CeinsqS7wotCIbiDe0PSdED/m/nEhij5VdSZwAPlpQo/wUAA6kvkSFvCh1Sj7DoG
 I+Y/7wtJdsRBk/txmwJv+E+Jmm+RvsNoCjLEWMfZ6zj7g4L1DW0nQMZlFOK+vH9eE3zq
 PJP4gOEJ5i2+IuFKrf6eIJZTX0yRiYqn7rfAjkQF58tv3+sA2KEIRxqACfhrn5gXjgc2
 k3zdEaAuqNa2jxuwV3XYiLwM97lJ50Y6uUEYvTs+v/RjlVbOxHs3ND35GqFby9PFQU9g
 qNUJJ7URS8t+02Dh+OAf2PxXIXKq/oNOlq+B29sD6fa37eTGVJTR9pDnIw+Cl1yXMVRd
 lbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9EscMvNq76GeUom/FtzlsqDl8sdOCj3rZo00CWoiuwA=;
 b=ZRZzvHsLika0BYsq3kKZOjxwv3Npd9h4JuQXuz7KD/P9PFBnlKQnMG+q2A4NFh54Cd
 FoC1e1Oip6XlJzgd36lyqodte4oHSHne0fbhmsBhcMrkeCHs/msRKY2MGo9QleCNjX+J
 GOfi7fBkQUtUmGzKrDvfZ0R6t59Ht9lGiBSnQ2QtJI1tN9ZrwZsRuP3XxLP493AdUJrR
 55GbtB78SLCV6dKDxVCDnlyuQSULkUSZPU5GKM2BFzxSL65b1+sryk+phSNGpjpPnpBl
 eBRZzWHNsjsrwkjKv9uoy3eMtNc8qp0VwmpwquJLJm+pmfN/dpMpPNleOJ13CV/vAQ1a
 q8MQ==
X-Gm-Message-State: AOAM533aKMtUNYgP86j/uLhRcrC2ZpUfs9HHFmjcjLOmJIEfPQc0ceVU
 48pV75utjqe4BunHWIYT40E=
X-Google-Smtp-Source: ABdhPJx5UVMEI7qk+X/GYHCw8s1oJwyJxDKu2qUGV9WU7GKqAoeY+izqW35kJFgowSEYipjDWNs+cA==
X-Received: by 2002:a5d:4a0a:0:b0:20a:c899:cb7b with SMTP id
 m10-20020a5d4a0a000000b0020ac899cb7bmr13446037wrq.618.1650887465776; 
 Mon, 25 Apr 2022 04:51:05 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e5ca446bcsm11573603wmp.5.2022.04.25.04.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 04:51:05 -0700 (PDT)
Message-ID: <20650a35-5392-43fa-8b70-902eea860d92@gmail.com>
Date: Mon, 25 Apr 2022 13:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 3/6] ARM: dts: add clock support for Airoha EN7523
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220314084409.84394-1-nbd@nbd.name>
 <20220314084409.84394-4-nbd@nbd.name>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220314084409.84394-4-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_045109_619226_4FE745A8 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/03/2022 09:44, Felix Fietkau wrote:
> This driver only registers fixed rate clocks, since the clocks are fully
> initialized by the boot loader and should not be changed later, according
> to Airoha.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Applied, thanks!

> ---
>   arch/arm/boot/dts/en7523.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
> index 36597f587f46..2e705b87b6c1 100644
> --- a/arch/arm/boot/dts/en7523.dtsi
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -3,6 +3,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/en7523-clk.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -83,6 +84,13 @@ L2_0: l2-cache0 {
>   		};
>   	};
>   
> +	scu: system-controller@1fa20000 {
> +		compatible = "airoha,en7523-scu";
> +		reg = <0x1fa20000 0x400>,
> +		      <0x1fb00000 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
>   	gic: interrupt-controller@9000000 {
>   		compatible = "arm,gic-v3";
>   		interrupt-controller;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
