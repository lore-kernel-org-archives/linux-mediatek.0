From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2 01/21] nvmem: core: Allow specifying device name verbatim
Date: Tue, 2 Jan 2018 10:40:22 -0800
Message-ID: <CAHQ1cqEnRL=Lwk_35NVR9r-mQ8giJ=mku+WGxp8gAMm_1Wi__w@mail.gmail.com>
References: <20180101232310.30420-1-andrew.smirnov@gmail.com>
 <20180101232310.30420-2-andrew.smirnov@gmail.com> <ba0b8125-6094-d042-a391-edcc2f68a114@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba0b8125-6094-d042-a391-edcc2f68a114@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chris Healy <cphealy@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jan 2, 2018 at 3:44 AM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> Thanks for the Patch,
>
> On 01/01/18 23:22, Andrey Smirnov wrote:
>>
>> Add code to allow avoid having nvmem core append a numeric suffix to
>> the end of the name by passing config->id of -1.
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
>>   drivers/nvmem/core.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
> This looks fine for me, Can you also add a line in kernel doc about this
> behavior.
>

Sure, will do in v3.

Thanks,
Andrey Smirnov
