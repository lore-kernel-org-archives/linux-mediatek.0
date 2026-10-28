Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C2606A31D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gle6hYBT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzui3q6k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=; b=Gle6hYBTeRGUwxL2OOYCD9Yi+5
	2jI1wivszZ3L0vcyzJrWcjTRH5BfboLHj7qnCGj0XhZaExSJrHnPOjh1/1tIvl5AYSa1lHY5I9m1f
	4uXiPDWDw3ZPK6xqeITUxe8dU2il0XLHJfclCjBaqJCGk2cNSqffPIZeQopjCy34UUtWAf8k/40wl
	BmxjYqM7Lu44LKUgf5g7CL8HlL15bL0o9LXlTTn/OPhm7gP35jur55yuU3l+wAEUYgTNj0o9lfQ5m
	aJc5bPbKFJer41oe7HzYTuBqyLLnVDvblk0F6JGdFGumUfg4MdSqAXe8YBa0bLOGPjSYwlIkL/+Cs
	bATQhQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6pN-00000007aNl-2X8o;
	Wed, 28 Oct 2026 16:48:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6pL-00000007aMS-2HoU
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 16:48:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so6198445e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206117; x=1793810917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=uzui3q6ke6A2/HaDDFB4kN2kEWQDVJmNQ9TxKz5eLNR4VLpKsdayBl08XXfp8fQRnO
         B0pONyHvVjTJWlsYhY6TESyboSPRXEZWQjDH9Sbr/EuFkKFwEUhUHY9cVQOn45jxFHXu
         +JToV1Qy7+OZorakVVGLAcOUk7RqctAo3rhmpkrdBHByfI/4+di99b/bO6IHLBOXe48H
         lT1kZilPDvuwkcyyIXZZwxLLLIaKjycrFaXxXEi9ZLvp4amK+KsY8I7ZNw7cBdt0x2nR
         Alg7gCDZJIb7iKXIMngO9k9n71hjsSu0c6EQw7oZjwXIx0DfPE/lyccEvduGplnFuZTB
         uxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206117; x=1793810917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=qjjjDIsSoKniSh5RMBfHURjFaTmvbfAFAWxsK9vNkoH8YDuRQndao++ixGFIz2dQzU
         24WCsG4i+zKUb0Suo2wVHjDVUx7VpRfncklM5hr7kufl8dwOeTHCtL1bcsdJrEpk1nou
         O+dJ7DnIzsKahJwe/HJyGvAoZdRZ5FFMQRW35tfJSuqlE6Etp3tt9QXnnU54T4xRQ1jV
         sN3kYJlthfgxEqBIJYTjPwyOlVXM80lcK80KX8rMx9mqiErWRlyc8KnafX1m3JF84Dao
         osC1uOTjnAA2WGvcq0K7PDPChNMKqhfJIIxAQs1ZCeTM8WobbWFQAJ4EH3FHog9Y31Wi
         wngw==
X-Forwarded-Encrypted: i=1; AKwUvByFo0rGJBzR3HTnBRZslpFW31Dctp6cE7/hKob9x8ThlEXdwd4sJ1Q2kNstIiJL77WHwEcrkkpVhCq/Gkrznw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKI3+T95uLvewZyCRb8vm1MNPDHaOVmroQs88HSg8M3CbNaNeLe
	cE4dcWQT3lIklsjdErPOLMJ4ZZQ0Bewg1xSJyqtZAyuCjFzx/TJeeYjM
X-Gm-Gg: AYBFou1KHDlqC3QaQU77gn+zun2F1LrhVcYB01uVdUEUw3xaUUFUgq4LrbGbQvd93M/
	qlhTnT7xwXlg2Cq6IRgYQbDbDMpvo8pQO+vPOGv/LSZl7xCaiAxA9UC5F0+Ee+5dUp9nDE33DCu
	MAHNCzccfSAuLznEK8BsVdYIyVJcQvnDyxHo2ZdbQiDFEk7G+9mm2QRbnDb8ua56AKQfqZZ9okT
	oEumC5puFRz4Y6bihXEE2nz7JfE6MWMe0NJMmEVKWE8fEcNGr+ax3br05c62NlTcSThwqd39uds
	RuzY9RLLiLs3t4h7wNy0VPTZNgPMcrU3lzQqxlrvPyjkdPqse4HwYFa7HbpeXxpIhJK4pMH3YmP
	6iLIgZ1suTgWkmy/jVJY2WRlObS/4zLVKfNbJa5A8Yf0hvChJqaiqIlZLgYM4eNDxP8AIG+Inj9
	NIqrJgms9Cv9NWCIndP+vKIqVbWXF/1krHXeHYZ1SHju8BKy1i3qVBb4lYDiXv+SRXOJob9G8it
	Emb1w0qIBVojTmHXHY7Dr7lKLRT5pp/lzsobZvJoX1F7sdUMPp0Etc87c5KRSoYJzXcEcvclP/J
	/1Az2/cqS8jJN8/yvrWv4c21jbZojVZWLfeT/ceOqq43osIZ4g48uQ8CWhhs8TQqzvlQJY/j14t
	C9pxs8foTOhdTHcteNk5DY4jzc8Rwqbvwu7xVog==
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr22034485e9.28.1793206116486;
        Wed, 28 Oct 2026 09:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm4600155e9.2.2026.10.28.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:48:35 -0700 (PDT)
Message-ID: <6ae22763.2bb6edcb.3bc160.a0e2@mx.google.com>
X-Google-Original-Message-ID: <auInYOnHl6n-3ggU@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:48:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
 <20261028-academic-blue-earwig-72d3d1@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-academic-blue-earwig-72d3d1@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_094839_598236_2F2D3500 
X-CRM114-Status: GOOD (  20.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:51:16PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 03:40:00PM +0100, Christian Marangi wrote:
> > Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> > The MMC controller is based on the MT7988 with the difference that it does
> > have a single clock controlling it.
> > 
> > Add the dedicated compatible to describe the 2 register requirement and
> > permit to define only 2 clock (the main one and a fixed clock for HS)
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Also add compatible to restrict clock-names for source and hclk
> >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> Your driver part suggests it's fully compatible with other variant. Why
> not expressing it with fallback?
> 

You mean something like 

   compatible = "airoha,an7581-mmc", "mediatek,mt7988-mmc";

? (my concern is if this would be problematic with the current if
conditions in the schema)

The driver is very liberal for the clock configuration as it does use lots
of _optional... But it's not possible to reuse one of the current
compatible as they all require additional property that Airoha SoC doesn't
have (either additional clocks or single register)

-- 
	Ansuel

