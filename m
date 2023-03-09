Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vhxj3g02U6JfJorCEqukLhEPbi5ScM6y20Fj/uWtxsc=; b=De8HrBnigeWDxUbeeK3zC81dQO
	qHKIUbHSYxvLVdT36XnsqGw1PbqVQzeHo4b0MIRVrTQ+IuzAEA8JcXw9OUTatrMrwInfKCEWvZFP7
	89vP2URQkO9DT1sVS9k1ZwMMwbIZG/7+WjgzIzjetNGD+m+MpueONZVea005yz5CdaoGHb85rkEif
	3IjfP799VZNaHFP/dpkIchiF1NlzIlknbCbI76chHIJFoLKLKEZbYJdptHsfU46piG7PECNwefm4r
	d65d35yyLn0PyUADDuDgYyykF3DPI3LRQYWIDOERdC1Ij+AfJgco70r3KN7Nt6MysXOlRbMau97t9
	2T8ZsuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGrj-00AK2C-7V; Thu, 09 Mar 2023 14:03:31 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGlD-00AGGL-JY
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 13:56:49 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536af432ee5so37305477b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678370204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhxj3g02U6JfJorCEqukLhEPbi5ScM6y20Fj/uWtxsc=;
        b=M6OUagewNatTVBWogs7CL7Frl+ekF/MC2BZgxAEhzQWeyuSsXaRpkf4c99DXMGsgc6
         GIkzhUNU2BURb1j3QuJVpX9peQPez+0A+Lwv3I+Pr4W55I9ScaDo7aFhChRp0sadmIiL
         0lKL1TZ0CxVdMF8HoIQ/7ufJEuKA5Dra+MJuKUyHRmB9rs9CuHe4y70Qv5xVu1WwZK0B
         1vXdXtOHzSOCFokSbLcL3GvOf4lTYuXwXKVhUa8ogJNH81T3PpCdFdiMh5PpBeOSTCOE
         8RasSI/d7wlsztguwb8tqjCkoykqGh1gdjoQgiePJjOS2aABefBearXVltjCsf9a3xlk
         bqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhxj3g02U6JfJorCEqukLhEPbi5ScM6y20Fj/uWtxsc=;
        b=TVBt/l7aAEYpVZp/+z6VzQgkhhMrdeR4tJYx0oiu1bmMg9PKxNFHAss0C2EqU0apQ+
         AHGCVArgpOHflLU4JwUAP/UzxBfME9YvdPvfSw8nURN6y1j217QvXdlzeVW48PD3Ns6s
         m7Arnqho0Nl5CIj8bc+U6DuPBOzknM8d1RnjGlN8ROcrCjuBFwEDWC7vmp5yLcP331O2
         QOmtOdZXxDkalZoG7bhIDH3krPghyU5CJCH/KExqcDVofeCcu78K5/vrL6x1uX7e/UL0
         GzurjHhGklXq42CcOLrVnE+6gq0bZjguI5BtWniXABwnyzL1ss4bGOJX63ATI9KvmKLh
         bvdA==
X-Gm-Message-State: AO0yUKW988S0MD8fPy+ITNnVrr8mKGOLeO7HTTkfY3EGjk2NSkY8UgYl
	5anLeYKcKEUCHI9kYKGI39jk0P7hiR72KalUhUxRxA==
X-Google-Smtp-Source: AK7set8C8YjXMi5gSQYXdOX+ayCa5RjgmjqpOw5RNChqcaFChToV9jRVJLPT0IsYxq4ctbaJ0y/nV2OJRYi9K+NoTvc=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr13521476ywk.9.1678370204353; Thu, 09
 Mar 2023 05:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com> <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 14:56:33 +0100
Message-ID: <CACRpkdb+CQFOW8zjK2pGhRX=tBUcJAyVN=ohEt8eccndA2nYpA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_055647_668482_1945C827 
X-CRM114-Status: UNSURE (   9.47  )
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

On Tue, Mar 7, 2023 at 2:18 PM Alexandre Mergnat <amergnat@baylibre.com> wrote:

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
> Then drive-strength property is set with enum to reflect its HW capability.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Is this something I can apply directly to the pinctrl tree once the DT
maintainers have
had a chance to look at it?

Yours,
Linus Walleij

