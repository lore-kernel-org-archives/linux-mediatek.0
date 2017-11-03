From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: Problems enabling the PCIe/USB3.0 port on MT7623N
Date: Fri, 3 Nov 2017 10:13:11 +0800
Message-ID: <1509675191.20200.18.camel@mtkswgap22>
References: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Thu, 2017-11-02 at 23:25 +0100, Kristian Evensen wrote:
> Hello,
> 
> I am working on adding mainline support for an MT7623N-based board.
> The board uses eMMC for storage, so I have based my work on a DTS-file
> for the eMMC reference board (from the LEDE repository).
> 
> The kernel currently boots just fine to my rootfs, and the switch, usb
> port and the two "pure" pcie slots are working. However, for the last
> couple of days I have been banging my head against the wall trying to
> get the combined pcie/usb3 slot to work. I have tried to add different
> nodes to the DTS, experimented with GPIOs and analyzed logs of the
> proprietary firmware (where to slot works), to no good.
> 
> Does anyone have any experience with activating this slot or hints or
> tips on where to look?

Glad to see someone else interested in the MT7623N. In your case you
need to set extra bit to switch the PCIe/USB function, which is not
supported in mainline yet...

Please see the below link and search 'HIF_SYSCFG1'.

https://patchwork.kernel.org/patch/9694575/


Thanks.

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
