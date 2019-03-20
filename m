From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2] usb: introduce usb_ep_type_string() function
Date: Wed, 20 Mar 2019 09:16:07 +0800
Message-ID: <1553044567.10179.148.camel@mhfsdcap03>
References: <28a8e9f1518e47c35e4563706cbe592b972a7f9d.1552977710.git.chunfeng.yun@mediatek.com>
         <1552982059.10179.143.camel@mhfsdcap03> <20190319092331.GA21652@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319092331.GA21652@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi Greg,

On Tue, 2019-03-19 at 10:23 +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 19, 2019 at 03:54:19PM +0800, Chunfeng Yun wrote:
> > 
> > Hi Felipe & Mathias,
> > 
> > Could you please comment this patch, if there is some-effect on dwc3 and
> > xhci, I'll remove its change.
typo: some-effect/side-effect
> 
> To be specific, you are changing the string values for things that might
> care about it and are seen by userspace.
> 
> Please be explicit about this, as it could cause problems.
Thank you for making it more clearer

> 
> greg k-h
