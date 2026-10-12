Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8A6CA9EDE
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2026 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=; b=f8HPXP3AhvP0g9IMEh4HnGyxLR
	bArmT4+Q670UfXOG0BdT9bqpAaNMhuYnM7mAOMEv1Wc66NOPgLz9Q/R3Wzs6uN6PTYTS+AxIjr9Qd
	IxPyw8vTns2Eu/xnZ3pjLKLkF1OPL+7U9B7/JsQ8uhOvdG4G8i3oAhqRl/+Kp51PvETTGsWAHyNzY
	WAxgXPAfhgVqXNNTmvRKb2KCGCfA/7ChwHY0k6vVccWhcEAoLoaZhIM66uZ9AEzk4I+briJS8s5hc
	Ze0lCgEQb/DVA47fZ0rQADyVpu9tCRsMcZkLhgxwxrvSI65m01ZJ2NH2vrLUJiG4jb44MXt8LPp68
	3lHLoBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGK48-0000000B8rE-3rFX;
	Mon, 12 Oct 2026 17:44:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGK44-0000000B8pB-3gqq
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Oct 2026 17:43:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so2627632a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2026 10:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827035; cv=none;
        d=google.com; s=arc-20260327;
        b=X8m72iOzYA2izNzBtlFNZ3uSr2hmUxMFbY5ncQajpBXRKvy7+itDPFD7MuUgDI9T9O
         qsUbWa+8tJkfa4RzKSEU3nFJ/D2y8EYhjRShI0341hJR+Tbc2MKubGjL6CPNfVND9Jcl
         ozXwKhfkzMUJHJ+wNcgvPqS49udGFha+n448OulyBa5eBo2d/GY2UZDJcA6EkRZREzzJ
         LsxSPCXVmTqw0OcCHPGKwuZYPog0vqQc75/3x8LwzwnadZoVrjE0b2ojvC/09YZrg+GM
         UcKVhZ1mdKD6NV5PRkMbTSyo+FO50vDkAyoe+HWUHVS4AAek+DwQzk758ud9PEIdQ82B
         OP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        fh=s5WrDbZ0TqWrSRVeEwnK1+e0JrHsagPRHBFXnNEYDUk=;
        b=lVcYv9wb0rX0474PbL53i6urklruWx7+1VdqBa6Aah69R7EiA0ApVGkno+gNuRqzNC
         Kjzpe7HGXfnIuEOl2GUle3XfvBCNq+XVsT+Q7MtIN0ceJr49ghLzPAs7rFXMe1Fw5XkP
         gKKaoto+SQ6Hvtw+UD9hXmTVaujv9SNrg2aWxrJPZOh3HVGOKuWf1goKRnujOSsCQ9oD
         qIjgAbjfvNOlQj6RG0pegVa0CFtPjF37jk5ajDD3G+1d9866g60OG0eCfxjwY/yTmH4z
         yP57Xp9Ed/z0gaoKGEa0P6N90r0pTxS3oG9ENlEC/EO9+uN7nS89DgMI3r8CduLTja0N
         beMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827035; x=1792431835; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=r5pqoxkgDMpNNApP+YitL2xWGnQm7iFZgg06hXWmqgkr11mpVkoa7LZS2gKuqPX1sk
         hQUXIXsT95hHIEDYpLZ9ILTnIWd3V3x+ekNdYJRy2O+3TTAD55NJD8bnFvQd5I1kC7N/
         REhBqRoA9Kbuje77A+F6Ig7XXdkZoP8IEUj/+HCafdm8KzTeD/1JRjTw2kKYDRZjDIgT
         fI/ovDwZoTwXIBSPzRuN4dxye/bYGDtomJdEmRviObcZAGYMkMHY4+pRw68i3oBrO7VR
         IZr03HX/CVdUKuv64sQ0UHDQ/B5IU7623frLMbyO5PxUvpDs7+WDj9kZ3cBc9VYIsrxd
         rXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827035; x=1792431835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=VJG+Qc8kb1BkW7S8St5asjakXQKEaU+TNYM+S7waaj8CtTbdfCWlo/z544cA0wUfHC
         F1zWdZ5XHE/bcl2BXA719d/eSMKJdnWDGxN4HY2VGLOPR/NW8PNXTqv36W0iE4wHyG6C
         WBjBlzrQcSuWjv7oYqfEQh3k1Uk4O6hh8hlntsQjGLTMEN1uq9pUMdij1QkdzEgL4Tg2
         9pWLeFOP3R5SDWtJi2Qnnkf2twX71wA/ehex1uUHrIKdfJ2cvuKuQnFE/FCNbgflFT2Y
         mjP5ntv/MoX4xFES52yOK16Fiy27Z28YmPvJgYT2RMt39t185y2BoJmSX6X1fEWEbtZH
         2ARA==
X-Gm-Message-State: AFq9FYJTKyyn1hPyHFX5aM2IfZ7kh8YKsYU9/e+bC4v3Wse/maS++D5O
	aoQFAJoe5tJ4EbeS4HWGKtXD+V4xDR0arGxjgaq0NlqeYztk8e8YpVnkjdWJSteaqabVibqT1Z7
	eAfA6oHFekg+Tv0Hov3sAsLhD+ZwQxD0=
X-Gm-Gg: AYBFou2ED+YKk5c+Ip6U+AHw8jS5gu9LQaEoLMDb9qXVBHLVbSwV413z4rlA3clodez
	bZvHe+dh/6iKHERR6WSZpDiRTFHH5e45Rr1M8+hbVf8df/jmE3Ntkddz6D7ipBYqiAqGgyvY+T2
	mU0EUlfaFjgTNvhlzoQVxFNQd5NW8pIXrBXotypFyF3WWx4+Gp2dJ/XLqqHHqeWjqk2pzKHD6E6
	lQzbteLM1OnvDvcfmNUS7sXzKU5AmxTYzbK5MmtkYX/AvUY/b1Yn6udfMD7Ha8uniugYtezIxDx
	+CDo88PD/5FrpJR3gRA1B/q+G7el2uQTOcSSHXD/l7FuEkADL1MbtA==
X-Received: by 2002:a05:6402:4341:b0:6ac:8761:17a1 with SMTP id
 4fb4d7f45d1cf-6b17c27a7famr8072014a12.36.1791827034421; Mon, 12 Oct 2026
 10:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-2-l.scorcia@gmail.com>
 <20261012-quirky-emu-of-renovation-c217dc@quoll>
In-Reply-To: <20261012-quirky-emu-of-renovation-c217dc@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 12 Oct 2026 19:43:42 +0200
X-Gm-Features: AclHuK-aSGZTx-4HZF0vtpTq6BBo_BN-ay9Tv6iz0b611lBgirjVShAwSUrYMCA
Message-ID: <CAORyz2KgX-7=gfax06+Pb5SFq4dVTtcTY2pbH+FDCRNZ+AVXOA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_104356_929079_C0E9770B 
X-CRM114-Status: UNSURE (   9.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Why do you have flexible clocks?

Hi, I'm sorry but I need a little help in understanding your comment.
If you meant "Why isn't there a constraint on the clocks' names", it
is already provided by the existing conditional block [1].

If you meant "Why does clock-output-names have only the maxItems
number and does not specify the clock name", it was there before [2].
It could probably be added back with another conditional expression.
If you meant something else entirely I apologize and would appreciate
some additional guidance.

Thank you,
Luca

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/phy/mediatek%2Chdmi-phy.yaml#L90-L102
[2] https://lore.kernel.org/all/20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com/

