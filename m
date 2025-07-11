Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613FDC83F1B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jul 2025 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=; b=ocIJgSktRXXfIgX1LeJ6ec0AIC
	5+v9Lqr9vnU6cngAsatFIVZI035+Mr/SEqjietn5kx8ueZbGXEAusztcurmRKu5H/1f9+nx5Bj52x
	TMVAdkcAUPOriVgHRkuLDwKCdXJ5u8N5v1uZONWODlGGAxK94/Sns2fk2HA/AsXWUmi+DGybDyaKb
	Mhnk9WRriJfgR9IvlTyf03YkysSg+v8mpEpYF63nt1AgEAmzeop6bepfvWjvFJMuCZe89O+uAKmHT
	+vUZ4jS4nv8CibxS72AtF1De2pHe2xLQkEIfh3kOfciFeTwle0/ttnl55iliIhNF5pgSh7MR0wS6l
	0kvLjW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIr2-0000000FaDC-3Ad7;
	Fri, 11 Jul 2025 18:52:16 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIcZ-0000000FX5e-37qQ
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:20 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e81f311a86fso2193345276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Jul 2025 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259038; x=1752863838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=JNbQh17DNRoaJg0xNsHHaHyRRnf4h4MS8rGUyTtgi6DYHW1nrCDhhfvRX/mmaYuJmO
         ekYdL3FGuazop09tq5gV2ICiVSEBDBPSAiFFx5iBe/pe7g7BTery9qP7ihGYKGjiotaj
         2PWckSNs0GIg86o6pyAe27f3MkFdi9An101x0nL4YDDdtLrQ+lWO0SCeHFcCPDYKbD6V
         SDheRHQWUXOeJsf9Tu+8UkP3/HkQ2Go/V8HAsmQNbmwMGa7KmK25Ng4ugZtTLUB6VNhc
         oS5x1wsjzq3BEb/200Ygk3eTX/Ih+MPEAMhv7vapsUQJ2p0Uxh+G6+c9Qf3POdNhgxDw
         r3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259038; x=1752863838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=KM9UzD/8Jq8APMwDjkczFgn4alMlBWJuD0TiPrHjSQ1rMlzC46vYiZz78kw0rX2/Ae
         +IL6AWYirsQPoFjSH2J1dSju33XbUZ/OJr5HsGcn0Ud0O1ubQuMyGXROs6/FwjZC1wj4
         gVncZBiy6St1y8cp1+uVmoWifCqom8k9heL9mvc9Xv/m1apKK03m4r1VWcBgx9AVQ4yQ
         EOou7UgvHhZw+XkdqKyx8uXHa/KiT0LLyUFubVCnWs7VW/DwruBv4c8Loo7iwgHWPTtA
         Sy38NaXGyhQGzfryJ3XfewnD35oPQHQ52S27YaN9lyoPTYi8PRmPMDLROHb8ThCP5nx8
         8X7A==
X-Forwarded-Encrypted: i=1; AJvYcCW2yjG1wl97rY9amDqEqMG+YnJve29Lea7CVSOW/XEnjSNdRHV15UWMYYxgaG7vldRrFzMLNnEoGtTt58eD7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWmimbai6rCO8MymegPE6zNuRMVXHIqpRvc5XAihp6i0Ry/MCw
	BGvaxpe1MsP3Kn52E0SWh6/XxdkMJWE95bXIkutNWdPeMBccy2Xo6qtIlN4gtAZN/XW8O6hO66b
	PxiGmBgdpyx/ONnHVmfd/HrbwIVywpsJUE4BG/cNecA==
X-Gm-Gg: ASbGncvPQGBrFxnDHY+6lUMoXqo79sqaCOfwd7Jq1tIAGvSxnbACvkS0MSBNWGla4kW
	AYMHG1Kvr/mPmPVYfp7Co63sY8UUzSMGP+7Ci2HOhxBRqUZk+/sX+ojZDRd8QUFGLe4aU4IsSNr
	FJ3+6buk+Ct1JHcZ62pM7KGN07kXXxK+mXqJ2WMMBlKBmoN5kC64vxS3udmQpsLnBEDotatx9J4
	ECNBDU=
X-Google-Smtp-Source: AGHT+IHzkdQtsARg4tgkPF4WasK2Xo6Mfikt+zRNsUMsy8+DUZg6XHckhgK5mt593KfRZFbjIPg2gYdMMhURtB+dxr4=
X-Received: by 2002:a05:690c:f05:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-717d5d7aa0fmr72034937b3.12.1752259038573; Fri, 11 Jul 2025
 11:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org> <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:37:05 +0200
X-Gm-Features: Ac12FXzfU1xcaSYLqYAP3dXdgN5KjaQup50oBj2gBIW6fBcQFAAh4KjvNIaCjNI
Message-ID: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113719_799434_BFA2AB8E 
X-CRM114-Status: UNSURE (   9.86  )
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

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say I'm a big fan of this patch set and it seems only
this patch 8/12 has outstanding comments.

Do you think you can do a quick iteration of it or does it require
a lot of time?

I am tempted to simply apply patches 1-7 to make your life
easier past v6.17, should I do this?

Yours,
Linus Walleij

