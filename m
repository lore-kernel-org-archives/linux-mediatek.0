Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybFS0k1CbTXXOhURrFfQtABFYZjFazqR0JMizJrhNG8=; b=tiQBbV0Xulfsus
	HV4g8wL40v9g8r7UzSsuTNGODKjVfdvTug5eA6OwmOfxAuAePUrKaHeij+u3lFzP1KJrqzXq3GODh
	G9mCHRTonklhWeu+FXM2KT+3i6QnHpLOIOKNvWblx9hEp1ygXKss/pkJ5+3kq3Ws/rdng3KW8UwG4
	/mQXdEZtxIu+u5F4qNnq6QtEIVU5KdP5cI5I8h4YQ3g80yMQgL0DhcJZf6E2s1+e0L4B6smRp4mW1
	IvTK9ZZ6WtxQV0BGhoRXwxRl9/gB96ZbqTCPkdflxDdi/buvXblSJpdA+C2HFV/vrlqZCALCUoo4T
	md2o0Fg9xrOk4v0djHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsAxx-00EjQF-4C; Fri, 20 May 2022 22:19:25 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsAxl-00EjN5-TL; Fri, 20 May 2022 22:19:15 +0000
Received: by mail-oi1-f180.google.com with SMTP id t144so8236929oie.7;
 Fri, 20 May 2022 15:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H9dsJo+KUSNJhEleqZiYrTy2I+OsjWQH8r8DGAGeIs0=;
 b=mpvO06Wr/hP8dnB5VEAJwgD3baUlodfLiNDVhFLUdnNa5ZKY6CrNjAS9hymf4iK1yz
 Z1R1ZSRLt5eW/ib9c+zNjHtxHFE3ZY1Y4cWJRsj8LAWWb5y9UQ2WkDA0MZnBknR54EfN
 3Mjs9s2i2S9L3HPWK07GXRZkfX1XQ8qd0OUe55cV/bLu3bQJip5HI6xhgC0oU3KuO7k1
 BV/5ao1tOhqhy+UOlusiaw6eBPoTI31JJbwoxytfXbNKty8T5/bGHIfmRMq4vPkTpqzl
 HxBWwoUtt2fK19lUL/coAA8cdNwPzhTwsmIap4cCGenbQjGkd57uuSXk2KSUQYuOikWV
 lQ2w==
X-Gm-Message-State: AOAM532klFTjEvU1k6fZ5Baw4PBhNvi3arr9vVlu7XOONaW9oPD6N4Lh
 iNr9Tphhbs6WsQezjN1Ycg==
X-Google-Smtp-Source: ABdhPJzft3aq22SEVhwqjbd7HcdI0g2Hkb3t39TPzeI/Bi/8SVUST456M6/1/CAjek8nu0smQ3/REA==
X-Received: by 2002:a05:6808:14c1:b0:32a:f33d:86ca with SMTP id
 f1-20020a05680814c100b0032af33d86camr4898688oiw.89.1653085152543; 
 Fri, 20 May 2022 15:19:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 126-20020a4a0384000000b0035eb4e5a6cdsm1569087ooi.35.2022.05.20.15.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:19:11 -0700 (PDT)
Received: (nullmailer pid 352851 invoked by uid 1000);
 Fri, 20 May 2022 22:19:10 -0000
Date: Fri, 20 May 2022 17:19:10 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: mtk-clocks: Set #clock-cells as
 required property
Message-ID: <20220520221910.GA348732-robh@kernel.org>
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
 <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_151913_986314_75595DF1 
X-CRM114-Status: GOOD (  12.23  )
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

On Wed, May 18, 2022 at 11:36:31AM +0200, AngeloGioacchino Del Regno wrote:
> This is a clock-controller binding, so it needs #clock-cells, or
> it would be of no use: add that to the list of required properties.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +
>  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml         | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml  | 1 +
>  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml         | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml  | 1 +
>  .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml         | 1 +
>  6 files changed, 6 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

Wasn't there some discussion about moving these to bindings/clocks/? 
Maybe that was another one, it's all a blur...

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
