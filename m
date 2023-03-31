Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD4CC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 18:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb6xLZTQTQfDOfnoLhLa6/IVI8QnMb1cauJ4IIp9pzk=; b=A7lkVn0GwybIT/DimBAA7zq1f0
	QxT3Xuq7Paf1AV01m7tH2jRCocO4EOkM852bGS543PyDwskmwMMSjnpW/gqjqz4OVPNN1UoJdLGGq
	zWgIcM/SHebsDwilKz6wQuQdlPw5lKW5UhGVl7B/4Gc8VsqGc7BFEnv5cYbwCKL71LFzP015A2HQz
	4dZMT10g71YAk2eNZYsrMO7PXUKMqIIKZ/Q1AuxWoC1XqwEyC34fw0p38IRyaFzKxBFxyC3Z0kCOc
	cmdkF+109aGdbKDzC//eFUA+24nyCtNz+X1HdOxXn0fIFDKV9NKxQMwckhywL6qKUxvULMvaSvUUp
	GMauJW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJlc-008VVv-19;
	Fri, 31 Mar 2023 18:46:28 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJlF-008VGh-39
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 18:46:11 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54606036bb3so266290417b3.6
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680288364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb6xLZTQTQfDOfnoLhLa6/IVI8QnMb1cauJ4IIp9pzk=;
        b=T8YJTdeMYbb5+drzr4PfwSAPqM0g2ur1tDsqj0l9TLQw8+V2H3RKsATUpFv8ILGFeF
         jRgBFoslWA5UWvvGMuGLLKHXjoEfsJxZm/z12TEe2Ri8mBh0nVkcqjnIuPrmYW2OVUyR
         SGb72wCQFq79qxru/phdmgHFLqNKp0YzEvHeOUu+3ej1ML+s4JtnpHUal4G1GDqGMk65
         yFegAuuOH8/q7xvzzcfwcOXRA32jXAxxKYjnX3GRrS/h//SZb5nyl+gqSulMDW+8RMYl
         P2hdl1o9gO5QKMKl9toztNs0lmlfUhD3IU6Y+rJlz3r0Mm1SGP57kPMihEtIJIH/JT1o
         MrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680288364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zb6xLZTQTQfDOfnoLhLa6/IVI8QnMb1cauJ4IIp9pzk=;
        b=gUkljzo7sEt9HvLoq2HL6i+hhBdgqRrPhYIODA/ID0GqC+XekMwksMsbGhUF9AwIZc
         NURdlaXLSUIlZlsvF0Ob3J7+Zj5w1bUiiq2APbtvXOdTE+Pg6HKMqiyZwr2f3aj5ZJsw
         KUv4Tbvi34ZOYeNTysHMZeX9u7LXPcu548Y/rQA9S6LrLQh9+mM2X/8/usX3++zWs5/U
         SlfoF1bPfIXN8VZyobpmcyTuAaG1RKt2xeRHrVHjmlcYHPVKZL8XRFTPOosTiQmhDO0U
         7xLSGHJ/UxU9tL2wY7daAEoXTSAahgUHExAwpAZ/vudaWWNbzGe3izcjUSEx0tITTmgC
         x3ww==
X-Gm-Message-State: AAQBX9fkH7WAZbpMTIgSl1wNRhx5CyraaIrSxc63/w8JWBz4Gnm44mvl
	L9i7BXygisSQE/fdpf2YtdKZVNvqXnC0FWJDO5M1Hg==
X-Google-Smtp-Source: AKy350bgwepPnwHMRW0YSZuNpQ8dtHQVLT8+IDDu10nrt86RgYns1z2FMH6EnSP3ABnDRvDAIqVyiIAEzbdJAM+G6zI=
X-Received: by 2002:a81:ac55:0:b0:546:1e9e:aa01 with SMTP id
 z21-20020a81ac55000000b005461e9eaa01mr6163297ywj.3.1680288364273; Fri, 31 Mar
 2023 11:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com> <7hy1ncydtc.fsf@baylibre.com>
In-Reply-To: <7hy1ncydtc.fsf@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 20:45:53 +0200
Message-ID: <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
To: Kevin Hilman <khilman@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_114606_068332_35666C76 
X-CRM114-Status: UNSURE (   8.03  )
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

You forgot to apply the patches merged by Matthias:

Changes in v4:
- Remove v3 applied patch from the serie:
  - arm64: dts: mediatek: add ethernet support for mt8365 SoC
  - arm64: dts: mediatek: add mmc support for mt8365 SoC
  - arm64: dts: mediatek: add mt6357 device-tree
  - arm64: dts: mediatek: add pwrap support to mt8365 SoC
  - arm64: dts: mediatek: Increase the size BL31 reserved memory

...

Changes in v3:
- Remove v2 applied patch from the serie:
  - dt-bindings: mmc: mediatek,mtk-sd: add mt8365

Regards,
Alex

