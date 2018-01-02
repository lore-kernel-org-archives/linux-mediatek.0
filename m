From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2 02/21] nvmem: Introduce devm_nvmem_(un)register()
Date: Tue, 2 Jan 2018 10:40:57 -0800
Message-ID: <CAHQ1cqGTophCKYsf=c_YECwBt8tQRhpT0wfvQwVxj+YyJO49xg@mail.gmail.com>
References: <20180101232310.30420-1-andrew.smirnov@gmail.com>
 <20180101232310.30420-3-andrew.smirnov@gmail.com> <f3ffb0f7-2d27-9c58-549f-dc44209f27c6@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f3ffb0f7-2d27-9c58-549f-dc44209f27c6@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chris Healy <cphealy@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jan 2, 2018 at 3:44 AM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> Thanks for the patch,
>
> On 01/01/18 23:22, Andrey Smirnov wrote:
>>
>> Introduce devm_nvmem_register()/devm_nvmem_unregister() to make
>> .remove() unnecessary in trivial drivers.
>>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: Carlo Caione <carlo@caione.org>
>> Cc: Kevin Hilman <khilman@baylibre.com>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: cphealy@gmail.com
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mediatek@lists.infradead.org
>> Cc: linux-rockchip@lists.infradead.org
>> Cc: linux-amlogic@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>   drivers/nvmem/core.c           | 41
>> +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/nvmem-provider.h | 17 +++++++++++++++++
>>   2 files changed, 58 insertions(+)
>>
> Patch looks good, kernel doc for these exported symbols are missing, you
> should add them in next version!
>

Good point! Will do in v3.

Thanks,
Andrey Smirnov
