From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH RESEND v2] Bluetooth: mediatek: add support for MediaTek
 MT7663U and MT7668U UART devices
Date: Sat, 2 Mar 2019 19:52:18 +0100
Message-ID: <826E5A6F-3429-416D-B4F4-DE3F6349D7FF@holtmann.org>
References: <35cb9acf1c5604e1d975efe9186879fc826fbe2f.1551551989.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <35cb9acf1c5604e1d975efe9186879fc826fbe2f.1551551989.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

> This adds the support of enabling MT7663U and MT7668U Bluetooth function
> running on the top of btmtkuart driver.
> 
> There are a few differences between MT766[3,8]U and MT7622 where
> MT766[3,8]U are standalone devices based on UART transport while MT7622
> bluetooth is a built-in device on MediaTek SoC communicating with the host
> through BTIF serial transport. Thus, extra setup sequence is necessary
> for these standalone devices such as remote regulator and reset control via
> GPIO, baud rate changing handshake between the host and device and so on.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtkuart.c | 281 ++++++++++++++++++++++++++++++++--
> 1 file changed, 271 insertions(+), 10 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
