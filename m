From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add reset controller
Date: Sat, 5 Oct 2019 07:46:30 -0700
Message-ID: <70b77fb3-7186-734d-3415-64acb30bab8f@roeck-us.net>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
 <1570255179.29077.24.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1570255179.29077.24.camel@mtksdaap41>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, broonie@kernel.org, yong.liang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, eason.yen@mediatek.com, perex@perex.cz, wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 10/4/19 10:59 PM, Yingjoe Chen wrote:
> On Thu, 2019-10-03 at 06:49 -0700, Guenter Roeck wrote:
>> On 9/27/19 3:31 AM, Jiaxin Yu wrote:
> 
> <snip..>
> 
> 
>>> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
>>> +			       unsigned long id)
>>> +{
>>> +	unsigned int tmp;
>>> +	unsigned long flags;
>>> +	struct toprgu_reset *data = container_of(rcdev,
>>> +				struct toprgu_reset, rcdev);
>>> +
>>> +	spin_lock_irqsave(&data->lock, flags);
>>> +
>>> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
>>> +	tmp |= BIT(id);
>>> +	tmp |= WDT_SWSYS_RST_KEY;
>>> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
>>> +
>>> +	spin_unlock_irqrestore(&data->lock, flags);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
>>> +				 unsigned long id)
>>> +{
>>> +	unsigned int tmp;
>>> +	unsigned long flags;
>>> +	struct toprgu_reset *data = container_of(rcdev,
>>> +					struct toprgu_reset, rcdev);
>>> +
>>> +	spin_lock_irqsave(&data->lock, flags);
>>> +
>>> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
>>> +	tmp &= ~BIT(id);
>>> +	tmp |= WDT_SWSYS_RST_KEY;
>>> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
>>> +
>>> +	spin_unlock_irqrestore(&data->lock, flags);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int toprgu_reset(struct reset_controller_dev *rcdev,
>>> +			unsigned long id)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = toprgu_reset_assert(rcdev, id);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return toprgu_reset_deassert(rcdev, id);
>>
>> Unless there is additional synchronization elsewhere, parallel calls
>> to the -> assert, and ->reset callbacks may result in the reset being
>> deasserted while at least one caller (the one who called the ->assert
>> function) believes that it is still asserted.
>>
>> [ ... and if there _is_ additional synchronization elsewhere, the
>>     local spinlock would be unnecessary ]
>>
> 
> I'm not sure if this count as additional synchronization, but you could
> get exclusive control to the reset by calling
> reset_control_get_exclusive so others won't try to reset the component
> while you are using it.
> 
> In this case, you still need spinlock because other drivers might trying
> to reset their components and they share same register.
> 
That isn't what I meant. I referred to synchronization in the reset
controller core. AFAICS the reset controller core prevents parallel
calls into the same reset controller driver using atomics. Unfortunately,
it is not well defined if additional synchronization on driver level
is needed - some drivers implement it, some drivers don't, and I don't
find a documentation. Maybe Philip can provide guidance.

Thanks,
Guenter
