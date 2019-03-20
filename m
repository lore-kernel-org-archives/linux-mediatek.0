From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2] usb: introduce usb_ep_type_string() function
Date: Wed, 20 Mar 2019 15:49:42 +0800
Message-ID: <1553068182.10179.166.camel@mhfsdcap03>
References: <28a8e9f1518e47c35e4563706cbe592b972a7f9d.1552977710.git.chunfeng.yun@mediatek.com>
 <1552982059.10179.143.camel@mhfsdcap03> <20190319092331.GA21652@kroah.com>
 <1553044567.10179.148.camel@mhfsdcap03> <87r2b2ujao.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87r2b2ujao.fsf@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felipe Balbi <balbi@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Matteo Croce <mcroce@redhat.com>, Dmitry Torokhov <dtor@chromium.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Colin
List-Id: linux-mediatek@lists.infradead.org

Hi Felipe,

On Wed, 2019-03-20 at 08:55 +0200, Felipe Balbi wrote:
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> 
> > Hi Greg,
> >
> > On Tue, 2019-03-19 at 10:23 +0100, Greg Kroah-Hartman wrote:
> >> On Tue, Mar 19, 2019 at 03:54:19PM +0800, Chunfeng Yun wrote:
> >> > 
> >> > Hi Felipe & Mathias,
> >> > 
> >> > Could you please comment this patch, if there is some-effect on dwc3 and
> >> > xhci, I'll remove its change.
> > typo: some-effect/side-effect
> 
> well, we don't really know if there are tools parsing the output. The
> side-effect _does_ exist (i.e. you change the string :-), what we don't
> know is if this will cause problems to possibly existing tools.
> 
> Personally, I don't mind the patch, but if it breaks existing parsers,
> that would be a little annoying.
Thank you for the feedback.

I'll abandon the changes about dwc3 & xhci
> 
