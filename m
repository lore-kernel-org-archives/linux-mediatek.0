From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: fix header guard macro define names
Date: Mon, 1 Oct 2018 13:57:22 +0200
Message-ID: <ae443a0d-9272-d538-ee85-6d5bf1231db8@nbd.name>
References: <20180930225715.18491-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180930225715.18491-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-10-01 00:57, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The header guards that are #defined are different from those being
> checked.  Fix this by #defining them to the correct name.
> 
> Fixes clang warnings:
> drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h:17:9:
> warning: '__MT76x02_MCU_H' is used as a header guard here, followed
> by #define of a different macro [-Wheader-guard]
> 
> drivers/net/wireless/mediatek/mt76/mt76x02_usb.h:17:9:
> warning: '__MT76x02_USB_H' is used as a header guard here, followed
> by #define of a different macro [-Wheader-guard]
> 
> Fixes: 905db7470199 ("mt76: usb: move mt76x02 mcu code in mt76x02-usb module")
> Fixes: edaa580bc830 ("mt76: move shared mcu_calibrate routine in mt76x02-lib module")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Merged, thanks.

- Felix
