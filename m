From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Mon, 30 Apr 2018 09:42:12 +0800
Message-ID: <1525052532.5013.5.camel@mtkswgap22>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
 <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
 <fc2bf32a-eb81-6cd1-9085-b8786ddf0f9c@phrozen.org>
 <CAKfDRXjpG4CNeHfKC1Kg=6mrqUTZ8A7bD1aivLkSQ2L0eK755Q@mail.gmail.com>
 <6ae4103b-45bf-c427-d0d9-87f6f4eb83b5@phrozen.org>
 <CAKfDRXiJCMpA+qj4HmoSg0F_Yt4LnjQ=Dvy_tkxa=Dnh_pN13g@mail.gmail.com>
 <a594ffaa-4098-4171-f824-1aa3f332c9fc@gmail.com>
 <CAKfDRXgNGRHu9JMs-9vb4n72w+PmR8buqDnz8ObEQNXtP1pM4w@mail.gmail.com>
 <1518446229.9025.61.camel@mtkswgap22>
 <CAKfDRXi57H5V+Qv-YO6+8OKdZLbTw7T_h64uZTMQZP6biO7Wpg@mail.gmail.com>
 <CAKfDRXg419rBTeqZ+UqQJFRj5s6CVg0YXzjmhyFxrbJgMkM8fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXg419rBTeqZ+UqQJFRj5s6CVg0YXzjmhyFxrbJgMkM8fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Sun, 2018-04-29 at 22:18 +0200, Kristian Evensen wrote:
> Hello,
> 
> On Mon, Feb 12, 2018 at 3:49 PM, Kristian Evensen
> <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> * My board is equipped with a 2.4GHz and a 5GHz wifi card, both
> connected via PCIe. The 2.4 card is connected to a "pure" PCIe-slot
> (pcie@1,0), while the 5GHz uses the slot that is shared between PCIe
> and USB3.0 (I think this is pcie@2,0). Based on my naive
> understanding, in order to enable this slot (as PCIe), I should set
> u3phy2 to okay (since phy is u3port1 in dtsi), but not enable usb2.
> However, when I set u3phy2 to okay, the 2.4GHz card disappears as well
> and I can no long see the PCI bridge (output from lspci is empty). If
> I don't add the u3phy2-node, then the 2.4Ghz card appears, but no
> 5GHz. Does anyone know how to make this slot work in PCIe-mode? I
> tried with pcie@0,0 instead of pcie@2,0 as well, but it did not have
> an effect.
> 

We didn't support port2 (pcie@2,0) for mainline version, but if you want
to use it you could take a look at -
https://patchwork.kernel.org/patch/9747713/

grep: HIF_SYSCFG1 /HIF_SYSCFG1_PHY2_MASK

That is, you need to clear these bits to 0 to enable PHY for pcie@2,0.

Thanks.
