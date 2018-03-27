From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC usb-next v3 1/2] usb: core: split
 usb_phy_roothub_{init,alloc}
Date: Tue, 27 Mar 2018 11:00:04 +0200
Message-ID: <20180327090004.GA6649@kroah.com>
References: <20180326203846.7248-1-martin.blumenstingl@googlemail.com>
 <20180326203846.7248-2-martin.blumenstingl@googlemail.com>
 <05b749dc-c8e6-260f-287d-7b3e8f599d13@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <05b749dc-c8e6-260f-287d-7b3e8f599d13-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, j-keerthy-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 27, 2018 at 11:24:08AM +0300, Roger Quadros wrote:
> On 26/03/18 23:38, Martin Blumenstingl wrote:
> > Before this patch usb_phy_roothub_init served two purposes (from a
> > caller's point of view - like hcd.c):
> > - parsing the PHYs and allocating the list entries
> > - calling phy_init on each list entry
> > 
> > While this worked so far it has one disadvantage: if we need to call
> > phy_init for each PHY instance then the existing code cannot be re-used.
> > Solve this by splitting off usb_phy_roothub_alloc which only parses the
> > PHYs and allocates the list entries.
> > usb_phy_roothub_init then gets a struct usb_phy_roothub and only calls
> > phy_init on each PHY instance (along with the corresponding cleanup if
> > that failed somewhere).
> > 
> > This is a preparation step for adding proper suspend support for some
> > hardware that requires phy_exit to be called during suspend and phy_init
> > to be called during resume.
> > 
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> 
> I don't think we need RFC in subject.

As I don't apply series with RFC in the subject, that might be a good
idea :)
