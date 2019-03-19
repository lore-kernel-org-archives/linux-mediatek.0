From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v2] Bluetooth: btmtksdio: fix uninitialized symbol errors
 in btmtksdio_rx_packet
Date: Tue, 19 Mar 2019 07:57:07 +0100
Message-ID: <8DD976C7-5512-4228-ADC1-62AE2A3921A1@holtmann.org>
References: <741bf172b7d0b77e664e7edeab1bd798c955cc5b.1552942432.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <741bf172b7d0b77e664e7edeab1bd798c955cc5b.1552942432.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

> Fixed all the below warnings. They would probably cause the following
> error handling path would use the uninitialized value and then produce
> unexpected behavior.
> 
> drivers/bluetooth/btmtksdio.c:470:2: warning: ‘old_len’ may be used
> uninitialized in this function [-Wmaybe-uninitialized]
>  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          old_data, old_len, true);
>          ~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/bluetooth/btmtksdio.c:376:15: note: ‘old_len’ was declared here
>  unsigned int old_len;
>               ^~~~~~~
> drivers/bluetooth/btmtksdio.c:470:2: warning: ‘old_data’ may be used
> uninitialized in this function [-Wmaybe-uninitialized]
>  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          old_data, old_len, true);
>          ~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/bluetooth/btmtksdio.c:375:17: note: ‘old_data’ was declared here
>  unsigned char *old_data;
>                 ^~~~~~~~
> 
> v2: Remove old_len and old_data because the error path for sdio_readsb also
>    seems wrong. And change the prefix from "mediatek" to "btmtksdio".
> 
> Fixes: d74eef2834b5 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reported-by: Marcel Holtmann <marcel@holtmann.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtksdio.c | 10 ----------
> 1 file changed, 10 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
