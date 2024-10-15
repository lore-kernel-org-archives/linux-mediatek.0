Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876CED20681
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 22:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q33cEmI/j84F+eXCAHRSsIHqTE0TQm7aU/4/N7XJsL0=; b=2bthKP0V0QFjcWyyMBWYObAAPM
	G8+/vvd254otYmET0Zpb0LkH2FG1sXvOzDwVVwg+yPWwheCrC7zAe+/ZXj4KgvoGeBVFVARQ0SK2X
	Si3t0Xls0w97cLg+5F22ab7gKbAetCGXO2l36qjVgcMHxjYOB4f/tbQzYUXsLu9lkd1WkhhAqaCpy
	WPnDwpB+vM84Xms0PwQ+YAsF+9wp1xeu6BCTW77Oh2n+GYabbJIeSvV1RTLTQzdzZgzHi1K64UYN/
	o7b4KgtWFl+s0WqFa3/FUlOIaiikwA3s42THuSi7eMYnR5OUUPS41PiqOeIs2LhFkgF3RqoXeCs8w
	M1jEYNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ph2-00000009kyn-2fi3;
	Tue, 15 Oct 2024 22:07:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pfW-00000009kjZ-1zx0
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 22:05:31 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so19200941fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729029928; x=1729634728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q33cEmI/j84F+eXCAHRSsIHqTE0TQm7aU/4/N7XJsL0=;
        b=l8i1SdxCd9NzxEtN2QkfJhyRwjPijZFJAa5QYKTz9rgyoJfu/UcSa3VXJrLn1xpvsI
         IiDFbxvpIdUiBjzWswwG9TVe9X0DnWFcx/PzfuqYFF+HbDctbnvAFhxhE+74ijFokkok
         caNzgFZsVUl36QxfwSEgp1RWAupleov65qXjkFLfa8RY10FUg3viEivaeBbmabeIy+8G
         3PW62NKbD3ntuS4l6poofF8EQbDmpXll8+4Ykm3SVhWNpDO5lmuId9e73KN7/HIoP+gJ
         041i2oo7P+/t6n4NdLuAT90LrSWCmlc+D1OFzVUAwlPYtQv8ZY1kLuN4rElrVNl6ZuX6
         SUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029928; x=1729634728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q33cEmI/j84F+eXCAHRSsIHqTE0TQm7aU/4/N7XJsL0=;
        b=ODNMzqWhPDrLzA688Xo+GT1Iep6UCrQIQoxwHI7ftOIR3VjTwZEJIKsamZJ7kzMDRc
         YhWEK7OcbAPTW4V1Sq34/7AydwwqMdRubTmEZTUtH5ofOVo5y4A3UEtLepYEw7icPZl8
         q6UzeZP6d8DuoDFWSvap4YPKIhlsboMilfc63yxODdfAlINssS4Ab9SOuVnlS4qbXBNk
         bIlmRzezpqR7BZBkdb4FpQmWZ4k4bu7cY5bVxeSy7TNHt6fs007Acj7g4v/lFVF753s+
         mt9+7ynD9KedJPowChQcXULyQwiqSgIFbm/fdDjhV83wYlJckRb0nNqpNuqsUaUgamt5
         gUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjHDBPSqkObP6LkS39SU3wBe7qMmChDHelaLJ4Pjr0FwA7zkZkMKNLbOESErt23+sQ3GuJK0y7UmArBTBIuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0GdL3NRNpak2hXrGIyjN0/sItAyeszzegNLPvrqHEPYDz2v50
	mrtyMJYzHmlbBfSOEvZ10OPPWPkhQw6l+HTGw939BQKi6NMp2rjcwYyGPLD4Ert2FQKmShCVMSe
	h7VmbKCdB+RZ10/R13nF1ZiAY4annGUV7Gm8Pmg==
X-Google-Smtp-Source: AGHT+IF03cb3/7b9UM1fIbkFJy1dyGBVueuDgpgdJXRaUwxue/1nc38avBYoxfonEVSvewytqHLGzNb6oa/GzyRjyF4=
X-Received: by 2002:a05:651c:2220:b0:2fa:d4c1:3b71 with SMTP id
 38308e7fff4ca-2fb3f1b40a4mr57294191fa.19.1729029928322; Tue, 15 Oct 2024
 15:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org> <20241013-en7581-pinctrl-v6-2-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-2-2048e2d099c2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:05:17 +0200
Message-ID: <CACRpkdZzfHaf6+6qJ4yKACpbYd1=j-mPbZ-YX4Ku881rp-qFyg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_150530_713830_00541C3A 
X-CRM114-Status: UNSURE (   7.22  )
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

On Sun, Oct 13, 2024 at 12:08=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:

> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

