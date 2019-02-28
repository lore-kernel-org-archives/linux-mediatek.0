From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/5] mt76: fix a leaked reference by adding a missing
 of_node_put
Date: Thu, 28 Feb 2019 08:39:04 +0000 (UTC)
Message-ID: <20190228083905.4B85260EA5@smtp.codeaurora.org>
References: <1550819742-32155-3-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550819742-32155-3-git-send-email-wen.yang99@zte.com.cn>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: wang.yi59@zte.com.cn, andrew@lunn.ch, alexandre.belloni@bootlin.com, f.fainelli@gmail.com, michal.simek@xilinx.com, netdev@vger.kernel.org, linus.walleij@linaro.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, Wen Yang <wen.yang99@zte.com.cn>, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, anirudh@xilinx.com, lorenzo.bianconi83@gmail.com, UNGLinuxDriver@microchip.com, John.Linn@xilinx.com, vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
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
