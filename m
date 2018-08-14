From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH] Bluetooth: mediatek: Fix memory leak
Date: Wed, 15 Aug 2018 02:45:20 +0800
Message-ID: <1534272320.31978.28.camel@mtkswgap22>
References: <20180814151031.GA25096@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814151031.GA25096@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Gustavo

thanks for the catch up

Acked-by: Sean Wang <sean.wang@mediatek.com>


On Tue, 2018-08-14 at 10:10 -0500, Gustavo A. R. Silva wrote:
> In case memory resources for *fw* were allocated, release them before
> return.
> 
> Addresses-Coverity-ID: 1472611 ("Resource leak")
> Fixes: 7237c4c9ec92 ("Bluetooth: mediatek: Add protocol support for MediaTek serial devices")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/bluetooth/btmtkuart.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
> index ed2a5c7..4593baf 100644
> --- a/drivers/bluetooth/btmtkuart.c
> +++ b/drivers/bluetooth/btmtkuart.c
> @@ -144,8 +144,10 @@ static int mtk_setup_fw(struct hci_dev *hdev)
>  	fw_size = fw->size;
>  
>  	/* The size of patch header is 30 bytes, should be skip */
> -	if (fw_size < 30)
> -		return -EINVAL;
> +	if (fw_size < 30) {
> +		err = -EINVAL;
> +		goto free_fw;
> +	}
>  
>  	fw_size -= 30;
>  	fw_ptr += 30;
> @@ -172,8 +174,8 @@ static int mtk_setup_fw(struct hci_dev *hdev)
>  		fw_ptr += dlen;
>  	}
>  
> +free_fw:
>  	release_firmware(fw);
> -
>  	return err;
>  }
>  
