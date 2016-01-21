From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: SCPSYS: use builtin_platform_driver
Date: Thu, 21 Jan 2016 18:55:04 +0100
Message-ID: <56A11B78.8030405@gmail.com>
References: <1451464240-5313-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451464240-5313-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: s.hauer@pengutronix.de, arnd@arndb.de, djkurtz@chromium.org, paul.gortmaker@windriver.com, eddie.huang@mediatek.com, jamesjj.liao@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 30/12/15 09:30, Matthias Brugger wrote:
> SCPSYS can't be built as module. Use builtin_platform_driver instead.
> For this probe must not be __init and the data accessed can't be
> __initconst. Remove this macros. To make the impact as small as possible,
> fold scp_domain_data into scp_domain via a pointer.
>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Daniel Kurtz <djkurtz@chromium.org>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to v4.5-next/soc with the tags.

Daniel actually stands out, with Reported-by, Reviewed-by and Tested-by 
tags. :)

Thanks!
