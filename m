Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3DDC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 19:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr3wWyppk2JO5cvuGc7OJNqcMG2NC5hwXnkMjN+yuLE=; b=PvDRQ2XVXDy+ws5uJfDt9Gd0zI
	bzdEr+GfadHV9z9Ul4uPokjvlbtrbeFW07XwNBK/M2LO/39TyHiWKmxCQwzMOVBGTNAAw8DKnUL8H
	xc/XiTz0Xf9fu8xrO2NeB5WDMh2RbnSa8VakNofKz0PfRw+9DZIU0zzGzT4Jgi8Uo11S0rpIwfGtu
	HfrKS5SqNyB+qxiqyHsu3A0cQfJFZGcd38KajOUXEREtGlq6vjhEUEDn8GrkjhBQYMX39fSaYyK1X
	IQdjC1K+dXGJLN0aGL4yVvmfqyJQ5F6CNTyl0vVT2tLTKRxbJKLlR4jEHfKPFrb/q9HAboEP9Ew2K
	oCDs+T9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYBPh-007LkF-QL; Fri, 03 Mar 2023 19:49:57 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYBPF-007Lf5-P2; Fri, 03 Mar 2023 19:49:34 +0000
Received: by mail-ed1-f46.google.com with SMTP id u9so14775617edd.2;
        Fri, 03 Mar 2023 11:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677872908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qr3wWyppk2JO5cvuGc7OJNqcMG2NC5hwXnkMjN+yuLE=;
        b=dM7YNG5EyQ/8OggbdbBF0081ERCTly3YGnQowiZxsujL0wvrDlmwAqBwIRJM0mHjID
         GnnGDaUYO9+rA/oRIwueLmoeuzjQ+hMAy571ToUVCqtJgaE72TeGaKqRQ3SCnjYpKQcD
         6HnnQ1/ZPXojk8ka+sN1rNGTKbuxIRMxWKtSzKkYOlRedPBjCi3g2HS2B+nwZKiah7q0
         1w+HikJz2Vsg2xXKyrmovmlAJor+QLUJ16dW3Y3yITJgiGuPEOVEmfYI7OUI5ry8Hd1Z
         ML1/rrA1d4FPhftSnSwR6A0ZZyQHcfwhjfX6RwlMURys/WvFP04WoEMEcMQvhuBmOar4
         ShxQ==
X-Gm-Message-State: AO0yUKXGBgTY4zk8KSH9IGC6dG/4uYRinRaXeFN/g/l+ereKLKD580yF
	fJdjrRMBuHCttzkL9LROgT5RdBNdJ2HOTtA2cNY=
X-Google-Smtp-Source: AK7set8pOENE3qQdov6OdbnX8NZeqRAuHLeW/9RDr9g861DgXcdaR15YJISLt3N0xGeu3omTus0Ig7L1FfyytK0BbOU=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr1748709edi.6.1677872907622; Fri, 03 Mar
 2023 11:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org> <1d3da42e-2499-7ff6-50fa-048a720e855f@linaro.org>
In-Reply-To: <1d3da42e-2499-7ff6-50fa-048a720e855f@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Mar 2023 20:48:16 +0100
Message-ID: <CAJZ5v0i9fbEpedS-CCM5qvfaG095jUDzOFd-H83G3mpwDaxoAA@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] Self-encapsulate the thermal zone device structure
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Zheng Yongjun <zhengyongjun3@huawei.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Daniel Golle <daniel@makrotopia.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-acpi@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_114929_856676_DF69A266 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Daniel,

On Fri, Mar 3, 2023 at 10:24 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Rafael,
>
> Do we have enough ack to apply this series, is it for you ?

I've just queued it up for 6.4.

It will reach linux-next and the thermal branch some time next week,
but I will be traveling, so there may be delays.

Thanks!

