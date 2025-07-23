Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BC6C83F1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jul 2025 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=; b=Bj9tg5LAzhCK1KfrsZhy5B05/q
	LAf4lAncyrGw9lJpmBobX5Mu0FfV3WP4C8xsblbIdMLTC+5Oiv/UwqJt+PJL4c947E7Lgla97dc5c
	hOV7DKcSJ4SuM7kdy5AUbzSZpC1JMmhnIqk9WBEWGGTjtKBDer6BY09Jai4DCiezpr3DF79ehsNdE
	QRtuEAmVeGxUeTZFVp+VyTA8FhrBuTSalSr/SgxM8sduOF7y8VkbTEtKwsEUHLjBMuow0Z2eSmc16
	OpaNaXEemzcS8AqZYrOycFugE9NS72p465s73Ln74l8GGPzmCUxYuNNOFEz8R97qkXf7DFupjv30m
	iUteHSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXp3-00000004pYl-3Ssh;
	Wed, 23 Jul 2025 11:39:45 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXmc-00000004pD6-0mAt
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Jul 2025 11:37:15 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-70e1d8c2dc2so63681267b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Jul 2025 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753270633; x=1753875433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=;
        b=XZpfSJqzFmNL1dZ17ROjaV9D3dovJAl42hGsKCsXeYJTIn4Y2xHgOc30FN9/R0EFYM
         P5Q+gG3p5Vy0n7C/LMbAh/sZ21AZB0p4PcJVif9T64MePvpKboItVRxB6ruIBgDe/DAX
         JY77G85ZOELezPR8XeudYc6WmTzmtfrTAVwznjYN3TXdBh3ky/bTBHsY/p4Cj1HGp4FN
         k+sCw4C3k8yI+ADHrpTfiQj3zMEHrXHXMSRIZNJ7UmwRmxGJ/n/zdu266/0x2a5NezUD
         RJhR2fShdplP9HEbWkIIY3fJ2Cxe1cOM8wItTYpZyk3L2vL8DKc22TM8L5MvHCN1vfNz
         Gk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270633; x=1753875433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=;
        b=G4M/XFAvJdHVeNx2j/OR9XHpLE4QEwCIVTxd9I1kTatNTthOQaKJ8C2H0uq1620E4J
         kKGfxR4dEUUgvi1xRnFmG6PFQBW5s+RwTKRPD2D9O2LSiehgJnt8VWODHI8ka96sBITg
         3jWo+JBR0SESc0Mz/hGVp5Zo3GXnjff08CjTfR+oX+tIDXuqlHKwM1ImLmaPdPXHGlms
         Pyq9occLhgCs/r6MNJEMozm0qSw8Z/bNEadv0sdJgng6WTxnd4jR7QW2iInrnfzyZlcs
         vLrpyb4NjwS7KydHOs41Vae4X3K1cVChr6ujKp7XNOIyH+/VYyiuU3KWOXqiZb0Xo4QM
         hEWw==
X-Forwarded-Encrypted: i=1; AJvYcCXsQq7VFOj4m7UYq988prGMphkvnXqQBVk/365YKCnBzEXmDXf+nZlUD4aa7+Q20OSNmbcYORJAcPWL9I1kiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzETwbB7RD+Us3niLpLy9cnA2/O5rhevUtC+l3JPqXjuk9LmXY3
	OTFO7IPyDz36tSuE7e4FIPw+fuoLECYqEWghqgrNOGunCfY9znjXC8zevIIGfnqME96URhEHUrE
	vEzGjqQ8qTTaeLWuBRf2ZAnnro/b0F2epPQjWEccTag==
X-Gm-Gg: ASbGncvetpzywXwliV/io/vWxprTliBYtE65TlY99/7o97xZDsAm3AJKu7doWhORskR
	H53J2CeuqBv7ThiwrYhVe44tmo0wZDebSu9YXz0xHuoMWmh6Buw+4KYxisZP31Y1sK0Q8kdCsYm
	mSxuLpK87jkrKzS9o5BRqd1ZCq8boNvY7hNHHo7awsaJ6jVYAz4aRgNML2DZcevUbOwaqRcDCXO
	eTbfBs=
X-Google-Smtp-Source: AGHT+IG1u0oo2KG/eqAPkei9S9jpNUr6q6/qerBp5U6HD3spcuvFuQv+r1pMepeUgbYOloTl+BtEStxyrYSqeymqSxI=
X-Received: by 2002:a05:690c:600d:b0:70c:a57c:94a3 with SMTP id
 00721157ae682-719b422713bmr31267587b3.19.1753270632818; Wed, 23 Jul 2025
 04:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:36:57 +0200
X-Gm-Features: Ac12FXyQQsvM0KPvnjy5H8NAQhVs4FHmng7Wc1VHONXxXWNwFzyha3AMuITkSaw
Message-ID: <CACRpkdbe-0fQY7rF7u14bn4j_f3Qn7+thRzJQZRZBTadG9pjGQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_043714_225568_2D4AEF12 
X-CRM114-Status: UNSURE (   9.99  )
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

On Fri, Jul 11, 2025 at 11:45=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver,
> include the driver implementation, new binding document and pinctrl heade=
r file.

> Cathy Xu (3):

>   dt-bindings: pinctrl: mediatek: Add support for mt8189
(...)
>   pinctrl: mediatek: Add pinctrl driver on mt8189

Applied these patches, thanks for all your hard work and
patience!

>   arm64: dts: mediatek: mt8189: Add pinmux macro header file

Please funnel this through the mediatek SoC tree.

Yours,
Linus Walleij

