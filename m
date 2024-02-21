Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE88CC54788
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=; b=bpzeLypjWbuokSGzgptM18T7zg
	38/XLYi5rKMTOOng57St4vOfzdS1gqlstDEhlF+P9vw+ISYHIHRJ7k+CTQJ3h/9WCiqZPuE+PMXns
	vBGHhW3mIOuYw+P0UKDLhxRrOXaOsXUg1sUCpFO9i5MG2/mf6w+0SC8PFIHpm/kuMPFMJKBqiw6Zd
	MtvC5vav0Prr84ZxMKWAZGUNVYHok6dWTnDn6X9WtaJDYVq03ew1oLmJqojtnSn/zF0WsYpdPdno0
	+hLqM7SLVI+Z0i8FPf1yk1QP/1yzap5PeEmvoEIRWwAXPJ3zcw2RxSvK0LgMIV7MCyrwi+VWXaQAu
	L6EFaFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcukb-00000002kgJ-3OZH;
	Wed, 21 Feb 2024 22:07:37 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcukZ-00000002kdM-1csa
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 22:07:36 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6083cabc2f9so38854437b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708553242; x=1709158042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=ShOH+i9VvWiBCSwGmXJeYdc5HZfdesLRn2b0k0Uoj97VM6W+UiCL66SpGAsvUVjrqL
         0km+RQlmz4tBAR/fg9iQ7s7qv8j7GcQuPMFbddZ1M5i9dLnrp/BONo7nkzE1UeERqMKh
         EZkKJbHiD6jYZf2vEObKn2FZhlCjXSZIet1MLLqlbNoeo9yE5rqCNrfPhTQ5mzAQ4DBp
         Yv5KM7vY03yKJ+4TbMy2Fu4U1tAQOlAuL7w4GbcBAwZ3SbTVMJJbK+a5KQoHk4QJCE5M
         tPg3l30FnwTWZHC5F83/R1INaiQamCbgVqVCN15hvKxT6Y8cYZ/8h5/PSoHCoH8HUpGF
         5Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553242; x=1709158042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=ftfeun7yRxLURRdhegHROtYtq+nyJgLQPAkoKTMjdkIzlpbnFLH3UIG1LE+32rPTz5
         D9MSSa/0Q+vT7wnqDCF8xZAzTreKkbJoEMrX3wmwlNLaWnICHczDw2sVDbAStHPv7Q2s
         M5r+WOm2OyNmscZ3CQXr2q0dGECftQPqNCfwPfq6iE7b/vUS8eFLGC4+h4kh92JjfpBC
         3+CBLv47K36DnRsEiVXZ0CCtYqs7CDqXdPwRYoZCiwbYwDMn5bJqiM/ZDcYcRAYtNPWF
         cakG5PHrGfVBZYaPubvPfjPPHwvK4T1X65t7+nElycwWySvn0gzG4WnLPmhn21EefEG1
         ZhwA==
X-Forwarded-Encrypted: i=1; AJvYcCVkZBEuJF2vfYVpdafFfqKJPfAvQeUZL+4SVQBAcXVF/9GvnIzgaaYpFViFMF6trM5Te7NzvXHT21vQUgOD+yAgjDbWoY12Tczed05JuHx+gSrE
X-Gm-Message-State: AOJu0YzjQ/GXaZvXq2CRKMuNRJfd1GhGZ4QutodlM7cD6G/j4FZCt4ce
	D5Pv8572YQShLhBp2pussSjL53NMoh9FXOuJcG3gFrndeXF8+wcQ2Pf8+3a3C/Y3Zry97ZAlUX2
	Z9BDgFiCCYdc/PA2W1/qDfCSosm277sD43mbS9A==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_140735_454127_5198B1EA 
X-CRM114-Status: UNSURE (   7.28  )
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

On Sat, Feb 17, 2024 at 10:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
(...)
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

