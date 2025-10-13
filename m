Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1FCCA476
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 10:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=; b=2EEYCTbT97xdTW45GKQcjvAYab
	55t4vZTWPGm7/xb3zWOAJyounMH6JpyxFqVv9Trv0PraEybTSFMBssms3ILa3RMQgmiAstGDizlV7
	7q40L6MT3KFYi4GZtRUSiyd4pQI0NVGx5oHDryIFGUMYsH0vkEoNZqQ4Y8nzCIPiNba7BdDietWOE
	BPhPyU6ar5l4xaVHv0TUxRvpj+gaKTmnSbm/EKaDu7N4LdWlJHgtOxQR42vWGv88BWpsE9isYFHuZ
	uXHKTr77uh8IkoL39ad0rVcfwXWUjZ6j2Kss0E2P1+zgMXN23ygM5SKro8GQI62KD5I2jNeNBbzsl
	Wkd7+rEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FUI-0000000Crb8-1he0;
	Mon, 13 Oct 2025 10:09:06 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FUG-0000000CraG-0nYF
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 10:09:05 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso43399911fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350142; x=1760954942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=;
        b=al6mtLWSSe3o12wplLJf4KV4DKTQ+O4d0yXO7OeT/XweIMrHfzThUnsjaRuHQ6CUSm
         ZowLS6zVrqWRV6Kglz+wR/pdi3s9IYg5YsjllQBJWIBI1lbVTmTfLxk3qd68dnHzE2nh
         cp8MA9UW3T2H+SYWIsD7qfmXYIQg0HdzKEAchyrQLdLCrMsSFPVaN/V6yE7LUqqC6jz8
         8qIkaxXYXS2SMe/f/6AZBF61/abBctKKNr/7IpavW8ZYeYyVEaJzRMUqvE0afxnID9e3
         YXwJ5icLTDmmAbwtEt4HUPh/jzZyfPfKAeJPk0T9G0g1Y0HtQylTH0GBC/5LSLMPBJqG
         IwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350142; x=1760954942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=;
        b=VZUEUcqK2Lf9EJKoT1VqvvnwCSs0AsZxiB9aYe3tDhW48EYXzvwdD7Gu+rZ9ax2fsu
         5qE/+O2xqhwdD9kc06wqkfTt1dp5Tlza8r2D/GTHGs/EeBbFiFPxSgotsizzeRHlEh0E
         gkqg0XMsQ97I1u0JaWGEnq1RfRvU7zeBaTgvW/v7PS8GNezxiZXb6gvLC3CnyDvITRqQ
         DSjHg0wQbXmsfVk9pppjmvmlvAE9Z+Y7LNpOkXckDkvYyZCd37wyfOegMVee9JPMoKzW
         4G7/dk5gRuvtjtmKgRnPH0hIrbvGefjXkgeDg1qfMzTIXe5dqorjJL89wlOa9bPjVxot
         6w3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWH2rhfXq/xXaPCP3Tw620anChbTGGO9+pJInhP0Ncnk20yDE1/I4BWZuA6SE2msQqeIrou/7PbfI6eeF8Lzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY55nqJenNhUmBCjhw7a0pisfrnj86qI+vXq3rK5UgBHIw0mD5
	jD9VBwzpGyE7zyyZbXEQ+jUdtObgGMnIH+4adhCahsXu96WSCmQDzamnTUs2ck4jcDdqExFE5A6
	EbtYZUS2qNX3hdDxet+XMYRiNiAPcvgv8dkpkVer26g==
X-Gm-Gg: ASbGncvinuBQ4YH5Xk2R2gWwMVs3B6LQTpL1oy3gcZ42//hVHCvJcTR7u33xoU7riGZ
	nOWIQ49/LMana+G1Y2sY5byJdaAE0RiNkjsOxJ3vZE3eyuk68fZXk7U1Av76KLEXP+4EHzUfgHF
	SSuhAEcM0IkF3Wj2HSfl8/pUy5M05SERJdr0uuQGmyTga30HndZHhNj2BcFhlXLnYws27aQhpiQ
	oGTIBDIUEboLtFOqe/NJislbxxk1paatJGItqOM
X-Google-Smtp-Source: AGHT+IGw5FBPHMZY98OuHAGpmxfzqUBjohFZCP4Y+3ye7G2Bxk75SIlnTIXF/kp1jPOVfGXssHiDF3M9kkzcVBZy+WM=
X-Received: by 2002:a05:651c:4385:20b0:376:41f5:a709 with SMTP id
 38308e7fff4ca-37641f5d53dmr17660371fa.48.1760350141633; Mon, 13 Oct 2025
 03:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:08:49 +0200
X-Gm-Features: AS18NWBxwqEgY4X_LszokVA-g-bopo-7ZyTrk7rGuaWxNocfJ07lm54aMEbkhdM
Message-ID: <CACRpkdbvTfJOBKOaEjje9dhnnjMXr1NqWpVBspe4Y8_WphaPSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for mt6878 pinctrl
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_030904_244377_4101C5AE 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Igor,

thanks for your patches!

On Mon, Sep 15, 2025 at 2:46=E2=80=AFPM Igor Belwon
<igor.belwon@mentallysanemainliners.org> wrote:

> Igor Belwon (4):
>       dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bind=
ings
>       pinctrl: mediatek: Add debounce times for MT6878
>       pinctrl: mediatek: Add support for MT6878 pinctrl

These three applied to the pin control tree!

>       arm64: dts: mediatek: Add MT6878 pinmux macro header file

Please funnel this patch through the SoC tree.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
FWIW.

Yours,
Linus Walleij

