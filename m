From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/5] nvmem: mtk-efuse: use stack for nvmem_config instead
 of malloc'ing it
Date: Thu, 21 Sep 2017 11:09:35 +0900
Message-ID: <CAK7LNARoZnVduzkWqyTYq4iMEAi0A88cpGWrD0Zc=wt=Xa+1QA@mail.gmail.com>
References: <1505134864-11975-1-git-send-email-yamada.masahiro@socionext.com>
 <1505134864-11975-3-git-send-email-yamada.masahiro@socionext.com> <1505925159.17049.12.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505925159.17049.12.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Keiji Hayashibara <hayashibara.keiji@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,


2017-09-21 1:32 GMT+09:00 Sean Wang <sean.wang@mediatek.com>:
> Hi, Masahiro
>
> For maintainability, I felt it's better if we use the same way to
> register nvmem as that most drivers does under nvmem usually using
> static structure. Otherwise, they should also be changed to use the
> one-time data in stack to avoid extra bytes to keep them.
>
>         Sean


Srinivas and I discussed the best practice for allocating nvmem_config.
https://lkml.org/lkml/2017/9/11/4

>From the discussion, static structure is possible only when
the system has one instance of the device.

If you know this is the case for mediatek,
yes, you can turn it into static,
but it is not always possible.
For example, Socionext SoCs have
two banks of efuse devices.

So, if we want to align the coding style for consistency,
nvmem in stack is safe and efficient, I think.


Moving one-time data into stack slightly
reduces the kernel image size.


-- 
Best Regards
Masahiro Yamada
