From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/5] mt76: fix a leaked reference by adding a missing
 of_node_put
Date: Thu, 28 Feb 2019 08:39:05 +0000 (UTC)
Message-ID: <20190228083905.DB24460F3D@smtp.codeaurora.org>
References: <1550819742-32155-3-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550819742-32155-3-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linus.walleij@linaro.org, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com, nbd@nbd.name, lorenzo.bianconi83@gmail.com, matthias.bgg@gmail.com, linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, anirudh@xilinx.com, John.Linn@xilinx.com, michal.simek@xilinx.com, wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>
List-Id: linux-mediatek@lists.infradead.org

Wen Yang <wen.yang99@zte.com.cn> wrote:

> The call to of_find_node_by_phandle returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./drivers/net/wireless/mediatek/mt76/eeprom.c:58:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 48, but without a corresponding object release within this function.
> ./drivers/net/wireless/mediatek/mt76/eeprom.c:61:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 48, but without a corresponding object release within this function.
> ./drivers/net/wireless/mediatek/mt76/eeprom.c:67:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 48, but without a corresponding object release within this function.
> ./drivers/net/wireless/mediatek/mt76/eeprom.c:70:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 48, but without a corresponding object release within this function.
> ./drivers/net/wireless/mediatek/mt76/eeprom.c:72:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 48, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Felix Fietkau <nbd@nbd.name>
> Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Patch applied to wireless-drivers-next.git, thanks.

34e022d8b780 mt76: fix a leaked reference by adding a missing of_node_put

-- 
https://patchwork.kernel.org/patch/10825315/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
