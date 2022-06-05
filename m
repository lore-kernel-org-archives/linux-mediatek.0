Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91257C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYStB2ZVHuEuuPOQ3sMpKrXZ2FHDbVYUtscMDDIfPN8=; b=GVH2iGusapyExs
	VpRS5ZVuA/KaZTL13iJP1HJ7WiDyy6qCAv88ao30AmdQWoM8nj3Fx4i2UGyPQme0G3oSQTXTubCg+
	9fSE1OZFH+8KongsU9LDkLZBX9lQv2XjyGOB4FXfad9DzB/Ae12L7+GVFxTEbFQydeI7EhwY+CUq3
	XSmzxNNsQwobxiVkdXEH0ETvoctE4fWgmReMNRFrbtIGWwlB4mVXZGqinFXMbWuzIXQW+WdPeLSld
	dz7XH90qRKWfWzdqaph9jeRDAC7w5Ce3WJjGLxdCTpHO6g+Kx9MiPpAfFs+HYymJtPWO4Hngtzw97
	fLnEzx54oX9Mc0TpLpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxh1-00FOW1-2O; Sun, 05 Jun 2022 21:21:51 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxgp-00FOU2-L6; Sun, 05 Jun 2022 21:21:40 +0000
Received: by mail-qt1-f170.google.com with SMTP id hh4so9250497qtb.10;
        Sun, 05 Jun 2022 14:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6XXXWEDjfuHYCfIXDSumNX+3E7d5iXSbe6DNn1lOd4g=;
        b=N4mNIoKFP08XfODPLzPWjxXqsixFP6oG2p8m+TY9jkuO9zA3NJPKracgdcoNO7npMO
         QITIdXOJkOetkAwMXLTUBBhsUJEnrLnUAddUP3qDEil3o2ZmKXdcujCFHTY7+MVuRCja
         nJi2VNwWNcqWG9BeUHQ6HgqL4kXPmrXP0J+hDhIx8dRoMp5GBz6WtLe7uV1F4D5bmANL
         TcHzBveHm98Ultu11bMbGXe1o7IW1RhtJTMNiHfdJ84kZyfW/+swXiKU8LPjh6jvroyA
         9HOwzdbYP4Xmzk/+HpGK+Z2CRPzEyDdklU2ZfqjjpQSIAU8yiJbVed7cLGjIBWW6y+sZ
         icsg==
X-Gm-Message-State: AOAM532z2EbfgW+VbJfjX7ErJMbcN6AlXa/HVp8s99lJE2Wk+BcfhSVM
	aL5j3uX6p6ABiZ3RhVD3tsXVfT86cQ==
X-Google-Smtp-Source: ABdhPJxg8lW9Q6SM/QjPCob7gXlo6b4anqT/h1nOtd8gSx2d8lxqP45JB9iTaLl3lm5YqQZlh/IV4g==
X-Received: by 2002:a05:622a:1115:b0:2f3:bd60:a33b with SMTP id e21-20020a05622a111500b002f3bd60a33bmr16106409qty.292.1654464098421;
        Sun, 05 Jun 2022 14:21:38 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id m28-20020a05620a215c00b006a03cbb1323sm9421958qkm.65.2022.06.05.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:21:38 -0700 (PDT)
Received: (nullmailer pid 3539028 invoked by uid 1000);
	Sun, 05 Jun 2022 21:21:35 -0000
Date: Sun, 5 Jun 2022 16:21:35 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, Amit Kucheria <amitk@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: mediatek: add binding
 documentation for MT8365 SoC
Message-ID: <20220605212135.GA3538973-robh@kernel.org>
References: <20220530183833.863040-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530183833.863040-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_142139_729838_75545628 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, 30 May 2022 20:38:31 +0200, Fabien Parent wrote:
> Add the binding documentation for the thermal support on MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
