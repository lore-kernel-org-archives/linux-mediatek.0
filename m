From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/22] mtd: nand: return error code of
 nand_scan(_ident,_tail) on error
Date: Sun, 6 Nov 2016 23:55:08 +0100
Message-ID: <20161106235508.52374ac3@bbrezillon>
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1478256190-7452-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri,  4 Nov 2016 19:42:48 +0900
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> nand_scan(), nand_scan_ident(), nand_scan_tail() return
> an appropriate negative value on error.
> 
> Most of drivers return the value from them on error,
> but some of them return the fixed error code -ENXIO
> (and a few return -ENODEV).
> 
> This series make those drivers return more precise error code.

Applied and fixed the bug I found in patch 13.

Thanks,

Boris

> 
> 
> Masahiro Yamada (22):
>   mtd: nand: ams-delta: return error code of nand_scan() on error
>   mtd: nand: cmx270: return error code of nand_scan() on error
>   mtd: nand: cs553x: return error code of nand_scan() on error
>   mtd: nand: gpio: return error code of nand_scan() on error
>   mtd: nand: mpc5121: return error code of nand_scan() on error
>   mtd: nand: tmio: return error code of nand_scan() on error
>   mtd: nand: orion: return error code of nand_scan() on error
>   mtd: nand: pasemi: return error code of nand_scan() on error
>   mtd: nand: plat_nand: return error code of nand_scan() on error
>   mtd: nand: atmel: return error code of nand_scan_ident/tail() on error
>   mtd: nand: brcmnand: return error code of nand_scan_ident/tail() on
>     error
>   mtd: nand: fsmc: return error code of nand_scan_ident/tail() on error
>   mtd: nand: lpc32xx: return error code of nand_scan_ident/tail() on
>     error
>   mtd: nand: mediatek: return error code of nand_scan_ident/tail() on
>     error
>   mtd: nand: mxc: return error code of nand_scan_ident/tail() on error
>   mtd: nand: omap2: return error code of nand_scan_ident/tail() on error
>   mtd: nand: vf610: return error code of nand_scan_ident/tail() on error
>   mtd: nand: cafe: return error code of nand_scan_ident() on error
>   mtd: nand: hisi504: return error code of nand_scan_ident() on error
>   mtd: nand: pxa3xx: return error code of nand_scan_ident() on error
>   mtd: nand: nandsim: remove unneeded checks for nand_scan_ident/tail()
>   mtd: nand: socrates: use nand_scan() for nand_scan_ident/tail() combo
> 
>  drivers/mtd/nand/ams-delta.c         |  5 ++---
>  drivers/mtd/nand/atmel_nand.c        | 10 ++++------
>  drivers/mtd/nand/brcmnand/brcmnand.c | 10 ++++++----
>  drivers/mtd/nand/cafe_nand.c         |  5 ++---
>  drivers/mtd/nand/cmx270_nand.c       |  4 ++--
>  drivers/mtd/nand/cs553x_nand.c       |  5 ++---
>  drivers/mtd/nand/fsmc_nand.c         |  9 ++++-----
>  drivers/mtd/nand/gpio.c              |  5 ++---
>  drivers/mtd/nand/hisi504_nand.c      |  4 +---
>  drivers/mtd/nand/lpc32xx_mlc.c       | 10 ++++------
>  drivers/mtd/nand/lpc32xx_slc.c       |  9 +++------
>  drivers/mtd/nand/mpc5121_nfc.c       |  4 ++--
>  drivers/mtd/nand/mtk_nand.c          |  4 ++--
>  drivers/mtd/nand/mxc_nand.c          | 10 ++++------
>  drivers/mtd/nand/nandsim.c           |  4 ----
>  drivers/mtd/nand/omap2.c             |  9 ++++-----
>  drivers/mtd/nand/orion_nand.c        |  5 ++---
>  drivers/mtd/nand/pasemi_nand.c       |  5 ++---
>  drivers/mtd/nand/plat_nand.c         |  5 ++---
>  drivers/mtd/nand/pxa3xx_nand.c       |  5 +++--
>  drivers/mtd/nand/socrates_nand.c     | 12 ++----------
>  drivers/mtd/nand/tmio_nand.c         |  6 +++---
>  drivers/mtd/nand/vf610_nfc.c         | 10 ++++------
>  23 files changed, 62 insertions(+), 93 deletions(-)
> 
