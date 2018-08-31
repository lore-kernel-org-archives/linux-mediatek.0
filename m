From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt76: Fix comparisons with invalid hardware key index
Date: Fri, 31 Aug 2018 15:52:48 +0000 (UTC)
Message-ID: <20180831155248.B4F3460445@smtp.codeaurora.org>
References: <20180823212738.18431-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823212738.18431-1-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-mediatek@lists.infradead.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> With gcc 4.1.2:
> 
>     drivers/net/wireless/mediatek/mt76/mt76x0/tx.c: In function ‘mt76x0_tx’:
>     drivers/net/wireless/mediatek/mt76/mt76x0/tx.c:169: warning: comparison is always true due to limited range of data type
>     drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c: In function ‘mt76x2_tx’:
>     drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c:35: warning: comparison is always true due to limited range of data type
> 
> While assigning -1 to a u8 works fine, comparing with -1 does not work
> as expected.
> 
> Fix this by comparing with 0xff, like is already done in some other
> places.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Patch applied to wireless-drivers-next.git, thanks.

81c8eccc2404 mt76: Fix comparisons with invalid hardware key index

-- 
https://patchwork.kernel.org/patch/10574583/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
