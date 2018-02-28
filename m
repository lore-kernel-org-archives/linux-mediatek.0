From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v3 01/22] nvmem: Document struct nvmem_config
Date: Thu, 1 Mar 2018 02:34:48 +0800
Message-ID: <1519842888.8089.88.camel@mtkswgap22>
References: <20180103200114.23922-1-andrew.smirnov@gmail.com>
         <20180103200114.23922-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103200114.23922-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, cphealy@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2018-01-03 at 12:00 -0800, Andrey Smirnov wrote:
> Add a simple description of struct nvmem_config and its fields.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Carlo Caione <carlo@caione.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: cphealy@gmail.com
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  include/linux/nvmem-provider.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 497706f5adca..27e599222ec1 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -22,6 +22,28 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
>  typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
>  				 void *val, size_t bytes);
>  
> +/**
> + * struct nvmem_config - NVMEM device configuration
> + *
> + * @dev:	Parent device.
> + * @name:	Optional name.
> + * @id:		Optional device ID used in full name. Ignored if name is NULL.
> + * @owner:	Pointer to exporter module. Used for refcounting.
> + * @cells:	Optional array of pre-defined NVMEM cells.
> + * @ncells:	Number of elements in cells.
> + * @read_only:	Device is read-only.
> + * @root_only:	Device is accessibly to root only.
> + * @reg_read:	Callback to read data.
> + * @reg_write:	Callback to write data.
> + * @size:	Device size.
> + * @word_size:	Minimum read/write access granularity.
> + * @stride:	Minimum read/write access stide.

typo on stide ?

> + * @priv:	User context passed to read/write callbacks.
> + *
> + * Note: A default "nvmem<id>" name will be assigned to the device if
> + * no name is specified in its configuration. In such case "<id>" is
> + * generated with ida_simple_get() and provided id field is ignored.
> + */
>  struct nvmem_config {
>  	struct device		*dev;
>  	const char		*name;
