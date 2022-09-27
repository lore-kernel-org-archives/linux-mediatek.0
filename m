Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84787C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KO5UAD2T7DgoYPQgFD91UfqIRE232yyISaSFCJ9s3Q=; b=HuPqV+Dm6aWI1U7Oy19srSIa4P
	fwp1yHgeq30I7XHB33vnvQEuXgCHoNWAFbJmRuDFNK4Qms0irTRIkgTTyt0TSmFbRWphMsQB1P71n
	E9IOr+PFkNQ/T6PMJD0E9dO62NtXZQtfH7umOScZMFmUBFlLdjtPGYnJGCMd3kiFsyBciJD69VD9K
	VP2Zyb6QvVhWUoX2VAyKxDiugEkt43miDY9++mOef5jHOK1+hZ77PkOr1+jmUXajGe3KwXDJrVtzI
	K8q3GYmMZRlLCrkojWg3UaQwLvMG1QGmyQOGPS60PGboWgXXcxMZE6a4PCtCDdvi8hZg1PSk1JgGY
	eNP06mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAja-00Atpl-Ls; Tue, 27 Sep 2022 13:34:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAjO-00Atjj-BZ
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 13:34:41 +0000
Received: by mail-pg1-x52b.google.com with SMTP id f193so9472540pgc.0
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=5KO5UAD2T7DgoYPQgFD91UfqIRE232yyISaSFCJ9s3Q=;
        b=SoU+eGuksQQhlnS7N57Z73aJoRcn1Yf2NhRhsCodkYOiV7LO9opJ5E2VCYREe5jIix
         Oek/U1yUHENSgLff5LPnC8g96rDkpkyHkyN8K4ng0t6VFbZFhaiBdfyEbni+0RGn8Bvq
         Xr0f0Eoqt6tUwJZdRxqQtkBIbO01YSyEzs/YfPOplLElabdw79du1/QP496W/K521tAO
         KKfJLi1VzArX+CrDYSiZD5o0f3yZ/lI0HMD3tk0S9NVt07KumdMGtpOn2kdj3DfJ9Blo
         P1h+q5XNmMceyQpXed0kBCLxxC8hoyH9lz/GILiJzcJK3VEBQWlBG8Gm4O571ponUsdt
         IIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5KO5UAD2T7DgoYPQgFD91UfqIRE232yyISaSFCJ9s3Q=;
        b=fRQ4Ckx0MRgLhklC4cnL7dl2VkKBxHT0n382a7hWmi0zjoPXN6i55gxYdH3lP8WGQQ
         6Jl0QfIJVxWZDKlqv9eF2CF/BM4c/Ua8dXUpVLMg3xla1sn+arOKCos75ukX54BJDw6c
         QUJQNc1AlgSS11sFSLbtq+VYyov1wI3mMR4VX8+aJJhRUaJh13GxV93/CO+m11lnLIWA
         AQICm/cJuEBDnJIsxUPkCmWD8yO5So1/rOzqCjFpjl64XrRh2yLXQq6mOYfy6PgrmOCF
         gn0hP0TiSOUhAhAsI2uaO/4LGZsE0CPeiUMPGeYLGT5jb9nHALkGidQUJqhmQSY55r5n
         uxBQ==
X-Gm-Message-State: ACrzQf0NGVPT72QkbINAQJE82GunMNymxFO9EPmZjNM6iEilcRgTfRJW
	KRYsNLPk0PA2GYRlx8cpC2kFaATj7i9wGxwOlGIxOA==
X-Google-Smtp-Source: AMsMyM4YIhFYJqfTMqQFxzcbSAJDenFpMeYijY6ikC/aRvNNUlM8pp9LqLPwxTZew8CdZonFZQtK3Mf4GpGS1w183Kg=
X-Received: by 2002:a63:b55d:0:b0:439:7a97:b89 with SMTP id
 u29-20020a63b55d000000b004397a970b89mr24899166pgo.70.1664285675305; Tue, 27
 Sep 2022 06:34:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:34:34 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-16-4844816c9808@baylibre.com>
 <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
In-Reply-To: <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:34:34 -0700
Message-ID: <CABnWg9sSbtXYLpcCoEts73CAsciKMEeMMRwfcfGng8H-rGYvkA@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_063438_414231_F730B131 
X-CRM114-Status: GOOD (  11.79  )
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

On Tue, 20 Sep 2022 14:22, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Add the DPI1 hdmi path support in mtk dpi driver
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 630a4e301ef6..91212b7610e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -15,7 +15,10 @@
>>   #include <linux/of_graph.h>
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>   #include <linux/types.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>>
>>   #include <video/videomode.h>
>>
>> @@ -66,10 +69,14 @@ struct mtk_dpi {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_connector *connector;
>>   	void __iomem *regs;
>> +	struct reset_control *reset_ctl;
>>   	struct device *dev;
>>   	struct clk *engine_clk;
>> +	struct clk *dpi_ck_cg;
>>   	struct clk *pixel_clk;
>> +	struct clk *dpi_sel_clk;
>>   	struct clk *tvd_clk;
>> +	struct clk *hdmi_cg;
>
>
>You're adding new clocks and then you're making *all clocks*, including the
>already existing ones... optional.
>
>That looks seriously odd.... can you please give a devicetree example for
>MT8195 in the next version, perhaps in the cover letter?
>
>Would also make it easier to test this entire big series.
>
>Regards,
>Angelo
>

The clock names are different for MT8195 HDMI than for the legacy DP.
Making everything optional might not have been a smart move.
I'll try to think of something else to make it look less odd.

The device tree I'm using to test things is rather "hackish" and has a bunch of
changes from what is found on linux-next.
I think Jason and Nancy are due to upstream those patches.

I'll try to include something minimal for you to test.
Otherwise would a public branch containing everything work for you?

Thx,
Guillaume.

