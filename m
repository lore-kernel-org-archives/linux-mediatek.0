Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B68BCE7B07
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK5FKcmSKFk/poFkH6WaIiPHJq3+6nK77MGlhBlv5xc=; b=T+rUluEJCHmVszWzS448Q3DFde
	PmpP9SxI2c8J0/ZTeIb4rRGmHIVXopxnVIQ3U5BKH99Lrh3yoNp2V6Q0QvkCVr9g9+wm7L78ofaJB
	xhz85UXwYLzMJtKOj2yLv8Tigm49R6ZjXh3WJSUlzLIEsOYX8HCpGoCs+ww4CT9z4WuZvvRsth7XC
	7Kg7RR2Svn9AS1Po95FgLLLaJIaEG3RHy28pGNNx/LhEYLmOhY9CXILnuquIN841xA3q90hTvQc5u
	QZ85PeMDPu6S2Xk03FP2fVdBCDMJmQymTNrJ0zBQdwrgLf1cPtIgpUjNDXlmLn44G4hwRnZzGzEyp
	oDKK2YhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qll5Y-002RYL-30;
	Thu, 28 Sep 2023 07:05:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qll5U-002RVz-2c
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 07:05:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3231df054c4so8514592f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 00:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695884723; x=1696489523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK5FKcmSKFk/poFkH6WaIiPHJq3+6nK77MGlhBlv5xc=;
        b=MzWBLRAXSSoEm2MxVLYb3S9McXjqGB9uQYhqISJVSWr5x9vVdNtV8U/Fjj2J3fkDXI
         Di3IWPLr+VttP48PLn9mQR63wIjmYQy3QA81C/pdCCChujwx/Wk9pPciNa0WX9n3XF53
         JA0eF2hg/7W42qxmY9lP+HwnlN5Kh4oFME1XoJqHrORMs3uyENG3YzS+xqEp+pr0Yj0j
         BA2qcJ3YwGIHTd/yIUqNlpDBh1S0EC7qX3dWSphYW5eHx1EfwJYl7sjVnoUtK5GeM1Z3
         /HG0V8rwcYUQwhmPqzLB4CwwVpnADvNAR+S4TsQP1Y/I+oWO6iEvKdH0dyzjJABNoi9z
         Rf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695884723; x=1696489523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JK5FKcmSKFk/poFkH6WaIiPHJq3+6nK77MGlhBlv5xc=;
        b=tLyGzcOgegaY8iyLe8CEdPlcT5RKlKsSicqFoEfxvxszgA/XT3wY9grIR7tatErdHR
         ueVFxMVaTOMytkqgh+GO3ICG7/6afkojC1vp/vMnIexyEedHdUgcmWjA0TbBkXpLeXxv
         97i6QKM2QPv73hxQv/Emg4kbDB9Pi3Jp6dT235b6wqr/xWMqESz/RTB7IwyZEOZdei/9
         +b4Wn6BsoH2t4cJvK8GBMTs4fdKWMkyLk2XnGfoglcA0FC3DmC6W2d6tuhJAIt6ibphR
         mwpKEwHa49vAHOO/2jxsIbitxd9QS8nWlIBbtR799GH2uixs4nNjLTZHH6axjN57Aw5K
         SCIw==
X-Gm-Message-State: AOJu0YyuDSuWSVrYyWz2UXKT5H0msDUIypYzO6GGVtgCRNzzlx9yucSR
	Szin28J+zsQZG3e7WxJrQ1kd6Q==
X-Google-Smtp-Source: AGHT+IHtRxKk7CXcPNdMQTTEBVfCDemBFx4pebeQoAgF8nP7IxdEu3s1ozmEdmztrqIM2F97b6iYUw==
X-Received: by 2002:a5d:5b17:0:b0:31f:a4fa:130a with SMTP id bx23-20020a5d5b17000000b0031fa4fa130amr465227wrb.14.1695884723076;
        Thu, 28 Sep 2023 00:05:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id bv19-20020a0560001f1300b0032327b70ef6sm10037825wrb.70.2023.09.28.00.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:05:22 -0700 (PDT)
Message-ID: <d8515a00-4d41-2d23-09ca-30f474fcbabd@linaro.org>
Date: Thu, 28 Sep 2023 09:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/31] thermal: Convert to platform remove callback
 returning void
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, ye xingchen <ye.xingchen@zte.com.cn>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Balsam CHIHI <bchihi@baylibre.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Chen Jiahao <chenjiahao16@huawei.com>,
 linux-mediatek@lists.infradead.org, Thara Gopinath
 <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 linux-stm32@st-md-mailman.stormreply.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
 <CAJZ5v0guyQ-SpNHXYBG2F_WyCSvgjXocGBy61Ep1Cy5-H-MOsQ@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAJZ5v0guyQ-SpNHXYBG2F_WyCSvgjXocGBy61Ep1Cy5-H-MOsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_000528_856802_C4F23672 
X-CRM114-Status: GOOD (  16.69  )
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

On 27/09/2023 21:45, Rafael J. Wysocki wrote:
> Hi,
> 
> On Wed, Sep 27, 2023 at 9:38 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> Hello,
>>
>> this series converts all platform drivers below drivers/thermal to use
>> .remove_new(). The motivation is to get rid of an integer return code
>> that is (mostly) ignored by the platform driver core and error prone on
>> the driver side.
>>
>> See commit 5c5a7680e67b ("platform: Provide a remove callback that
>> returns no value") for an extended explanation and the eventual goal.
>>
>> There are no interdependencies between the patches. As there are still
>> quite a few drivers to convert, I'm happy about every patch that makes
>> it in. So even if there is a merge conflict with one patch until you
>> apply or a subject prefix is suboptimal, please apply the remainder of
>> this series anyhow.
> 
> I think I'll go ahead and apply all of this in one go (for 6.7).
> 
> Daniel, any objections?

No objection, for the series:

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


