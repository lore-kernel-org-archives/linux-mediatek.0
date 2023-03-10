Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE2C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=; b=szuYVp5BS5w90k9htimegQlo1r
	GxNhF+awzFXiEdwGhzRNJ9yQeraNyIrOdd7OE6hQ/OKkn5MF8zg9APsgVm0pdtmlP8UHom9S7+3X0
	8sdynJ9SvDjLDSQAAct7yZWBBS54ECtI209XXKIhNXsrpof3vJhMZHWHrk/x87G0PhuDev3QsPYWH
	uBg830MUISkd1fYE184FIBkDbJ1w2LDDqq5i+vQQHs1z7CPV5+DJS5gk/zdF0aWjeKSxUw883pc/h
	1UV5Y3jWRHei0+wSJYIkwQt0epktoIhP+c8FaUHld2lG7GucJVOn8M6sKKToWvMA9L2qLKPl/WVmp
	IAhu7RmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXBh-00DOw2-Et; Fri, 10 Mar 2023 07:29:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXBe-00DOuz-FX
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 07:29:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so4512662wms.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 23:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678433346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=;
        b=mypyJqnC/F6lSavmkFjuNxCKPeRm25olFcbDuBbOsNUdgP5ZV1s0p+0BbdmQia3Nco
         eWD82VasDd0oGCDEKHhbnfPVkrOrJpT3f1RdWpJTlQ9FFHc8JoHhmHwOWxMA0+fH6UtJ
         5RnzxgtdCPBWoloVZpMX2hboHtHa6/ZkgrUh+vWSktIBlGqc4ZrFmPcCxkKAUI7h9WkK
         FqjdmcRRCl+OyDdE05M4VOz4/XwOMi9xUQjLahywyfgovNrTASKp3ts1ZdL9YTrjMBVX
         MCobRRHYDuKI5CshilPmv2tUYuHFRqIH/mMLjgOpNFDI0z8nmNRYTmaceloOm3TFnnFC
         kRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678433346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=;
        b=WI+6YmbNtwlEQpkTmiXPFaPz/VqS+V4iTyUNKJOdURp5TCUnCeAn5D3PqFQuqYhQ+x
         vahThPCg4GnXih1866c4CArzfbIuoXljq4P1zqaUUSZN6w/yOyTJZdrGCgS9zSA93SZ4
         9VaZ/rQp4nw6t1zRTz8NYM0Yw6xpWqfKL9Mv/+JLd9P9+H9T/pXdV6OMkl1m8DZr3Ryk
         QT144B/8J3jxlVOOPafRJSc1lYL2s0S3v14f7C2YoeEd+4hLgfxfkvro1+xyFD8zmGRd
         /HihLxQwVGVukBAf2YXomLTVajMFi3Zgyvt821FW7Ky7p4pMoDoAFJMU3NECHvgR+4a3
         KhHw==
X-Gm-Message-State: AO0yUKXZ1NhYLnygCsrRDrA8Kx/T1zuje6NyIfN7gjozpCuZNnt++88m
	p4MqkAmHltMFh5+NoO1jIF3QtQ==
X-Google-Smtp-Source: AK7set92+cRtbKy+3ERr2ns8dFh7B2dy3XcYI3Bks9AgxAOC76oxIeXSLX+VzvC44JGh3SZrPpNXNg==
X-Received: by 2002:a05:600c:3ba5:b0:3eb:4501:6c60 with SMTP id n37-20020a05600c3ba500b003eb45016c60mr1132916wms.5.1678433346655;
        Thu, 09 Mar 2023 23:29:06 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id o1-20020a056000010100b002c71b4d476asm1393871wrx.106.2023.03.09.23.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 23:29:05 -0800 (PST)
Message-ID: <ef92dcac-cadd-b85e-d6ea-512684266e81@linaro.org>
Date: Fri, 10 Mar 2023 07:29:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 matthias.bgg@gmail.com, bgoswami@quicinc.com, vkoul@kernel.org,
 daniel.baluta@nxp.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jarkko.nikula@bitmer.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_232910_600999_22AEA60B 
X-CRM114-Status: GOOD (  10.39  )
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



On 07/03/2023 10:30, Claudiu Beznea wrote:
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 41db6617e2ed..dc892fac4baa 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -12,7 +12,6 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <dt-bindings/sound/sc7180-lpass.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
> index d43f480cbae3..ee4a4b553e74 100644
> --- a/sound/soc/qcom/lpass-sc7280.c
> +++ b/sound/soc/qcom/lpass-sc7280.c
> @@ -8,7 +8,6 @@
>   #include <linux/module.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> -#include <linux/pm_runtime.h>
>   
>   #include <dt-bindings/sound/sc7180-lpass.h>

Has these been compile tested? the reason I ask is because both these 
drivers need SET_SYSTEM_SLEEP_PM_OPS macro from pm.h which was getting 
included from pm_runtime.h, now that is removed, am guessing it will 
cause a compile errors.

can you atleast replace this with pm.h instead of removing it totally?

--srini

