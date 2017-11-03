From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems enabling the PCIe/USB3.0 port on MT7623N
Date: Fri, 3 Nov 2017 17:20:42 +0100
Message-ID: <CAKfDRXg=vno2wOL39JAUGnKHEsXVb4XyewEmPR5CHf5k+66xhw@mail.gmail.com>
References: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg@mail.gmail.com>
 <1509675191.20200.18.camel@mtkswgap22>
 <CAKfDRXjrDPKo-mveCb8o7YFdBbBa53kt8WTPDi1RhMXMcbvMYw@mail.gmail.com>
 <d9c34106-3a90-1df0-6765-1ab230372468@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <d9c34106-3a90-1df0-6765-1ab230372468-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi all,

On Fri, Nov 3, 2017 at 1:19 PM, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org> wrote:
> I managed to get the 2nd USBport working on the LEDE last night and will
> push a patch today. the usb2 node is simply not getting enabled and the 2nd
> phys node is missing 2 properties.

Based on this comment from John, I took a second look at the
mt7623.dtsi file in LEDE and updated the structure of u3phy2 to match
that of phy1. Now, I can see the hub. I.e., dmesg contains the
following:

[    1.095790] xhci-mtk 1a240000.usb: xHCI Host Controller
[    1.100998] xhci-mtk 1a240000.usb: new USB bus registered, assigned
bus number 3
[    1.108643] xhci-mtk 1a240000.usb: hcc params 0x01401198 hci
version 0x96 quirks 0x00210010
[    1.117009] xhci-mtk 1a240000.usb: irq 198, io mem 0x1a240000
[    1.123373] hub 3-0:1.0: USB hub found
[    1.127154] hub 3-0:1.0: 1 port detected
[    1.131426] xhci-mtk 1a240000.usb: xHCI Host Controller
[    1.136646] xhci-mtk 1a240000.usb: new USB bus registered, assigned
bus number 4
[    1.144068] usb usb4: We don't know the algorithms for LPM for this
host, disabling LPM.
[    1.152707] hub 4-0:1.0: USB hub found
[    1.156480] hub 4-0:1.0: 1 port detected

However, I still can't see the device connected to the slot. I don't
know if that (in most cases at least) should just work out of the box,
or if additional steps are required? I suspect the following error
might be related:

[    1.314407] mediatek-pcie 1a140000.pcie: can't request region for
resource [mem 0x1a244000-0x1a244fff]
[    1.353851] mediatek-pcie 1a140000.pcie: Failed to get pcie phy2
range fffffff0
[    1.361099] mediatek-pcie 1a140000.pcie: failed to request resources: -16
[    1.367896] mediatek-pcie: probe of 1a140000.pcie failed with error -16

I have to admit that I don't have so much experience working with
dts', etc. so apologizes for any stupid questions.

Thanks in advance for all the help so far,
Kristian
