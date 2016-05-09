From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 01/22] net-next: mediatek: use mdiobus_free() in
 favour of kfree()
Date: Mon, 9 May 2016 14:07:35 +0200
Message-ID: <20160509120735.GR7972@lunn.ch>
References: <1462788254-40572-1-git-send-email-john@phrozen.org>
 <1462788254-40572-2-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462788254-40572-2-git-send-email-john@phrozen.org>
Sender: netdev-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: davem@davemloft.net, nbd@nbd.name, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, May 09, 2016 at 12:03:53PM +0200, John Crispin wrote:
> The driver currently uses kfree() to clear the mii_bus. This is not the
> correct way to clear the memory and mdiobus_free() should be used instead.
> This patch fixes the two instances where this happens in the driver.
> 
> Reported-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: John Crispin <john@phrozen.org>

Thanks John

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

       Andrew
