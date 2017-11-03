From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems enabling the PCIe/USB3.0 port on MT7623N
Date: Fri, 3 Nov 2017 12:07:27 +0100
Message-ID: <CAKfDRXjrDPKo-mveCb8o7YFdBbBa53kt8WTPDi1RhMXMcbvMYw@mail.gmail.com>
References: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg@mail.gmail.com>
 <1509675191.20200.18.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1509675191.20200.18.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Ryder,

Thanks for the quick reply!

On Fri, Nov 3, 2017 at 3:13 AM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Glad to see someone else interested in the MT7623N. In your case you
> need to set extra bit to switch the PCIe/USB function, which is not
> supported in mainline yet...
>
> Please see the below link and search 'HIF_SYSCFG1'.
>
> https://patchwork.kernel.org/patch/9694575/

I am currently building LEDE for the board and noticed that they have
a different patch for PCIe
(https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/mediatek/patches-4.9/0003-PCI-mediatek-add-support-for-PCIe-found-on-MT7623-MT.patch;h=43f51ef6b334d6ff859dca6218a9710ba1b9e3d5;hb=HEAD).
This patch does the same regmap_update_bits() call (with the same
values) and I added some logs to confirm that the functions is called.
So at least that part should be fine.

Yesterday evening, I had some discussions with the producer of the
board, as they provided me with two firmware images - one where I can
see the device connected to the slot (provided to the vendor by
Mediatek) and one where the device is not available (image compiled by
the vendor). According to the vendor, the difference between the
images is that the image provided by Mediatek enables USB
OTG-functionality and this is required for the slot. However, they
could not give me any technical details on how to enable OTG. When
searching the linux-mediatek mailing list archives, I couldn't find
any OTG-specific patches. Are there any specific steps that has to be
taken to enable OTG?

I am not sure if it matters, but when I look at the image where I can
see the device, the content of USB devices is:
# ls /sys/bus/usb/devices/
2-0:1.0  1-0:1.0  3-1:1.0  usb3     usb1     1-1
1-1:1.0  3-1:1.1  3-0:1.0  usb2     3-1

With LEDE or the other vendor-firmware, it contains the follows:
root@LEDE:/# ls /sys/bus/usb/devices/
1-0:1.0  2-0:1.0  usb1     usb2

I was also provided with the toolchain yesterday, so I will try to
compile the linux-mediatek kernel for the board. Which branch is the
best to use?

Thanks for all the help so far,
Kristian
