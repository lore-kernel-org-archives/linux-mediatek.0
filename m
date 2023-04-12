Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F351C77B72
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj1HamM+8SM24EOk1NXCkim3SGvhB5cPO3Uo08qq7IY=; b=Tg1U9CzGPVRQ++nMTnt+sLysuk
	SZzvgsptfK6uxYdLIgmc+jEFD30VBIBn7d8Y5UZbOwtReBInX7bnsWiDTEMGoz/aaFaTzFnj25DXT
	mVjaPOl9shwEndcAwA0TnX5OoI7apxmTaOg+5t7TlrHjn/cz4QbNWhcAFsrcH0R9G4h1Rx0yYSGlT
	gQ7/vVCgXSY0dXA+ulirhNX/jpPEi4c1I6/5c3ygnw/IaAUmWWhF91lboXpyobtW/apo9IHhNOKR5
	idQkP+ZkWk2ythfu65rFoAOvlZ0qd32MKNdx+KC/za0DSDisDH8FzYW5TlHO4DzGJB1J34Um1j+Cj
	d6Gugoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmabY-003M7S-0V;
	Wed, 12 Apr 2023 13:33:44 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmabV-003M6V-0B;
	Wed, 12 Apr 2023 13:33:43 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pmabN-0000FF-00; Wed, 12 Apr 2023 15:33:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4E6A6C2449; Wed, 12 Apr 2023 15:27:06 +0200 (CEST)
Date: Wed, 12 Apr 2023 15:27:06 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: John Crispin <john@phrozen.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] MIPS: Remove deprecated CONFIG_MIPS_CMP
Message-ID: <20230412132706.GA11717@alpha.franken.de>
References: <20230405185128.15237-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405185128.15237-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_063341_259790_802D822C 
X-CRM114-Status: GOOD (  14.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 05, 2023 at 08:51:27PM +0200, Thomas Bogendoerfer wrote:
> Commit 5cac93b35c14 ("MIPS: Deprecate CONFIG_MIPS_CMP") deprecated
> CONFIG_MIPS_CMP and after 9 years it's time to remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Marc, if you prefer an extra patch for the irqchip change, I'll
> split this. Otherwise I would take it through the MIPS tree.
> 
>  arch/mips/Kconfig                    |  34 +----
>  arch/mips/include/asm/rtlx.h         |   1 -
>  arch/mips/include/asm/smp-ops.h      |  16 ---
>  arch/mips/include/asm/vpe.h          |   4 -
>  arch/mips/kernel/Makefile            |   3 -
>  arch/mips/kernel/rtlx-cmp.c          | 122 ------------------
>  arch/mips/kernel/smp-cmp.c           | 148 ----------------------
>  arch/mips/kernel/vpe-cmp.c           | 180 ---------------------------
>  arch/mips/kernel/vpe.c               |   2 +-
>  arch/mips/mti-malta/Makefile         |   2 -
>  arch/mips/mti-malta/malta-amon.c     |  88 -------------
>  arch/mips/mti-malta/malta-init.c     |   2 -
>  arch/mips/mti-malta/malta-platform.c |   2 -
>  arch/mips/ralink/mt7621.c            |   2 -
>  drivers/irqchip/irq-mips-gic.c       |  26 ----
>  15 files changed, 3 insertions(+), 629 deletions(-)
>  delete mode 100644 arch/mips/kernel/rtlx-cmp.c
>  delete mode 100644 arch/mips/kernel/smp-cmp.c
>  delete mode 100644 arch/mips/kernel/vpe-cmp.c
>  delete mode 100644 arch/mips/mti-malta/malta-amon.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

