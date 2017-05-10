From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Soc: mediatek - Fix possible NULL derefrence.
Date: Wed, 10 May 2017 13:34:18 +0200
Message-ID: <f0719f59-c2ad-cf94-b230-730095f87c50@gmail.com>
References: <CGME20170127111755epcas4p4f4bf0401e49ddd4563b0365b838d3dde@epcas4p4.samsung.com>
 <1485515868-3671-1-git-send-email-shailendra.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485515868-3671-1-git-send-email-shailendra.v@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shailendra Verma <shailendra.v@samsung.com>, John Crispin <blogic@openwrt.org>, Henry Chen <henryc.chen@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-mediatek@lists.infradead.org



On 27/01/17 12:17, Shailendra Verma wrote:
> of_match_device could return NULL, and so can cause a NULL
> pointer dereference later.
> 
> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>

I fixed the subject line and queued it for v4.12-next/soc
Sorry for the (huge) delay.

Matthias

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c |    5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index a5f1093..c48db98 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1117,6 +1117,11 @@ static int pwrap_probe(struct platform_device *pdev)
>   	const struct of_device_id *of_slave_id = NULL;
>   	struct resource *res;
>   
> +	if (!of_id) {
> +		dev_err(&pdev->dev, "Error: No device match found\n");
> +		return -ENODEV;
> +	}
> +
>   	if (pdev->dev.of_node->child)
>   		of_slave_id = of_match_node(of_slave_match_tbl,
>   					    pdev->dev.of_node->child);
> 
