From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7615: Make mt7615_irq_handler static
Date: Sat, 11 May 2019 16:24:03 +0200
Message-ID: <eb17d602-ab87-2d75-7d82-acbf93ede150@nbd.name>
References: <20190504102247.43720-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190504102247.43720-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, royluo@google.com, kvalo@codeaurora.org, matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 2019-05-04 12:22, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/net/wireless/mediatek/mt76/mt7615/pci.c:37:13:
>  warning: symbol 'mt7615_irq_handler' was not declared. Should it be static?
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Applied, thanks.

- Felix
