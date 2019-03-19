From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: introduce usb_ep_type_string() function
Date: Tue, 19 Mar 2019 10:23:31 +0100
Message-ID: <20190319092331.GA21652@kroah.com>
References: <28a8e9f1518e47c35e4563706cbe592b972a7f9d.1552977710.git.chunfeng.yun@mediatek.com>
 <1552982059.10179.143.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552982059.10179.143.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 19, 2019 at 03:54:19PM +0800, Chunfeng Yun wrote:
> 
> Hi Felipe & Mathias,
> 
> Could you please comment this patch, if there is some-effect on dwc3 and
> xhci, I'll remove its change.

To be specific, you are changing the string values for things that might
care about it and are seen by userspace.

Please be explicit about this, as it could cause problems.

greg k-h
