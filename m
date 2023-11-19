Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8044DC072A2
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPRqtY1zpT/Q/zxPJfMhR0FIAH4WhHFxsqt84FQQa7w=; b=SqqF7r2Si/mSYJh75wsrp2sENY
	Ql3lP8Rcgl+Vz1muqIuF64bIg8BiBGcZM0uMXYO2d7z+maQOJPwk/DVYCwVHNWCtCHFBrVsAxEvhP
	Ghh8R5Mm1HZCxigpwho4g6Pr/TmEsV/Jgx156HpKD+AD2cXhGb7Jt+Nuj3fJrSKRbZthdyr5qI78s
	/G87W1QrXx9gwedKWwFUxYhFpnxLln7ObE6xfl3VuBgyAvkZ0ApveE9gvMu/qam9YL3o/foiks/Vf
	mzLvkD+SqYLHzrvjhPArrC5NyzbFPVy6Cge8U60dp06tUAk85Z3QCRO1TmiNQR+oPaeKC2HcqSsPW
	9Y2Dp70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4k6O-00AMGE-0n;
	Sun, 19 Nov 2023 15:52:52 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4k6K-00AMFk-2s;
	Sun, 19 Nov 2023 15:52:50 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5844bc378feso2101009eaf.0;
        Sun, 19 Nov 2023 07:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700409167; x=1701013967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPRqtY1zpT/Q/zxPJfMhR0FIAH4WhHFxsqt84FQQa7w=;
        b=EisGjJFyGoRy+662Xrq3sdvAemp9oDfaO58SiD7szJQpUHwNDHvRwbE3pL8a3t1iYr
         tVoT+ZNEHFBbQs7/Rxyvju5kWIHwMYT7m47VRFv6o3XoOUZXFu6Gx0fJXWIvitZT4tkD
         FPJ+t/dzIwk+uN7DAGeFjNV9p8qaOVg4cEcQmmSNDRt74DRC1h0uO1iMSwWe/CajlxPq
         y51XjogIqQQ4gQuXAdHPD9AYhXGTqrLzf/xLeIDstSOLOjWq5YIuPQisGnMPlgxpNQFX
         1an+5M4X+x3rPpVKvsiYU2TX2AUtaCexmlpE0VrKaOryeJtDR/IVGiiJKFuBBUpW2XjC
         rFEw==
X-Gm-Message-State: AOJu0Ywo9AVH76QopWnO6n9DLpSe4rPawBd6Q0oahrzb7m/icNfsZ3G7
	CzNu1G5CMVCU1o/rvT6wpQ==
X-Google-Smtp-Source: AGHT+IHkoTGEBKV6rZZg7WiLGiP6+Mb7p3oHWf3C06rFydhcw0A24vcNXVCbjQuWR8Y0z9Ns2eOgLg==
X-Received: by 2002:a05:6820:2290:b0:587:2b3c:e11f with SMTP id ck16-20020a056820229000b005872b3ce11fmr6022465oob.0.1700409167085;
        Sun, 19 Nov 2023 07:52:47 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id eg11-20020a0568200b8b00b0057b6ac3922esm1084662oob.18.2023.11.19.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 07:52:46 -0800 (PST)
Received: (nullmailer pid 254995 invoked by uid 1000);
	Sun, 19 Nov 2023 15:52:43 -0000
Date: Sun, 19 Nov 2023 09:52:43 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: convert ethsys controller to
 the json-schema
Message-ID: <20231119155243.GA235374-robh@kernel.org>
References: <20231117074926.10824-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117074926.10824-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_075248_931662_B057AB70 
X-CRM114-Status: GOOD (  15.74  )
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

On Fri, Nov 17, 2023 at 08:49:26AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. The only introduced change was fixing
> "reg" value in example (1 address cell + 1 size cell).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> For the record I was trying to simplify "compatible" syntax with
> following but "oneOf" apparently can't be used as a single item.
> 
> items:
>   - oneOf:
>       - const: mediatek,mt2701-ethsys
>       - const: mediatek,mt7622-ethsys
>       - items:
>           - const: mediatek,mt7623-ethsys
>           - const: mediatek,mt2701-ethsys
>       - const: mediatek,mt7629-ethsys
>       - const: mediatek,mt7981-ethsys
>       - const: mediatek,mt7986-ethsys
>   - const: syscon

The problem is you have nested 'items' which forms a matrix.

You generally need a 'oneOf' for each possible length of an array unless 
the value of each index is always the same (i.e. only the size of the 
list varies).

> 
>  .../bindings/arm/mediatek/mediatek,ethsys.txt | 29 ----------
>  .../arm/mediatek/mediatek,ethsys.yaml         | 54 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.yaml

Can you move this to bindings/clock/

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

