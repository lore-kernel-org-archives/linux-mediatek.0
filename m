From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Sun, 11 Feb 2018 11:33:57 +0100
Message-ID: <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Sat, Feb 10, 2018 at 11:02 PM, Kristian Evensen
<kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> With OpenWRT, I based the dts for the U7623 on mt7623-eMMC.dts. Since
> this file is not available in the mainline kernel, I decided to use
> the DTS for Banana Pi R2 as the boards seem fairly similar (and the
> initial goal is just to have a kernel that boots). I got a 4.14 config
> from a repo I found on the BPI-forum
> (https://github.com/frank-w/BPI-R2-4.14), added missing config symbols
> for 4.15, compiled a kernel and appended the dtb to the uImage. So
> far, so good and the kernel compiles just fine.

I see that I made some mistakes and missed some details in the
description. Sorry about that, I blame the lack of coffee :)

I did not use the DTS for the R2, as I had already seen that 4.9
failed to boot with the R2 DTS (also the no output-error). What I did
was that I took the mt7623-eMMC.dts and updated it (basically
uncommenting the switch-section) so that the compiler would not hit
any errors/warnings. I also reduced the amount of memory, as my board
only has 512MB RAM.

BR,
Kristian
