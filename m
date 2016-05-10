From: Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mtd: mediatek: device tree docs for MTK Smart
 Device Gen1 NAND
Date: Tue, 10 May 2016 07:57:25 -0400
Message-ID: <5731CCA5.5070603@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160506153816.7ca581ac@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160506153816.7ca581ac@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 05/06/2016 09:38 AM, Boris Brezillon wrote:
> Hi Jorge,
>
> On Fri, 29 Apr 2016 12:17:21 -0400
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> This patch adds documentation support for Smart Device Gen1 type of
>> NAND controllers.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/mtd/mtk-nand.txt | 161 +++++++++++++++++++++
>>   1 file changed, 161 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
>> new file mode 100644
>> index 0000000..175767d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> [...]
>
>> +
>> +Children nodes properties:
>> +- reg:			Chip Select Signal, default 0.
>> +			Set as reg = <0>, <1> when need 2 CS.
>> +Optional:
>> +- nand-on-flash-bbt:	Store BBT on NAND Flash.
>> +- nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
>> +- nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
>> +			The controller only supports 512 and 1024.
>> +			For large page NANDs ther recommended value is 1024.
>> +- nand-ecc-strength:	Number of bits to correct per ECC step.
>> +			The valid values that the controller supports are: 4, 6,
>> +			8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36, 40, 44,
>> +			48, 52, 56, 60.
>> +			The strength should be calculated as follows:
>> +			E = (S - F) * 8 / 14
>> +			S = O / (P / Q)
>> +				E :nand-ecc-strength;
>> +				S :spare size per sector;
>> +				F : FDM size, should be in the range [1,8].
>> +				    It is used to store free oob data.
>> +				O : oob size;
>> +				P : page size;
>> +				Q :nand-ecc-step-size
>> +			If the result does not match any one of the listed
>> +			choices above, please select the smaller valid value from
>> +			the list.
>> +			(otherwise the driver will do the clamping at runtime).
>> +- vmch-supply:		NAND power supply.
> Where is this supply name coming from? I most datasheets I see Vdd or
> Vcc, but nothing close to Vmch.
>
>
>

um yes we are removing this since we dont use it (it is the NAND vcc on 
some other MTK platform to do power management via regulator).
