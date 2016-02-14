From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH V5 04/11] soc: mediatek: PMIC wrap: split SoC specific
 init into callback
Date: Sun, 14 Feb 2016 22:01:38 +0100
Message-ID: <56C0EB32.4080701@openwrt.org>
References: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
 <1454841778-35529-5-git-send-email-blogic@openwrt.org>
 <56BC7674.9030706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56BC7674.9030706@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, Flora Fu <flora.fu@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 11/02/2016 12:54, Matthias Brugger wrote:
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index b22b664..e3bbee5 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> @@ -372,6 +372,7 @@ struct pmic_wrapper_type {
>>       enum pwrap_type type;
>>       u32 arb_en_all;
>>       int (*init_reg_clock)(struct pmic_wrapper *wrp);
>> +    int (*init_special)(struct pmic_wrapper *wrp);
> 
> Nit:
> I wonder if we can find a better name for the callback, as init_special
> sounds quite generic to me.
> 
> Thanks,
> Matthias

Hi,

At first I considered enable_wrapper as the mt8135/8173 code seems to do
just that. however mt2701 does an init of the ADC. So how about using
init_soc_specific ?

	John
