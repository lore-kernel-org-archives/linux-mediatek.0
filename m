Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B40C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zL/Tgozd757x0uspKJ/QO1fI2sa1DUP6bzOx+70NEX0=; b=WYNIY7c5DWmd353ot7YURlh+FN
	GP4nDqdB6TkrUFFNqz9K6RQd1XsHSac7EvrmCC4ikaGKyZDS7GnMbLoOfgqtdV64bwj66u79ULkmO
	aH2PqjXvmY6zhRvTpGbvx2sem8tHa43tMinpSvfxWVZzg0yhc6FfqE6mw74AReX1SHC8KEOkaA0hy
	DZLsL32UBmlIih5bZADGQchshVgRYZaUXz6KT3vgvlkLIUvwnRL7uuKOuTXDRyp1k1TQxN+am1E0p
	nX7lf/2iGj/Ts+oUja7TNprBwIFLOa1GT8Xyk2oN8kk6SM6M29ycadzeICbqJOEwbsowMXQYjSuy4
	dektYtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZfZ-00000000SfD-3umo;
	Mon, 26 Feb 2024 12:01:17 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTk-000000009NV-08uz;
	Mon, 26 Feb 2024 10:45:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F18C060005;
	Mon, 26 Feb 2024 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zL/Tgozd757x0uspKJ/QO1fI2sa1DUP6bzOx+70NEX0=;
	b=PbNfK+FefzTpRRZZaLv6nXskQ+mmjm6jtVHrDL7HRvcQUxrt/ON5CBHIra+IRzW5oSP3mC
	qL0rcEu5cs9tcn9SnBMBL/eM1OxBZfSwfB/j6BSbxCBBSPT6hoADU1JUblR3QK5LVJSHMF
	MhmzEaiQP7PPOzilGKqZR8Pxp1pjllqW51/TO2+/XDxIS1lzGDEMpvXjGzbNIOhYVx13eA
	S/xIGuK89v2kZwSrZJ0PAF4SxW3+AiVnLiFBfq6vNJwE0hVbsNPyME4lPuM/CUu/mGz3z2
	4ck9hwW45k2IESMkzf5Mdo+mppFvwVwPNaY81MpS+5bJR5rghPxnyXJmZ74hiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Erick Archer <erick.archer@gmx.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	=?utf-8?q?Uw?= =?utf-8?q?e_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Prefer struct_size over open coded arithmetic
Date: Mon, 26 Feb 2024 11:44:56 +0100
Message-Id: <20240226104456.490065-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240211091633.4545-1-erick.archer@gmx.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e395036504c4e19d15ba64543a4c3beca373f7a9'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024500_678892_E2F62B7D 
X-CRM114-Status: GOOD (  12.58  )
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

On Sun, 2024-02-11 at 09:16:33 UTC, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
> this structure ends in a flexible array:
> 
> struct mtk_nfc_nand_chip {
> 	[...]
> 	u8 sels[] __counted_by(nsels);
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> devm_kzalloc() function.
> 
> This way, the code is more readable and safer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

