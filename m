Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFBBC761AF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHkwTuEK0sRBaJKLMcnB+ss8uWVVS2sTLaR7SSh4ZeE=; b=ljlYpcE0ASFhfGY1ZaeAZLsxAb
	nONaHZcWT63WTh7CpmS+8psFtMd5ux9unyhGAsKL1FOwUp1+3QvortQ77LsKwCJX5ClpkMF/GPAde
	lmjauyZh7m/3r3ivd8Vm+vuHx3Wz7MyiLCxVOWuOZ1fnS+2E6kXpId3v/VUW0IM/SlB9UgPmjTsl4
	u5Cex1tTYaZRxWCmxt4v9EwbGbA7a+aWdtLYZHQ0ruPUCHxZgBiK+J9feoYh9TyZ+XE/WOtFuP46t
	HhIsuOhF1tE7rFNMu3TsfIT5BV9FDClMDpP/O9oGK4PiYxiVrj9xqzUHeIdfqAcSTQ3Ht8hWKy08D
	D8PmiSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjh99-001dmn-2Y;
	Tue, 04 Apr 2023 13:56:27 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjh8M-001czs-21
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 13:55:45 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54184571389so614868287b3.4
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680616537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHkwTuEK0sRBaJKLMcnB+ss8uWVVS2sTLaR7SSh4ZeE=;
        b=Qq5kv5hhcFuFy0PJtvFX4bmOosaBrR84kqX5KLBFFzUEc6HYu6DcRmucycm+pwLw4z
         c1uAzgS+6IfRZYHJk5KJGH6BUXWCXHUvONFdF36/iOgG9fJm+Or6v5c3zg4rspaHH3g3
         HiltUNh0Van26IVMA9fB0iQ/2JU4EmqjOAKnh9wB4GYotEL+CBZNtjApM3/Mvn7TE8jd
         7annxlm42iGSeOwxHaUKhpp00xjGstfzsDYvTrigHwC9433728mLS/XLnCAvVdN12kQr
         08QyncQY1xCydyx4nySCZClEtVlnx7zpGvVuhHi5DCP1Pb+uzJy0FxU1zuboEdb75qqE
         HUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHkwTuEK0sRBaJKLMcnB+ss8uWVVS2sTLaR7SSh4ZeE=;
        b=cUzKk3e+E2En31VKDk+1iFUVtW1VHHlaI6BWA38Xa7kXSx5Cy74sBoVVKOYNGtVilI
         QPZrPY4bgkKMqPWFI+J+kvHG50kIzCZHeTKTGA5a0QmCjLJrDt4KxBw8VNSDGSVRGtia
         mNhMBbf5SwAvdBePWL2wMzlVShKNL3znWtJ9po7uU+zKyp8JMTtIS1tlJemVGM6j8O6x
         1dJWdE1yvHcrmHxSLDnPIDnEPdaci57XsYOB3R+CuV6lZL+rxIfhMAoJWYqydUdJV0mw
         gRjxisyKk3vi/0J15FkPXWEYu/66cw3808iEBEgK/bpRAEHdG9RL8J50KgOXb9ytuXML
         Lf8g==
X-Gm-Message-State: AAQBX9crYBWTxodBhktr5PI9YwrB0TqIwHRQtlTAeE7vxotcIJxwi00f
	IhuHM1EFPgUOijTFk7Ya/619G3cSh7IALFPXDSzOxA==
X-Google-Smtp-Source: AKy350YrZFFIvslatnz6+JHLJxRXhURuO0Qe/CqTvhzL+6y/s/8tkJIoSvOoisaRTFct5e3xH8itE5OFyL+d4Sx3qSk=
X-Received: by 2002:a81:e545:0:b0:545:8202:bbcf with SMTP id
 c5-20020a81e545000000b005458202bbcfmr1485931ywm.9.1680616536968; Tue, 04 Apr
 2023 06:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com> <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Apr 2023 15:55:26 +0200
Message-ID: <CACRpkdYSpMD-V0QNGwtiKCA4KAedYfmFpvdCHWhjST9uTricTg@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_065538_695655_141ED97C 
X-CRM114-Status: GOOD (  10.01  )
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

On Fri, Mar 31, 2023 at 7:55=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:

> This SoC is able to drive the following output current:
> - 2 mA
> - 4 mA
> - 6 mA
> - 8 mA
> - 10 mA
> - 12 mA
> - 14 mA
> - 16 mA
>
> Then drive-strength property is set with enum to reflect its HW capabilit=
y.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

This patch does not apply to my devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Can you please rebase and resend?

Yours,
Linus Walleij

