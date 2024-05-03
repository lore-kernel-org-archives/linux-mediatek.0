Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C91C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK1c0cjshouh+E4KJynzZDtLzXQpYSsUDTXZXXC73m8=; b=egcpamR/q1W//B/zFApH2Go7T7
	WL2GBEJaqvHOVrNUT63l0xuEgsYfjM+Js915O/dAA7eFxDde9wOhXROj665wr7QT5IQr0+7YnM2ax
	kYil6c46SF9wZ8oUT4JcFjt0PGvg6IO5F8RsCx9amyGcA2IGNGZTYA6a8K5XzfueTPLq3eC5wlaqK
	K7C0s6fm3dlRaejfN41yzY59imU+sfCPkty81LMd5a+wV4N19Ri4fuPRjYiYckdgKpyMPLs8Xhjpa
	qvURzsOVRJmQWzNgUrvoXa5S85cN1HCxrT9QhwqnTMXGnmM0H73P0VlFmP90x6+7qkvZAyB5uxhcZ
	G1Zu/+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rTa-0000000GKEf-1gqW;
	Fri, 03 May 2024 11:53:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rTW-0000000GKCQ-1WJE;
	Fri, 03 May 2024 11:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57E29CE18EC;
	Fri,  3 May 2024 11:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE35AC116B1;
	Fri,  3 May 2024 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714737189;
	bh=oIovYuO/wwA3btzTdboGgNcBMqORvy93ZrXEDE9gLHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qo4z/cb1lBqPWjlJbPLD9UCWaSUw+LkRcCfSFgtNCa7Nm5W7gqxC6hpvnHmbzRx12
	 qQKfkKM+AbafUkfxhz+qeYgQclTLeSm4to1eC4+KwSbHIR1Iw+GMg1aRK7/l6851XO
	 C3YQIpqUsFXZIq4UCK9NSdK1RJIF50QT69ChGe+XpxuMWw+OTYJi7OnZPezh/AST8h
	 yoYVNK2ZpyQiriowSgL3neRAC4CsiknyVfebk7q1CEPCsFLVt6tSmmcoeGvbakErgo
	 81Xz52g6gwf4V12wKhJ31oJ3XB6SzRhf7PqlevdgthOMdH5ib/63Y6cimZhxaxV35c
	 Pbx227mOPeUqw==
Message-ID: <52335ded-43e7-4694-80bf-6ceee7d918d8@kernel.org>
Date: Fri, 3 May 2024 14:53:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] interconnect: mediatek: Add MediaTek MT8183/8195
 EMI Interconnect driver
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, amergnat@baylibre.com
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-8-angelogioacchino.delregno@collabora.com>
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20240424095416.1105639-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_045314_793880_7C2B92BB 
X-CRM114-Status: GOOD (  11.03  )
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

Hi Angelo,

On 24.04.24 12:54, AngeloGioacchino Del Regno wrote:
> Add an interconnect driver for the External Memory Interface (EMI),
> voting for bus bandwidth over the Dynamic Voltage and Frequency Scaling
> Resource Collector (DVFSRC).
> 
>               ICC provider         ICC Nodes
>                                ----          ----
>               ---------       |CPU |   |--- |VPU |
>      -----   |         |-----  ----    |     ----
>     |DRAM |--|DRAM     |       ----    |     ----
>     |     |--|scheduler|----- |GPU |   |--- |DISP|
>     |     |--|(EMI)    |       ----    |     ----
>     |     |--|         |       -----   |     ----
>      -----   |         |----- |MMSYS|--|--- |VDEC|
>               ---------        -----   |     ----
>                 /|\                    |     ----
>                  |change DRAM freq     |--- |VENC|
>               ----------               |     ----
>              |  DVFSR   |              |
>              |          |              |     ----
>               ----------               |--- |IMG |
>                                        |     ----
>                                        |     ----
>                                        |--- |CAM |
>                                              ----
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thank you for working on this! It looks good to me.
Do we have a plan how to merge all this?

Thanks,
Georgi

> ---
>   drivers/interconnect/Kconfig            |   1 +
>   drivers/interconnect/Makefile           |   1 +
>   drivers/interconnect/mediatek/Kconfig   |  29 ++
>   drivers/interconnect/mediatek/Makefile  |   5 +
>   drivers/interconnect/mediatek/icc-emi.c | 153 +++++++++++
>   drivers/interconnect/mediatek/icc-emi.h |  40 +++
>   drivers/interconnect/mediatek/mt8183.c  | 143 ++++++++++
>   drivers/interconnect/mediatek/mt8195.c  | 339 ++++++++++++++++++++++++
>   8 files changed, 711 insertions(+)
>   create mode 100644 drivers/interconnect/mediatek/Kconfig
>   create mode 100644 drivers/interconnect/mediatek/Makefile
>   create mode 100644 drivers/interconnect/mediatek/icc-emi.c
>   create mode 100644 drivers/interconnect/mediatek/icc-emi.h
>   create mode 100644 drivers/interconnect/mediatek/mt8183.c
>   create mode 100644 drivers/interconnect/mediatek/mt8195.c


