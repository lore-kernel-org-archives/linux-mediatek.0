Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4254C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1jmXMGgCEe3vyECBk95vJ+hBk5w1rZzr4yvt3CADUo=; b=veYHYLgShgUVGpBSAfxm/fROq/
	B7CWLKccjujUpit0InPsAMIxyicFoToS31OiI5x4vx6RyIXsk6+gUB2SuNwCAQPFEUPyurAyChmSF
	pObnhrysxEeKzCH1eNGvwkEZjRyHq/wJUADyuwolhwh2IaKe9V48phqzgUjpCE7EMAMmjSdje5/ep
	Na3pIlYz5VI6YSlUFkZcG2XJqXxXd/BaL9NRL5JIcTRERRmFUQhbvUwF4Wb/o5rFc1nJrAPM/Gihl
	pRkD1MhfqPjxOAecu12A0flKm7IkhlZoY2YWvKs/6P8gyAQGDTqwRPicV4QoF0YR1vnvwJnGE5Bq2
	aOeVbpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWva-0000000HUyB-29mv;
	Fri, 23 Aug 2024 16:14:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWtx-0000000HULo-0UPy
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 16:12:40 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52efdf02d13so3148092e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429555; x=1725034355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1jmXMGgCEe3vyECBk95vJ+hBk5w1rZzr4yvt3CADUo=;
        b=eqhm5gmzoAfOL+8Ve8yWqG6DGbuCCSPP0jfx4Fcc27Vh6Qj+oyISIBHSwvrG6OL3tp
         PxoQQikOmEEqsptDvMZCMtxezAztFxwe1iH46zGOFe72lhlokas5P0uKs4AGsIx6R2eO
         3R7zoRDb9JV5TfsygP+ceqDE/aiLSfya+CDanjAg8RuRjJRs7kP8Tbb19o5UeJzJ2iWX
         z4gGg40+8c868T1l2EbuTzph0jzznpMWkCg0BlY/x63ixPkWMgReiSp/5rQBDQeW8vIx
         ehmvrfDQlpHNmEKb+F+nhB/8+RuixX2g1veSe+OVVkwXeFthwEo0YkRHAVmkQH/MTEr+
         ZaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429555; x=1725034355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1jmXMGgCEe3vyECBk95vJ+hBk5w1rZzr4yvt3CADUo=;
        b=PhvH2wxCSSh0dsRZZAXfdjxQCLc67XAgVJVwXtnv0jlT+QA08XqDQAnBEiDiRvWEDg
         r747Hgv2GDHoW2pxE0eAKjVDm5Wqc8Gun2Xd2Cso0C9VRZ3sJ6QwT9RCna4blK7bgM+Z
         UhnSvhkRssq3ulksM21UjWPtnIg+N5gC3JlvrLSoVf8u7CAX+uMDI/x/yuYbQpsWZfj4
         SFzn7H1QOQyU9Za4K9PP6WqqJCsITpxgj8lQttIDQfMAmL8Riq5NP9dPtjxVREox73ak
         dnPQqQBkXOZqlrTSfvcD1vP6hRJdrtYKQY/Aipi2FCVIrTTmF6lPr8XqqG2h0IBmcSXw
         eYQA==
X-Forwarded-Encrypted: i=1; AJvYcCUlrtNuvALpJPgN68r5JBfnt6E9daofN95ZT8ddrDra+9qeCuQsRw8akRfYRRGRM417We6nRRmmYffV0Ka6GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKGeN2lYXgDEFERyk9mDqVbZPNRkHdX3hK12wKkO2uYgB6amjn
	D9LNvhc3OKHyBkIPFxNvw1TGSDUMVs7/Qf+jehvWhE8ji5pD76epdmELgKwZ0fwh0fnE72sI4i/
	BgON6+3kN2Dt0ehDNzDvybgNOKZwmis0yFTkR5Q==
X-Google-Smtp-Source: AGHT+IG7mSCIWYZ8bpH8IAQGda1ENwR9WbQciD7o/G7QbH41YO9wcFnvMe+Pbl1EVS7OeQRr0SFN9rrPBxhDD4ALEaE=
X-Received: by 2002:a05:6512:b22:b0:52c:ddef:4eb7 with SMTP id
 2adb3069b0e04-53438846f4cmr2471437e87.20.1724429554337; Fri, 23 Aug 2024
 09:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
 <20240811-dt-bindings-serial-peripheral-props-v1-4-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-4-1dba258b7492@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:12:23 +0200
Message-ID: <CACRpkdbaHqJfK7989rx8OaS9mpmdYO2Hpna6dUty_fDgYa3chA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: gnss: reference serial-peripheral-props.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Johan Hovold <johan@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Kaehn <kaehndan@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_091237_166586_D86D995F 
X-CRM114-Status: UNSURE (   9.26  )
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

On Sun, Aug 11, 2024 at 8:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The "current-speed" property is not a common property for all GNSS
> devices, but only to these connected with serial.  Drop the property
> from the common GNSS properties schema and instead reference common
> serial properties schema (for children of UART controllers).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

