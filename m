From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems enabling the PCIe/USB3.0 port on MT7623N
Date: Sat, 4 Nov 2017 13:05:19 +0100
Message-ID: <CAKfDRXhbivcsjmArn3zgb-bvP8HDzfzrL92e8+6cdi0LtyQySg@mail.gmail.com>
References: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg@mail.gmail.com>
 <1509675191.20200.18.camel@mtkswgap22>
 <CAKfDRXjrDPKo-mveCb8o7YFdBbBa53kt8WTPDi1RhMXMcbvMYw@mail.gmail.com>
 <d9c34106-3a90-1df0-6765-1ab230372468@phrozen.org>
 <CAKfDRXg=vno2wOL39JAUGnKHEsXVb4XyewEmPR5CHf5k+66xhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXg=vno2wOL39JAUGnKHEsXVb4XyewEmPR5CHf5k+66xhw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

First of all, I see that I have completely forgot to mention the board
I am using, sorry about that. It is this one:
http://www.unielecinc.com/q/news/cn/p/product/detail.html?qd_guid=OjXwKCaRlN

On Fri, Nov 3, 2017 at 5:20 PM, Kristian Evensen
<kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [    1.314407] mediatek-pcie 1a140000.pcie: can't request region for
> resource [mem 0x1a244000-0x1a244fff]
> [    1.353851] mediatek-pcie 1a140000.pcie: Failed to get pcie phy2
> range fffffff0
> [    1.361099] mediatek-pcie 1a140000.pcie: failed to request resources: -16
> [    1.367896] mediatek-pcie: probe of 1a140000.pcie failed with error -16

John explained this error message to me yesterday and we got a working
usb2. However, when disabling pcie2 and enabling usb2, the only thing
that happened was that one of the wifi-cards disappeared. The USB slot
(the one with the LTE module in the picture in the link above) was
still dead. After discovering this, I loaded the proprietary firmware
(version where the slot is working) to check the output of lspci and
see if pcie2 was enabled/disabled. lspci showed three bridges and
three devices - 01:00.0 contained a SATA controller, while 02:00.0 and
03:00.0 contained the wifi radios. I guess this points to the issue of
the dead slot not having to do with usb2 being disabled.

As I mentioned in an earlier email to the list, the manufacturer says
that the modem slot will be exposed if USB OTG is opened (I suspect
they mean put in host mode), so I guess that would be the next path to
explore. I see that there is a USB 2.0 OTG block on the hardware
diagram, and I see that the tphy-driver contains code which always
enables OTG. Has anyone got OTG working and is there any way to verify
that OTG is up and running? I did some research last night and found
this patch: https://patchwork.kernel.org/patch/9963671/. I forced the
bits to be set/unset for OTG and host-mode (separate tests), but
nothing happened.

BR,
Kristian
