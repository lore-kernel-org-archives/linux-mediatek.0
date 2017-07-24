From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: ethernet: mediatek: Explicitly include
 linux/interrupt.h
Date: Mon, 24 Jul 2017 13:45:46 -0700 (PDT)
Message-ID: <20170724.134546.1106925176951200316.davem@davemloft.net>
References: <20170720100631.16040-1-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20170720100631.16040-1-broonie@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: broonie@kernel.org
Cc: nbd@openwrt.org, blogic@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Mark Brown <broonie@kernel.org>
Date: Thu, 20 Jul 2017 11:06:31 +0100

> The mediatek ethernet driver uses interrupts but does not explicitly
> include linux/interrupt.h, relying on implicit includes.  Fix this so we
> don't get build breaks as happened for ARM in next-20170720.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Applied, thanks.
