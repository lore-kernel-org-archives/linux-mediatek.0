From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Thu, 14 Mar 2019 12:36:26 +0100
Message-ID: <f620e4ef-3d9e-4230-30e8-5cc608710695@denx.de>
References: <20190313122403.248873-1-armax@google.com>
 <20190313123454.GB2202@kadam> <20190314111313.GB8034@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314111313.GB8034@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Armando Miraglia <arma2ff0@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: neil@brown.name, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, sankalpnegi2310@gmail.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Armando,

On 14.03.19 12:13, Armando Miraglia wrote:
> My answers are in-line below. BTW bare with me as this is my attempt to get my
> feet wet in how to contribute to the linux kernel for my own pleasure and
> interest :)
> 
> On Wed, Mar 13, 2019 at 03:34:54PM +0300, Dan Carpenter wrote:
>> On Wed, Mar 13, 2019 at 01:24:04PM +0100, Armando Miraglia wrote:
>>> Running Lindent on the mt7621-spi.c file in drivers/staging I noticed that the
>>> file contained style issues. This change attempts to address such style
>>> problems.
>>>
>>
>> Don't run lindent.  I think checkpatch.pl has a --fix option that might
>> be better, but once the code is merged then our standard become much
>> higher for follow up patches.
>>
>>> Signed-off-by: Armando Miraglia <armax@google.com>
>>> ---
>>> NOTE: resend this patch to include all mainteners listed by get_mantainers.pl.
>>>   drivers/staging/mt7621-spi/spi-mt7621.c | 27 +++++++++++++------------
>>>   1 file changed, 14 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
>>> index b509f9fe3346..03d53845f8c5 100644
>>> --- a/drivers/staging/mt7621-spi/spi-mt7621.c
>>> +++ b/drivers/staging/mt7621-spi/spi-mt7621.c
>>> @@ -52,14 +52,14 @@
>>>   #define MT7621_LSB_FIRST	BIT(3)
>>>   
>>>   struct mt7621_spi {
>>> -	struct spi_master	*master;
>>> -	void __iomem		*base;
>>> -	unsigned int		sys_freq;
>>> -	unsigned int		speed;
>>> -	struct clk		*clk;
>>> -	int			pending_write;
>>> -
>>> -	struct mt7621_spi_ops	*ops;
>>> +	struct spi_master *master;
>>> +	void __iomem *base;
>>> +	unsigned int sys_freq;
>>> +	unsigned int speed;
>>> +	struct clk *clk;
>>> +	int pending_write;
>>> +
>>> +	struct mt7621_spi_ops *ops;
>>
>> The original is fine.  I don't encourage people to do fancy indenting
>> with their local variable declarations inside functions but for a struct
>> the declarations aren't going to change a lot so people can get fancy
>> if they want.
>>
> Is there an explicit intent to deprecate Lindent in favor of checkpatch.pl
> --fix? If one would like to contribute to fixing the tooling for linting which
> of the two would be the right target for such an effort?
> 
>> The problem with a local is if you need to add a new variable then you
>> have to re-indent a bunch of unrelated lines or have one out of
>> alignment line.  Most people know this intuitively so they don't get
>> fancy.
>>
>>>   };
>>>   
>>>   static inline struct mt7621_spi *spidev_to_mt7621_spi(struct spi_device *spi)
>>> @@ -303,7 +303,7 @@ static int mt7621_spi_setup(struct spi_device *spi)
>>>   	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
>>>   
>>>   	if ((spi->max_speed_hz == 0) ||
>>> -		(spi->max_speed_hz > (rs->sys_freq / 2)))
>>> +	    (spi->max_speed_hz > (rs->sys_freq / 2)))
>>
>> Yeah.  Lindent is correct here.
> 
> Funny enough, this is something I adjusted manually :)
> 
>>>   		spi->max_speed_hz = (rs->sys_freq / 2);
>>>   
>>>   	if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
>>> @@ -316,9 +316,10 @@ static int mt7621_spi_setup(struct spi_device *spi)
>>>   }
>>>   
>>>   static const struct of_device_id mt7621_spi_match[] = {
>>> -	{ .compatible = "ralink,mt7621-spi" },
>>> +	{.compatible = "ralink,mt7621-spi"},
>>
>> The original was better.
>>
>>>   	{},
>>>   };
>>> +
>>>   MODULE_DEVICE_TABLE(of, mt7621_spi_match);
>>
>> No need for a blank.  These are closely related.
> 
> Ack.
> 
>>>   
>>>   static int mt7621_spi_probe(struct platform_device *pdev)
>>> @@ -408,9 +409,9 @@ MODULE_ALIAS("platform:" DRIVER_NAME);
>>>   
>>>   static struct platform_driver mt7621_spi_driver = {
>>>   	.driver = {
>>> -		.name = DRIVER_NAME,
>>> -		.of_match_table = mt7621_spi_match,
>>> -	},
>>> +		   .name = DRIVER_NAME,
>>> +		   .of_match_table = mt7621_spi_match,
>>> +		   },
>>
>> The new indenting is very wrong.
> 
> Ack. In fact, I was thinking this could be one target to fix the logic in
> Lindent to do this appropriately.
> 
> I have a process question here: to post a change for the only accepted change I
> have in this patch should I send out a new patch?

Would it be possible for you to wait a bit with this minor cleanup?
As I'm preparing a patch to move this driver out of staging right
now. You can definitely follow-up with your cleanup, once this move
is done. Otherwise the move might be delayed even more.

Thanks,
Stefan
