Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoLwGMzHvGtvHQkKs3MK+0usf6//d20QV6oW4kAgwHE=; b=uwj46wJiVKEPtX
	Qpp4JU1m1HUdagc4xBzQuvX5aAMCwbn6J645fqQlkXS6dD+xLArKPzC2sPeENH5MD4LDuCFGNonvG
	ZYi9CaHQ/UJXzaP8wU9XSib4oU/fFzdtEtU042Ep1ya9mjKns32B/o/Vrc9Vejx+ZIqIBabQRsCR/
	PFcn4jHhcKmt1YkvzxgWpDBl2bXlQU65vcFVS0Dqvz2/tyH5ovILYzr+MaAd8YB+m0xhIP/kjjF3/
	HYAwEhrottL97jt6CHAEyVEGrpIWtUVKO2Sfk8s4ZQc6RTNkaDebOAytwrx1zOfkr9y3ba9LpSoF1
	7HQQnAbNMFR5uUF+9LsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njmjo-0038KL-V6; Wed, 27 Apr 2022 18:50:08 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njmjT-0038Aq-N0; Wed, 27 Apr 2022 18:49:49 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 d16-20020a056830139000b00605e13c23c9so1080781otq.6; 
 Wed, 27 Apr 2022 11:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XkFp4bPCvGPvoxtWs0T4GHuydk1I/JnKWam2KB2EgH0=;
 b=WgrwufYHuLxrtMf6nIjH7NphyXX7MSj4UGm+IWoAhAdEzVIfAlBjOmXEWqCmq71h9Z
 7f0Sm1R7WgCVKoU0WfEckRdY9YcbqaJcpl4fFjU/xsMj1bJlRDWVHfGAXvRGgKuUG0za
 Qt49ic1A2a4um3De7JdN5uyrwts9uuvCk4LIkkhWlB299m+dSy+R3eoo3X1dOzple11h
 hm+2GYHKjnmINn19iPBNz4rHBAn99gxQavlMsedTGHAP0X97DvB9AUeMN2VPTmMHPrQG
 mUPZsxlB0rcnwV/6+2tyFpsHbxqFvyy/rkUVe7CzKZlDJd5YRVSdhj9h2oE63ReQnmYh
 17mg==
X-Gm-Message-State: AOAM532ONdniAvApR6H3tHa3Yhewu1VZH5J2NNikbmEHKulDw2zV9Rne
 Vj1lpkNa+Ab3Uzw1yWq2+g==
X-Google-Smtp-Source: ABdhPJwzbS6guqppl23lSNHSgJWx3eX7jtWwvge8UqnbMtpDtrYOg0GP/AahJ5xlCu0LogWKhvRbow==
X-Received: by 2002:a9d:6759:0:b0:605:4d93:c44f with SMTP id
 w25-20020a9d6759000000b006054d93c44fmr10488106otm.373.1651085385939; 
 Wed, 27 Apr 2022 11:49:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c17-20020a9d6851000000b0060551d14386sm6148712oto.13.2022.04.27.11.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 11:49:45 -0700 (PDT)
Received: (nullmailer pid 444224 invoked by uid 1000);
 Wed, 27 Apr 2022 18:49:44 -0000
Date: Wed, 27 Apr 2022 13:49:44 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: lee.jones@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, cy_huang@richtek.com
Subject: Re: [PATCH 1/2] dt-bindings: leds: Fix binding document for the
 Mediatek MT6360 LED
Message-ID: <YmmQSHKPAk2Bt1cE@robh.at.kernel.org>
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
 <20220427080330.40136-2-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427080330.40136-2-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_114947_802596_06B21F1D 
X-CRM114-Status: UNSURE (   9.27  )
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

On Wed, Apr 27, 2022 at 04:03:29PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix binding document for the Mediatek MT6360 LED
> 
> Link: https://lore.kernel.org/lkml/YmHK02g1pC19Oyh6@robh.at.kernel.org/
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 --
>  1 file changed, 2 deletions(-)

I already sent and applied the same patch[1].

Rob

[1] https://lore.kernel.org/lkml/20220426133508.1849580-1-robh@kernel.org/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
