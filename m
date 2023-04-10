Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849D2C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=; b=ivHXveb2EivPRE+DlpkC1xEV5R
	Tqy5pDNC3GcvDbQYNknMkYdOVS5YGg/QQEassE8UAe8Mwd70mvNK7c8bucUa4JtVhBvmhfhtF4w0w
	7xHuWFV5Mz4LbvwV65z4UWU8x4doRJRTIvC+NQ0jQxy8IWpjqnfCxej3YlyHE5GtCJjxg/tVZR3U+
	Qats4VX8jygbDEPcRb6I6eG6ycNiQJ9xFWgGVwL3KQorZbCU5zgzuEHmn5dfEM0ZOOlT55oPZBe/k
	i0JGc2SwMIa9IhkrE27K/YUpRhI4xnDz8nN9IZQDbbLzbFC7w8BMsQqn0/IiE3FNjtZAmBDSN28Wi
	LPL+MrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plkDR-00Ebnz-1r;
	Mon, 10 Apr 2023 05:37:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plkDP-00EbmL-15
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 05:37:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id gb34so10323294ejc.12
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Apr 2023 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681105036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=;
        b=whrLD5VxYI35os9KEqHHxKa9Pszo5bo/r3L1orZhvpTq+fxiO2jOFNxbUlcI0Vs3GI
         p3RauP4xFlUGVo8P+SU0FAjx22bxvxCcnObAMYYRyICpZgnhTXjhA5DCU6ygFH4gKuyO
         eXbdDoA7p3M07jbTtohEJ2v/Tz9VjHr6a0oJvdDrr7ejrHUVk++XAtzWb+z2In6SL2Gl
         t5tXQY/ajlwSp4Lah8lGP7hewVhzXVhK5MgiJIM1jDOC3z+GFlsAzATc7ylW+X+YH8So
         id2qKF0m1S0qz2zyvyjFzxEpK2HPsFYVayvCP8RJW7o40S1Tl79GVKw4kmsvRGVPv8gK
         DGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681105036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=;
        b=q65bPY0iKNX62z8pojWX7xue2G8jNwV8aC9OnkbGvVspmZEdWofGYddUbUJF7F3QWc
         8Ra9T3ctJjPllWc17owJYX9pfD4/D/V7DYQWsRxE2ztzve+Gv+F29GoxdSomgc0LHjWk
         H49tYUf6dfw8MyhnNzkxk8UCty4bw5C/lSkQ8YjOmNIe8/r1KMF7it8vzaeJOib1EDt1
         /bWEcyEWZ/FtTbWfyeoX08Q3rq4/v70O2P8Imc2iSFvhIEEwHHClENeCCzBm6rZewwSz
         BFoxYXoFoxueD46USC4TRaepeE7g37QyD+lchD8e/xnpQshF6ogYXZd7oA+FA7jXhGbM
         c38w==
X-Gm-Message-State: AAQBX9dSQGwaatOyndKM6MU0+ZCRcWQs/zAhnkTYoJ1BqVjALjy2uSSV
	MVHtt+aIGCKUv+byaWHFqMP2aw==
X-Google-Smtp-Source: AKy350YTLowzB2oBTshKq4rUG1CwxaDQBrenUjB20X2/2en11DizxiRt7NJuVWdjlDxpJZAqRXbXzA==
X-Received: by 2002:a17:906:a043:b0:94b:5921:69f9 with SMTP id bg3-20020a170906a04300b0094b592169f9mr200904ejb.64.1681105036100;
        Sun, 09 Apr 2023 22:37:16 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906350d00b0094b0f3886b0sm104670eja.76.2023.04.09.22.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 22:37:15 -0700 (PDT)
Message-ID: <5d091ef6-0f4c-dbf6-fb73-f9f9d13af3d8@linaro.org>
Date: Mon, 10 Apr 2023 06:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback returning
 void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Miaoqian Lin <linmq006@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Liang Yang <liang.yang@amlogic.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-amlogic@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>,
 Roger Quadros <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Stephen Boyd <sboyd@kernel.org>, Valentin Korenblit
 <vkorenblit@sequans.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park
 <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_223719_436988_22D9D61F 
X-CRM114-Status: GOOD (  16.21  )
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



On 4/8/23 19:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

b4 seems didn't take my tag on 00/49, here it is again:
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

