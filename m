Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2815C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Hl+hU+TNeZjuxSABhEdZd1KZhSZC+nINd4XLp7+aIo=; b=uemzKgHMgGU9UOjBGuyiAYG6tC
	eL8J8NFhQkBEcv3G6K+35R7V8icDUyyI+UUYxfIC4ARfwYsyGPODjhxLX4DhqXAEhumPDsgpaCd4U
	w13WeNwaX6be5AB9KygU9ZD3BPYLI+49z8s0MwAB9xwPbRU7ELgIDW9+kN4Zbrp+F0pOgovy42tIk
	pHWP3IoXPrHoJitzahSNsOdb3RWTLpR+xXINeb+RrsXvc5AuDlticPSyFK4xbuNFsrOdQTqrJRDha
	1nYH0FLaxd4JOQ+W80/FG1tE8Q+cbuR9j7K8cMaVQtVjfZD0irK+9mTNG309aVQoppLk/FjXUW9BE
	aS4YpyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz1q-006SNB-6N; Wed, 08 Mar 2023 19:00:46 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz1n-006SLO-Id; Wed, 08 Mar 2023 19:00:44 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17711f56136so4870161fac.12;
        Wed, 08 Mar 2023 11:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hl+hU+TNeZjuxSABhEdZd1KZhSZC+nINd4XLp7+aIo=;
        b=799qPsi8l8QJ70BEvmjkT8sozZIIrD2qXiQmz6801rPULusE3yv8FF9/yMsldliplm
         hpE4rjelX+VuX/3Djsn0TQ2rTKDpD9z/65Cn3tyK0yZS9v5slA7NtiFPli8EDXQVonwH
         tQaE8ZigEbl9ZArs7ANnMi56rrNbPz0KIWAmn6jur6/IRByVW9taYrmcumYc2+XFK5Ea
         WDQ9m+f7bENqa5I0lf5gXXduoHqv+phsI0vq1ng/4DvX28NHb+7gaTyGtQSfb3yLvUw5
         7fyHs+IGjADmFiRz6kjqcSLEzKfJtH1HQBNGQinBXQA9gPE1HrvQmw0GuNWZU4YL9BB8
         s+9g==
X-Gm-Message-State: AO0yUKUhkBw2HeTDW+/+BDledo1BF4zUs+YcF0JVE7FVPVBxLmA3D/De
	irhyY5Wzs+W4flrhCJQnFg==
X-Google-Smtp-Source: AK7set+Pcb5lu+k9cusuDmhFqFSm2qqL8crxqGgPEG8SBLpmeTJq4QEP/ex4Xsfkf2GRJlK2aZikaw==
X-Received: by 2002:a05:6871:28b:b0:172:3d66:6868 with SMTP id i11-20020a056871028b00b001723d666868mr11397673oae.15.1678302040624;
        Wed, 08 Mar 2023 11:00:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f5-20020a056870d30500b001724742cfcesm6425572oag.38.2023.03.08.11.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:00:40 -0800 (PST)
Received: (nullmailer pid 3601310 invoked by uid 1000);
	Wed, 08 Mar 2023 19:00:39 -0000
Date: Wed, 8 Mar 2023 13:00:39 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com, wenst@chromium.org, krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com, steven.price@arm.com
Subject: Re: [PATCH v4 02/12] dt-bindings: gpu: mali-bifrost: Set
 power-domains maxItems to 5
Message-ID: <167830203908.3601252.4440777459062565810.robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_110043_639936_566934C5 
X-CRM114-Status: GOOD (  10.09  )
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


On Tue, 28 Feb 2023 11:26:54 +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding (and fixing) power-domain-names and MediaTek
> MT8192 bindings, allow up to five items for power-domains.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


