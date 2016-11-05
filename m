From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 00/22] mtd: nand: return error code of nand_scan(_ident,
 _tail) on error
Date: Sat, 5 Nov 2016 08:34:26 +0100
Message-ID: <7970b05b-a5d4-4149-ba80-f6d19a145c6d@gmail.com>
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Vladimir Zapolskiy <vz@mleia.com>, Wenyou Yang <wenyou.yang@atmel.com>, linux-mediatek@lists.infradead.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 11/04/2016 11:42 AM, Masahiro Yamada wrote:
> 
> nand_scan(), nand_scan_ident(), nand_scan_tail() return
> an appropriate negative value on error.
> 
> Most of drivers return the value from them on error,
> but some of them return the fixed error code -ENXIO
> (and a few return -ENODEV).
> 
> This series make those drivers return more precise error code.
> 

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Nice cleanup, thanks!

-- 
Best regards,
Marek Vasut
