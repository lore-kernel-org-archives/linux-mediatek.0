Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF089C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwfV7uve9JHvQ7KPIcuTdH5iXAupAcOmFZXka/qb7TE=; b=pJksMesCW5klQ5a1qJqHzbpEyu
	vyFK5TcBza+rl0zKR4Lcyl8x2VcR7lDu0bBSJgkJ3RSGZLLPWUJxly51Gak+RlyWACIlvegVD88T0
	aFxKpINT0aqutwtEs2mE3833rcH/ze0sgCG9TJ3qf+Gn3Z6ZBrKbRjytp0rZqBELyEBDmSoduW6Zh
	lgvyfJKW+ZNqomQEFsec4TdhB588af0JQBLRX+88WCX1stZ8ArLRM3VDG0bAYGfTYdu2Lptb5P6DI
	8VZBt6MmjrvcAUrW4GESaZ/m1WKacj7nxjwJqXXd8p+i1eeNhc1zDvIWNQOwylcV4rAa9FjYmV9EN
	yeRBa2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CHx-008kFb-3B;
	Thu, 08 Jun 2023 09:50:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CHu-008kDy-31
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 09:50:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30e56fc9fd2so432227f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686217835; x=1688809835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwfV7uve9JHvQ7KPIcuTdH5iXAupAcOmFZXka/qb7TE=;
        b=PpYoQ9yBVRw2vZUWFh2CmtHT2Hf537cbytt50hvfTVoPmF9Gk4gIoqksRA90soEjgT
         BJJUPYAibqGWlmew06C33ldDMSj9lAhFsIadnFoo4f9ywI2khZtxKVd959gjiVf8d84G
         /cQfPbgAt3rK+8fYSrJi2T1sM9TFSEkemPr0raVGVnxl39pmXPzInTP70Toq4HrLbXlF
         s66rtbskCNwdz9Pm8NDo6yRs9R+sqGG+njr5DbsW32pKBcJ6aOpZ9HcWJbXHgguMKqQQ
         Iom8RjZLir4TsGAMTJ6Yxq9WQxxyLk7XSWLw1aqKJ1G50LYHOSPlnbGIEHZiJRw1Q/Rh
         31YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686217835; x=1688809835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwfV7uve9JHvQ7KPIcuTdH5iXAupAcOmFZXka/qb7TE=;
        b=XAUlTWVFyZJpV11OFEN14XLPVUkHRbUaP2FFNIGpLoHtZpajFV310mbWFXc6q4NT4f
         22C1BgH/GsjlccNwDho/WnR/8zLz4xJLKE/hPuuTom1rlsxpeH8N2jVzHI63gJ9ttyyV
         HZDNbMGnPavm6oGE2NjW5OmjxSpvkU9h+aUgQOqhlK7Tn34XiQjdt8/W8RcFI0riHGcO
         CF8sqaL4WEe7XQhtqUtcNncCXZwNtQmi+26oHzyYqcKzb8tyW/+0uq4wSAyefzpy7fbX
         axiwvr/SGIlRDFX5o28YVlqAGNRsAjdwfyiMo3OhqiYsJRBjN1brvgsxoD2XwrFLme5g
         k8zA==
X-Gm-Message-State: AC+VfDw9/3OzQsD8SZmoEdJpk/iZLTR/RkRV2w7EQVUah/RerLIUTStG
	MHjP8cYFK78D7nCPWuby87q9Hg==
X-Google-Smtp-Source: ACHHUZ7vePKIJ7//4HDDmBh8tZbIexRsI4k41AJwSBLsN64OpFI6fQf5Jj3sbWscK45AtGmBnqt/1w==
X-Received: by 2002:adf:d84e:0:b0:307:82e3:70cd with SMTP id k14-20020adfd84e000000b0030782e370cdmr7002149wrl.14.1686217834930;
        Thu, 08 Jun 2023 02:50:34 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d650f000000b0030adfa48e1esm1071530wru.29.2023.06.08.02.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:50:34 -0700 (PDT)
Message-ID: <8bbbc852-6139-29d4-417c-a2d9c77c192f@baylibre.com>
Date: Thu, 8 Jun 2023 11:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros
 for registers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_025038_979377_8FBDD4F1 
X-CRM114-Status: GOOD (  22.51  )
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

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Replace open coded instances of FIELD_GET() with it, move register
> definitions at the top of the file and also replace magic numbers
> with register definitions.
> 
> While at it, also change a regmap_update_bits() call to regmap_write()
> because the top 29 bits of AUD_TOP_CFG (31:3) are reserved (unused).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 32 ++++++++++++++---------
>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 5b2660139421..ac69c23e0da1 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -6,6 +6,7 @@
>    * Author: Trevor Wu <trevor.wu@mediatek.com>
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/input.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> @@ -19,6 +20,15 @@
>   #include "../common/mtk-afe-platform-driver.h"
>   #include "../common/mtk-soundcard-driver.h"
>   
> +#define CKSYS_AUD_TOP_CFG	0x032c
> + #define RG_TEST_ON		BIT(0)
> + #define RG_TEST_TYPE		BIT(2)
> +#define CKSYS_AUD_TOP_MON	0x0330
> + #define TEST_MISO_COUNT_1	GENMASK(3, 0)
> + #define TEST_MISO_COUNT_2	GENMASK(7, 4)
> + #define TEST_MISO_DONE_1	BIT(28)
> + #define TEST_MISO_DONE_2	BIT(29)
> +
>   #define NAU8825_HS_PRESENT	BIT(0)
>   
>   /*
> @@ -251,9 +261,6 @@ static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>   };
>   
> -#define CKSYS_AUD_TOP_CFG 0x032c
> -#define CKSYS_AUD_TOP_MON 0x0330
> -
>   static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_component *cmpnt_afe =
> @@ -265,13 +272,13 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   	struct mtkaif_param *param;
>   	int chosen_phase_1, chosen_phase_2;
>   	int prev_cycle_1, prev_cycle_2;
> -	int test_done_1, test_done_2;
> +	u8 test_done_1, test_done_2;
>   	int cycle_1, cycle_2;

Shouldn't be unsigned too ?

I'm wondering if it would be better (probably in another patch) to 
change the data type of the other variables too, to match their 
use-case. (maybe it's already the case, I'm just wondering)

>   	int mtkaif_chosen_phase[MT8188_MTKAIF_MISO_NUM];
>   	int mtkaif_phase_cycle[MT8188_MTKAIF_MISO_NUM];
>   	int mtkaif_calibration_num_phase;
>   	bool mtkaif_calibration_ok;
> -	unsigned int monitor = 0;
> +	u32 monitor = 0;
>   	int counter;
>   	int phase;
>   	int i;
> @@ -303,8 +310,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   	mt6359_mtkaif_calibration_enable(cmpnt_codec);
>   
>   	/* set test type to synchronizer pulse */
> -	regmap_update_bits(afe_priv->topckgen,
> -			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
> +	regmap_write(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_TYPE);
>   	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
>   	mtkaif_calibration_ok = true;
>   
> @@ -314,7 +320,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
>   						    phase, phase, phase);
>   
> -		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
> +		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
>   
>   		test_done_1 = 0;
>   		test_done_2 = 0;
> @@ -326,14 +332,14 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		while (!(test_done_1 & test_done_2)) {
>   			regmap_read(afe_priv->topckgen,
>   				    CKSYS_AUD_TOP_MON, &monitor);
> -			test_done_1 = (monitor >> 28) & 0x1;
> -			test_done_2 = (monitor >> 29) & 0x1;
> +			test_done_1 = FIELD_GET(TEST_MISO_DONE_1, monitor);
> +			test_done_2 = FIELD_GET(TEST_MISO_DONE_2, monitor);
>   
>   			if (test_done_1 == 1)
> -				cycle_1 = monitor & 0xf;
> +				cycle_1 = FIELD_GET(TEST_MISO_COUNT_1, monitor);
>   
>   			if (test_done_2 == 1)
> -				cycle_2 = (monitor >> 4) & 0xf;
> +				cycle_2 = FIELD_GET(TEST_MISO_COUNT_2, monitor);
>   
>   			/* handle if never test done */
>   			if (++counter > 10000) {
> @@ -361,7 +367,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   			mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1] = prev_cycle_2;
>   		}
>   
> -		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
> +		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
>   
>   		if (mtkaif_chosen_phase[MT8188_MTKAIF_MISO_0] >= 0 &&
>   		    mtkaif_chosen_phase[MT8188_MTKAIF_MISO_1] >= 0)

After that:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


