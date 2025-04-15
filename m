Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36AEC369BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=; b=P8xcmibg2aZ5daaV5wX4vx+XoL
	1Mcw9RG2tblIoxafMyGMbE/XBm2s4zjQPYjIa+Ua2bVviGwHge37/2PLQ701rgwvwwYHp15xMJ4Et
	ll2AI30fnoFEN2FsiCN2dbWn03bymTxdPqlwjK3Ifl83sPSqipDn81mpbaC4PWUiGA1FLbnDmkvb6
	wzRc6sQTexFm6lca1kWZYQEm2btB2S2L24CBG46eTeMnWe2ZruXNFLS0w+DBLQdyHy+RVD/V7lV3B
	PDewLNfnpcxNk2Cps0n8KH6OjrZGfrTiBdN6wbMdkTnn4EvyEhKGP+xbLQBitGyyEAdZUM6DQKcSX
	O2SkAa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oVi-00000007IKs-1SnC;
	Tue, 15 Apr 2025 22:12:06 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oUa-00000007IA0-3dTo
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Apr 2025 22:10:58 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54298ec925bso5319813e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Apr 2025 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755055; x=1745359855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=lVT8fQXmc63YO9wMs75pVgMuUNbJmv2qioIA3bz42sHuccwll/JmW5R+IfzK/eYCYz
         GM0oHycfyyxxQJkYIciuta1zBevwEiW243e/KzfARq4PbPmmsCofaSprqR0WDll1K3yP
         4f5jRlrKJ0dU9OwokUtwA6Jn0S+VQetLn3oyTk/6ZClhmZQF7ZaWbVOkdSVc3HapPcrr
         t4WfSSTHpOxWuQtS3AYy/B1WArTdDUB/OW6KooMdR1Zym6jrkBLMMcMrZeXPe6SokRI3
         naGDh1eimmJYUdtrh8CG07vSeZfGyBuaaHxd8/McCv684v/USAoudfmT2aLPzid96tB3
         vmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755055; x=1745359855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=OPQLDnJ0dg8zdpvqmRevq+LepNM2cy98npplCwaJgBz/I2AkKMD3aK7hexUEwDBbbn
         FQljR9VoY41G1jnpFoJou/GvqmANk18jeq47NYXqT2jlTNWPZtfVqfNi1eM7Ez/yEPs/
         VlyiXOoWPrd3Sg8QvoiDh6Joi42JY5r5J2P5fFb51lWn2EEdBKbmZ+wvNMBMad0mG6G0
         VMeGLOXIPaKL7ZgJfEgu3Y+HrOaLkRXxY4BK+LgLfhPGY77pSof8j1u81kcz1DMN/BJy
         bX4e5DfGc1o6MHQ805jsi4DrCTvmEsOWjzvWujd2JCuwnB3fJUUFVMyZMPmGxh2Qb0Rj
         VGUw==
X-Forwarded-Encrypted: i=1; AJvYcCXIdQOTtdIH3irm8FpZPBiUgcA4gZ6/P4sqC+AQxcIWvRUatWmLyahAZL7NGxJZDOjb7blumfmd4addMKPZKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjNtacJ4aSbCvfXo7K561YNPXNSqgJ8y7DHvjncqvBv7vIYzSx
	B8dK8FOf3kvYaO3fELNX3CpMGBu40a6W66CIZKpBjYGIwQNg4mmfcBWLHpY+BBJR9oZatIPsznv
	Gz8L4G79mxpyinSw077s67tWNyEINAO7aZJXVIA==
X-Gm-Gg: ASbGncvJ0NGrRJ2AIp0Ea/ijSkRjfbMHtrZUOxKP0LCSK+pUajHBX/BnBYK+AfC94Gl
	8J83tQs80FzXNO8991afxGQ9YjhObGhW4SPq82XxUnsGJfoPye5EAkw5SIvCp+wPFwm28H+vh9K
	VDMFrXO0IxMnzHTBdYTikPhw==
X-Google-Smtp-Source: AGHT+IGZJzLOwnZ9qpiWHcIF+V8TMR3nGOqkOptHc/Gl4TE7Nw9LgOL4ju4wMFEnKHYqcQfWgSEgPkmfn705OlR6U1Q=
X-Received: by 2002:a2e:be2c:0:b0:30d:e104:cd55 with SMTP id
 38308e7fff4ca-3107c35dcf8mr1584751fa.38.1744755054882; Tue, 15 Apr 2025
 15:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:10:43 +0200
X-Gm-Features: ATxdqUEUFUOJ2tt2s7fnA8fXcqPXcCQqJSFMlzS_sbWB5FOT4EwR_LV0iDgZ9D8
Message-ID: <CACRpkdZC40M9p0VsygE4fWeybdHYD6OJ2b4BJufbCA4LVW1z5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_151056_908583_3DFECDCF 
X-CRM114-Status: UNSURE (   7.48  )
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

On Mon, Mar 24, 2025 at 1:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Both patches applied, thanks!

Yours,
Linus Walleij

