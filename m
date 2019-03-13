From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Wed, 13 Mar 2019 17:54:43 +0100
Message-ID: <4172ce05-8dfc-c956-6af0-47c8367c215e@denx.de>
References: <20190313122403.248873-1-armax@google.com>
 <eb85ea17-babd-fe3a-f0ff-9c7f13498bd1@gmail.com>
 <CAJsYDVKF-3jZo4E3EMiYOqeWXVLu0hBra6Qp0sFoCz8y=BAjSw@mail.gmail.com>
 <4789d739-d2b5-357b-b9d8-bfaf587d33fc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4789d739-d2b5-357b-b9d8-bfaf587d33fc@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>
Cc: Armando Miraglia <arma2ff0@gmail.com>, NeilBrown <neil@brown.name>, Armando Miraglia <armax@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sankalpnegi2310@gmail.com, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 13.03.19 17:46, Matthias Brugger wrote:
> 
> 
> On 13/03/2019 17:34, Chuanhong Guo wrote:
>> Hi!
>> On Wed, Mar 13, 2019 at 8:28 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 13/03/2019 13:24, Armando Miraglia wrote:
>>> [...]
>>> Apart from fixing styling issues it would be usefull to see if we can add
>>> support for mt7621 to drivers/spi/spi-mt65xx.c
>> It's impossible. They are completely different IPs.
> 
> Thanks for the info. Do you know the status of the rest of the drivers in staging?

Just to inform you. We are using this SPI driver from staging
in one of our customer projects and I will try to move this
driver out of staging into drivers/spi very shortly.

Thanks,
Stefan
