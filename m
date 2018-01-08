From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: mt76: fix memcpy to potential null pointer on failed allocation
Date: Mon,  8 Jan 2018 17:28:58 +0000 (UTC)
Message-ID: <20180108172858.9D82A60215@smtp.codeaurora.org>
References: <20171214101322.10178-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171214101322.10178-1-colin.king@canonical.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Ian King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
List-Id: linux-mediatek@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the allocation of skb fails and returns NULL then the
> call to skb_put will cause a null pointer dereference. Fix this by
> checking for a null skb and returning NULL.  Note that calls to
> function mt76x2_mcu_msg_alloc don't directly check the null return
> but instead pass the NULL pointer to mt76x2_mcu_msg_send which
> checks for the NULL and returns ENOMEM in this case.
> 
> Detected by CoverityScan, CID#1462624 ("Dereference null return value")
> 
> Fixes: 7bc04215a66b ("mt76: add driver code for MT76x2e")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Felix Fietkau <nbd@nbd.name>

Patch applied to wireless-drivers-next.git, thanks.

364bea50dbea mt76: fix memcpy to potential null pointer on failed allocation

-- 
https://patchwork.kernel.org/patch/10111747/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
