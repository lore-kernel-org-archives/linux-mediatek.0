Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B76EE77199
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=; b=Dg77n+m0HVDbyXS8uLbMH/uHGd
	Kah3hHBK4IN0Gp9Gdzt+Yn0VfwHkBdZncgvOl9xHgjSnmwhBLhNUR7GF/NjSlKmHCWUCzNKwmT5hV
	bPvW6HE0mXj+/I+Hb2LvHhnVjY95BtJummzusFO9C7VHbOGvU7D0LFW3DpGcd2gIjzo+C1SjcSYQg
	TZCe9dXPhvvS4jchM90kJrwkR8fCHB+wkod56Oo2dxe/3uXXyQDZxgzHzMWw3xO8umf8vsE/4CBfF
	7EQTozemjnYm7T0fnLIRn8fs0jnNYTyqvehCVMp0Dhtune3KRXpiivkfb2r+12QwajXA7pp6/pTyi
	7tM8//Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGJW-00000006G2P-1Qs3;
	Tue, 07 Jan 2025 20:36:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGJU-00000006G1O-0cqm;
	Tue, 07 Jan 2025 20:36:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21649a7bcdcso228482315ad.1;
        Tue, 07 Jan 2025 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736282191; x=1736886991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
        b=ALUD5BsHGXSdFBtfr9C0vUqAJCuGOdqsToXlDRwtYcrO/3GEce17LQj5aQmnmua6MG
         qI6Hm0MlhIDiwYgBHcfxykdHfGV/zT4/k6lTm89lCWadExoOYmL78w64Td8H/d7SFNCk
         nOKnOBl8N7i2cxOLm0VN4J1wShzfB4aXnbwRlKQNckIdxACEId3+rBHOJSK5qMQbVo3p
         uyDRg9T1NO/xcH1Yf8LfnGDy2rwVV2Po9MW4Upnuqwov4q9dMp6h+024zkPidGxidYkL
         7bj4sYpC0bM4R+6LNpAVjDbkGUyUKm2/B8n/7ExNx6mR/K9ofakwDYeLYtLNWe6lc4UE
         1S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736282191; x=1736886991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
        b=oh+sZfALZ3QcrAKw/OnImCQxDuguh0faWrld9DnjcRdwjppx/62+brWhZfrAGPZOem
         FNXpPcBE+25hTNsTQFyNWAGEI2bUzeWxLYi9Hemc1sPVzVXuLQGZ9izb0qn9IMVFLe2A
         qWpHOz7fQhEGofdVwKeZHvklsNFKJ8vnHxB80QwgSHtm0s9sgWQSZGx6SiAYwsvI4WeL
         Ystog43hSLI2xL3cv52OiGaTGFEFGKHphOf3yf1QjW6aK3H0vfAEEyXPpwnhjFEHDYFo
         nPIqDDoxwZPedoHDrl0FDbfBmrz6aGocKDhnlK8zufJ6JG1pNpND9eZmxnJOHNxk92JA
         0bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU42osMuUYQmfh2FYJFn+Xrs4s3f/T8xmuEIvnK6GWXmCU5Yh6iyv5ex1RkZwJ5L3a/AYJM3k3zHDCrvIqIqro=@lists.infradead.org, AJvYcCUCT4yBoc6TWWFWnn+0x0zhpMnByMW5PaOvOCAIyjAX505u9FeH4U4yFYrZWgGDNQe2V87G++Z3qJPTQX6J@lists.infradead.org, AJvYcCW3yGZYxCQqPSf+tpgTKeMBLZRxoMlYg7dzOsJF7BzOIfpED8FcMX0789QlT41eJ4JCB3S6lgo9FrGEEXwLBbFLXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylpO0AsmfN9GsZEOPW41K57B4pGxG+ByoqhdqC1SCBfly3Xz+Q
	OESRMpgLnnsPAMS7RUYrAnmEEvLVR/ShcJeQR5qgcDPSxIpNf1d+65eoUh9q1fdbJpPMlmcK0G+
	Ka837KSLPTvI6oJq2PocndkUoOOs=
X-Gm-Gg: ASbGncuUvVpG1MF5qbjYUbfRh1bE5/rnqmG3UZwwU8VV+VusqD4mqL+kOuec37Eqhvm
	eXAwFm1+DfFLzaHhT4V4ogaZDLFP2YWUCQA2XsAdw1qKvcEk5I+GX
X-Google-Smtp-Source: AGHT+IHgiQDN0G5/PdDd430gJpVrEIqkV02owORB8V1V6tlHZDq0VmXjlHDjVTSTRjC3ezsidQtyveZkFyttC72Msfc=
X-Received: by 2002:a17:902:f70a:b0:216:8319:2949 with SMTP id
 d9443c01a7336-21a84000ae2mr5997805ad.56.1736282191527; Tue, 07 Jan 2025
 12:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:36:20 +0100
X-Gm-Features: AbW1kvat2n17hvPwDrGQUj8U_8QFAMpbYP8hJMpXB_xRYGmIfR0aXMkOm1WMYyw
Message-ID: <CAFBinCCqekcg75YPnck5NEiLftpiDR5KhX7Ngc2xuRKpbMik+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_123632_191850_EB4BCE93 
X-CRM114-Status: GOOD (  11.05  )
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

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
For amlogic,meson-dw-hdmi.yaml:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

