From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [RESEND PATCH] gnss: get serial speed from subdrivers
Date: Thu, 16 May 2019 18:39:24 +0200
Message-ID: <86y336l5fn.fsf@baylibre.com>
References: <1557322788-10403-1-git-send-email-lollivier@baylibre.com> <20190508155341.GA1605@Red>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508155341.GA1605@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed 08 May 2019 at 17:53, Corentin Labbe <clabbe.montjoie@gmail.com> wrote:
>> -/*
>> - * FIXME: need to provide subdriver defaults or separate dt parsing from
>> - * allocation.
>> - */
>>  static int gnss_serial_parse_dt(struct serdev_device *serdev)
>>  {
>>  	struct gnss_serial *gserial = serdev_device_get_drvdata(serdev);
>>  	struct device_node *node = serdev->dev.of_node;
>> -	u32 speed = 4800;
>> +	uint speed;
>>  
>> -	of_property_read_u32(node, "current-speed", &speed);
>> +	of_property_read_u32(node, "default-speed", &speed);
>
> Hello
>
> of_property_read_u32 use u32, so no reason to use uint instead.
>
> Regards

Hello Corentin,

Thank you for your review. A v2 has been sent:
https://lore.kernel.org/lkml/1558024626-19395-1-git-send-email-lollivier@baylibre.com/

Cheers,
Loys
