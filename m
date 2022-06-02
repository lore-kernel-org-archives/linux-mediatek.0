Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A083C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoD8TGM3umog/ywTqCAF81LKq72jRY/9tSdzbdUaInc=; b=fb5nR7HJyHKbBE
	6H3IsYXvBxL45cJGDjGwihMDvUVPZ3zZwBVrqnoYSBYjHfHcoRwID/TWZxHiukgoCieNuIhdI4pdo
	Wu+xLrvAFScQHzR3likak8tuIYJHPaEAgwip9eWrCiTdWlIDek8fAP61CLZSuQAuq4tdyMjzVCUd7
	Sr/Y41y4ftUy7L9mEm2cbLRkLEiMg+my+V5xiM4MRVQY3ab+XSBQxlW4LUX0a7dQyUMmK1sFpZDpf
	HsDVE39MvSHUsvNJgLKWAskXZS+UNeHPSiQL0a87sUIqz4Ac2R46aS6uB7IxUJhgtDR7FbNeoZmh5
	IAZ4rz2ZO2tIVKu/W3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkWb-003K3X-Ak; Thu, 02 Jun 2022 13:06:05 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkWN-003JvX-9J; Thu, 02 Jun 2022 13:05:52 +0000
Received: by mail-oi1-f182.google.com with SMTP id u79so1033185oie.5;
        Thu, 02 Jun 2022 06:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LNaq7sEztiDWF2FCJpJbFxTE7mAwKmgj75OQYyNv2Lw=;
        b=saU2g5k92O8SDL7BKuqDHWKosZBJJ3lGoAgdZFeVMcAhzusaTbPTkdFOBPOKvsul6O
         lF5LAsE89N7M7aNaNeTfGem8fGr9nIqNDVmY4jndPAfsyE7CCp9B8TzHHq7cFCGdJbKR
         zLNvNbQeCLAAzFQ942+JenC3nNvT+mT2QD/kmhq2jIq9jivWpWgJvSfnO41aNlPQ6l1t
         gXKpV2XDDFf5TZBZo1Kco+/3hsHkpIXkrcu+E4LGPCOmZHE9uzUTe/4nRh5yoIbOcEgx
         reD01JTVA/PEmvJTzFe7aYTY+DjY23E30vU2LP3HpruO94wuGi8Tt0x7IHOIromOFhpR
         ktYQ==
X-Gm-Message-State: AOAM531ydG3AvOVdB6iNpSktVxXkPTDDG67rCmNGTIAmI5qJaI4KNSa+
	hMZRysU9OY9Yf0xupLGMqw==
X-Google-Smtp-Source: ABdhPJxs1Y0i7VKbCMntycxl5hizJm7Nq2kWqQ8bHM1Bplx9d/kQA7s8uN6OuQaO4Y0+hxy1mvQMNQ==
X-Received: by 2002:aca:2408:0:b0:32b:ef3:67c5 with SMTP id n8-20020aca2408000000b0032b0ef367c5mr2539773oic.189.1654175146719;
        Thu, 02 Jun 2022 06:05:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r2-20020a05683002e200b0060603221247sm2159020ote.23.2022.06.02.06.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:05:46 -0700 (PDT)
Received: (nullmailer pid 2108487 invoked by uid 1000);
	Thu, 02 Jun 2022 13:05:45 -0000
Date: Thu, 2 Jun 2022 08:05:45 -0500
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Cc: mturquette@baylibre.com, ikjn@chromium.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, weiyi.lu@mediatek.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, miles.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, robh+dt@kernel.org, allen-kh.cheng@mediatek.com, angelogioacchino.delregno@collabora.com, sboyd@kernel.org, chun-jie.chen@mediatek.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding
 of MT8192 clock
Message-ID: <20220602130545.GA2108433-robh@kernel.org>
References: <20220523102339.21927-1-matthias.bgg@kernel.org>
 <20220523102339.21927-2-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523102339.21927-2-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_060551_391180_74B0453F 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, 23 May 2022 12:23:38 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The code controlling msdc clock gate was moved inthe the consumer, the MMC
> driver. This node did never represent a working implementation of any
> peripheral. It was just a lonely clock gate that wasn't used. Delete the
> binding description of this node.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> 
> ---
> 
> Changes in v3:
> - Update commit message to explain better why we do ABI breakage here
> 
> Changes in v2:
> - Delete compatible in binding descprition as well
> - Add RvB tags
> 
>  .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml      | 8 --------
>  1 file changed, 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
