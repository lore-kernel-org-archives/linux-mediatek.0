Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85062C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=; b=t2GL5ngjBwG+Qp8575KdxDYMSz
	ulpqkrxLunzGYO0tP/r4qn9l1vtlq4LQ61ieqGDKR4QmrMaDa8WCietkcxqxkgF6OwiFeO8bE0ey5
	6Nd4+F9J6RfC4VdOJkfEpG06B4Q/B5z7JlBaM17jXkQD/T18/Vjg5rmH+B9tzUWppSVZzOdxfl/x4
	9D1QpNr4uKzX56JVyWa+GSiSGkuZTWaQf7w6NcohZSD830AMwnhvvV0zPnB5oJtOMv152LVU5gizT
	AOiXk7IcOA7gVJMj28cyMK0guSzO0HokeDyHaMzCRoFSX2QY9W1umfhxCKSv+1oBObhh9VNQQdopK
	8hH4FZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCT2s-00AUw3-OM; Fri, 15 Jul 2022 21:40:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCT2o-00AUtX-SJ
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 21:40:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk26so8408425wrb.11
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 14:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=;
        b=EiZ/Jmkz5DdkNRwJGtK9gVoZ3BcJ8ejMk3yeeSneUGJiCM2csICY8AdW61vGapRVcY
         UVEs2lvDUtUmSWhTy5Riy+DiODr1rNBvvUK4wbrRLT25XjOXefr0/051txgAy4PBorpi
         GKNcSgswr6pLYwYHFSVzvB34JMrg+jT1ikpzno4L0ZOP0gQXJvWnMhCAGwkPbk+zk4T6
         NHUHFy/WsEuLp1Gd3GTwIoolQEUdfvT1tqqUGbfp80W8fFmVfSTmouc1u2k89r7uyeR9
         nYK4zK2wqlmEsLRHEwqRtcub6mC9oo2ROYXHqnHla+d+LumXFIkgFPThdJfozfzXSQFb
         VGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=;
        b=hsSSpGEf5e3ufo7xEPzwjO/rQkS5oDHoRMutiQBAD+c9+3vHVE6lR6p1gmS6B3DejM
         Z/b1m+1hAfCvxH33u3ngplmBSh++OeijaufGkXuKw0tgP43PWzGljAnP/b57PqfLMhdk
         NZqi56QI6tZTSFgiRHDL14F7qjrjlaJlT+m4G8quFojYBEC+UtWebEza/Y8sU8mwbo3p
         bSTxUiwgUGGZm1NIRKZEbMk/YkKLFzex4Bnu9+iWdazhxqUcmN8cYdojUy8LEGdXF3+z
         KKw7fDBe4Tlz9Td+YPAbz/tZCy4oQgMJRmAcKLggTLUVpP5kCFLWSZTx+Z5EnFKCkRbn
         FBZg==
X-Gm-Message-State: AJIora/SmOAdORzEU3IEE9FxubxEIfhNoOPmQnlTRJe7cQJDMVjYjFi7
	+FkTSC+BHUR2HaHjFhOhfU95Xw==
X-Google-Smtp-Source: AGRyM1vl55wMLC6v4FE7361A1EgLL5IjuxGDiU+pOGyn8ZoWrdHGmzM+ZMQkW7lv66vojAGIB7e/MQ==
X-Received: by 2002:a5d:4e04:0:b0:21d:6ec3:38a2 with SMTP id p4-20020a5d4e04000000b0021d6ec338a2mr14182586wrt.362.1657921215858;
        Fri, 15 Jul 2022 14:40:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a223:f4b3:40c9:43fa? ([2a05:6e02:1041:c10:a223:f4b3:40c9:43fa])
        by smtp.googlemail.com with ESMTPSA id j27-20020a05600c1c1b00b0039c4ba160absm17678280wms.2.2022.07.15.14.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 14:40:15 -0700 (PDT)
Message-ID: <563e92de-68aa-7382-2564-c1ccc270c571@linaro.org>
Date: Fri, 15 Jul 2022 23:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 06/15] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org,
 linux-imx@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-iio@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-msm@vger.kernel.org
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jonathan Cameron <jic23@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Tali Perry <tali.perry1@gmail.com>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Patrick Venture
 <venture@google.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman <avifishman70@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Andy Gross
 <agross@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Haibo Chen <haibo.chen@nxp.com>, Jishnu Prakash <quic_jprakash@quicinc.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-7-nuno.sa@analog.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220715122903.332535-7-nuno.sa@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_144018_985225_6908EE36 
X-CRM114-Status: GOOD (  15.97  )
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

On 15/07/2022 14:28, Nuno Sá wrote:
> Make usage of the new firmware agnostic API
> 'devm_of_iio_channel_get_by_name()' to get the IIO channel.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>   drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index d9c9c975f931..0b8543c627f0 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -825,7 +825,8 @@ static int adc_tm5_get_dt_channel_data(struct adc_tm5_chip *adc_tm,
>   	}
>   	channel->adc_channel = args.args[0];
>   
> -	channel->iio = devm_of_iio_channel_get_by_name(adc_tm->dev, node, NULL);
> +	channel->iio = devm_fwnode_iio_channel_get_by_name(adc_tm->dev,
> +							   of_fwnode_handle(node), NULL);
>   	if (IS_ERR(channel->iio)) {
>   		ret = PTR_ERR(channel->iio);
>   		if (ret != -EPROBE_DEFER)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

