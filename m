Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0B4C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 11:25:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C8564E29
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 11:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C8564E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oc13RiFzhhk3Gcdt9VxW0qjtsPo1rz7+hKwmVWzGDWE=; b=QI8d+mpHltfRjmul90oeVHFOd
	VnbtcSTewjabAzQtY3e9v4ggY0Aq7h7BYhfABBWvvf1ICo2sdJ4+OnfpozhzVmck52fwlEW3rKH6D
	l6CnIeLh+qTS2u2+IHNY38nB4IamuF9hTZKKekt2jaAcb0NjhT3+R/QtnJvIH/jgebLvBSyMwFmKR
	p56+89oYEE++mavZb5/SmX3fFLS8uDf47IayF6ollFJ5FHEddWVNdu2RR4c2SRfDkevB3cUSQm8jF
	wrtKS8PO8fhPflENjBTZYN4N0l0lp2CbB9ss79PnjEpaXmgnx4xT4DW7ZpfJs0bE+neylqu3OmQQJ
	2gLhgXxAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6AqZ-0008Gg-3t; Sun, 31 Jan 2021 11:24:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6AqW-0008GG-Fl; Sun, 31 Jan 2021 11:24:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id g10so13468832wrx.1;
 Sun, 31 Jan 2021 03:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sPEAzuPd0U46yDR7p0D1tm0palbouXVPREQNLM1oWFw=;
 b=U9hjySODiFdjzCwIcgif1abuJjI54ZesRA0AcXHLKWoXhA/j4Hq6JV5Hu77Fr9fcbp
 Q8bLTSV2nFjzeaGVfHcnSxSHhf7mPCNWtJt7DgArqPi8pkyv6rsCGaXHix+YVe47e9ZY
 GYTAIY9bsWhcobBgIiUzNJRtK6oP0JI3Dazabb1R5z5WL9YiRfnPTXQKm7jeeyAKGOJ1
 48dWBH/liP3uhstF9zLTq35c1YY0F6phwD4hPiy13WkxW4J3DEkle+0OBLUucjUAegga
 M8JVpYHkVObwGlBD847Od8EKHbE3EI9ATSOPTz0eS4mXwE1EkamLshBh3yMtVjz1jl7+
 Phiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sPEAzuPd0U46yDR7p0D1tm0palbouXVPREQNLM1oWFw=;
 b=TJjWKBMUqu6uCS2UiJsCtRwVz6ctrkbGUqJJAglItR7StiToJWZt+SDxnegKOnGXGq
 j40MXyae3CEbnmNdu2I+usC/0753GR81Zk93ofCEJm2dQZwvXUw1gQoCvHx0MuT9BBJE
 RKISgM5Au8IdxHD4uxbKtaAxcpKM3SJcWCUN/xwBR2PoItrRUKOOQUOGGLveeEsWpM9D
 //3yLz/eyiH6GJUsPDbAxIYvZTudMCSzVmmfZ+FaDKyEY+fzk62S352UfIiLiI2wgJnI
 J2OCMqHRygaHrkyNDudljEocbJ70NJ5Zwo2hx63TgPgutxxdI5FsZPkl+kdLrwXFdGvq
 i5Tw==
X-Gm-Message-State: AOAM531/jsaYDSTFLCb5qoyU2CReJheeVoE30PxlELzwt7MhzMtjmcFt
 0BUcfbHsjVXeC8S8L6FTT3E=
X-Google-Smtp-Source: ABdhPJywD2RlNEGfn4nrsntu2FQvdDtyTnJsz+DOFfYuZswbHI1mWY5nPPrV9RQ0NRrTF7D3sOjkRA==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr13262458wrh.326.1612092286997; 
 Sun, 31 Jan 2021 03:24:46 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id m8sm22899025wrv.37.2021.01.31.03.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 03:24:46 -0800 (PST)
Subject: Re: [PATCH v2] arm64: dts: mt8192: add nor_flash device node
To: Bayi Cheng <bayi.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>
References: <1608697379-22025-1-git-send-email-bayi.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9d395f32-ffbe-85a5-a424-4778e8d8bc1f@gmail.com>
Date: Sun, 31 Jan 2021 12:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1608697379-22025-1-git-send-email-bayi.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_062448_583100_AD4C7015 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/12/2020 05:22, Bayi Cheng wrote:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> add nor_flash device node
> 
> Change-Id: I79f0228529bd8a33e5f354b7a861a4ec8d92e9ba

Applied to v5.11-next/dts64
I dropped the Change-Id. In the future please make sure to not include this tag
in upstream submissions.

Thanks!

> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
> ---
> Change in v2:
> 1: add dependent patch of arm soc
> 2: change compatible name
> 
> Depends on:
> https://patchwork.kernel.org/patch/11713559/
> [v4,1/3] arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index e12e024..751c877 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -379,6 +379,19 @@
>  			status = "disabled";
>  		};
>  
> +		nor_flash: spi@11234000 {
> +			compatible = "mediatek,mt8192-nor";
> +			reg = <0 0x11234000 0 0xe0>;
> +			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "spi", "sf", "axi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disable";
> +		};
> +
>  		i2c3: i2c3@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
