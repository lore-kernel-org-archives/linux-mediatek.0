Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4360AC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCwKOOcvZG227KNZBJVAw0tdRH4yoYqx+lNqD4UHuvE=; b=vyewosmSSGL+V7Ia5+B5No16EP
	/d6edlH0BbHyDkBGG3HtbF8zQn7lGAfJ9PxiwkZQQvP+daYkLZ+/cAqKNvtWHEIuOMxXCa8sa03jp
	qe1PjnxZUJ5Wj+u5XVSAVUHvqBY3YiVihgIZNHfabap+/JWAA3MA2ZwZYBU7Jp8KiRYVKVZFvReaU
	eW7dw56uN3MIunalIVhhvxlOxjZAhl1rMbP8x7ZIXBT/X/kXWTOAMlmrGt+3bBdk2NRtDFJr0gU3L
	3HYFesMqzK/mxDivDNc5X9CUr/h4CTtrjynlSQ9c1ocsIuCHIbVxJmCkFCq4Ms1xk1t8S3vRF6/I6
	HLJmOJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r82DZ-0060Uf-3C;
	Tue, 28 Nov 2023 17:49:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r82DI-0060N3-0J;
	Tue, 28 Nov 2023 17:49:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so7807056a12.1;
        Tue, 28 Nov 2023 09:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701193774; x=1701798574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCwKOOcvZG227KNZBJVAw0tdRH4yoYqx+lNqD4UHuvE=;
        b=E62Gs2jzH2NqBXRn2CNd0BBaiMNP5fLCylvvMWSZJT+8ssrjEnhTNf0GZppwfvz01m
         fm2cUP79xqSnPNd9GuMt3A5KRy37XX73jM7RN1VwhdcGSyyNoKdFSyF+jJsi9E+TI+S0
         i/6y8E0EmQ+FXbijBKrdUjpIR9edEq0HbkjVCI/5TZJM/3S8DXSeKCRaLhT3nMA0zH0U
         BtgEVNEjcu4JcnSVkboEpMyD9w34yi3qT9JMGV2gLni2jS/8ZYZEYTGEgZVzpnl+X4zj
         SrrLEnTSH64dx7EEmb1GEYC1HvID8c6oxZuCee/WjH81cvdFvrttWQb27RShB8Q2uH+t
         7w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193774; x=1701798574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCwKOOcvZG227KNZBJVAw0tdRH4yoYqx+lNqD4UHuvE=;
        b=XYQEbApL3zQDfWZZz9Dz8KskiAdi5woDnvsDmrUKJn0rcMH5U9z6x4YhGCG1Px7xc6
         V/RaMRGNg+SBNQ8rsXee2zqzrWyEQQnxwV38GR9lUpI6vCYZd1mALTm0+TeOk4dqmhly
         +/eUxgcmB+eji6l9a4/xBcMcHm+1UGh1qXBAzlWqwxBC8wQoo6LbnLfzNDhN2IkS0DDU
         szzOlVwFDIcGVpzay1BbD1UenDNx2dOSGj1FuoKI4aRi+vjpNPulNCBM6eM0lFw1ZXQz
         Va4XU9wTi8rdCpITuafiDKYBFgQ0+dxbYji0Y3lTvJN+PoyFIQo8xO1Q0g3iKGNnbgGR
         Df9Q==
X-Gm-Message-State: AOJu0YzmvluDfnbfohGF7zFkoT4vDnBetJHSyR4dnOibfHhKsnZXRrrD
	sr/WFXhLAhn4aOu+zMF1Go0=
X-Google-Smtp-Source: AGHT+IFv+IODDHV2aUyGCP25pWGTd1fOh8jm9JfU859xNG4T5EWQ0fud734+4RsoprcqhFPRy7x98g==
X-Received: by 2002:a17:906:3a45:b0:a04:edd6:dea7 with SMTP id a5-20020a1709063a4500b00a04edd6dea7mr9353671ejf.7.1701193774209;
        Tue, 28 Nov 2023 09:49:34 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kh4-20020a170906f80400b00a0ad10b3f68sm4836490ejb.205.2023.11.28.09.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:49:33 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pwm: remove Xinlei's mail
Date: Tue, 28 Nov 2023 18:49:24 +0100
Message-ID: <170119374438.445690.8441934091500162620.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123134716.2033769-1-mwalle@kernel.org>
References: <20231123134716.2033769-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_094936_137995_BD362B1B 
X-CRM114-Status: UNSURE (   8.60  )
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


On Thu, 23 Nov 2023 14:47:16 +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
> 
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] said:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply to
>     RCPT TO command)
> 
> Remove it.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pwm: remove Xinlei's mail
      commit: c7861b3ffaba39021968505bd6807bf4fa7148c9

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

