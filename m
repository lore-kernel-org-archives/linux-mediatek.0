From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH] Bluetooth: mediatek: Fixed incorrect type in assignment
Date: Tue, 19 Mar 2019 07:58:10 +0100
Message-ID: <53100DF6-DAB8-40C2-8DEF-CE4146FC6023@holtmann.org>
References: <64582ec6b953c055bc3cf18e7bba18d578f03b0a.1551744635.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <64582ec6b953c055bc3cf18e7bba18d578f03b0a.1551744635.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

> Fixed warning: incorrect type in assignment reported by kbuild test robot.
> The detailed warning is shown as below.
> 
> make ARCH=x86_64 allmodconfig
> make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> 
> All warnings (new ones prefixed by >>):
> 
> btmtkuart.c:671:18: sparse:    warning: incorrect type in assignment
> 			       (different base types)
> btmtkuart.c:671:18: sparse:    expected unsigned int [usertype] baudrate
> btmtkuart.c:671:18: sparse:    got restricted __le32 [usertype]
> 
> sparse warnings: (new ones prefixed by >>)
> btmtkuart.c:671:18: sparse: warning: incorrect type in assignment
> 			       (different base types)
> btmtkuart.c:671:18: sparse:    expected unsigned int [usertype] baudrate
> btmtkuart.c:671:18: sparse:    got restricted __le32 [usertype]
> 
> vim +671 drivers/bluetooth/btmtkuart.c
> 
>   659
>   660	static int btmtkuart_change_baudrate(struct hci_dev *hdev)
>   661	{
>   662		struct btmtkuart_dev *bdev = hci_get_drvdata(hdev);
>   663		struct btmtk_hci_wmt_params wmt_params;
>   664		u32 baudrate;
>   665		u8 param;
>   666		int err;
>   667
>   668		/* Indicate the device to enter the probe state the host is
>   669		 * ready to change a new baudrate.
>   670		 */
>> 671		baudrate = cpu_to_le32(bdev->desired_speed);
>   672		wmt_params.op = MTK_WMT_HIF;
> 
> Fixes: 22eaf6c9946a ("Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART devices")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtkuart.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
