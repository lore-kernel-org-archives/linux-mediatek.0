From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mediatek: Update SoC entry
Date: Sun, 2 Dec 2018 20:39:13 +0100
Message-ID: <2529be64-7737-6237-7558-fb15dd22b513@gmail.com>
References: <20181016145758.12995-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016145758.12995-1-matthias.bgg@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, davem@davemloft.net, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, arm-soc <arm@kernel.org>
List-Id: linux-mediatek@lists.infradead.org



On 16/10/2018 16:57, Matthias Brugger wrote:
> Add IRC channel and URL of the wiki.
> Also add soc drivers folder and regex to catch more
> mediatek components.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Any comments on this patch?
Through which tree should it go?

Regards,
Matthias

>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ac000cc006d..66782dad6487 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1676,13 +1676,17 @@ ARM/Mediatek SoC support
>  M:	Matthias Brugger <matthias.bgg@gmail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +W:	https://mtk.bcnfs.org/
> +C:	irc://chat.freenode.net/linux-mediatek
>  S:	Maintained
>  F:	arch/arm/boot/dts/mt6*
>  F:	arch/arm/boot/dts/mt7*
>  F:	arch/arm/boot/dts/mt8*
>  F:	arch/arm/mach-mediatek/
>  F:	arch/arm64/boot/dts/mediatek/
> +F:	drivers/soc/mediatek/
>  N:	mtk
> +N:	mt[678]
>  K:	mediatek
>  
>  ARM/Mediatek USB3 PHY DRIVER
> 
