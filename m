Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGiS4SdPWdo9d1y/Rcgl1wblb/VKwZV/6yepOuxpzwo=; b=bOwWBXZsqj+sL3
	XZ01OoFh05grBHDYDpVyIy8nrApK7ZG3rbnmHPl2XL6m5jpeUwiXqvSFC1Ki6+zVDghtIFmFOk6wF
	7wJAPw655paCvol+WFt5PEhk7+wqiexHJJI3YbOL3T9N91ASRbd4DT2L0UOYt6dqcp6ivBEnFSgGf
	kDM6h2IETV9w0brXCz59wWcwDSxZv8aFe+OkZtvwsh7TvPdEXbQyhwC3Xqwh28YfaL3O/QPcKHcSE
	z2WmjzMkvShNhfpt2hdlr0Yjy1zgTByiJjsAgLGnvRt8mPmK/4jugRMzzvko7D6BKQzFmyQeI8F0T
	+ZxV+sbIeo7acvI1Vbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAjN-00CcDk-5R; Thu, 12 May 2022 15:27:57 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAjC-00Cc3t-FV; Thu, 12 May 2022 15:27:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BD18FF80F;
 Thu, 12 May 2022 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=so0UQipUdKDe8ooC1ldtUKaBqHHt2wI5r8cjBJFcJKM=;
 b=aFBXvEVBwohTzze5N6XsrVxq2wyQUP0l5BDHVk0yiodNk/xZfl2nrxxfWPOPWtxXTRyKWD
 MbEEvRzD1lsTnHoluE5edyGBPQW1+qItAoHUIQvIln4Bw5a53Jd3F8pGwZAU0+yd0Cgneh
 IMyi+8Q0a0iGuYcUQq+rlEZeGcfpPNU2RJiC3zW2ciG42RG10SwiAv/3UCHRKZoFWZUZiQ
 44qBY5YsFMgJb8bb0tRpsty4i6iexoe6OefVN3rVAxgPamkc0SLHhF6ZCGdol+ipyhUGko
 K7gDMA/Cs6ipAIuArg6gqPd+75K3fic9NEeJw2cfTkGMh9j9b5GCMaWsIA9LYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: MTD_NAND_ECC_MEDIATEK should depend on
 ARCH_MEDIATEK
Date: Thu, 12 May 2022 17:27:43 +0200
Message-Id: <20220512152743.245075-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <bb9568e825d4bc7506870b03836baa91bcc4b725.1652104136.git.geert+renesas@glider.be>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'66d7a40beb413815a5b1adbc1558200f5b18d817'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082746_691612_C6A74FFC 
X-CRM114-Status: GOOD (  10.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-05-09 at 13:50:02 UTC, Geert Uytterhoeven wrote:
> The MediaTek Hardware ECC Engine is only present on MediaTek MT27xx and
> MT76xx SoCs.  The driver for this engine is a dependency for the
> MediaTek NAND controller (MTD_NAND_MTK) and the MediaTek SPI NAND Flash
> Interface (SPI_MTK_SNFI) drivers, both of which already depend on
> ARCH_MEDIATEK.
> 
> Hence add a dependency on ARCH_MEDIATEK to the Hardware ECC Engine
> driver, too, to prevent asking the user about this driver when
> configuring a kernel without MediaTek SoC support.
> 
> Fixes: 4fd62f15afa0d0da ("mtd: nand: make mtk_ecc.c a separated module")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
