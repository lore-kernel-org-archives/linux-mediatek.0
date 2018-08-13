From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mailbox: mediatek: add module license
Date: Mon, 13 Aug 2018 15:50:18 -0700
Message-ID: <e5ccb767-2c8c-b677-42ae-436666570c14@infradead.org>
References: <20180813214500.3398337-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180813214500.3398337-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: HS Liao <hs.liao@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 08/13/2018 02:44 PM, Arnd Bergmann wrote:
> The missing license tag in the new driver causes a compile-time warning,
> and may result in the module being unusable if it calls EXPORT_SYMBOL_GPL()
> functions:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox/mtk-cmdq-mailbox.o
> 
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 6f92c5ee12f7..aec46d5d3506 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -567,3 +567,5 @@ static void __exit cmdq_drv_exit(void)
>  
>  subsys_initcall(cmdq_drv_init);
>  module_exit(cmdq_drv_exit);
> +
> +MODULE_LICENSE("GPL v2");
> 

https://lore.kernel.org/lkml/99f4666b-95fc-a1dd-04d3-3d1d803990fb@infradead.org/


-- 
~Randy
