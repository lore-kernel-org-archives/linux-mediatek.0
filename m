Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA8CD11C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YinWXQnk0eT7Z1wHOzuPSCSYvlwXIPlk1+iKh10Vls=; b=D8TM+y7dqg3hA5xwOubtqWJ+T3
	i0iI5QLahZnqdcDl5EHEC+TlZyyFCSvoIAjppvT2Qwc+AHn+THUYvB/4NIrYrIAAIbb5yeG3ZtOcB
	2DZTBl6cmmEsasAxzwVkASzpFKaH1vIDu+FW9oADZysHDf2a8tJc9NB7QxyMgwhD47zm6A+3kSSP/
	LwV9Gg8xFxkiCZK/yR3wEQuKmHlgYPdKXVQNeh7JQxU/nydmEuDTJhuPSKR1NtjLp/QxweHWjJMxn
	q9fQE4LCxcVRc9qZBHhGePxHoi3XBJBVrpPSROcTJEjKRVhpd2Q0uCM2fYeOYcT4HIbSI4c9iswMn
	sh5PqIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRnn-0000000CXwS-1G5g;
	Sun, 07 Apr 2024 12:39:15 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRni-0000000CXvY-07QI;
	Sun, 07 Apr 2024 12:39:11 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-221e6bf537dso2306273fac.1;
        Sun, 07 Apr 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712493547; x=1713098347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YinWXQnk0eT7Z1wHOzuPSCSYvlwXIPlk1+iKh10Vls=;
        b=TBFOdNM0L/H3WXBlNY0e3NxTfDO/1TgC+VeCdMiTeHzseFqU3STOgQbkQwyRl7VRtV
         RIVHJglb7EC6MghQhotsaHzks6VM3/bdD5PrlAYuBEY0Jvu8aRmM/siU/H9DXH2ZiCcn
         EgfIlU8mdZjGp2tDh1k8HblCY0WS/M/buMLq1xs7CRYjZXmM4dhDismMTQCSO5Tcn4es
         g+VtJKfLTPG1A6/+lc4SYBCLyDFyjmzq3iITds5nNAFSnIE2A4SKzAC2/8dil4bfd7BG
         Vu9DMUznsrFQAislRH71EYGrgIop3jyM2gCWD727X5BkHoGZSv5H53aFa9iA7xuGckfW
         D3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712493547; x=1713098347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YinWXQnk0eT7Z1wHOzuPSCSYvlwXIPlk1+iKh10Vls=;
        b=ehkeSPasFDXV1D32T2dLu2VLs7clx01+nrQ6/tcWGGtVKI4CAmmaRl02srzlL06D/T
         QWF3aaChUP6EBLPFCnDTtVjS7frO7fodkjnOSIjE3EzQB0rqGq9io2CUCPx5eiE9YgZD
         FbQ7vgntsqdU0e98//cCEGLqz7gV84ueNToFOltfxjmhO0Ah9Ibpc69GAlwG76yls8e+
         /RwW5xMnnGnIesUQ8eNmlNTtWDrnjF9ghtLIheUbXgsbTu9XiQS/OIJu3gan0+PvG4As
         6vq+ZZtUt9nbvQ1uzTDt/qWI5z1UKnKxJeEwbGT5HulcFi9aAEaVBzCR/jLtQl3Kz82a
         6wGg==
X-Forwarded-Encrypted: i=1; AJvYcCWYJKgxI8RTz4RHhF4zcrtNIh9TwU57DvTblG2xSS5w1eVzIWo0dmULmQbYbkKPrL4W9rMLUcQ2YBhHFrsPKcY6HpvBCu7RkqlNK0VDZ2uJLVbQJZnDJ/sRwMRjexxgMwgrkXpq6I5YkvczmSd/VaVedPP66jytiItgS5rqUtJrZLTfngMPDgDDkpNV0UPeUF7nJJyRJ3ftF+D01Sb4yvX+R/HfLQUH7/LJD8/0ybgRrmuU9v6WZr3z6wup3O9Yv6ryog==
X-Gm-Message-State: AOJu0YynAG30UQnhqDN++8iX2wuB53tHv199XztMF4OG+ZpuGCd6fWPj
	Bd57WXheg3S0rQNz7/pqvu9HlcfE/ybEPYLRe+yLL59Mse/lL2vU1Pr7niohB6KFN6wXxKYfJCE
	feMzX/W7MIVKVGCTwyfaj8NiZmFE=
X-Google-Smtp-Source: AGHT+IFvZ1UMHhMwBSNso145G9wXeopvnhz67bSYiVC6v0RYNhkx43Ef5CmXFgL9Iup+iSFrwPTE4vACd2zsBUdljvU=
X-Received: by 2002:a05:6870:fb8f:b0:22e:e1e5:b8e with SMTP id
 kv15-20020a056870fb8f00b0022ee1e50b8emr6777731oab.41.1712493547737; Sun, 07
 Apr 2024 05:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org> <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 7 Apr 2024 14:38:57 +0200
Message-ID: <CAMhs-H_gx0LB89QpLf-fJrumONRSnwB5_L7YkkWKC=7130EFLA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: PCI: host-bridges: switch from
 deprecated pci-bus.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_053910_106756_D588E4CF 
X-CRM114-Status: GOOD (  12.48  )
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

On Sun, Apr 7, 2024 at 12:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> dtschema package with core schemas deprecated pci-bus.yaml schema in
> favor of pci-host-bridge.yaml.  Update all bindings to use the latter
> one.
>
> The difference between pci-bus.yaml and pci-host-bridge.yaml is only in
> lack of "reg" property defined by the latter, which should not have any
> effect here, because all these bindings define the "reg".
>
> The change is therefore quite trivial, except mediatek,mt7621-pcie.yaml
> binding which have children nodes being also host bridges, apparently.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

