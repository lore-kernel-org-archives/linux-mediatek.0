From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v2] gnss: get serial speed from subdrivers
Date: Fri, 17 May 2019 10:45:53 +0200
Message-ID: <86y33579ku.fsf@baylibre.com>
References: <1558024626-19395-1-git-send-email-lollivier@baylibre.com> <69b5e90c-c1c3-9f2e-57a8-64741182a96e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69b5e90c-c1c3-9f2e-57a8-64741182a96e@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-mediatek@lists.infradead.org, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu 16 May 2019 at 19:02, Robin Murphy <robin.murphy@arm.com> wrote:

>> -/*
>> - * FIXME: need to provide subdriver defaults or separate dt parsing from
>> - * allocation.
>> - */
>>   static int gnss_serial_parse_dt(struct serdev_device *serdev)
>>   {
>>   	struct gnss_serial *gserial = serdev_device_get_drvdata(serdev);
>>   	struct device_node *node = serdev->dev.of_node;
>> -	u32 speed = 4800;
>> +	u32 speed;
>>   
>> -	of_property_read_u32(node, "current-speed", &speed);
>> +	of_property_read_u32(node, "default-speed", &speed);
>>   
>>   	gserial->speed = speed;
>
> Hmm, maybe it's a bit too convoluted for the compiler to warn about, but 
> if a "default-speed" property is not present, gserial->speed will now be 
> assigned an uninitialised value. I don't know what the intent is neither 
> the driver nor the DT provides a value, but you'll either need to bring 
> back the fallback initialisation above or propagate errors from 
> of_property_read_u32().
>
> Robin.
>

Robin,
Good point, thank you for your review. I'll think about it and see about
a fallback scenario.
I would be in favour of propagating the error because default values are
very dependent on the hardware in use.

Best,

Loys
