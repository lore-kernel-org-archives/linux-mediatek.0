From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 08/11] soc: mediatek: PMIC wrap: remove
 pwrap_is_mt8135() and pwrap_is_mt8173()
Date: Thu, 4 Feb 2016 19:37:58 +0100
Message-ID: <56B39A86.6000904@gmail.com>
References: <1453715604-36856-1-git-send-email-blogic@openwrt.org>
 <1453715604-36856-9-git-send-email-blogic@openwrt.org>
 <56AF3992.8020004@gmail.com> <56AF3AC7.5040001@openwrt.org>
 <56AF3D67.8080708@gmail.com> <56AF3E47.9010001@openwrt.org>
 <56AF4138.5010004@gmail.com> <1454578576.15541.11.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454578576.15541.11.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 04/02/16 10:36, Yingjoe Chen wrote:
> On Mon, 2016-02-01 at 12:27 +0100, Matthias Brugger wrote:
>>
>> On 01/02/16 12:15, John Crispin wrote:
>>>
>>>
>>> On 01/02/2016 12:11, Matthias Brugger wrote:
>>>>
>>>>
>>>> On 01/02/16 12:00, John Crispin wrote:
>>>>>
>>>>>
>>>>> On 01/02/2016 11:55, Matthias Brugger wrote:
>>>>>>
>>>>>>
>>>>>> On 25/01/16 10:53, John Crispin wrote:
>>>>>>> With ore SoCs being added the list of helper functions like these would
>>>>>>
>>>>>> The commit message is something strange:
>>>>>> "With every new SoC being added..." maybe?
>>>>>>
>>>>>>> grow. While at it also add a new flag "bridge" and use that insted of
>>>>>>
>>>>>> s/insted/instead
>>>>>>
>>>>>>> pwrap_is_mt8173() where appropriate.
>>>>>
>>>>> you are lookign at V3 of the series, V4 has this fix done already
>>>>>
>>>>> [...]
>>>>>
>>>>>
>>>>>>>          }
>>>>>>> @@ -830,6 +824,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
>>>>>>>          .int_en_all = BIT(31) | BIT(1),
>>>>>>>          .spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>>>>>>>          .wdt_src = PWRAP_WDT_SRC_MASK_ALL,
>>>>>>> +    .has_bridge = 1,
>>>>>>>          .init_reg_clock = pwrap_mt8135_init_reg_clock,
>>>>>>>          .init_special = pwrap_mt8135_init_special,
>>>>>>>      };
>>>>>>
>>>>>> Please set has_bridge explicitly for mt8173.
>>>>>
>>>>> I dont get it. the original code never did that.
>>>>>
>>>>
>>>> has_bridge was introduced by this patch, but you don't set it explicitly
>>>> to 0 in pwrap_mt8173.
>>>>
>>>> Just as I see it, please try to write a summary to every new version of
>>>> a patch set which explains what you changed between one version and
>>>> another. This will help a lot making the review easier.
>>>>
>>>> Thanks,
>>>> Matthias
>>>>
>>>
>>>
>>> You missed the "to zero" part before. now the comment makes sense. I can
>>> set it to 0 if it is more obvious for you in that case.
>>>
>>> general consent is to not declare statics to 0. check_patch.pl will
>>> actually complain about those declarations. that is why i was confused.
>>
>> If that's the case, then we accept the authority of check_patch.pl ;)
>> I didn't know that, so just leave has_bridge as it was.
>
> I believe checkpatch only complain for global/static variables
> initializers, not inside a struct initializers even when they are
> global.
>
> In MTK i2c drivers drivers/i2c/busses/i2c-mt65xx.c, we always explicitly
> init flags in compatible struct, IMHO it make support feature for each
> IC more clearly. This does not trigger any warning from checkpatch.
>

Ok, thanks for clarification.
