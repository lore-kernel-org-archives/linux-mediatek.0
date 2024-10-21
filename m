Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB8D0E6D8
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m79BIBKqneDCStQUQ14/pD49h3bl1usdmKNzsly5q9s=; b=CHPzGJGwaXTEXObcUFpfwMX4li
	d0OdeGwu1J6597b8CcJcAP/pSP7vMunPQJLv88IPlbFd7xHipluKbJp72tRtg3EykntuZhiTFyepy
	q3OVnZZ5pIxy1jkOdy7+9Ow3ycx4XCkoPMo0t76MEk96Vr7/NGeQExqS/g4cC19U6TD3Y+luipN41
	diFIAXrFBohSWtQ3cjAxPMjMjUCs7ha+1OSVENpzGN44coW0d4kISxOwHtdfOHst5FWX5zHi8uzCt
	jYPjC1j/Ql0yllMuSDmDUT2MY6v94n3gREV6M1r2HKxtkm5w+GbG0pzDNbFkz5xpjVtHKpdxR1lhp
	FyJBTskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pGw-00000006oJ7-3Vdd;
	Mon, 21 Oct 2024 10:04:22 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pEx-00000006nlK-0psi;
	Mon, 21 Oct 2024 10:02:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7787D2000F;
	Mon, 21 Oct 2024 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m79BIBKqneDCStQUQ14/pD49h3bl1usdmKNzsly5q9s=;
	b=WDeAFwi61lq51jGCq2dtNZcjZYRng+WYMANNQlyiXvBIPczC6sd9Lgo5R99LEfGy0Wj3wm
	SzmfcCM8jY0uiS/QE4GnfSSZeylVGZHUOKC/a4Ywl43vodweeWHqdMQ+zBcwTRJHx0yMKL
	OeNniS5u+Pi3kI2z0aU42gmkRCecObZ49gwE44CMBSTIiN3mbGEW5j+8GPzBva/z4P14Ll
	rrnrVJWRy+YLUNuF3iDnqnmiXukMRFbCSz+BoSrXAPAAfHdXzDKZYUy4IVA4/EYzMlmPKV
	AxTzUTPQKq8w74Gv+SotqloQEHThh2apW9b763Q0+kkQuUlCBdsjWeb9RdATwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: Constify struct nand_ecc_engine_ops
Date: Mon, 21 Oct 2024 12:02:13 +0200
Message-ID: <20241021100214.173157-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <72597e9de2320a4109be2112e696399592edacd4.1729271136.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'af264e5989055ac33f413c4c80874345cda0cc97'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030219_439651_5521F1D6 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2024-10-18 at 17:05:57 UTC, Christophe JAILLET wrote:
> 'struct nand_ecc_engine_ops' are not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> Update the prototype of mxic_ecc_get_pipelined_ops() accordingly.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   16709	   1374	     16	  18099	   46b3	drivers/mtd/nand/ecc-mxic.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   16789	   1294	     16	  18099	   46b3	drivers/mtd/nand/ecc-mxic.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

