Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07E0CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDChyjARcHDkjDQPX6XB8cVwDI75Vj0OVvNyqfGNTb8=; b=iHn5R59hgxjCGCcX/BvF1bqORP
	PiGr/5Go+VfF7BofLHcMFzBr/N40kEbvFM4JbxkLfbmGbLeqVqgbPEYxt1zx8rgHhPKPU61zT63ln
	1CXU3D/BM3tZwRZEITsJNQ/Uwt0/UcHmbfHn/4323JAdDjEUFP0nxnotWZaTgvMpYdhnRe+TWscra
	mScQc1ZM01fxjXvT1HzKovCYpy+EDLscSikPeT9h6mkIJ5vxP7/IIzK9gvV97hURZWKAt/wobHhUT
	yblen/uA6/+snXEDmiLahQdPpWAgC3XMJmJH1odVZxqzdXrxpQNzen9Y1L8D9Z8Igifozcdx6i991
	yIuwTUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrL0I-003rVe-2B;
	Fri, 13 Oct 2023 16:27:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrL0F-003rTh-15
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Oct 2023 16:27:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9be3b66f254so15657766b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Oct 2023 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697214421; x=1697819221; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dDChyjARcHDkjDQPX6XB8cVwDI75Vj0OVvNyqfGNTb8=;
        b=LHiJuAZJYkYvp0J1n+MTY4Q5q759o4Z8ZV2r6NN5LclxxECl69ESTRF43Bfv0KkFBC
         C6DBQz278B0lEyjKGDyArFq2GkCUf0cWOg2pS8/gnfm52WfpALc4zPAK/YuOyh2p1k/C
         Pih5wFIcLrHbqGp5/VPxJ2G9P/csSOXEwJFJyIvv6VTc1fX4gDTSH6Ah4uWeHSJ6XSu2
         SQSsL4ZdUlKx5Y44OEdspOTEputQRn/+BBI9y94srumbsbDtE6gj8tRakZeYS0ncV5pO
         hQBIwz1pw37TYITz0WdhFNtq4C8jRpWlQtP3KeeD6QQHOAwpfEOwmnqCD/guWQ6B6h6u
         EyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214421; x=1697819221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDChyjARcHDkjDQPX6XB8cVwDI75Vj0OVvNyqfGNTb8=;
        b=N5piW0E2E5waCxBvKy7q3KCIEQgAihTEbxBM1e+/CzrUtfQOYHpMF7W+U4Cs2oiqM7
         0lGCjeRODMpykCweUSKA2Hrhy/YFatinjRmFZntStqgIBi6Ecq1xIS7O/3kQfaxXxBVA
         OB+DdHzIH6T68oVkYtoUHzvgldQWh9qDPjzwYQmvj6B7yiWVv1WF+hRGGMcy8Xnxyscb
         a+U0GcmbrVcdQBQdDPjlwa/rDWFLZE2p9LxXPn3ZF2f/MXTFWgdMasJ8fqqUxLLeyzuK
         zeynMCvXBSqNnmK9ECHelaVbt/QzA0RqrKLzg8qHXTrxJL1xjEUu8tzT75L/xOnHc1G1
         9dhw==
X-Gm-Message-State: AOJu0Yw+TjXXqy2KkPEQbI/7n0uAKbORW2G2j8sd2vrsXViKJ57zastN
	epuWnd0/Lmtm+eZN++BegGcDuCssZLp2HqGiu+k5zWpM3mWzi3cMH7M=
X-Google-Smtp-Source: AGHT+IH4mCWm8Z2elsfB5wPDuFnQnwc2DSuvszMcvKnLJwB6uCPWL0qpI196Srkb4PahcQqJyczrTAjD9wvlQcukgRA=
X-Received: by 2002:a17:907:74b:b0:9bd:bbc1:1c5f with SMTP id
 xc11-20020a170907074b00b009bdbbc11c5fmr1802252ejb.35.1697214421164; Fri, 13
 Oct 2023 09:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231006073831.10402-1-shawn.sung@mediatek.com> <20231006073831.10402-5-shawn.sung@mediatek.com>
In-Reply-To: <20231006073831.10402-5-shawn.sung@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Oct 2023 17:26:47 +0100
Message-ID: <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add MT8188
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, 
	linux-mediatek@lists.infradead.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_092707_545721_AF78C151 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Shawn,

On Fri, 6 Oct 2023 at 08:38, Hsiao Chien Sung <shawn.sung@mediatek.com> wrote:
> +  Padding provides ability to add pixels to width and height of a layer with
> +  specified colors. Due to hardware design, Mixer in VDOSYS1 requires
> +  width of a layer to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
> +  we need Padding to deal with odd width.
> +  Please notice that even if the Padding is in bypass mode, settings in
> +  register must be cleared to 0, or undefined behaviors could happen.

If I understand the driver correctly, padding is automatically applied
to compensate for unaligned dimensions. The first/last rows/columns of
the overlay area will be filled with a specified colour (black?) to
preserve the area. This is unfortunately not OK to do transparently.
Userspace must be aware of this policy decision and specifically
request it. If not, the atomic request check should fail and tell
userspace that the requested configuration is not possible to achieve.

Cheers,
Daniel

