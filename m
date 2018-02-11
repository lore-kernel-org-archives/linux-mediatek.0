From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Sun, 11 Feb 2018 12:13:28 +0100
Message-ID: <CAKfDRXg66Un3c7U=WTSUYoduDkAD+jsL-tzxnYUSLHKrmFKiOg@mail.gmail.com>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
 <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
 <fc2bf32a-eb81-6cd1-9085-b8786ddf0f9c@phrozen.org>
 <CAKfDRXjpG4CNeHfKC1Kg=6mrqUTZ8A7bD1aivLkSQ2L0eK755Q@mail.gmail.com>
 <6ae4103b-45bf-c427-d0d9-87f6f4eb83b5@phrozen.org>
 <CAKfDRXiJCMpA+qj4HmoSg0F_Yt4LnjQ=Dvy_tkxa=Dnh_pN13g@mail.gmail.com>
 <12343512-196f-c89f-e7dc-2e35cad49fc8@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <12343512-196f-c89f-e7dc-2e35cad49fc8-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
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
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Sun, Feb 11, 2018 at 12:11 PM, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org> wrote:
> You'll also need to tell the kernel about the uart, looking at the owrt
> config you'll find ...
>
> grep DEBUG_UART target/linux/mediatek/config-4.9
> CONFIG_DEBUG_UART_8250=y
> # CONFIG_DEBUG_UART_8250_FLOW_CONTROL is not set
> CONFIG_DEBUG_UART_8250_SHIFT=2
> # CONFIG_DEBUG_UART_8250_WORD is not set
> CONFIG_DEBUG_UART_PHYS=0x11004000
> CONFIG_DEBUG_UART_VIRT=0xf1004000

Thanks, I will take a look. I also made some progress. I used a
different config I found on the Banana Pi forums (availble here
http://www.fw-web.de/dokuwiki/lib/exe/fetch.php?media=bpi-r2:mt7623n_evb_ryderlee_defconfig.txt)
and while there are some errors when booting, booting to the ramdisk
works fine. So it seems that the DTS at least is not completely
broken.

BR,
Kristian
