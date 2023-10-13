Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C8CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=; b=bPtbqLOf59K+EgigZtqZBhIISr
	8oOxwtoayLrrXGub+/UCjX/6GgBdJpYjUzypmtkiAYjU5IvA2vEGCqv9ul2CNO2Y8eyh4qQ3++P7C
	T7K41Lh9Fd6Czthm3aLDQaqO/XeXP/iBah+ZLizaf8YTV2zprJkStam2Gyqdb1hw3fCwcsAY7NUNb
	TUWFs00rOONQMaotjuYAZTWco+6CXi5uNdC0JRlRkoYt+mpi2m7FrEqztMZL1o7ZYBMTFePaifODE
	z5XYcVBYAZ1BEesBexWjXGpMzjOUBPJp8FCzBR7/4yjGlUsxC+j+XZmqujowq2zO7nfBGXVZHJPl9
	p6dMfykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrPS8-004HgW-0M;
	Fri, 13 Oct 2023 21:12:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrPS5-004HfK-0f
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Oct 2023 21:12:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so3948248a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Oct 2023 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697231522; x=1697836322; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=;
        b=HMcaSY/2m5aRoHQeBrsOwMumJ+aOtw7dejot4x1tcNjrU5/D7YYsrvNFt74Wr0fTu3
         pcbSUWw6sS3DTWXURixsPlqbkCsRE8R61bXguNj+ZYOs2PfJnR+rgUIhJGyotRL9avG9
         KFjYhSw9IJG3yPBxeaHrzXoljeH5rumkVXi0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231522; x=1697836322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=;
        b=DRsr2S0273NSWGea8OVPnNbRdDG6SPLYTjEpuuztmDxJ4l7UW3QhwwuV0jucUcEOWX
         xNVrbss2StE3sZgoe7QW4A5R1QnFG+zQqwnv9hOgCA3VWyBLEXnd2EmOkaL6+fBlfQTG
         g9epQGZyUwJy2VQAELA5oukPNzAExblgNrnohsxsKOujUjxgkcQwikVwAmIgfGM5k1mZ
         Bg4b8HIeCmTH+2Z7oRlkd0IkQ07WvYE3aWUEBC8vzs/6YJ8HGlssiazup3t+KB+svcBc
         0MNheJ0F8LeKBF2ePZ7fdV7/7IFgWc1+mY2f9T4OJLwoHl96WzclWxOPyjUCs5uwYxpz
         e8jQ==
X-Gm-Message-State: AOJu0Yy6mVRgXn70ixRoUN+pUmW6H8Hc9o5SG45/peC6UBR8pV62plpF
	mObnCsa31SwVnlf2dFyn+NgOywgUsDxaMRa/+JIkTw==
X-Google-Smtp-Source: AGHT+IEuNA+Q2Yxxws7amOJuXWe3ey6jbnUkGbWIJda+AVzB6s8jOrXT89FhBxT8kIo26PoR154bP2xzv0Ano/B3pdA=
X-Received: by 2002:a17:907:60cb:b0:9be:7b67:1673 with SMTP id
 hv11-20020a17090760cb00b009be7b671673mr337821ejc.1.1697231521525; Fri, 13 Oct
 2023 14:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231013200851.347042-1-robh@kernel.org>
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 13 Oct 2023 14:11:50 -0700
Message-ID: <CAPnjgZ0Uh7RTvYfLjEL7g1NjC1pO8-xJuj9RBSVVnwviAwzF0Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Julien Massot <julien.massot@iot.bzh>, Trevor Wu <trevor.wu@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_141209_271106_1E2E05BA 
X-CRM114-Status: GOOD (  13.66  )
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

On Fri, 13 Oct 2023 at 13:45, Rob Herring <robh@kernel.org> wrote:
>
> The common reserved-memory bindings have recently been copied from the
> kernel tree into dtschema. The preference is to host common, stable
> bindings in dtschema. As reserved-memory is documented in the DT Spec,
> it meets the criteria.
>
> The v2023.09 version of dtschema is what contains the reserved-memory
> schemas we depend on, so bump the minimum version to that. Otherwise,
> references to these schemas will generate errors.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile    |   2 +-
>  .../remoteproc/renesas,rcar-rproc.yaml        |   2 +-
>  .../bindings/reserved-memory/framebuffer.yaml |  52 -----
>  .../reserved-memory/memory-region.yaml        |  40 ----
>  .../reserved-memory/reserved-memory.txt       |   2 +-
>  .../reserved-memory/reserved-memory.yaml      | 181 ------------------
>  .../reserved-memory/shared-dma-pool.yaml      |  97 ----------
>  .../bindings/sound/mediatek,mt8188-afe.yaml   |   2 +-
>  8 files changed, 4 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
>

Reviewed-by: Simon Glass <sjg@chromium.org>

