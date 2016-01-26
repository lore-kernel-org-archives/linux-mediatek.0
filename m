From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH V3 09/11] soc: mediatek: PMIC wrap: add a slave specific
 struct
Date: Tue, 26 Jan 2016 10:36:07 +0100
Message-ID: <56A73E07.8050201@openwrt.org>
References: <1453715604-36856-1-git-send-email-blogic@openwrt.org>
 <1453715604-36856-10-git-send-email-blogic@openwrt.org>
 <1453800710.10901.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1453800710.10901.6.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 26/01/2016 10:31, Yingjoe Chen wrote:
> 
> Hi John,
> 
> Thanks for preparing the patch.
> 
> 
> 
> On Mon, 2016-01-25 at 10:53 +0100, John Crispin wrote:
>> This patch adds a new struct pwrap_slv_type that we use to store the slave
>> specific data. The patch adds 2 new helper functions to access the dew
>> registers. The slave type is looked up via the wrappers child node.
>>
>> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> ---
>>  drivers/soc/mediatek/mtk-pmic-wrap.c |  170 +++++++++++++++++++++++++---------
>>  1 file changed, 124 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index 54553b4..21d8e5a 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> <...>
> 
>> +/* defines for slave device wrapper registers */
>> +enum dew_regs {
>> +	PWRAP_DEW_BASE,
>> +	PWRAP_DEW_EVENT_OUT_EN,
>> +	PWRAP_DEW_DIO_EN,
>> +	PWRAP_DEW_EVENT_SRC_EN,
>> +	PWRAP_DEW_EVENT_SRC,
>> +	PWRAP_DEW_EVENT_FLAG,
>> +	PWRAP_DEW_READ_TEST,
>> +	PWRAP_DEW_WRITE_TEST,
>> +	PWRAP_DEW_CRC_EN,
>> +	PWRAP_DEW_CRC_VAL,
>> +	PWRAP_DEW_MON_GRP_SEL,
>> +	PWRAP_DEW_MON_FLAG_SEL,
>> +	PWRAP_DEW_EVENT_TEST,
>> +	PWRAP_DEW_CIPHER_KEY_SEL,
>> +	PWRAP_DEW_CIPHER_IV_SEL,
>> +	PWRAP_DEW_CIPHER_LOAD,
>> +	PWRAP_DEW_CIPHER_START,
>> +	PWRAP_DEW_CIPHER_RDY,
>> +	PWRAP_DEW_CIPHER_MODE,
>> +	PWRAP_DEW_CIPHER_SWRST,
>> +	PWRAP_MT8173_DEW_CIPHER_IV0,
>> +	PWRAP_MT8173_DEW_CIPHER_IV1,
>> +	PWRAP_MT8173_DEW_CIPHER_IV2,
>> +	PWRAP_MT8173_DEW_CIPHER_IV3,
>> +	PWRAP_MT8173_DEW_CIPHER_IV4,
>> +	PWRAP_MT8173_DEW_CIPHER_IV5,
> 
> 
> For PWRAP_MT8173_DEW_*, since they exist on pmic mt6397, it seems
> strange to name them with MT8173 name. I guess we got this name because
> MTK internal code base try to support them in MT8173.
> 
> On the other hand, these are not used in current code, maybe we can just
> remove them?
> 
> Joe.C

Hi Joe,

correct, i kept them as they are in the mtk internal driver. i'll
happily drop them.

	John
