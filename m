From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] net-next: mediatek: remove superfluous free_irq() call
Date: Mon, 04 Jul 2016 15:47:30 +0200
Message-ID: <6569336.G6c12n4Gqk@wuerfel>
References: <1467639430-64370-1-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1467639430-64370-1-git-send-email-john@phrozen.org>
Sender: netdev-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Monday, July 4, 2016 3:37:10 PM CEST John Crispin wrote:
> Commit 8067302973a1 ("net-next: mediatek: add support for IRQ grouping")
> adds handling for irq 1 and 2 to the uninit function but did not remove
> irq 0 which is not used since irq grouping was introduced. Fix this by
> removing the superfluous call to free_irq().
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: John Crispin <john@phrozen.org>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the quick update!
