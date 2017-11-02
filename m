From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Problems enabling the PCIe/USB3.0 port on MT7623N
Date: Thu, 2 Nov 2017 23:25:23 +0100
Message-ID: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg@mail.gmail.com>
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
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

I am working on adding mainline support for an MT7623N-based board.
The board uses eMMC for storage, so I have based my work on a DTS-file
for the eMMC reference board (from the LEDE repository).

The kernel currently boots just fine to my rootfs, and the switch, usb
port and the two "pure" pcie slots are working. However, for the last
couple of days I have been banging my head against the wall trying to
get the combined pcie/usb3 slot to work. I have tried to add different
nodes to the DTS, experimented with GPIOs and analyzed logs of the
proprietary firmware (where to slot works), to no good.

Does anyone have any experience with activating this slot or hints or
tips on where to look?

Thanks in advance for any help,
Kristian
