From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] mtd: mtk: avoid warning in mtk_ecc_encode
Date: Fri, 30 Sep 2016 19:25:17 +0200
Message-ID: <201609301925.17577.arnd@arndb.de>
References: <20160930163429.380785-1-arnd@arndb.de>
 <20160930185139.15c8be66@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160930185139.15c8be66@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Friday 30 September 2016, Boris Brezillon wrote:
> > +     /* copy into possibly unaligned OOB region with actual length */
> > +     memcpy(data + bytes, eccdata, len);
> 
> Is it better than
> 
>         for (i = 0; i < len; i += 4) {
>                 u32 val = __raw_readl(ecc->regs + ECC_ENCPAR(i / 4));
> 
>                 memcpy(data + bytes + i, &val, min(len, 4));
>         }
> 
> I'm probably missing something, but what's the point of creating a
> temporary buffer of 112 bytes on the stack since you'll have to copy
> this data to the oob buffer at some point?


I tried something like that first, but wasn't too happy with it for
a number of small reasons:

- __raw_readl in a driver is not usually the right API, __memcpy32_from_io
  uses it internally, but it's better for a driver not to rely on that,
  in case we need some barriers (which we may in factt need for other drivers).

- the min(len,4) expression is incorrect, fixing that makes it more complicated
  again

- I didn't like to call memcpy() multiple times, as that might get turned
  into an external function call (the compiler is free to optimize small
  memcpy calls or not).

I agree that he 112 byte buffer isn't ideal either, it just seemed to
be the lesser annoyance.

	Arnd
