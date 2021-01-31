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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FEEC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 11:29:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5990564E2C
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 11:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5990564E2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vhZPxlOtt9vkANXaOye/I/nyptBRG4w03DbKasQswcs=; b=n+kLaQsbmHG7lO2R2oSR2N6fl
	J6owBsbhRh3xeNZe8GHn1NFPMB5BZZqoXUWwXicnxla/C2HfRYj0MLcpenShwRDNfHoE0k+Rghcpb
	dhYpLXUF03jOGjEmgLK9vvbni2a+qY/bV5VpLsAPYPVonevBnNQOrYufnVc4PljUrZFX5N7WE2h18
	BMcKZH+Ci/2Z8FZUJ8+TVgBj4CHcs0z0C+nb030cj7vPbZFbFOHZEqrA3kO1fZx+P8G8sRgwwKzYv
	Soatv+GFu2Ju4uyYEz3yu7sQ2xu+0jvgh8mDr1Zhn7m8NAtHvnqMBD7ZWu7BHShRHtEIgQY+0X4y8
	xgNZ+GGIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6AvJ-0000Et-7p; Sun, 31 Jan 2021 11:29:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6AvH-0000EF-AM; Sun, 31 Jan 2021 11:29:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id s24so9618622wmj.0;
 Sun, 31 Jan 2021 03:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XHb9cnox9HkjfJVutQn1daYnX6lfpuc7jeu45/QEfeI=;
 b=EQeHdvxEhoyJe9zcUUy/4MUJFr7xk942ZePSW3M+m4/sZqotS29RG3HdBcEcP1JOnz
 wQ4Ya6LxkaogoTRIFPlBQ3EuyVVEuvnfD2d2pNE3LB8kuITs9n5zz4i/qbxTI47/MC3J
 O5ZwA3QvAGZzaPJ3UmgGVagq/DwjwPMQjz+whLq7tTbDcOHT2JxvrBcNmsCw1ZMXag3h
 xdvh9Nlslmy1Iu6NpKqdj8r17O1lMsb5PoeaylQ7VMLm+dXzQi8nsd7GeHoQ1zDIeqpa
 IQQ4kySEJZLafR7+bzuz6rDegIID4bF9hyEegbodxfMtUeC9SnDbMWomOmFOdiOaF40C
 Fkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XHb9cnox9HkjfJVutQn1daYnX6lfpuc7jeu45/QEfeI=;
 b=IRNRqKcU+GqFCb4oCFy6TEa8qHvLeGS4Mmh+4AAO4mC913FM3I+ZvUm1tDlNPdrUBH
 I1+ysLFVCykgmeCR3lHnDpELBF4iOgfeLAEV0eLVec1mUy+XnHO9L0lZt/nnIESd9CEq
 +Xg8kXEVXnQV5kugJAQH+nF3sM6XXALgn0fjVftEYFSmc97YoeZIsbDcqjK4p6nIGfbF
 Umj7svLEE3M8YW3V+DnjIn7orakvekcZHGBYMOldHqZsVOA7HOoetzwWD1UCT+Cs7JhP
 GEQyBc1ZL+qW4j2sanyAVCro08c8+C6jr4g3oFnacGnq0xnL4G+3Ishg/WKsIk2V9Kku
 ptUg==
X-Gm-Message-State: AOAM532lO0Hbpovm+R944HNc7f+6vrNiIz5/9SWjmbaFr9/HNJANreDM
 7YIh4kyH/30bEOflal5A8S0=
X-Google-Smtp-Source: ABdhPJxldbS+DBTdSmlDy0S9DQbm5EfFn+7dzBMcUpRAq1/jcgUEDxeOgVOPME7rz9Liocj4zeWn8g==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr10719171wmq.156.1612092582086; 
 Sun, 31 Jan 2021 03:29:42 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id z18sm22061538wro.91.2021.01.31.03.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 03:29:41 -0800 (PST)
Subject: Re: [PATCH v13 1/8] arm64: dts: mt8183: rename rdma fifo size
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <72ebe1a7-a54b-fafc-c58b-05b06d63e210@gmail.com>
Date: Sun, 31 Jan 2021 12:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129092209.2584718-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_062943_413012_5ACB422E 
X-CRM114-Status: GOOD (  17.99  )
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

Hi Hsin-Yi,

On 29/01/2021 10:22, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> property name must include only lowercase and '-'
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

I applied 1/8 and 2/8 already, so please drop them for v14.

Thanks,
Matthias

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
