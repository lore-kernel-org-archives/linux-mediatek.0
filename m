From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: mt76x2e hardware restart
Date: Tue, 15 Oct 2019 18:52:12 +0200
Message-ID: <f7695bc79d40bbc96744a639b1243027@natalenko.name>
References: <deaafa7a3e9ea2111ebb5106430849c6@natalenko.name>
 <c6d621759c190f7810d898765115f3b4@natalenko.name>
 <9d581001e2e6cece418329842b2b0959@natalenko.name>
 <20191012165028.GA8739@lore-desk-wlan.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191012165028.GA8739@lore-desk-wlan.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <sgruszka@redhat.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
List-Id: linux-mediatek@lists.infradead.org

Hey.

On 12.10.2019 18:50, Lorenzo Bianconi wrote:
> sorry for the delay. Felix and me worked on this issue today. Could you 
> please
> try if the following patch fixes your issue?

Thanks for the answer and the IRC discussion. As agreed I've applied [1] 
and [2], and have just swapped the card to try it again. So far, it 
works fine in 5 GHz band in 802.11ac mode as an AP.

I'll give it more load with my phone over evening, and we can discuss 
what to do next (if needed) tomorrow again. Or feel free to drop me an 
email today.

Thanks for your efforts.

[1] 
https://github.com/LorenzoBianconi/wireless-drivers-next/commit/cf3436c42a297967235a9c9778620c585100529e.patch
[2] 
https://github.com/LorenzoBianconi/wireless-drivers-next/commit/aad256eb62620f9646d39c1aa69234f50c89eed8.patch

-- 
   Oleksandr Natalenko (post-factum)
