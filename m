Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9FCC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czZIXcSril+0S5W4kqc0onDmBGjrVJmOKnFUKeX4tsk=; b=Lxmjc8r1rb5BJYJyEDbQ1nT7fD
	it4FTH3ru2jF4vFTzTBowB+f7eZtyR4YE5BnxZIMpD/iGUYwEet7fv9C0/kfMnh4i35DR9b/uBohH
	LpQQgA0O6kxnxQavNKyBn80lqKoWEjV6gK6GBh22v0JdaHNsfkFNup30UmL67PJR3rXPINexblXkK
	CcMI0VZyTqv91xbOScgJs3muEdbmctwiwUgamZISCgr/4B40wnIqkE/rruGzaVEbffOmnAJgxFr+0
	Xfit1xGNtPuWnZO/FXPwzgMJSsGMHMt9t3BjtdfVtL5SirzvB3OSbtdCT3oxTNi1bEYy2EYmd5s6S
	0XUcfmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLVD-000SMR-1u; Thu, 06 Oct 2022 07:41:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLV0-000SGq-LI
	for linux-mediatek@lists.infradead.org; Thu, 06 Oct 2022 07:40:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id a10so1295781wrm.12
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 00:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=czZIXcSril+0S5W4kqc0onDmBGjrVJmOKnFUKeX4tsk=;
        b=6qjVyGLzJP2d40EpuWNyVT7l6T1hqaLdgmVpPaEvxGoI3eNCRgjZbGBoV/FQXGFiob
         p1/snStTlv9rq/9KQBEnbttDzx9aV9UFcCtCpTruw0x3LnutL5LIoByYqspkjd4myhFG
         o66132ZmNOgdoO+IlS/KPAboWUZ4rxmqEi5tZR2IqESw7F5zea9zC2XndyD0QwNfiMW+
         /nwbOLPLYFu+/Cky/cDEFK7gRRN0k+BrwlpQEh4ZaKLwj5dIr4NcKkO8p5HwaacjzsA6
         gZ0TzxilJw76mVoMKbn+T6w4zrLCe+y6EPNId2yu4f5oz1jz2r47ME95GEpCEBO05Q/r
         AVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czZIXcSril+0S5W4kqc0onDmBGjrVJmOKnFUKeX4tsk=;
        b=n6LHiIQdCiZr/2Et1Eb5NguIqIhnTygxlZsuZeeKGIk6zf1qF1tOZAgYVbALQbJIIo
         70AsB6sMj+A9AQWq75uQ2Nldbs9xiZlK4EhXn17znKQr18erTND1xH3JfNnzTu3MGh3x
         Wp42//IB2qCvzwP0I/lRNlnlutCn46/Gg4MyrlxIKS6/NY9RBqGj4A5ZQpqfqKTYb/nF
         G2LHUl3EEJLwBUOcxH1L0YoHXsTuWiyYnh+csaxL35+a0hYNkpbpU52GpqGPAUoY9Fdc
         hV6hi0x5D6+ja+vI+pyLBPRYc967tk9iaDjKo5oxetBkaIfWeftZV48bXMWefgF5zeVE
         wvfA==
X-Gm-Message-State: ACrzQf3a5hKWRVE8Uz7aNUz8h4tq6nlE/Fuj3sdx9g886FMSYDDzS5EK
	/t0++pCf9neFAfH4eqC8kZ4vHw==
X-Google-Smtp-Source: AMsMyM6xxcX+Jw879ZvGrzE2zvbkaNBbDJ39qRVbXxY0XUtG9zHNqjzwrFb8JpJ5s9D9VO54lzi4fg==
X-Received: by 2002:a5d:404b:0:b0:22e:331e:1cba with SMTP id w11-20020a5d404b000000b0022e331e1cbamr2019320wrp.488.1665042051756;
        Thu, 06 Oct 2022 00:40:51 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b003a601a1c2f7sm4346819wmq.19.2022.10.06.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 00:40:51 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v2 5/5] Input: mtk-pmic-keys: add MT6357 support
In-Reply-To: <20221005-mt6357-support-v2-5-f17ba2d2d0a9@baylibre.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-5-f17ba2d2d0a9@baylibre.com>
Date: Thu, 06 Oct 2022 09:40:50 +0200
Message-ID: <87czb5o0vx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_004054_723320_C77FAB1B 
X-CRM114-Status: GOOD (  15.80  )
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

On Wed, Oct 05, 2022 at 16:57, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> From: Fabien Parent <fparent@baylibre.com>
>
> Add PMIC Keys support on MT6357 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 9b34da0ec260..2a63e0718eb6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6331/registers.h>
> +#include <linux/mfd/mt6357/registers.h>
>  #include <linux/mfd/mt6358/registers.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
> @@ -90,6 +91,19 @@ static const struct mtk_pmic_regs mt6331_regs = {
>  	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
>  };
>  
> +static const struct mtk_pmic_regs mt6357_regs = {
> +	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
> +				   0x2, MT6357_PSC_TOP_INT_CON0, 0x5,
> +				   MTK_PMIC_PWRKEY_RST),
> +	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
> +				   0x8, MT6357_PSC_TOP_INT_CON0, 0xa,
> +				   MTK_PMIC_HOMEKEY_INDEX),
> +	.pmic_rst_reg = MT6357_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
> +};
> +
>  static const struct mtk_pmic_regs mt6358_regs = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
> @@ -276,6 +290,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>  	}, {
>  		.compatible = "mediatek,mt6331-keys",
>  		.data = &mt6331_regs,
> +	}, {
> +		.compatible = "mediatek,mt6357-keys",
> +		.data = &mt6357_regs,
>  	}, {
>  		.compatible = "mediatek,mt6358-keys",
>  		.data = &mt6358_regs,
>
> -- 
> b4 0.10.1

