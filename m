Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C0C43334
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ziTOQtETWQd/64ES4X9ZAnJqgfisp3D2aIh62VQMxA=; b=sfIS9JzrNbA6vt
	SwMLvOSdO3bqCH2nJjqQdoh9ogjHiZX1II1JXt6KR9pIZ6ffWBoBANh4tSPM4wROS6nGPoOuR70nm
	WChRGUVc5OxtebvprAVrTxOPChalYH3sORpqedRFfJm7YoiMterV1ECxo3Mgi+n9eKkY6bp2ZFEB9
	dWd4/w8VdR96eUVXhca8CaVWfnzbjZOIIgaAgPiv8Q0oUw+7bHUXYF7XDShA43/OwVgRo6ObcxpF/
	wHgWC1Bapy2aU4Vxu2dBxRbpHw0sLsZABefAVIwiydZztODbYlXEvJP3mIxHBi2XgNojeMH0fmK3M
	2D15lPiZx4m3oA/shuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxpP-00FQEC-Jy; Sun, 05 Jun 2022 21:30:31 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxpD-00FQ7o-4P; Sun, 05 Jun 2022 21:30:20 +0000
Received: by mail-qv1-f41.google.com with SMTP id a9so9192746qvt.6;
        Sun, 05 Jun 2022 14:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uZI+EnU87dcWUfUFFhpN+OYPeQIExzhHGOWXPK3MC0A=;
        b=m4604oboZLSnJrvIgpsNVDJIuF51LZrintfQN3vhOLjsTKjDvK4T8Jt2yF9FqFvE5y
         nN17KdlaIF0RMPRxPgot5uCwl7eqsue6tuybG0k2jiTaapEPdajOgZGcJYv3vbu3LTBl
         2qNj4coXfjj3o1Jt7/Ha10Jo5mZ3sY4/YVjm1TjYJVGnTDOD3IKvIfKj285Wn0Ylkysl
         /h5vj/sRjCMjytQzrxzGO3P3Oq9gJ9AtLTxu8n4U3Ik3A6+geDzzL7TQ1luNDhtr9FAa
         1n97sfJ6yusEpXbklQ30J9DYsx4p/Xuj39YR3d+hleKpApDra8s4m6PH9hvZBP9YSh2Q
         V/3w==
X-Gm-Message-State: AOAM530aW6uatHjQ8D071OW39ttGOAZYQPPt9op7oNqt6RLn3WjgNfH1
	vom/NCtxpE0ps2ZXQOBwRQ==
X-Google-Smtp-Source: ABdhPJzBJkTjBX310kI+NxQF4vE8d9T0cn/1gPz4GQRd5Xd3gOwsRRPc85ot5wnlFJQqVP5chJMUBQ==
X-Received: by 2002:a05:6214:d48:b0:464:7c9a:4f39 with SMTP id 8-20020a0562140d4800b004647c9a4f39mr18104795qvr.124.1654464617714;
        Sun, 05 Jun 2022 14:30:17 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id o21-20020a05620a15d500b0069fc13ce216sm9650760qkm.71.2022.06.05.14.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:30:17 -0700 (PDT)
Received: (nullmailer pid 3552526 invoked by uid 1000);
	Sun, 05 Jun 2022 21:30:14 -0000
Date: Sun, 5 Jun 2022 16:30:14 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: mfd: mt6397: add binding for MT6357
Message-ID: <20220605213014.GA3552446-robh@kernel.org>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531124959.202787-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_143019_213343_5976C0FB 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On Tue, 31 May 2022 14:49:53 +0200, Fabien Parent wrote:
> Add binding documentation for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
