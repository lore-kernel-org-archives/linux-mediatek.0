Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A4BC982C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=; b=1yN0cctcB+iaPNHp4iMcc/832+
	jIIBQm7Bterxy18dL9+y1crQT9Q756puCoRWf2eMmkFX/t4kJTRK/HC+Y8wMvkHqQsD37DtIle1dE
	I6IgSH3qw8oy8hh1Jg8JpkVflRvKNld7ie4H9Ofze47uyjTMeKqRqn6drod7+fvry26GyCjK+rxDS
	itMG4fV8ZEHCSK5GmoHp2YGUFoZdY/69dlycYbhLQD7TYRkyFXdjUNVAQcDsyj6H7aGuHDJdv4qnA
	n2s39zGPDq0M8vVDbcZwSm8Nuog8i2hVFATaID3HT0rppLXdV8t/MLgJmJ6dK0KgmA5mRjM0JXyNa
	0m2gqXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tKK-00000009rRX-48Kp;
	Wed, 16 Sep 2026 17:21:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tKJ-00000009rRB-00dy
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 17:21:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61DA460A56
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 17:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41C31F00902
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579302;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OtqPa6xWTvZHahphsBKsXSM0vVDuwyyQDfeMMeeEdCwWUcXyf9dlKeNLwgs5z44tQ
	 WrEw0/lFS1kR81AfTFFl8gO2WD8ymB6OULjtt3mMaSrQZ/BLplGiHqg2ZX64o9jZyv
	 lRQjurrPvX6EHDlo/M7bJ3vybpD2OkTMf18ZzfkBroMKIYFxdFYoOBO4SqZXkxmA+m
	 5H66Szm6FTlqa6jX0VplbsuV5ZZ89DhiviBw+u3aGEgpG3N7+v+oORv1usu/Fl+caa
	 0oDpvEUV/RUY8fvpDeaGcVR6CILUMSDmpvRRSbahMAfV/wEskXbF0UkH8q4fFAn5zH
	 6D4yaBy6bTqaQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2387078e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 10:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOajMFUroo5FQfSnypCQfA6BGL7sGd6kVd+UBUeLurXqyTlfr1tWxfIKl+zcov+kNv+xbM5hJNeX/H1wYB0Q==@lists.infradead.org
X-Gm-Message-State: AFuF++lOnV3uDl7xatwkyN/cZE0hq4UhVAEgNzTCw3V3oncqevBP5Vwi
	3StpuO3J8CxHhwynWMrJwPOLbdTQmIxBM/dE2tasXeTUcVBzbYzUNSTKtvksEnvn+TYVORcXsei
	Xqg0jLb0ucFoIOG4J6g9HiE/VGucb3dc=
X-Received: by 2002:a05:6512:6883:10b0:5b6:172b:7ba1 with SMTP id
 2adb3069b0e04-5b8ba5d1a82mr67749e87.9.1789579300578; Wed, 16 Sep 2026
 10:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:21:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
X-Gm-Features: AcwNN1WeMHFPjUODWxifW5uhfKTviiZfd6OYXXOq_JHN6cgG4pckjp0gwgbXDp4
Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 13, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

