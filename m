From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 00/22] Verbatim device names and
 devm_nvmem_(un)register()
Date: Mon, 26 Feb 2018 09:30:12 +0000
Message-ID: <858e2843-1aa9-05e5-7f36-926da1c92db1@linaro.org>
References: <20180103200114.23922-1-andrew.smirnov@gmail.com>
 <CAMRc=Mct60LMcr-CGJue1dTK+XNwz=dmkm2arTGeN1czeN9JoA@mail.gmail.com>
 <61e56a69-5722-138e-481e-44473a79b388@linaro.org>
 <CAHQ1cqGp3jPvb1FNd9SoP_t-hzAHZazAOobrgM2yustrZ5ja6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHQ1cqGp3jPvb1FNd9SoP_t-hzAHZazAOobrgM2yustrZ5ja6w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chris Healy <cphealy@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Andrey,
Thankyou for your patience.

On 26/02/18 03:45, Andrey Smirnov wrote:
> On Thu, Jan 25, 2018 at 1:17 AM, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>> On 24/01/18 11:13, Bartosz Golaszewski wrote:
>>>>
>>>>
>>> Hi Srinivas,
>>>
>>> I don't see this series in next - is it going to miss this merge window?
>>>
>>
>> Thanks for your patience.
>>
>> In general, I pick stuff which are sent before rc5-rc6 and send it to Greg
>> KH for inclusion in char-misc tree.
>>
>> These patches will be queued for next release cycle..
>>
> 
> Srinivas:
> 
> Correct me if I am wrong, but doesn't seem like these patches made it
> to char-misc tree yet. I was recently rebasing them on top of Linus'

As this is 4.17 material, these will not go into char-misc tree until or 
after rc5.
> master and ended up having to resolve a couple of merge conflicts, so
> would you like me to re-spin v4 on top of 4.16-rc1 (or any other
> version) and re-submit the series?
Sure thanks, If you can respin the patches than that would reduce my 
time while sending it to Greg. I will send them to Greg next week.

thanks,
Srini
> 
> Thanks,
> Andrey Smirnov
> 
