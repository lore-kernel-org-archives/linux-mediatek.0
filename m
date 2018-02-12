From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Mon, 12 Feb 2018 15:49:45 +0100
Message-ID: <CAKfDRXi57H5V+Qv-YO6+8OKdZLbTw7T_h64uZTMQZP6biO7Wpg@mail.gmail.com>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
 <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
 <fc2bf32a-eb81-6cd1-9085-b8786ddf0f9c@phrozen.org>
 <CAKfDRXjpG4CNeHfKC1Kg=6mrqUTZ8A7bD1aivLkSQ2L0eK755Q@mail.gmail.com>
 <6ae4103b-45bf-c427-d0d9-87f6f4eb83b5@phrozen.org>
 <CAKfDRXiJCMpA+qj4HmoSg0F_Yt4LnjQ=Dvy_tkxa=Dnh_pN13g@mail.gmail.com>
 <a594ffaa-4098-4171-f824-1aa3f332c9fc@gmail.com>
 <CAKfDRXgNGRHu9JMs-9vb4n72w+PmR8buqDnz8ObEQNXtP1pM4w@mail.gmail.com>
 <1518446229.9025.61.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1518446229.9025.61.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

On Mon, Feb 12, 2018 at 3:37 PM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Just let you know that I will extend common files and extend/add some
> existing/new official reference boards such as mt7623n with emmc/nand
> and mt7623a with emmc/nand to avoid just copy-n-pasting those much
> almost identical nodes into following new dts.
>
> bananapi-r2 board is also derived and customized from mt7623n with emmc
> board, so it will be reasonabe to be restructured to reuse the nodes in
> common files.
>
> The thing will happen in this two weeks. You can base the work to extend
> yours.
>
> Your SoC is based on MT7623A? I guessed it is because I have seen some
> warning happenings about generic power domains in your boot log.
>
>         Sean

Great, thanks for letting me know. My 4.9-DTS is just a slightly
modified version of the eMMC-DTS, the only changes I made was to
update bootargs and switch configuration. So adding upstream support
should, fingers crossed, be quite fast. My main motivation for adding
upstream support, in addition to it being fun, interesting and maybe
can help someone else, is to see if I can get the USB OTG port on the
board working. The port works with proprietary firmware I got with the
device, but not with 4.9 and I was not able to get a good answer on
how to enable it from the vendor. I see patches related to MT7623 and
USB, but nothing mentioning USB OTG specifically. Has there been any
work on the OTG-port, or should it "just" work out of the box? The
reason I am trying to get the OTG-port to work, is that the vendor has
connect a modem (via mini-PCIe) to this port.

Yes, the SoC I am working on is based on MT7623A. It is meant for use
in routers, so no need for HDMI, etc. (which is as far as I have
understood the main differences between N and A).

BR,
Kristian
