Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E19C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 22:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuP/BIBy04vLBcoBGVqhGTXN9mmV1eIZYFN8vss7cQg=; b=o3z6vgTOnOzJEVl5gOE3vu6TQY
	uul+NZCTzEuB0lI7w9ZDSyaBU6m9tU4yvOk0h4EmBqp+6YUn01XOF84J0Vy73U93mILjjo3K0RH/y
	aelC/fflqwJgApnd7yJMNTdS2ZKpdNQjhGTy2vsw1aXbTOblBt8Rx+lKI1cR38TOlIV4qwXZCeSdU
	vSf6l8SZqranwd4RlH/VtvXmC+zvjiar0YD+Y+C/0UYxmPz2+IcZI132rRuDTE6uxlqsQXJqkb7ya
	hizwew4QqaPWWA8HiKiLMQoSWZwSo0xNr/1fjdJ6kVWrjXB02bVj92y7sg9ECZMTwN1EfDCkoYdHF
	M8WxV2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7kDy-003bRY-0M;
	Mon, 27 Nov 2023 22:37:06 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7kDu-003bR4-2t;
	Mon, 27 Nov 2023 22:37:04 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b2e330033fso3030851b6e.3;
        Mon, 27 Nov 2023 14:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124621; x=1701729421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PuP/BIBy04vLBcoBGVqhGTXN9mmV1eIZYFN8vss7cQg=;
        b=LqfT4mWff9QRDKV8krhgSn62btMcZEa2WFSzdGqa8EtpdO0nJJE3EEWJ5VL7ubUHtF
         +L7ts3awqRfFHjHlh2IqcLvN3CwTTXvAhbp2HdWrDQ4xIasC2rBOXQ/19WMS65z3ZXFf
         Mv00AOGsHSe8CqIyoQt26A1vQN9HvKbMq6YlC1+O5EAhz9iuq4F+HVfIzPDDOE6edc16
         2IKIUIWye6KlehMR8wbR508dYbqadXEwG8NkDI7K8UwBBbmmBYD60f57NhluN17OzH13
         eT78pVsbfD3xNmITC7xi4ylgj0a2u74uTPIUBwn2klV1cKKa0P9XL/pr5dsk7jXMgYS8
         oZLw==
X-Gm-Message-State: AOJu0Yxv/vWahGBWhqEAWyP/WV2D5SPKpzxS/mviSBhhwnMzGPkamveM
	R/OvcJWnwtLwTy67hhAEbA==
X-Google-Smtp-Source: AGHT+IHnBoOuhgYs4OuZFTxhqfLVnkGsU3Xz25XMs+5zcX/cSJDESCt0UIwuoRDE3kSUCtKtw4b/eA==
X-Received: by 2002:a05:6808:6493:b0:3b8:42e2:6004 with SMTP id fh19-20020a056808649300b003b842e26004mr19430047oib.42.1701124621210;
        Mon, 27 Nov 2023 14:37:01 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e13-20020a056808148d00b003b85cc30fe8sm980458oiw.36.2023.11.27.14.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:37:00 -0800 (PST)
Received: (nullmailer pid 167239 invoked by uid 1000);
	Mon, 27 Nov 2023 22:36:59 -0000
Date: Mon, 27 Nov 2023 16:36:59 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 5/8] dt-bindings: net: add QCA807x PHY
 defines
Message-ID: <20231127223659.GA152280-robh@kernel.org>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231126015346.25208-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_143702_938317_DE7FC762 
X-CRM114-Status: GOOD (  18.05  )
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

On Sun, Nov 26, 2023 at 02:53:43AM +0100, Christian Marangi wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> Add DT bindings defined for Qualcomm QCA807x PHY series related to
> calibration and DAC settings.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/dt-bindings/net/qcom-qca807x.h | 30 ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 include/dt-bindings/net/qcom-qca807x.h

How is this used? There's nothing in the binding about it. Binding 
headers go with the binding schema that define how they are used.

> 
> diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
> new file mode 100644
> index 000000000000..e7d4d09b7dd4
> --- /dev/null
> +++ b/include/dt-bindings/net/qcom-qca807x.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Device Tree constants for the Qualcomm QCA807X PHYs
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_QCA807X_H
> +#define _DT_BINDINGS_QCOM_QCA807X_H
> +
> +/* Full amplitude, full bias current */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_BIAS		0
> +/* Amplitude follow DSP (amplitude is adjusted based on cable length), half bias current */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS		1
> +/* Full amplitude, bias current follow DSP (bias current is adjusted based on cable length) */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_DSP_BIAS		2
> +/* Both amplitude and bias current follow DSP */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_BIAS		3
> +/* Full amplitude, half bias current */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS		4
> +/* Amplitude follow DSP setting; 1/4 bias current when cable<10m,
> + * otherwise half bias current
> + */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS	5
> +/* Full amplitude; same bias current setting with “010” and “011”,
> + * but half more bias is reduced when cable <10m
> + */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS_SHORT	6
> +/* Amplitude follow DSP; same bias current setting with “110”, default value */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS_SHORT	7
> +
> +#endif
> -- 
> 2.40.1
> 

