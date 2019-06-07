From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: Remove set but not used variables 'pid' and
 'final_mpdu'
Date: Fri, 7 Jun 2019 19:01:36 +0200
Message-ID: <f3e5d386-e1de-d707-397d-2ef99e09f345@nbd.name>
References: <20190529145356.13872-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529145356.13872-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, royluo@google.com, kvalo@codeaurora.org, matthias.bgg@gmail.com, sgruszka@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, davem@davemloft.net
List-Id: linux-mediatek@lists.infradead.org

On 2019-05-29 16:53, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warnings:
> 
> drivers/net/wireless/mediatek/mt76/mt7603/mac.c: In function mt7603_fill_txs:
> drivers/net/wireless/mediatek/mt76/mt7603/mac.c:969:5: warning: variable pid set but not used [-Wunused-but-set-variable]
> drivers/net/wireless/mediatek/mt76/mt7603/mac.c:961:7: warning: variable final_mpdu set but not used [-Wunused-but-set-variable]
> drivers/net/wireless/mediatek/mt76/mt7615/mac.c: In function mt7615_fill_txs:
> drivers/net/wireless/mediatek/mt76/mt7615/mac.c:555:5: warning: variable pid set but not used [-Wunused-but-set-variable]
> drivers/net/wireless/mediatek/mt76/mt7615/mac.c:552:19: warning: variable final_mpdu set but not used [-Wunused-but-set-variable]
> 
> They are never used, so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.

- Felix
