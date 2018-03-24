From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC usb-next v2 0/2] fix HCD PHY suspend handling
Date: Sat, 24 Mar 2018 15:21:19 +0100
Message-ID: <20180324142121.8618-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This is a follow-up to my previous series "initialize (multiple) PHYs
for a HCD": [0].

Roger Quadros reported [1] that it "is breaking low power cases on TI
SoCs when USB is in host mode". He further explains that "Not doing the
phy_exit() here [when entering suspend] leaves the clocks enabled on
our SoC and we're no longer able to reach low power states on system
suspend."
Chunfeng Yun from Mediatek noted [2] that we cannot unconditionally call
phy_exit while entering system suspend, because this would "disconnect
plugged devices on MTK platforms, due to re-initialize u2 phys when
resume"

In the discussion (which followed Roger's bug report: [1]) Roger,
Chunfeng and me came to the conclusion that we can fix suspend on the
TI SoCs without breaking it on the Mediatek SoCs by extending the
suspend and resume code in usb/core/phy.c by checking whether the USB
controller can wake up the system (which is the case for the Mediatek
MTU3 controller, but now for the dwc3 controller used on the TI SoCs):
- if the controller can wake up the system (Mediatek MTU3 use-case) we
  only call usb_phy_roothub_power_off (which calls phy_power_off) when
  entering system suspend
- if the controller however cannot wake up the system (dwc3 on TI SoCs)
  we additionally call usb_phy_roothub_exit (which calls phy_exit) when
  entering system suspend
- (we undo the previous steps during system resume)

The goal of this series is to fix the issue reported by Roger without
breaking suspend/resume on the Mediatek SoCs.
Since I neither have a TI nor a Mediatek device I am sending this as
RFC. I have tested it on an Amlogic Meson GXM board (Khadas VIM2) which
does NOT support suspend/resume yet.

this should be applied on top of [3] "usb: core: phy: fix return value
of usb_phy_roothub_exit()" (even though there's no strict dependency,
this is the order I wrote the patches in).

Changes since v1 (blob attachments) at [4]:
- use device_may_wakeup instead of device_can_wakeup as suggested by
  Roger Quadros
- use the controller device from hcd->self.controller as suggested by
  Chunfeng Yun
- compile time fixes thanks to Roger Quadros
- if usb_phy_roothub_power_on in usb_phy_roothub_resume failes then
  we now call usb_phy_roothub_exit to keep the PHYs in the correct
  state if usb_phy_roothub_resume partially failed


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006599.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006737.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006758.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006819.html
[4] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006794.html


Martin Blumenstingl (2):
  usb: core: split usb_phy_roothub_{init,alloc}
  usb: core: use phy_exit during suspend if wake up is not supported

 drivers/usb/core/hcd.c | 18 +++++++----
 drivers/usb/core/phy.c | 88 +++++++++++++++++++++++++++++++++++---------------
 drivers/usb/core/phy.h |  9 +++++-
 3 files changed, 82 insertions(+), 33 deletions(-)

-- 
2.16.2
