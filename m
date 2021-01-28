Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E849C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 16:32:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2395264E07
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 16:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2395264E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gf7Meh/6COAeEUzq2X7QeZ7vqef3teg9v6rRtkD/CJw=; b=nMgbQd82Ggp2JEDJsBJbyZxBX
	cSIowCWnEwMLj9Yd48o+GQT3oHbB7ep0xvQhHtwFKo5wg+ZMXrCTbAdfak4nb+WPz3RkShzRtfpli
	WFJjWhIegBR3Vu+glBsseHBjhNr/qr8ZMDngha4pGYuUWAqSmud+fonEXRILbSHeno+7ZfRSyYSmZ
	U/AHsBHtCvWCB7QAeU9d9XuIiTqCQwtveDdE6/PlYm9JwFV6znBQc4eilnWraLi+UqRpOx6FLy7oR
	RnR8C3CmCPYChds2yZIC4pqPxii9299qyoX/IYaCAuKwgjuTwcKZQ0bYMK2a4FoqvPCFkAIAcHttP
	f9iqtHXOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5AD7-0005cw-7J; Thu, 28 Jan 2021 16:31:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5AD5-0005cH-8u; Thu, 28 Jan 2021 16:31:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id s7so3046985wru.5;
 Thu, 28 Jan 2021 08:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aB7zuQWcrPzPmAQrvOloCgHrIKsDNj/0Gfzl4leTLYE=;
 b=e5uIsa58hkgWWmUhwaKnmmHmMUqxBkDVk7uZLLwbgjSz2lN4sTUnVWwF1moV9j/Zfm
 9SoMLVIaxYNZCG9mfg/6Frbu3C2JGaXQqMN6L+v+3zyCD+pk6JpVlVSYBhu5O4Xe9OUa
 0ieB3VbXfC/pLsnVtkmY26Vq5jDJkM3FNHnQN9Lz0ywTWglPxoQPT2+TKvizMPwOmUAT
 f0ouhlrpI7UphqCMOrtQTF3xmHtt4oqHX/eBzNg59KoIpx/PI1k1TPNVlnBNpYFCb2jb
 hppBiESlyfW1zUk11ucEBIlEnNnprnXvBmPYkuSsedCk07W0f4bXH25nu+Xdf7/jplag
 bT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aB7zuQWcrPzPmAQrvOloCgHrIKsDNj/0Gfzl4leTLYE=;
 b=e6veNTMhAVxvvd/BGErPkRchLNWsSYlR829+mfVTCUGz16NHD/MrbWibysqWN+ySWU
 xFY7zsFbJxAjAsfRU0FE1XDDYA9R8L85D8/xK6Plly6UjOE9CTjim0U+fRzmKhuvlXIj
 k7Udhr5vH1ajA6Pxm0nCOgQk2EmKyzLBSpRYzhwsr+J0pmCg48X6dWYhEAC/qUC+JHig
 0uIPEyU8eVdp7HfI28NpLjoCJxMTeOTjQCo19hkRJeFoE7hXawWrSMpot1X3uXwICKgW
 u0r14+Pa8fIt3yPWffPD6R/QKVF/e4pPW5wVqUQiJ+glFaQ+/N9FChPr6yY4xRzyrUri
 dyUg==
X-Gm-Message-State: AOAM533r853q709qdxD3Kxzl1O55FYavYNrafwdF52bKd4BkNVRjmS2/
 Po9zO94TO8qaAbGVvMLOhQ9GHiX5GeM=
X-Google-Smtp-Source: ABdhPJwYip4jGo3j1j/kpGaNQKnhSrNc2zFSNPByK826616JOYqRX00Y68OHdP666t5omBXVRS5RQQ==
X-Received: by 2002:adf:e511:: with SMTP id j17mr14390620wrm.17.1611851512379; 
 Thu, 28 Jan 2021 08:31:52 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id b3sm7439842wme.32.2021.01.28.08.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 08:31:51 -0800 (PST)
Subject: Re: [PATCH v12 1/8] arm64: dts: mt8183: rename rdma fifo size
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5eec39ff-de13-a749-d8c2-f2426e9565ed@gmail.com>
Date: Thu, 28 Jan 2021 17:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128112314.1304160-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_113155_354961_61E912BD 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/01/2021 12:23, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> property name must include only lowercase and '-'
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.11-next/dts64

Thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7e..6c84ccb709af6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>  			mediatek,larb = <&larb0>;
> -			mediatek,rdma_fifo_size = <5120>;
> +			mediatek,rdma-fifo-size = <5120>;
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>  		};
>  
> @@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>  			mediatek,larb = <&larb0>;
> -			mediatek,rdma_fifo_size = <2048>;
> +			mediatek,rdma-fifo-size = <2048>;
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>  		};
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
