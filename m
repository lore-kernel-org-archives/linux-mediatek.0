Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8FDC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0D460F25
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D0D460F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BIeYNmfoBxj1l9a9eW3xjcDwpkyS0Acy2QKptCoO0L4=; b=JPKdXXsnYONVzSWtalkf082NmI
	Nxulpcux2Wm2DMbnc3/KaLgNzYaX/Omn/q+1dWjM01zdYTRPdu++pARIKxoYm0ZUBHzAZj5YBMM8M
	igmXrjVHfd45yFkhy6RRIN6ge9brx/BWMRcIXyiCJhvAMF0jtfZ31JqU9MHH7y541NxzDyuNwi1o+
	GvyRHxlm8heOlfhWTff7wF4vyKbZmUVlsLrMrfeZTy8t33W4z04lIo4j0wEiMSr3AOH47SlwjrkLL
	IUeeI3YtJNyzmsqQafEpQNbzUJhjmK8tCRgBHN+Hx7ABXKyZNIpv0YVI+yWTsdvKWn39OUjJHyifS
	Nt/wBOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBJ9Q-006dQl-QQ; Wed, 04 Aug 2021 15:49:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBJ9O-006dPx-Jw; Wed, 04 Aug 2021 15:49:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id m12so2751314wru.12;
 Wed, 04 Aug 2021 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2dt+JCnDhzMuvuUcJendmagePQt2OmpjWjxGl2h2eSw=;
 b=c+4bics3U0UyT9sOlYaoXB+Pv3we0STUZJ96Sao884tADmnBNmKO9LVGYn8MvoQa04
 w3Af502+mK5R9QgrJbTZmFhBVrmlv7GITRIxJ/xzzblwCuni+XHcgAiQ3jGS4F0rhFSQ
 SQh4pgib2aqu2ffw3UJ1iTpJT51FXzFwvUFC59vmBg2aG25kSwJa7y0yz0NSkqyp8t8m
 dVoKBkS4IC8zBFlg+dDITrkS4tkk8ALo+5ve/nuWBBkjlaFGXAfp5kcCfUwGOYYLOjN6
 28ZoVYpWWf6i1ptdJFug79mufViICWN/2d0MlkTu6ZWf4H860KxaYgoc0BGzS1+VoH9m
 KaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2dt+JCnDhzMuvuUcJendmagePQt2OmpjWjxGl2h2eSw=;
 b=n+39vgvI7zIwiOCKJZwVLnzg39DCOgdXEUOQSG8V2YKOExuxmDZUNoLqnosqsjAF5j
 Lb1f7lBoPlnq61D178NeJjwuoPpZFTEEJfk/kvJ6YowlD6s0EpyPnZs+wWLYniJE1N7n
 dVCKhBEuM828wiVykBg2psA+jpFzHRmKVCZcYvKCNFYenAxSqoDmSUGwVGi9FpqRNiSh
 ovJUfWAuDcoXDnPwJPp6oKiyWfbCPOBeGLnrkGDFK8a0msfmH6PBAXVb5xejQMK0m+ru
 Ij/T9iIwckBoTpXwRlDmGwEimgL1Tz36gXKKt2I/XHwuKxcVXHQlzpszpXqsXjWDgD1c
 GrNA==
X-Gm-Message-State: AOAM532oPfeYm7fR2B0ufAYHMdqhpSVfSSgEkcj3LV1EpveKLWC80weM
 VqrVuDiN6Z//e7AcMJUhiN8=
X-Google-Smtp-Source: ABdhPJz2JH+ovTO5JfiQX9w31dumlvMTh5VUOzWQL1sCXN8YrmLj1q6dGX5Kfvt7/GyAAOB4oBrZMA==
X-Received: by 2002:a05:6000:18cc:: with SMTP id
 w12mr54693wrq.96.1628092184912; 
 Wed, 04 Aug 2021 08:49:44 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id c15sm3117662wrw.93.2021.08.04.08.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:49:44 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210726102442.2119877-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7feeeae7-2d79-cd3f-18f2-ef0adfe3adeb@gmail.com>
Date: Wed, 4 Aug 2021 17:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726102442.2119877-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_084946_710086_8079C6F2 
X-CRM114-Status: GOOD (  17.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 26/07/2021 12:24, Hsin-Yi Wang wrote:
> Use aliases to mmc nodes so the partition name for eMMC and SD card will
> be consistent across boots.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

applied to v5.14-next/dts64

Thanks

> ---
> v1->v2: skip unused mmc2.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 21452c51a20a8..d5a2cad39c9c7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -10,6 +10,12 @@
>  #include "mt8173.dtsi"
>  
>  / {
> +	aliases {
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		mmc2 = &mmc3;
> +	};
> +
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0 0x40000000 0 0x80000000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
