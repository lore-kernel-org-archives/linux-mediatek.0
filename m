Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03846C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiHvebRQ8izw3xHUBaApA8sZABOqhO5201jaVL8EbC4=; b=vw8j6MWB59NZigXGI05pJD4khw
	GB9QxyGUZJ26dKv7/eF7otgEMPN+FA2a4I51zzA99oHUYaQQEcC5szMXgBxor9ch4FMeT9nsoviRF
	I+HSolcKYdJwaTVVqTCP6J9UqxslJL+x51SGght9rq9hp1PQ3XNDKRVnqMEZMDupi1iVWodoaNZ9Q
	jkIizIrZcz+A+CxPS+SYqWdkBj5sZUj7jPe1a9hEQbZFTMGU+X6mO7ogR/tuWk7YrXR728D2VBQNm
	kZxFqFqeo3M6CYgSq3DwphThSc+0Wl9Bvw0zKlgMlKxkXnlPWG8P5AghXVCMNJq9XzoHZREH02JXn
	3ppw8zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmdx-008tvi-Ga; Fri, 07 Oct 2022 12:39:57 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmdu-008tok-SZ; Fri, 07 Oct 2022 12:39:56 +0000
Received: by mail-io1-f45.google.com with SMTP id i134so3496099ioa.8;
        Fri, 07 Oct 2022 05:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiHvebRQ8izw3xHUBaApA8sZABOqhO5201jaVL8EbC4=;
        b=7jT9itgjAl7JajWlrud3gRCel74j/ezy9CiC3MSNGzkDDqm8ce3q+mKYOboPWZrYYF
         5pbPWdaaTOpLh5e70vyfzUsrbO1NZIwegpFl9J/PYXiokL5zwz5IdYDzSTNFGUVWeCh0
         77yCJfWwI6yxT+6yd34myT+7z0fSqfjC68FnrM4Vecok3ScCAe6fcAGVzdTTblBVutuD
         h9zfoXuZ20+dQSznOygnloZwZE2Fd3YFJdeVBLaFwQRFzpZNoRwfHgw5WS7U1Tk0cLQk
         Hzr6fvD84+AaxNjAmyDeHnh9+YFDEPSnq5NTM3CAybsI/t3FQuU/e2JQOYCjufH3c5cS
         qz7A==
X-Gm-Message-State: ACrzQf3hBNQ3Ki62fxpzbA/Byd8Ztz12JoflzgH6ki1So2UpwM32d07P
	20FPFDg+nONlu9dUyPzY1A==
X-Google-Smtp-Source: AMsMyM7V4GSAphi5v5xSoxERaOtipv6nPn7H4JgbZqoQqJGSLh/AiFmmMT/+ytBZCxwFLhO6OyuvoA==
X-Received: by 2002:a05:6638:1655:b0:35a:6ee2:402d with SMTP id a21-20020a056638165500b0035a6ee2402dmr2446416jat.138.1665146390434;
        Fri, 07 Oct 2022 05:39:50 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
        by smtp.gmail.com with ESMTPSA id y7-20020a92c747000000b002f8d114ca84sm890521ilp.17.2022.10.07.05.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:39:49 -0700 (PDT)
Received: (nullmailer pid 22073 invoked by uid 1000);
	Fri, 07 Oct 2022 12:39:47 -0000
Date: Fri, 7 Oct 2022 07:39:47 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, nfraprado@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, angelogioacchino.delregno@collabora.com, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: watchdog: mediatek: Convert mtk-wdt
 to json-schema
Message-ID: <166514637708.21847.15986899611169493380.robh@kernel.org>
References: <20221007093437.12228-1-allen-kh.cheng@mediatek.com>
 <20221007093437.12228-6-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007093437.12228-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_053954_935908_7A1BFF1F 
X-CRM114-Status: GOOD (  13.19  )
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

On Fri, 07 Oct 2022 17:34:34 +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Convert the MediaTek watchdog bindings to schema.
> 
> The original binding only had 4 without a fallback but there is a reset
> controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt" and
> "mediatek,mt8195-wdt". Since there is no reset controller for the mt6589,
> we remove "mediatek,mt6589-wdt" as a fallback.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 77 +++++++++++++++++++
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
>  2 files changed, 77 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

