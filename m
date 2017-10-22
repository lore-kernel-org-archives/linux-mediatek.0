From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: pwrap: fix fatal compiler error
Date: Sun, 22 Oct 2017 12:02:15 +0200
Message-ID: <4722c8ca-b967-7f35-8c8c-f718f40612a2@gmail.com>
References: <20171021082529.31351-1-matthias.bgg@gmail.com>
 <20171021082529.31351-2-matthias.bgg@gmail.com>
 <1508646191.29850.23.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508646191.29850.23.camel@mtkswgap22>
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
To: Sean Wang <sean.wang@mediatek.com>
Cc: robh@kernel.org, chenglin.xu@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr, arvind.yadav.cs@gmail.com, chen.zhong@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On 10/22/2017 06:23 AM, Sean Wang wrote:
> On Sat, 2017-10-21 at 10:25 +0200, Matthias Brugger wrote:
>> When adding the MT6380 compatible, the sentinel for of_device_id was
>> deleted, which leades to the following compiler error:
>> FATAL: drivers/soc/mediatek/mtk-pmic-wrap: struct of_device_id is not terminated with a NULL entry!
>>
>> Fix this by adding the sentinel again.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>   drivers/soc/mediatek/mtk-pmic-wrap.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index 912edf93c192..e9e054a15b7d 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> @@ -1380,6 +1380,7 @@ static const struct of_device_id of_slave_match_tbl[] = {
>>   	}, {
>>   		.compatible = "mediatek,mt6397",
>>   		.data = &pmic_mt6397,
>> +	}, {
>>   		/* sentinel */
>>   	}
>>   };
> 
> Thanks for patching the mistaken edit I made.
> 
> Acked-by: Sean Wang <sean.wang@mediatek.com>
> 
> 

Thanks, both patches pushed to v4.14-next/soc
