From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: mediatek: fix checking for NULL instead of
 IS_ERR() in .probe
Date: Wed, 23 Mar 2016 13:50:15 -0400 (EDT)
Message-ID: <20160323.135015.4255305663652743.davem@davemloft.net>
References: <1458687964-9690-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1458687964-9690-1-git-send-email-vz@mleia.com>
Sender: netdev-owner@vger.kernel.org
To: vz@mleia.com
Cc: nbd@openwrt.org, blogic@openwrt.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Vladimir Zapolskiy <vz@mleia.com>
Date: Wed, 23 Mar 2016 01:06:04 +0200

> devm_ioremap_resource() returns ERR_PTR() value on error, it never
> returns NULL, fix it and propagate the returned error upwards.
> 
> Fixes: 656e705243fd ("net-next: mediatek: add support for MT7623 ethernet")
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Applied, thanks.
